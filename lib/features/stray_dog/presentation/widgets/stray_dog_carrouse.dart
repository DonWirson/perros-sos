import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perros_sos/features/stray_dog/data/models/stray_dog_model.dart';
import 'package:perros_sos/features/stray_dog/presentation/bloc/stray_dog_bloc.dart';
import 'package:perros_sos/features/stray_dog/presentation/widgets/custom_card.dart';

class StrayDogsCarrousel extends StatefulWidget {
  const StrayDogsCarrousel({super.key});

  @override
  State<StrayDogsCarrousel> createState() => _StrayDogsCarrouselState();
}

class _StrayDogsCarrouselState extends State<StrayDogsCarrousel> {
  List<StrayDogModel> strayDogsModel = [];

  @override
  void initState() {
    super.initState();
    //Dispara evento que busca ultimos reportados
    BlocProvider.of<StrayDogBloc>(context).add(
      GotAllStrayDogs(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StrayDogBloc, StrayDogState>(
      listener: (context, state) {
        if (state is GotAllStrayDogsSuccess) {
          setState(() {
            strayDogsModel = state.strayDogs! as List<StrayDogModel>;
          });
        }
        if (state is GotAllStrayDogsFailure) {
          //TODO:Implementar snackbar o accion al fallar request
        }
      },
      child: Padding(
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
              itemCount: strayDogsModel.length,
              primary: true,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: CustomCard(
                    strayDogModel: strayDogsModel[index],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 20,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
