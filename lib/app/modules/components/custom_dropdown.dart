import 'package:flutter/material.dart';
import 'package:pxn_mobile/utils/constants.dart';

class CustomDropDown extends StatelessWidget {
  final List<dynamic> billers;
  final dynamic selectedBiller;
  final Function(dynamic) onChanged;
  final String displayValue;
  final String hint;
  const CustomDropDown({
    Key key,
    this.billers,
    this.selectedBiller,
    this.onChanged,
    this.displayValue,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: DropdownButtonFormField(
        value: selectedBiller,
        onChanged: onChanged,
        // selectedItemBuilder: (context) => [
        //   Text("data"),
        // ],
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
            Icons.airline_seat_flat,
            color: Color(0xFF1D83AE),
          ),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        items: billers
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(
                  "${e.toJson()[displayValue]}",
                  style: kSearchTextStyle,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class ProviderCustomDropDown extends StatelessWidget {
  final List<dynamic> billers;
  final dynamic selectedBiller;
  final Function(dynamic) onChanged;
  final String displayValue;
  final String hint;
  const ProviderCustomDropDown({
    Key key,
    this.billers,
    this.selectedBiller,
    this.onChanged,
    this.displayValue,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: DropdownButtonFormField(
        value: selectedBiller,
        onChanged: onChanged,
        // selectedItemBuilder: (context) => [
        //   Text("data"),
        // ],
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
            Icons.airline_seat_flat,
            color: Color(0xFF1D83AE),
          ),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        items: billers
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Text(
                  "${e.toJson()[displayValue]}",
                  style: kSearchTextStyle,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
