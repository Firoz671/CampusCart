import 'package:campus_cart/ui/screens/add_screen.dart';
import 'package:campus_cart/ui/screens/chat_screen.dart';
import 'package:campus_cart/ui/screens/favourite_screen.dart';
import 'package:campus_cart/ui/screens/home_screen.dart';
import 'package:campus_cart/ui/screens/notification_screen.dart';
import 'package:campus_cart/ui/screens/seller_profile_screen.dart';
import 'package:campus_cart/ui/screens/widgets/cm_app_bar.dart';
import 'package:campus_cart/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: CmAppBar(
          onPressed: _onTapProfileIconButton,
          isDivider: false,
          icon: CircleAvatar(
            backgroundColor: AppColors.seconderyColor,
            child: Image.asset(
              'assets/images/potato.jpg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        body: _buildPage(),
        bottomNavigationBar: _bottomNavBar(),
      ),
    );
  }

  Widget _buildPage() {
    switch (_currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return FavouriteScreen();
      case 2:
        return AddScreen();
      case 3:
        return NotificationScreen();
      case 4:
        return ChatScreen();
      default:
        return HomeScreen();
    }
  }

  Widget _bottomNavBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedItemColor: Colors.black,
        selectedItemColor: AppColors.blackColor,
        backgroundColor: AppColors.primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: _currentIndex == 0 ? 32 : 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.favorite_border, size: _currentIndex == 1 ? 32 : 24),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded,
                size: _currentIndex == 2 ? 32 : 24),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_outlined,
                size: _currentIndex == 3 ? 32 : 24),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined, size: _currentIndex == 4 ? 32 : 24),
            label: 'Chat',
          ),
        ],
      ),
    );
  }

  void _onTapProfileIconButton() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SellerProfileScreen()));
  }
}
