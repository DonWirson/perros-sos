import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 130,
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Quinta Normal",
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "14:59",
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 100,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Image.network(
              fit: BoxFit.cover,
              "https://i.natgeofe.com/n/4f5aaece-3300-41a4-b2a8-ed2708a0a27c/domestic-dog_thumb_square.jpg",
            ),
          ),
        ],
      ),
    );
  }
}
