import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomEditText extends StatefulWidget {
  const CustomEditText(
      {Key? key, this.mController, this.mLabel, this.maxLength, this.onChange})
      : super(key: key);

  final TextEditingController? mController;
  final String? mLabel;
  final int? maxLength;
  final Function(String value)? onChange;

  @override
  State<CustomEditText> createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF1F1F1),
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(44),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 59,
          child: TextFormField(
            controller: widget.mController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            maxLength: widget.maxLength,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: widget.mLabel ?? "",
              border: InputBorder.none,
              counterText: "",
              labelStyle:
                  Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: const Color(0x4D0F3F15),
                      ),
            ),
            style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0F3F15),
                ),
            onTapOutside: (event) {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            onChanged: widget.onChange,
          ),
        ),
      ),
    );
  }
}
