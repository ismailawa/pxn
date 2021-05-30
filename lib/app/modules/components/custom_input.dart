import 'package:flutter/material.dart';
import 'package:pxn_mobile/utils/constants.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final bool isTogglePassword;
  final Function(bool) togglePassword;
  final Function(String) validator;

  final String hint;
  final IconData icon;
  const CustomInput({
    Key key,
    this.icon,
    this.hint,
    this.controller,
    this.isPassword = false,
    this.isTogglePassword = false,
    this.togglePassword, this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: TextFormField(
        validator: validator,
        controller: controller,
        style: kSearchTextStyle,
        obscureText: isPassword && isTogglePassword,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: kSearchPlaceholderStyle,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(
                color: Color(0xFF1D83AE),
                width: 2,
              )),
          prefixIcon: Icon(
            icon,
            color: Color(0xFF1D83AE),
          ),
          suffixIcon: !isTogglePassword && !isPassword
              ? null
              : isTogglePassword
                  ? InkWell(
                      onTap: () {
                        togglePassword(true);
                      },
                      child: Icon(
                        Icons.visibility,
                        color: Color(0xFF1D83AE),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        togglePassword(false);
                      },
                      child: Icon(
                        Icons.visibility_off,
                        color: Color(0xFF1D83AE),
                      ),
                    ),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
