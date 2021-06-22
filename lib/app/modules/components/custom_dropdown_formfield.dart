
// import 'package:flutter/material.dart';
// import 'package:pxn_mobile/utils/constants.dart';

// class CustomDropDown<T> extends StatelessWidget {
//   final List<T> billers;
//   final T selectedBiller;
//   final Function(dynamic) onChanged;
//   const CustomDropDown({
//     Key key,
//     this.billers,
//     this.selectedBiller,
//     this.onChanged,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 0),
//       child: DropdownButtonFormField(
//         value: selectedBiller,
//         onChanged: onChanged,
//         // selectedItemBuilder: (context) => [
//         //   Text("data"),
//         // ],
//         decoration: InputDecoration(
//           hintText: "Select Vendor",
//           hintStyle: kSearchPlaceholderStyle,
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(40),
//               borderSide: BorderSide(
//                 color: Color(0xFF1D83AE),
//                 width: 2,
//               )),
//           prefixIcon: Icon(
//             Icons.airline_seat_flat,
//             color: Color(0xFF1D83AE),
//           ),
//           isDense: true,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(40),
//           ),
//         ),
//         items: billers
//             .map(
//               (e) => DropdownMenuItem<T>(
//                 value: e,
//                 child: Text(
//                   "${e.name}",
//                   style: kSearchTextStyle,
//                 ),
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }
