import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      this.controller,
      this.fillColor = Colors.white,
      this.validator,
      this.obscureText = false,
      this.onChanged,
      this.keyboardType,
      this.suffixIcon,
      this.hintText,
      this.prefixIcon,
      this.maxLines = 1,
      this.textAlign = TextAlign.start,
      this.isDropDown = false,
      this.dropDownOptions})
      : super(key: key);
  final TextEditingController? controller;
  final Color? fillColor;
  final FormFieldValidator<String>? validator;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final int maxLines;
  TextAlign textAlign;

  bool isDropDown;
  List<String>? dropDownOptions;

  @override
  Widget build(BuildContext context) {
    return isDropDown ? DropDownTextField(context) : GetTextField(context);
  }

  PopupMenuButton<String> DropDownTextField(BuildContext context) {
    return PopupMenuButton<String>(
      position: PopupMenuPosition.over,
      offset: const Offset(1, 15),
      onSelected: (value) {
        controller?.text = value;
      },
      surfaceTintColor: Colors.white,
      color: Colors.white,
      itemBuilder: (BuildContext context) {
        return [
          ...(dropDownOptions ?? []).map(
            (option) {
              return PopupMenuItem<String>(
                value: option,
                child: Text(
                  option,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
              );
            },
          ).toList()
        ];
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          GetTextField(
            context,
          ),
          Container(
            color: Colors.transparent,
            height: 50,
            width: Get.width,
          ),
          const Positioned(
            top: 0,
            bottom: 0,
            right: 8,
            child: Icon(
              Icons.arrow_drop_down,
            ),
          )
        ],
      ),
    );
  }

  TextFormField GetTextField(
    BuildContext context,
  ) {
    return TextFormField(
      enabled: !isDropDown,
      onChanged: onChanged,
      maxLines: maxLines,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      cursorColor: Colors.black,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey,
          ),
      textAlign: textAlign,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixIconColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.focused) ? Colors.grey : Colors.black,
        ),
        suffixIconColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.focused) ? Colors.grey : Colors.black,
        ),
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey.withOpacity(.7),
            ),
        contentPadding: const EdgeInsets.only(
          left: 16,
          top: 11,
          bottom: 11,
          right: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.withOpacity(.1), width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.withOpacity(.5), width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.withOpacity(.1), width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.withOpacity(.1), width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red.withOpacity(.3), width: 1.0),
        ),
      ),
    );
  }
}
