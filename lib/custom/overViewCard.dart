import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:permission_handler/permission_handler.dart';

import '../ads/adsManager.dart';

class OverViewCard extends StatefulWidget {
  final int tappedContainerIndex;
  final List<String> imageUrls;

  const OverViewCard(this.tappedContainerIndex, this.imageUrls);

  @override
  _OverViewCardState createState() => _OverViewCardState();
}

class _OverViewCardState extends State<OverViewCard> {
  Future<void> _setWallpaper(BuildContext context) async {
    final PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        final String imageUrl = widget.imageUrls[widget.tappedContainerIndex];
        final File cachedImage =
            await DefaultCacheManager().getSingleFile(imageUrl);

        // Show dialog for screen selection
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await AdManager.loadUnityIntAd();
      await AdManager.loadUnityRewardedAd();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Center(
              child: Icon(
                Icons.close,
                weight: 10,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.imageUrls[widget.tappedContainerIndex]),
            fit: BoxFit.cover,
          ),
        ),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Stack(
            children: [
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
