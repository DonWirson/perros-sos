import 'package:flutter/material.dart';
import '../../domain/entities/lost_pet_entities.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.lostPet,
    super.key,
  });
  final LostPet lostPet;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 10,
          child: Text(
            substractHour(
              lostPet.reportDate.toString(),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 15,
          // child: lostPet.photoUrl == null
          child: true
              ? Image.asset(
                  "assets/images/cute_dog.jpg",
                  fit: BoxFit.fitHeight,
                  height: 100,
                )
              : Image.asset(
                  "assets/images/cute_dog.jpg",
                  fit: BoxFit.fitHeight,
                  height: 100,
                ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              // lostPet.address ?? "",
              "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }

  String substractHour(String timeStamp) {
    var dateHour = timeStamp.split(" ");
    return dateHour[1].substring(0, 5);
  }
}
