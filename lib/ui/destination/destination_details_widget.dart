import 'package:flutter/material.dart';
import 'package:travel_app/domain/entity/destination.dart';
import 'package:travel_app/helpers/colors/app_color.dart';

class DestinationDetailsWidget extends StatelessWidget {
  const DestinationDetailsWidget({super.key, required this.destination});
  final Destination destination;
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MainImageWidget(destination: destination),
                  SizedBox(height: 20),
                  TitleAndLocationWidget(destination: destination),
                  SizedBox(height: 24),
                  UnderImageInfoWidget(destination: destination),
                  SizedBox(height: 24),
                  DescriptionWidget(destination: destination),
                ],
              ),
            ),
          ),
          BookNowButtonWidget(),
        ],
      ),
    );
  }
}

class BookNowButtonWidget extends StatelessWidget {
  const BookNowButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            "Book Now",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: "Geometry",
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: AppColor.primaryColor,
          ),
        ),
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.destination});
  final Destination destination;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About Destination",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontFamily: 'sf',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            destination.about,
            style: TextStyle(
              height: 1.5,
              decoration: TextDecoration.none,
              color: Colors.grey,
              fontFamily: 'sf',
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

class UnderImageInfoWidget extends StatelessWidget {
  const UnderImageInfoWidget({super.key, required this.destination});
  final Destination destination;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.grey),
              Text(
                " ${destination.district}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'sf',
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(Icons.star, color: Colors.yellow, size: 18),
              ),
              Text(
                destination.rating.toString(),
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'sf',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "\$${destination.price}",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                  fontFamily: 'sf',
                  fontSize: 15,
                  color: AppColor.primaryColor,
                ),
              ),
              Text(
                "/Person",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'sf',
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TitleAndLocationWidget extends StatelessWidget {
  const TitleAndLocationWidget({super.key, required this.destination});
  final Destination destination;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            destination.title,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
              fontFamily: 'sf',
            ),
          ),
          SizedBox(height: 5),
          Text(
            "${destination.district}, ${destination.country}",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: 'sf',
            ),
          ),
        ],
      ),
    );
  }
}

class MainImageWidget extends StatelessWidget {
  const MainImageWidget({super.key, required this.destination});

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Image.asset(
              destination.photos[0],
              height: 350,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
            child: Row(
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
                      backgroundColor: const Color.fromRGBO(
                        158,
                        158,
                        158,
                        0.3,
                      ), //Color(0x101B1E28),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Text(
                  "Details",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'sf',
                  ),
                ),
                SizedBox(
                  width: 44,
                  height: 44,
                  child: IconButton(
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      backgroundColor: const Color.fromRGBO(
                        158,
                        158,
                        158,
                        0.3,
                      ), //Color(0x101B1E28),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_outline,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
