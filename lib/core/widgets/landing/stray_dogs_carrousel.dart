import 'package:flutter/material.dart';

import '../../utils/custom_list_tile.dart';

class StrayDogsCarrousel extends StatelessWidget {
  const  StrayDogsCarrousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            topLeft: Radius.circular(5),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 178, 184, 143),
              Colors.white,
            ],
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(20),
          height: 160,
          child: ListView.separated(
            itemCount: 5,
            primary: true,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const CustomListTile());
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 20,
              );
            },
          ),
        ),
      ),
    );
  }
}
