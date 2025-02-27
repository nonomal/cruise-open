import 'package:cruise/src/common/nav/nav_util.dart';
import 'package:cruise/src/page/pay/page.dart';
import 'package:cruise/src/page/user/discover/page.dart';
import 'package:cruise/src/page/user/fav/page.dart';
import 'package:cruise/src/page/user/feedback/feedback_page.dart';
import 'package:cruise/src/page/user/history/page.dart';
import 'package:cruise/src/page/user/settings/about/page.dart';
import 'package:cruise/src/page/user/settings/main/main_page.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel/wheel.dart';

class CruiseSettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEFEFEF),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 55, 0, 0),
            child: ListView(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(EvaIcons.person),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              title: Text("我的"),
                              onTap: () async {
                                bool isLoggedIn = await Auth.isLoggedIn();
                                if (isLoggedIn) {
                                  NavUtil.navProfile(context);
                                  //page = BottomNavigationDemo(type: BottomNavigationDemoType.withLabels);
                                } else {
                                  NavUtil.navLogin(context);
                                }
                              },
                            )))),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ClipRRect(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                                color: Colors.white,
                                child: ListTile(
                                  leading: Icon(EvaIcons.bookmark),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  title: Text("收藏"),
                                  onTap: () async {
                                    bool isLoggedIn = await Auth.isLoggedIn();
                                    if (isLoggedIn) {
                                      var data = {'name': "fav"};
                                      Widget page =
                                          FavArticlePage().buildPage(data);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => page),
                                      );
                                    } else {
                                      NavUtil.navLogin(context);
                                    }
                                  },
                                ))))),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(EvaIcons.bulb),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              title: Text("发现"),
                              onTap: () async {
                                var data = {'name': "originalstories"};
                                Widget page = DiscoverPage().buildPage(data);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => page),
                                );
                              },
                            )))),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ClipRRect(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                                color: Colors.white,
                                child: ListTile(
                                  leading: Icon(EvaIcons.clock),
                                  trailing: Icon(Icons.keyboard_arrow_right),
                                  title: Text("阅读历史"),
                                  onTap: () async {
                                    bool isLoggedIn = await Auth.isLoggedIn();
                                    if (isLoggedIn) {
                                      var data = {'name': "history"};
                                      Widget page =
                                          HistoryPage().buildPage(data);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => page),
                                      );
                                    } else {
                                      NavUtil.navLogin(context);
                                    }
                                  },
                                ))))),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(EvaIcons.email),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              title: Text("意见建议"),
                              onTap: () async {
                                Get.to(() => FeedbackPage());
                              },
                            )))),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(EvaIcons.info),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              title: Text("关于cruise"),
                              onTap: () async {
                                var data = {'name': "aboutPage"};
                                Widget aboutPage = AboutPage().buildPage(data);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => aboutPage),
                                );
                              },
                            )))),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            color: Colors.white,
                            //margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: ListTile(
                              leading: Icon(EvaIcons.settings),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              title: Text("设置"),
                              onTap: () async {
                                Get.to(() => MainPage());
                              },
                            )))),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                            color: Colors.white,
                            child: ListTile(
                              leading: Icon(EvaIcons.heart),
                              trailing: Icon(Icons.keyboard_arrow_right),
                              title: Text("会员中心"),
                              onTap: () async {
                                bool isLoggedIn = await Auth.isLoggedIn();
                                if (isLoggedIn) {
                                  var data = {'name': "payPage"};
                                  Widget payPage = PayPage().buildPage(data);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => payPage),
                                  );
                                } else {
                                  NavUtil.navLogin(context);
                                }
                              },
                            )))),
              ],
            ),
          ),
        ));
  }
}
