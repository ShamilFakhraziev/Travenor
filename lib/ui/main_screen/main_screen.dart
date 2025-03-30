import 'package:flutter/material.dart';
import 'package:travel_app/helpers/colors/app_color.dart';
import 'package:travel_app/ui/calendar/calendar_screen.dart';
import 'package:travel_app/ui/message/message_screen.dart';
import 'package:travel_app/ui/my_profile/my_profile_screen.dart';
import 'package:travel_app/ui/home/home_screen.dart';
import 'package:travel_app/ui/search/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;
  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  Widget _buildMiddleTabItem() {
    return Container(
      width: 50, // Задайте желаемую ширину
      height: 50, // Задайте желаемую высоту
      decoration: BoxDecoration(
        color: AppColor.primaryColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.search_outlined, // Ваша иконка
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedTab,
        children: [
          const HomeScreen(),
          CalendarScreen(),
          SearchScreen(),
          MessageScreen(),
          const MyProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        onTap: onSelectTab,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),

          BottomNavigationBarItem(icon: _buildMiddleTabItem(), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Messages',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
