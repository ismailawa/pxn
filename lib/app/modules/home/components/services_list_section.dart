import 'package:flutter/material.dart';
import 'package:pxn_mobile/app/modules/home/components/service_card.dart';

class ServiceListSection extends StatelessWidget {
  const ServiceListSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            ServicesCard(
              onCardPress: () {},
              title: 'Utilities',
              imageUrl: 'assets/images/utilities.svg',
            ),
            ServicesCard(
              onCardPress: () {},
              title: 'Transfers',
              imageUrl: 'assets/images/transfer.svg',
            ),
            ServicesCard(
              onCardPress: () {},
              title: 'Carby',
              imageUrl: 'assets/images/carby.svg',
            ),
            ServicesCard(
              onCardPress: () {},
              title: 'Ecommerce',
              imageUrl: 'assets/images/ecommerce.svg',
            ),
            ServicesCard(
              onCardPress: () {},
              title: 'ECurrency',
              imageUrl: 'assets/images/ecurrency.svg',
            ),
          ],
        ),
      ),
    );
  }
}
