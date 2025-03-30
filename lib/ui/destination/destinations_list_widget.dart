import 'package:flutter/material.dart';
import 'package:travel_app/domain/entity/destination.dart';
import 'package:travel_app/helpers/colors/app_color.dart';
import 'package:travel_app/ui/destination/destination_details_widget.dart';

class DestinationsListWidget extends StatelessWidget {
  DestinationsListWidget({super.key});

  final Destination _dest = Destination(
    id: 1,
    photos: <String>[
      "assets/images/alt.jpeg",
      "assets/images/alt1.jpeg",
      "assets/images/alt2.jpeg",
    ],
    title: "The Golden Mountains of Altai",
    country: "Russia",
    district: "Altai",
    rating: 5,
    price: 60,
    about:
        "The Golden Mountains of Altai are the heart of Siberia, a region captivating with its wild beauty. They are not just mountains, but an entire system of ranges where peaks touch the sky and glaciers feed crystal-clear rivers. Here, alpine meadows are overflowing with flowers, and dense coniferous forests hold the secrets of ancient shamans.",
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 384,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  ColoredBox(
                    color: Colors.white,
                    child: SizedBox(
                      width: 240,
                      height: 360,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  _dest.photos[0],
                                  width: 240,
                                  height: 286,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                top: 6,
                                right: 6,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_border),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 180,
                                  child: Text(
                                    _dest.title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'sf',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 18,
                                      ),
                                    ),
                                    Text(
                                      _dest.rating.toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: 'sf',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColor.descriptionTextColor,
                              ),
                              Text(
                                "${_dest.district}, ${_dest.country}",
                                style: TextStyle(
                                  fontFamily: 'sf',
                                  fontSize: 15,
                                  color: AppColor.descriptionTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 240,
                    height: 360,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => DestinationDetailsWidget(
                                    destination: _dest,
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
