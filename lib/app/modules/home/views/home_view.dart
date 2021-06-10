import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:pxn_mobile/app/modules/components/custom_input.dart';
import 'package:pxn_mobile/app/modules/components/sections_header.dart';
import 'package:pxn_mobile/app/modules/home/components/services_list_section.dart';
import 'package:pxn_mobile/app/modules/home/components/transaction_list_section.dart';
import 'package:pxn_mobile/app/modules/home/components/wallet_card.dart';
import 'package:pxn_mobile/app/modules/home/controllers/home_controller.dart';
import 'package:pxn_mobile/utils/constants.dart';

class HomeView extends StatelessWidget {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100.withOpacity(0.3),
      body: Obx(
        () => SafeArea(
          child: controller.user.value.id == null
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          HeaderSection(),
                          SizedBox(
                            height: 20,
                          ),
                          WalletCard(
                            user: controller.user.value,
                            topupWallet: () {
                              controller.openPaymentDialog(context);
                            },
                          ),
                          Label(
                            title: "Services",
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          ServiceListSection(),
                          Label(
                            title: "Recent Transactions",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TransactionListSection(
                            controller: controller,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  final Function close;
  final Function makePayment;
  const CustomDialog({
    Key key,
    this.close,
    this.makePayment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.40,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Top Up",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              CustomInput(
                formater: [ThousandsSeparatorInputFormatter()],
                icon: Icons.payment,
                hint: "Enter Amount",
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: MaterialButton(
                    color: pxnSecondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: makePayment,
                    child: Text(
                      'Proceed',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: close, child: Text('Cancel')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 3 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}

class Label extends StatelessWidget {
  final String title;
  const Label({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Row(
        children: [
          Text(
            title,
            style: kLargeTitleStyle3,
          ),
        ],
      ),
    );
  }
}
