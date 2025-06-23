import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travel_app/domain/entity/destination.dart';
import 'package:travel_app/helpers/colors/app_color.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.week;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final Destination _destination = Destination(
    id: 1,
    imageUrls: <String>[
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

  // Пример данных о событиях
  final Map<DateTime, List<Destination>> _events = {
    DateTime.utc(2025, 03, 31): [
      Destination(
        id: 1,
        imageUrls: <String>[
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
      ),
      Destination(
        id: 1,
        imageUrls: <String>[
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
      ),

      Destination(
        id: 1,
        imageUrls: <String>[
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
      ),
      Destination(
        id: 1,
        imageUrls: <String>[
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
      ),

      Destination(
        id: 1,
        imageUrls: <String>[
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
      ),
      Destination(
        id: 1,
        imageUrls: <String>[
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
      ),

      Destination(
        id: 1,
        imageUrls: <String>[
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
      ),
      Destination(
        id: 1,
        imageUrls: <String>[
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
      ),
    ],
    DateTime.utc(2025, 04, 02): [
      Destination(
        id: 1,
        imageUrls: <String>[
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
      ),
    ],
  };

  List<Destination> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    //TODO: !Middle.При множественном вызове одного  и того же метода подумоть можно ли его рещультаты вынести в отедльную переменную
    final selectedDayEvents = _getEventsForDay(_selectedDay ?? _focusedDay);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30),
          AppBarWidget(),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              eventLoader: _getEventsForDay,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 15, top: 20),
            child: SizedBox(
              height: 390,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My Schedule",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'sf',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View all',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'sf',
                            color: AppColor.primaryColor,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: selectedDayEvents.length,
                      itemBuilder: (context, index) {
                        final _dest = selectedDayEvents[index];
                        return SelectedDayItemWidget(dest: _dest);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
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
                backgroundColor: Color(0x101B1E28),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/auth');
              },
              icon: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Icon(Icons.arrow_back_ios, size: 24),
              ),
            ),
          ),
          Text(
            "Schedule",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
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
                backgroundColor: Color(0x101B1E28),
              ),
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                size: 28,
                color: AppColor.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectedDayItemWidget extends StatelessWidget {
  const SelectedDayItemWidget({super.key, required this.dest});
  final Destination dest;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ColoredBox(
          color: const Color.fromARGB(15, 158, 158, 158),
          child: SizedBox(
            width: 335,
            height: 80,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    dest.imageUrls[0],
                    width: 80,
                    height: 80,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            dest.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'sf',
                            ),
                          ),
                        ),
                        //TODO: !Minor. Можно вынести в common widgets (видежты которые используются по всему приложению)
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 20,
                              color: Colors.grey,
                            ),
                            Text(
                              "${dest.district}, ${dest.country}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'sf',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
