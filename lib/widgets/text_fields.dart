import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String? lableText;
  final IconData? icon;
  final double? width;
  final double? height;
  final TextEditingController? controller;
  final ValueChanged<String?>? onSaved;
  final String Function(String?)? validator;
  final bool? isenable;
  final String? hintText;
  final Color? fontColor;
  final Function()? onTap;

  const InputTextField(
      {Key? key,
      this.lableText,
      this.width,
      this.height,
      this.controller,
      this.icon,
      this.onSaved,
      this.validator,
      this.isenable,
      this.fontColor,
      this.onTap,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.0),
        // color: const Color(0xfff2f2f2),
      ),
      child: TextFormField(
        enabled: isenable,
        controller: controller,
        onSaved: onSaved,
        // validator: validator,
        validator: (input) => input!.trim().isEmpty ? "Can't be empty" : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          // prefixIcon: Icon(
          //   icon,
          //   color: Constants.kIconsColor,
          // ),
          hintText: hintText,
          labelText: lableText,

          // labelStyle: TextStyle(fontSize: 18.0, color: Constants.kPrimaryColor),
          counterStyle: TextStyle(color: fontColor),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.black12,
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.redAccent,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.redAccent,
              width: 2.0,
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
