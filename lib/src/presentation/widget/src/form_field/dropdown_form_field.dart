import 'package:barv/barv.dart';
import 'package:barv/gen/assets.gen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A data class to represent the category.
class BarvDropdownValue {
  /// Creates the category.
  const BarvDropdownValue({
    required this.id,
    required this.name,
    this.icon,
    this.code,
  });

  final int id;
  final String name;
  final String? icon;
  final String? code;

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other.runtimeType == runtimeType &&
          other is BarvDropdownValue &&
          id == other.id &&
          name == other.name &&
          icon == other.icon &&
          code == other.code);

  @override
  int get hashCode => Object.hash(
        runtimeType,
        id.hashCode,
        name.hashCode,
        icon.hashCode,
        code.hashCode,
      );
}

class BarvDropDownFormField extends StatefulWidget {
  /// Creates a Dropdown Form Field.
  ///
  /// Every properties are required except [labelText].
  const BarvDropDownFormField({
    super.key,
    this.labelText,
    required this.controller,
    required this.values,
    this.mandatory = false,
    this.onChanged,
    this.innerSuffix,
    this.autoValidateMode,
  });

  /// Text showed as label in the first initialized
  final String? labelText;

  /// the Form field controller
  final DropdownController controller;

  /// The list of value to provide inside dropdown
  final List<BarvDropdownValue> values;

  /// Determine whether field is required or not
  final bool mandatory;

  /// Function called when value is changed
  final ValueChanged<BarvDropdownValue?>? onChanged;

  /// Optional widget to place on the line after the input.
  final Widget? innerSuffix;

  /// Used to enable/disable this form field auto validation and update its
  /// error text.
  final AutovalidateMode? autoValidateMode;

  @override
  State<BarvDropDownFormField> createState() => _BarvDropDownFormFieldState();
}

class _BarvDropDownFormFieldState extends State<BarvDropDownFormField> {
  @override
  void initState() {
    super.initState();
    widget.controller._textController.text =
        widget.controller.value?.name ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return DropdownButtonHideUnderline(
      child: DropdownButton2<BarvDropdownValue>(
        isExpanded: true,
        autofocus: true,
        customButton: IntrinsicHeight(
          child: Stack(
            children: [
              BarvFormField(
                controller: widget.controller._textController,
                readOnly: true,
                labelText: widget.labelText ?? '',
                innerPrefix: widget.controller.value?.icon != null
                    ? SvgPicture.asset(
                        widget.controller.value!.icon!,
                      )
                    : null,
                innerSuffix:
                    const Icon(Icons.arrow_drop_down_outlined, size: 24),
                validator: widget.mandatory ? BarvValidator.required : null,
                autovalidateMode:
                    widget.autoValidateMode ?? AutovalidateMode.disabled,
              ),
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
          ),
        ),
        value: widget.controller.value,
        onChanged: (value) {
          if (value != null) {
            widget.controller.value = value;
            widget.controller._textController.text = value.name;
          }
          setState(() {});
          widget.onChanged?.call(value);
        },
        items: widget.values
            .map(
              (item) => DropdownMenuItem<BarvDropdownValue>(
                key: Key(item.id.toString()),
                value: item,
                child: _BuildItemContainer(
                  selected: item.name == widget.controller._textController.text,
                  text: item.name,
                  icon: item.icon,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _BuildItemContainer extends StatelessWidget {
  const _BuildItemContainer({
    super.key,
    this.selected = false,
    required this.text,
    this.icon,
  });

  final bool selected;
  final String text;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (icon != null) SvgPicture.asset(icon!),
        if (icon != null) const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isLightMode ? BarvColor.analgesic : BarvColor.albin,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (selected)
          SvgPicture.asset(
            Assets.icon.systems.custom.done,
          ),
      ],
    );
  }
}

class DropdownController extends ValueNotifier<BarvDropdownValue?> {
  /// Creates a new dropdown controller.
  DropdownController({BarvDropdownValue? initialValue}) : super(initialValue);

  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
