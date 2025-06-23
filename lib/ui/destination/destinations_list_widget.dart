import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/domain/blocs/local/destinations/destinations_bloc.dart';
import 'package:travel_app/domain/blocs/local/destinations/destinations_event.dart';
import 'package:travel_app/domain/blocs/local/destinations/destinations_state.dart';
import 'package:travel_app/helpers/colors/app_color.dart';
import 'package:travel_app/ui/destination/destination_details_widget.dart';

class DestinationsListWidget extends StatefulWidget {
  DestinationsListWidget({super.key});

  @override
  State<DestinationsListWidget> createState() => _DestinationsListWidgetState();
}

class _DestinationsListWidgetState extends State<DestinationsListWidget> {
  late final DestinationsBloc destinationsBloc;
  // TODO: !Middle. Не стоит скоращать название переменных
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    destinationsBloc = BlocProvider.of<DestinationsBloc>(context);
    //TODO: изучить момент. Можно ли задать блоку стартовый ивент при его инициалзиации
    destinationsBloc.add(DestinationsLoadingStart());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 384,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        //TODO: Middle. доабвил  BlocListener но не использую его в чем смысл его добавления
        //TODO: Middle. использовать BlocConsumer вместо сочетания BlocListener и BlocBuilder
        child:
        // BlocListener<DestinationsBloc, DestinationsState>(
        //   listener: (context, state) {},
        //child: BlocBuilder<DestinationsBloc, DestinationsState>(
        BlocBuilder<DestinationsBloc, DestinationsState>(
          builder: (context, state) {
            if (state is DestinationsFailure) {
              return Text('Error: ${state.errorMessage}');
            }
            if (state is DestinationsSuccess) {
              final destinations = state.destinations;

              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (BuildContext context, int index) {
                  final destination = destinations[index];
                  if (destination == null) {
                    return SizedBox.shrink();
                  }
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
                                      child: Image.network(
                                        //TODO: Middle. внутри билдеров на подобие ListView.builder в начале пишем что то вроде final destination = destinations[index]
                                        //destinations[index].imageUrls.first,
                                        destination.imageUrls.first,
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
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 180,
                                        child: Text(
                                          destination.title,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'sf',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      //TODO: !Minor. Лучше было бы вынести в отдельный виджет
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 4,
                                            ),
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                              size: 18,
                                            ),
                                          ),
                                          Text(
                                            destination.rating.toString(),
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
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        "${destination.district}, ${destination.country}",
                                        style: TextStyle(
                                          fontFamily: 'sf',
                                          fontSize: 15,
                                          color: AppColor.descriptionTextColor,
                                        ),
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
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        //TODO: (By me) почему не надо исппользовать виджет в названии что плохого в этом конкретно здесь
                                        (context) => DestinationDetailsWidget(
                                          destination: destination,
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
              );
            }
            return Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: AppColor.primaryColor,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
