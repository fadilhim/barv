import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stream_transform/stream_transform.dart' hide Switch;

/// Process only one event by cancelling any pending events and
/// processing the new event immediately.
///
/// **Note**: there is no event handler overlap and any currently running tasks
/// will be aborted if a new event is added before a prior one completes.
EventTransformer<Event> debounceTime<Event>({Duration? duration}) {
  return (events, mapper) {
    return events
        .debounceTime(duration ?? const Duration(milliseconds: 800))
        .switchMap(mapper);
  };
}

/// Process only one event and ignore (drop) any new events
/// until the current event is done.
///
/// **Note**: dropped events never trigger the event handler.
EventTransformer<Event> droppable<Event>() {
  return (events, mapper) {
    return events.transform(_ExhaustMapStreamTransformer(mapper));
  };
}

/// Process events one at a time by maintaining a queue of added events
/// and processing the events sequentially.
///
/// **Note**: there is no event handler overlap and every event is guaranteed
/// to be handled in the order it was received.
EventTransformer<Event> sequential<Event>() {
  return (events, mapper) => events.asyncExpand(mapper);
}

/// debounce the sequential transformer
EventTransformer<E> debounceSequential<E>(Duration duration) {
  return (events, mapper) {
    return sequential<E>().call(events.debounceTime(duration), mapper);
  };
}

class _ExhaustMapStreamTransformer<T> extends StreamTransformerBase<T, T> {
  _ExhaustMapStreamTransformer(this.mapper);

  final EventMapper<T> mapper;

  @override
  Stream<T> bind(Stream<T> stream) {
    late StreamSubscription<T> subscription;
    StreamSubscription<T>? mappedSubscription;

    final controller = StreamController<T>(
      onCancel: () async {
        await mappedSubscription?.cancel();
        return subscription.cancel();
      },
      sync: true,
    );

    subscription = stream.listen(
          (data) {
        if (mappedSubscription != null) return;
        final Stream<T> mappedStream;

        mappedStream = mapper(data);
        mappedSubscription = mappedStream.listen(
          controller.add,
          onError: controller.addError,
          onDone: () => mappedSubscription = null,
        );
      },
      onError: controller.addError,
      onDone: () => mappedSubscription ?? controller.close(),
    );

    return controller.stream;
  }
}

/// Process events concurrently.
///
/// **Note**: there may be event handler overlap and state changes will occur
/// as soon as they are emitted. This means that states may be emitted in
/// an order that does not match the order in which the corresponding events
/// were added.
EventTransformer<Event> concurrent<Event>() {
  return (events, mapper) => events.concurrentAsyncExpand(mapper);
}

/// Process only one event by cancelling any pending events and
/// processing the new event immediately.
///
/// Avoid using [restartable] if you expect an event to have
/// immediate results -- it should only be used with asynchronous APIs.
///
/// **Note**: there is no event handler overlap and any currently running tasks
/// will be aborted if a new event is added before a prior one completes.
EventTransformer<Event> restartable<Event>() {
  return (events, mapper) => events.switchMap(mapper);
}
