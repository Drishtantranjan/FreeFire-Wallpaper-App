import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import '../ads/adsManager.dart';

class KlaOverview extends StatelessWidget {
  final String imageUrl;

  const KlaOverview({required this.imageUrl});

  Future<void> _setWallpaper(BuildContext context) async {
    final PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        final File cachedImage =
            await DefaultCacheManager().getSingleFile(imageUrl);

        final WallpaperScreen selectedScreen = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Select Screen'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Home Screen'),
                    onTap: () {
                      Navigator.of(context).pop(WallpaperScreen.HOME_SCREEN);
                    },
                  ),
                  ListTile(
                    title: const Text('Lock Screen'),
                    onTap: () {
                      Navigator.of(context).pop(WallpaperScreen.LOCK_SCREEN);
                    },
                  ),
                  ListTile(
                    title: const Text('Both'),
                    onTap: () {
                      Navigator.of(context).pop(WallpaperScreen.BOTH_SCREENS);
                    },
                  ),
                ],
              ),
            );
          },
        );

        int wallpaperType = WallpaperManager.HOME_SCREEN; // Default value

        if (selectedScreen == WallpaperScreen.HOME_SCREEN) {
          wallpaperType = WallpaperManager.HOME_SCREEN;
        } else if (selectedScreen == WallpaperScreen.LOCK_SCREEN) {
          wallpaperType = WallpaperManager.LOCK_SCREEN;
        }

        final bool result = await WallpaperManager.setWallpaperFromFile(
          cachedImage.path,
          wallpaperType,
        );

        if (result) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Row(
                children: [
                  Text(
                    'Wallpaper added to your screen!',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              backgroundColor:
                  Colors.white, // Set the Snackbar background color
              behavior:
                  SnackBarBehavior.floating, // Make Snackbar float above the UI
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Failed to set wallpaper.',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor:
                  Colors.white, // Set the Snackbar background color
              behavior:
                  SnackBarBehavior.floating, // Make Snackbar float above the UI
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error: $e',
              style: const TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white, // Set the Snackbar background color
            behavior:
                SnackBarBehavior.floating, // Make Snackbar float above the UI
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Permission denied. Wallpaper cannot be set.',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white, // Set the Snackbar background color
          behavior:
              SnackBarBehavior.floating, // Make Snackbar float above the UI
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Stack(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 100,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          await AdManager.showIntAd();
                          _setWallpaper(context);
                        },
                        child: const Text(
                          "Set as Wallpaper",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum WallpaperScreen {
  HOME_SCREEN,
  LOCK_SCREEN,
  BOTH_SCREENS,
}
