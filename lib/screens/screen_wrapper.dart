import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';


import '../services/authentication/auth_services.dart';
import 'main_screens/home_screen.dart';
import 'main_screens/portfolio_screen.dart';
import 'main_screens/tempscreen.dart';
class ScreenWrapper extends StatefulWidget {
  const ScreenWrapper({super.key});

  @override
  State<ScreenWrapper> createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  bool homescreen = true;
  bool portfolioscreen = false;
  bool tempscreen = false;
  GlobalKey<CurvedNavigationBarState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: key,
          index: 0,
          items: const [
            Icon(Icons.home),
            Icon(Icons.person),
            Icon(Icons.logout),
            Icon(Icons.abc)
          ],
          onTap: (index){
            if(index==1){
              setState(() {
                homescreen = false;
                portfolioscreen = true;
                tempscreen = false;
              });
            }
            if(index==0){
              setState(() {
                homescreen = true;
                portfolioscreen = false;
                tempscreen = false;
              });
            }
            if(index == 2){
              setState(() async {
                await AuthServices().signUserOut();
              });

            }
            if(index==3){
              setState(() {
                homescreen = false;
                portfolioscreen = false;
                tempscreen = true;
              });
            }
          },
          color: const Color.fromARGB(255, 130, 123, 230),
          buttonBackgroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeOutQuart,
          animationDuration: const Duration(milliseconds: 600),
        ),
        body: Stack(
          children: [
            Visibility(
              visible: homescreen,
              child: const HomeScreen(),
            ),
            Visibility(
              visible: portfolioscreen,
              child: const PortfolioScreen(),
            ),
            Visibility(
              visible: tempscreen,
              child: const Tempscreen(),

            )
          ],
        )

    );
  }
}