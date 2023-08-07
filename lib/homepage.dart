import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:freefire_wallpaper/custom/middle.dart';
import 'package:freefire_wallpaper/custom/uppercard.dart';
import 'package:freefire_wallpaper/legalstuff/help.dart';
import 'package:freefire_wallpaper/legalstuff/privacyPolicy.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isAppBarVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    final userScrollDirection = _scrollController.position.userScrollDirection;
    if (userScrollDirection == ScrollDirection.reverse && _isAppBarVisible) {
      setState(() => _isAppBarVisible = false);
    } else if (userScrollDirection == ScrollDirection.forward &&
        !_isAppBarVisible) {
      setState(() => _isAppBarVisible = true);
    }
  }

  PreferredSize? _buildAppBar() {
    if (!_isAppBarVisible) {
      return null;
    }
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBar(
        actions: [Image.asset('assets/black.jpeg')],
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 180,
                child: Image.asset(
                  'assets/appbar.png',
                  height: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(right: 40.0, top: 40, left: 20),
            child: SizedBox(
              child: Image.asset(
                'assets/drawer.png',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            title: Text(
              '     Help',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Help()),
              );
            },
          ),
          ListTile(
            title: Text(
              '     Feedback',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onTap: () async {
              // Open Play Store link for feedback
              const url =
                  'https://play.google.com/store/apps/details?id=com.drishtant.freefire_wallpaper';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(
            title: Text(
              '     Contact us',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onTap: () async {
              // Open LinkedIn profile link for contact
              const url = 'https://www.linkedin.com/in/drishtant-ranjan/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(
            title: Text(
              '     Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Privacy()),
              );
            },
          ),
          ListTile(
            title: Text(
              '     More Apps',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onTap: () async {
              // Open Play Store link for more apps
              const url =
                  'https://play.google.com/store/apps/developer?id=Og+Developer';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: const Column(
          children: [
            Text(
              "Wallpapers",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TopCard(),
            WallpaperContainer(),
          ],
        ),
      ),
    );
  }
}
