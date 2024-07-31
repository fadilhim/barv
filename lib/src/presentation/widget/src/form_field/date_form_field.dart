import 'package:barv/barv.dart';
import 'package:barv/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
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
  DateTime? selectedDate;

  @override
  initState() {
    super.initState();
    if (widget.controller.value != null) {
      widget.controller.controller.text = widget.dateFormat != null
          ? widget.dateFormat!.format(widget.controller.value!)
          : widget.controller.value!.ddMMMMyyyy;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLightMode = theme.brightness == Brightness.light;

    return BarvFormField(
      onTap: () async {
        final selectedTime = await showModalBottomSheet<DateTime?>(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.0),
            ),
          ),
          backgroundColor: BarvColor.albin,
          isScrollControlled: false,
          builder: (context) {
            return SafeArea(
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
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).maybePop(selectedDate);
                          },
                          child: Text(
                            'Confirm',
                            style:
                                BarvTypography.text(color: theme.primaryColor),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (picked) {
                          if (picked != selectedDate) {
                            setState(() {
                              selectedDate = picked;
                            });
                          }
                        },
                        initialDateTime: widget.controller.value ??
                            widget.initialDate ??
                            widget.firstDate ??
                            TrustedDateTime.now(),
                        minimumDate: widget.firstDate ?? TrustedDateTime.now(),
                        maximumDate: widget.lastDate ??
                            widget.firstDate ??
                            TrustedDateTime.now(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
        if (selectedTime != null) {
          setState(() {
            _isEnabled = true;
          });
          widget.controller.controller.text = widget.dateFormat != null
              ? widget.dateFormat!.format(selectedTime)
              : selectedTime.ddMMMMyyyy;
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
