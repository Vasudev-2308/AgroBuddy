// ignore_for_file: prefer_const_constructors

import 'package:agro_buddy/Screens/BottomNavBarPages/farmscreen.dart';
import 'package:agro_buddy/Screens/BottomNavBarPages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  final List<Widget> _pages = [Home(), Farm()];
  bool status0 = false;
  bool status1 = false;

  onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: _pages.elementAt(_selectedIndex),
      endDrawer: SafeArea(
        child: Drawer(
            elevation: 10.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30)),
            ),
            child: Container(
              margin: EdgeInsets.all(20),
              child: ListView(children: <Widget>[
                Center(
                  child: Text(
                    "Settings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                Divider(
                  thickness: 2,
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Push Notifications"),
                    FlutterSwitch(
                      width: 70.0,
                      height: 34.0,
                      valueFontSize: 15.0,
                      toggleSize: 22.0,
                      value: status0,
                      borderRadius: 30.0,
                      padding: 8.0,
                      showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          status0 = val;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("App Updates"),
                    FlutterSwitch(
                      width: 70.0,
                      height: 34.0,
                      valueFontSize: 15.0,
                      toggleSize: 22.0,
                      value: status1,
                      borderRadius: 30.0,
                      showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          status1 = val;
                        });
                      },
                    ),
                  ],
                ),
              ]),
            )),
      ),
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
    );
  }
}
