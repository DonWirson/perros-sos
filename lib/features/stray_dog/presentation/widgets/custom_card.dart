import 'package:flutter/material.dart';
import 'custom_card_details.dart';
import '../../../../core/extension/font_extension.dart';
import '../../domain/entities/lost_pet_entities.dart';

class CustomCard extends StatelessWidget {
  final LostPet lostPet;
  final BuildContext context;

  const CustomCard({
    required this.context,
    required this.lostPet,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset(
                "assets/images/cute_dog.jpg",
                fit: BoxFit.scaleDown,
              ),
            ),
            Text(
              lostPet.name.isEmpty ? "N/A" : lostPet.name,
              style: Theme.of(context).textTheme.h4,
            ),
          ],
        ),
      ),
      onTap: () => navigateToDetails(),
    );
  }

  void navigateToDetails() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CustomCardDetails(
          lostPet: lostPet,
        ),
      ),
    );
  }
}
