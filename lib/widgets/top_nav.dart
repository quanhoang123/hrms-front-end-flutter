import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/api/callapi.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/authentication/authentication.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_text.dart';

class TopNavigationBar extends StatefulWidget {
  @override
  _TopNavigationBarState createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  var userData;
  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  void _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userJson = localStorage.getString('user');
    var user = json.decode(userJson);
    setState(() {
      userData = user;
    });
  }

  void logout() async {
    var res = await CallApi().getData('logout');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.remove('user');
      localStorage.remove('token');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => AuthenticationPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Visibility(
              visible: !ResponsiveWidget.isSmallScreen(context),
              child: CustomText(
                text: "Hr Management",
                color: lightGrey,
                size: 20,
                weight: FontWeight.bold,
              )),
          Expanded(child: Container()),
          IconButton(
              icon: Icon(
                Icons.settings,
                color: dark,
              ),
              onPressed: () {}),
          Stack(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: dark.withOpacity(.7),
                  ),
                  onPressed: () {logout();}),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: active,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: light, width: 2)),
                ),
              )
            ],
          ),
          Container(
            width: 1,
            height: 22,
            color: lightGrey,
          ),
          SizedBox(
            width: 24,
          ),
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text(userData != null ? '${userData['name']}' : '',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.0,
                      fontWeight: FontWeight.w500
                  )
              )
          ),
          SizedBox(
            width: 16,
          ),
          Container(
            decoration: BoxDecoration(
                color: active.withOpacity(.5),
                borderRadius: BorderRadius.circular(30)),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: light,
                child: CircleAvatar(
                  backgroundColor: light,
                  backgroundImage: NetworkImage(
                      userData != null ? '${userData['avatar']}' : ''),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Image.asset(
                    "assets/icons/icoins.png",
                    width: 28,
                  ),
                ),
              ],
            )
          : IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                key.currentState.openDrawer();
              }),
      title: TopNavigationBar(),
      iconTheme: IconThemeData(color: dark),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
