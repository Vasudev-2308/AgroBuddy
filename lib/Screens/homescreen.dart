// ignore_for_file: prefer_const_constructors

import 'package:agro_buddy/Models/farm_data_model.dart';
import 'package:agro_buddy/Screens/BottomNavBarPages/crop_recommender.dart';
import 'package:agro_buddy/Screens/BottomNavBarPages/farmscreen.dart';
import 'package:agro_buddy/Screens/BottomNavBarPages/home.dart';
import 'package:agro_buddy/Screens/settings_drawer_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PageController? _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var providerInstance = Provider.of<FarmData>(context, listen: false);
      providerInstance.fetchDataFromJson();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController!.dispose();
    super.dispose();
  }

  int _selectedIndex = 0;

  onTap(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController!.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 5,
          title: const Text(
            'Agrobuddy',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                },
                icon: Icon(
                  Icons.tune,
                  size: 25,
                ))
          ],
        ),
        body: PageView(
          controller: _pageController,
          children: [
            Home(), RecommenderScreen(), Farm()],),
        endDrawer: DrawerWidget(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.home,
                size: 27,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.leaf_arrow_circlepath,
                  size: 27,
                ),
                label: "Crop"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.agriculture_outlined,
                  size: 27,
                ),
                label: "Farm")
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.blueGrey,
          type: BottomNavigationBarType.shifting,
          onTap: onTap,
        ),
      ),
    );
  }
}
