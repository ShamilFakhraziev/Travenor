import 'package:flutter/material.dart';
import 'package:travel_app/domain/entity/destination.dart';
import 'package:travel_app/helpers/colors/app_color.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            AppBarWidget(),
            SizedBox(height: 30),
            SizedBox(
              height: 48,
              width: 350,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  suffix: IconButton(icon: Icon(Icons.mic), onPressed: () {}),
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: AppColor.backButtonColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(40, 0, 0, 0),
                      width: 0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(40, 0, 0, 0),
                      width: 0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(40, 0, 0, 0),
                      width: 0,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "sf",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Search Places",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'sf',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 1000,
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),

                itemBuilder: (context, index) {
                  return SearchPlacesGridItem(destination: _dest);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPlacesGridItem extends StatelessWidget {
  const SearchPlacesGridItem({super.key, required this.destination});

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SizedBox(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                destination.photos[0],
                height: 124,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                destination.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'sf',
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Icon(Icons.location_on_outlined),
                Text(
                  "${destination.district}, ${destination.country}",
                  style: TextStyle(
                    fontFamily: 'sf',
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "\$${destination.price}",
                      style: TextStyle(
                        fontFamily: 'sf',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: AppColor.primaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      "/Person",
                      style: TextStyle(
                        fontFamily: 'sf',
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 44,
          height: 44,
          child: IconButton(
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              backgroundColor: Color(0x101B1E28),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },
            icon: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Icon(Icons.arrow_back_ios, size: 24),
            ),
          ),
        ),
        Text(
          "Search",
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'sf',
          ),
        ),
        TextButton(
          child: Text(
            "Cancel",
            style: TextStyle(
              fontFamily: 'sf',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.primaryColor,
            ),
          ),
          style: TextButton.styleFrom(),
          onPressed: () {
            //model?.not = NotificationTimeButtons.Recent;
          },
        ),
      ],
    );
  }
}
