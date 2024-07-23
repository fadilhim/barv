import 'package:barv/barv.dart';
import 'package:barv/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class BarvDateFormField extends StatefulWidget {
  /// Creates a date picker form field.
  ///
  /// The [controller] must not be null.
  ///
  /// While others are optional.
  const BarvDateFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.mandatory = true,
    this.dateFormat,
  });

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [DateTimeController].
  final DateTimeController controller;

  /// Text that suggests what sort of input the field accepts.
  final String? labelText;

  /// earliest allowable date, if null it will take today date as its value
  final DateTime? firstDate;

  /// latest allowable date, if null it will take first date as its value
  final DateTime? lastDate;

  /// must either fall between [firstDate] and [lastDate], or be equal to one of them.
  /// if null it will take first date as its value
  final DateTime? initialDate;

  final DateFormat? dateFormat;

  /// Determine whether field is required or not
  final bool mandatory;

  @override
  State<BarvDateFormField> createState() => _BarvDateFormFieldState();
}

class _BarvDateFormFieldState extends State<BarvDateFormField> {
  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLightMode = theme.brightness == Brightness.light;

    return BarvFormField(
      onTap: () async {
        final selectedTime = await showDatePicker(
          context: context,
          firstDate: widget.firstDate ?? TrustedDateTime.now(),
          barrierColor: BarvColor.anaesthesia,
          lastDate:
              widget.lastDate ?? widget.firstDate ?? TrustedDateTime.now(),
          initialDate: widget.controller.value ??
              widget.initialDate ??
              widget.firstDate ??
              TrustedDateTime.now(),
        );
        if (selectedTime != null) {
          setState(() {
            _isEnabled = true;
          });
          widget.controller.controller.text = widget.dateFormat != null
              ? widget.dateFormat!.format(selectedTime)
              : selectedTime.EEEEddMMMMyyyy;
          widget.controller.value = selectedTime;
        }
      },
      controller: widget.controller.controller,
      readOnly: true,
      labelText: widget.labelText,
      innerSuffix: SvgPicture.asset(
        Assets.icon.systems.icDateFill,
        colorFilter: ColorFilter.mode(
            _isEnabled
                ? theme.primaryColor
                : isLightMode
                    ? BarvColor.iron
                    : BarvColor.albin,
            BlendMode.srcIn),
      ),
      validator: widget.mandatory ? BarvValidator.required : null,
    );
  }
}

class DateTimeController extends ValueNotifier<DateTime?> {
  /// Creates a new date controller.
  DateTimeController({DateTime? initialValue}) : super(initialValue);

  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
