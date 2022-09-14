import 'package:flutter/material.dart';
import 'package:varstools/screens/camera/camera_screen.dart';
import 'package:varstools/screens/favourite/favourite_screen.dart';
import 'package:varstools/screens/file/file_screen.dart';
import 'package:varstools/screens/home/home_screen.dart';
import 'package:varstools/screens/setting/screen_setting.dart';
import 'package:varstools/utilities/extensions/enum/tab_item.dart';
import 'package:camera/camera.dart';


class BottomBarMainScreen extends StatefulWidget {
  const BottomBarMainScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarMainScreen> createState() => _BottomBarMainScreenState();
}

class _BottomBarMainScreenState extends State<BottomBarMainScreen> {
  bool clickedCentreFAB = false;
  late TabItem _currentTab = TabItem.home;

  void updateTabSelection(TabItem tabItem) {
    setState(() {
      _currentTab = tabItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Offstage(
            offstage: _currentTab != TabItem.home,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _currentTab != TabItem.file,
            child: const FileScreen(),
          ),
          Offstage(
            offstage: _currentTab != TabItem.favourite,
            child: const FavouriteScreen(),
          ),
          Offstage(
            offstage: _currentTab != TabItem.setting,
            child: const SettingScreen(),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await availableCameras().then((value) => Navigator.push(context,
              MaterialPageRoute(builder: (_) => CameraScreen(cameras: value))));
        },
        elevation: 4.0,
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: const Icon(Icons.photo_camera),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  updateTabSelection( TabItem.home);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  color: _currentTab == TabItem.home
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection( TabItem.file);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.file_open,
                  color: _currentTab == TabItem.file
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              const SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection( TabItem.favourite);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.favorite,
                  color: _currentTab == TabItem.favourite
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection( TabItem.setting);
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.settings,
                  color: _currentTab == TabItem.setting
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
