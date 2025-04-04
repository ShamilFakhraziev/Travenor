import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travel_app/domain/entity/user.dart';
import 'package:travel_app/helpers/colors/app_color.dart';
import 'package:travel_app/helpers/images/app_image.dart';
import 'package:travel_app/ui/message/chat_widget.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
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
            MessagesAndEditButtonWidget(),
            SizedBox(height: 10),
            SizedBox(
              height: 48,
              width: 370,
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
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
            Align(alignment: Alignment.topLeft, child: MessagesListWidget()),
          ],
        ),
      ),
    );
  }
}

class MessagesListWidget extends StatelessWidget {
  MessagesListWidget({super.key});
  final Message message = Message(
    companion: User(
      id: 1,
      name: "First Lastffffffffffffffffffffffffffffffffffffffffffffffffffffff",
      profileImage: AppImage.profileImage,
    ),
    body:
        "Hifffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
    status: MessageStatus.Unchecked,
    date: DateTime(2025, 03, 28, 9, 53),
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Stack(
              children: [
                MessagesListItemWidget(message: message),
                SizedBox(
                  width: 400,
                  height: 60,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => //ChatScreen(),
                                    ChatWidget(companion: message.companion),
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
    );
  }
}

class MessagesListItemWidget extends StatelessWidget {
  MessagesListItemWidget({super.key, required this.message});
  final Message message;
  final TextStyle style = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    fontFamily: 'sf',
    color: Colors.grey,
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 60,
      child: ColoredBox(
        color: Colors.white,
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              SizedBox(
                width: 56,
                height: 56,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Image.asset(
                        message.companion.profileImage,
                        width: 56,
                        height: 56,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 2,
                      child: CircleAvatar(
                        radius: 8,
                        backgroundColor: Color.fromRGBO(
                          Random().nextInt(255),
                          Random().nextInt(255),
                          Random().nextInt(255),
                          1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Expanded(
                          child: Text(
                            message.companion.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'sf',
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.check,
                        size: 16,
                        color:
                            message.status == MessageStatus.Checked
                                ? AppColor.primaryColor
                                : Colors.grey,
                      ),
                      SizedBox(width: 5),
                      if (DateTime.now().difference(message.date).inDays < 1)
                        Text(
                          "${message.date.hour}:${message.date.minute}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: style,
                        )
                      else if (DateTime.now().difference(message.date).inDays <
                          2)
                        Text(
                          "Yesterday",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: style,
                        )
                      else if (DateTime.now().difference(message.date).inDays <
                          30)
                        Text(
                          "${message.date.day}/${message.date.month}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: style,
                        )
                      else if (DateTime.now().difference(message.date).inDays <
                          365)
                        Text(
                          "${message.date.day}/${message.date.month}/${message.date.year}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: style,
                        ),
                    ],
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      message.body,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'sf',
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Message {
  final User companion;
  final String body;
  final MessageStatus status;
  final DateTime date;

  Message({
    required this.companion,
    required this.body,
    required this.status,
    required this.date,
  });
}

enum MessageStatus { Checked, Unchecked }

class MessagesAndEditButtonWidget extends StatelessWidget {
  const MessagesAndEditButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Messages",
          style: TextStyle(
            fontSize: 20,
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
            ),
            onPressed: () {},
            icon: Icon(Icons.add, size: 24),
          ),
        ),
      ],
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
          "Messages",
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
            icon: Icon(Icons.more_vert, size: 28, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
