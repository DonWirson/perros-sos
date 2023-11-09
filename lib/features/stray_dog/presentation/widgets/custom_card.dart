import 'package:flutter/material.dart';
import 'package:perros_sos/features/stray_dog/data/models/stray_dog_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.strayDogModel,
    super.key,
  });
  final StrayDogModel strayDogModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 10,
          child: Text(
            substractHour(
              strayDogModel.reportDate.toString(),
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 15,
          child: strayDogModel.photoUrl == null
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
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              strayDogModel.address ?? "",
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
