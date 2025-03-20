import 'package:flutter/material.dart';

import '../../../domain/models/models.dart';

class PetList extends StatelessWidget {
  const PetList({super.key, required this.pets});

  final List<PetModel> pets;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.separated(
        separatorBuilder: (_, index) {
          return const SizedBox(height: 20);
        },
        padding: const EdgeInsets.all(16),
        itemCount: pets.length,
        itemBuilder: (_, index) {
          return SizedBox(
              width: double.infinity,
              height: size.height * .25,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    height: size.height * .2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: const LinearGradient(
                          colors: [
                            Colors.transparent,
                            Color(0xFFfefffe),
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(.35, 0.0),
                          tileMode: TileMode.clamp),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            height: size.height * .25,
                            width: size.width * .55,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pets[index].dogName ?? '',
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.normal,
                                      color: Color(0xff383838)),
                                ),
                                Expanded(
                                  child: Text(
                                    pets[index].description ?? '',
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        color: Color(0xff7a7a79)),
                                  ),
                                ),
                                Text(
                                  'Almost ${pets[index].age.toString()} ${pets[index].age == 1 ? 'year' : 'years'}',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff555454)),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: SizedBox(
                      height: size.height * .25,
                      width: size.width * .35,
                      child: Image.network(
                        //'',
                        pets[index].image ?? '',
                        fit: BoxFit.fill,
                        errorBuilder: (_, obj, task) {
                          return const Icon(Icons.error_outline);
                        },
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
