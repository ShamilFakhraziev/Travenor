import 'package:flutter/material.dart';
import 'package:travel_app/domain/entity/user.dart';
import 'package:travel_app/helpers/colors/app_color.dart';
import 'package:travel_app/ui/message/message_screen.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key, required this.companion});
  final User companion;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final TextEditingController _newMessageCOntroller = TextEditingController();

  bool _isMe = false;
  void sendMessage(String text) {
    ChatMessage? newMessage = ChatMessage(
      body: text,
      isMe: _isMe,
      companion: widget.companion,
      status: MessageStatus.Checked,
      date: DateTime.now(),
    );
    _messages.insert(0, newMessage);
    _newMessageCOntroller.text = '';
    _isMe = !_isMe;
    setState(() {});
  }

  List<ChatMessage> _messages = <ChatMessage>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final ChatMessage message = ChatMessage(
      companion: widget.companion,
      body:
          "Hellfsssssssssssssssssfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffsssssssssssso",
      isMe: true,
      date: DateTime.now(),
      status: MessageStatus.Checked,
    );
    _messages.add(message);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              AppBarWidget(companion: widget.companion),
              MessagesListWidget(messages: _messages),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 48,
                    width: 310,
                    child: TextField(
                      onSubmitted: sendMessage,
                      controller: _newMessageCOntroller,
                      textAlignVertical: TextAlignVertical.center,
                      textInputAction: TextInputAction.send,

                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.attach_file),
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
                  CircleAvatar(
                    backgroundColor: AppColor.primaryColor,
                    radius: 24,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.mic, color: Colors.white),
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

class MessagesListWidget extends StatelessWidget {
  MessagesListWidget({super.key, required this.messages});

  final List<ChatMessage> messages;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 570,
        child: ListView.builder(
          itemCount: messages.length,
          reverse: true,
          itemBuilder: (context, index) {
            return messages[index];
          },
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String body;
  final MessageStatus status;
  final DateTime date;
  final bool isMe;
  final User companion;
  ChatMessage({
    required this.body,
    required this.isMe,
    required this.companion,
    required this.status,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  companion.profileImage,
                  width: 40,
                  height: 40,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ColoredBox(
              color:
                  isMe
                      ? Color(0xffE5F4FF)
                      : const Color.fromARGB(52, 158, 158, 158),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: SizedBox(
                  width: 300,
                  child: Wrap(
                    children: [
                      Text(
                        body,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontFamily: 'Geometry',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "${date.hour}:${date.minute}",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              //fontFamily: 'sf',
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.check,
                            size: 16,
                            color:
                                status == MessageStatus.Checked
                                    ? Colors.green
                                    : Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.companion});
  final User companion;
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
              Navigator.of(context).pop();
            },
            icon: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Icon(Icons.arrow_back_ios, size: 24),
            ),
          ),
        ),
        SizedBox(
          width: 200,
          child: Column(
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                companion.name,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'sf',
                ),
              ),
              Text(
                "Active Now",
                style: TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.green,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'sf',
                ),
              ),
            ],
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
            icon: Icon(Icons.phone, size: 22, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
