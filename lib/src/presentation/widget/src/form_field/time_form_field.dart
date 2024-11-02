import 'package:barv/barv.dart';
import 'package:barv/gen/assets.gen.dart';
import 'package:barv/src/presentation/widget/widgets.dart';
import 'package:barv/src/utilities/extension/extension.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarvTimeFormField extends StatefulWidget {
  /// Creates a time picker form field.
  ///
  /// The [controller] must not be null.
  ///
  /// While others are optional.
  const BarvTimeFormField({
    super.key,
    required this.controller,
    this.initialTime,
    this.onTimeSelected,
    this.mandatory = true,
    this.autoValidateMode,
    this.innerSuffix, this.labelText,
  });

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TimeController].
  final TimeController controller;

  /// The time initially selected when the dialog is shown.
  /// if null it will take present time as its value
  final TimeOfDay? initialTime;

  /// Called when the time is selected.
  final VoidCallback? onTimeSelected;

  /// Determine whether field is required or not
  final bool mandatory;

  /// Used to enable/disable this form field auto validation and update its
  /// error text.
  final AutovalidateMode? autoValidateMode;

  final Widget? innerSuffix;

  final String? labelText;

  @override
  State<BarvTimeFormField> createState() => _DatePickerFormFieldState();
}

class _DatePickerFormFieldState extends State<BarvTimeFormField> {
  DateTime time = TrustedDateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.controller.value != null) {
      widget.controller.controller.text = widget.controller.value!.timeFormat;
    }
    if (widget.initialTime != null){
      time = widget.initialTime!.toDateTime(TrustedDateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return BarvFormField(
      onTap: _onSelect,
      controller: widget.controller.controller,
      readOnly: true,
      labelText: widget.labelText,
      hintText: '--:--',
      innerSuffix: InkWell(
        onTap: _onSelect,
        splashFactory: NoSplash.splashFactory,
        child: widget.innerSuffix ?? SvgPicture.asset(
          Assets.icon.systems.custom.time,
          colorFilter: ColorFilter.mode(isLightMode ? BarvColor.analgesic : BarvColor.albin, BlendMode.srcIn),
        ),
      ),
      validator: widget.mandatory ? BarvValidator.required : null,
      autovalidateMode: widget.autoValidateMode ?? AutovalidateMode.disabled,
    );
  }

  Future<DateTime?> _showDialog() async {
    final theme = Theme.of(context);
    final isLightMode = theme.brightness == Brightness.light;

    final res = await showCupertinoModalPopup<DateTime?>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: Container(
            height: MediaQuery.of(context).copyWith().size.height / 3,
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                const SizedBox(height: 3),
                Center(
                  child: Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: BarvColor.iron,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).maybePop(time);
                        },
                        child: Text(
                          'Confirm',
                          style:
                          BarvTypography.text(color: theme.primaryColor),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: CupertinoDatePicker(
                    initialDateTime: time,
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: true,
                    onDateTimeChanged: (DateTime newTime) {
                      setState(() => time = newTime);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return time;
  }

  Future<void> _onSelect() async {
    final selectedDate = await _showDialog();
    if (selectedDate != null) {
      final selectedTime = TimeOfDay.fromDateTime(selectedDate);
      widget.onTimeSelected?.call();
      widget.controller.controller.text = selectedTime.timeFormat;
      widget.controller.value = selectedTime;
    }
  }
}

class TimeController extends ValueNotifier<TimeOfDay?> {
  /// Creates a new date controller.
  TimeController({TimeOfDay? initialValue}) : super(initialValue);

  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
