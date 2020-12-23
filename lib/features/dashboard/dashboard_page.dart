import 'package:amadis_customer/core/utils/utils.dart';
import 'package:amadis_customer/features/home/home_page.dart';
import 'package:amadis_customer/features/my_orders/my_orders_page.dart';
import 'package:amadis_customer/features/profile/profile_page.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key, this.initialPage}) : super(key: key);
  final int initialPage;
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardPage> {
  int _currentIndex;
  PageController _pageController;

  @override
  void initState() {
    _currentIndex = widget.initialPage ?? 0;
    _pageController =
        PageController(initialPage: _currentIndex, viewportFraction: 1.0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AmadisColors.primaryColor,
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomePage(),
            MyOrdersPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: kToolbarHeight,
        selectedIndex: _currentIndex,
        curve: Curves.easeInOutQuad,
        animationDuration: const Duration(milliseconds: 500),
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(
            index,
            curve: Curves.easeInOutQuad,
            duration: Duration(milliseconds: 500),
          );
        },
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        showElevation: true,
        iconSize: 30,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
            textAlign: TextAlign.center,
            activeColor: AmadisColors.primaryColor,
            inactiveColor: AmadisColors.secondaryColor.withOpacity(0.8),
          ),
          BottomNavyBarItem(
            title: Text('Mis Pedidos'),
            icon: Icon(Icons.location_on),
            textAlign: TextAlign.center,
            activeColor: AmadisColors.primaryColor,
            inactiveColor: AmadisColors.secondaryColor.withOpacity(0.8),
          ),
          BottomNavyBarItem(
            title: Text('Perfil'),
            icon: Icon(Icons.person_outline),
            textAlign: TextAlign.center,
            activeColor: AmadisColors.primaryColor,
            inactiveColor: AmadisColors.secondaryColor.withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}
