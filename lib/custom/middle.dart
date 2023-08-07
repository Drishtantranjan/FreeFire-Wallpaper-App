import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:freefire_wallpaper/custom/overViewCard.dart';
import 'dart:math';

class WallpaperContainer extends StatefulWidget {
  const WallpaperContainer({Key? key});

  @override
  _WallpaperContainerState createState() => _WallpaperContainerState();
}

class _WallpaperContainerState extends State<WallpaperContainer> {
  int tappedContainerIndex = -1;
  List<String> imageUrls = [];
  bool shouldShowImage =
      false; // Flag to control the rendering of the network image

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  void fetchImages() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('wallpaper').get();
    List<String> urls = snapshot.docs
        .map((doc) => (doc.data() as Map<String, dynamic>)['general'] as String)
        .toList();

    // Shuffle the imageUrls list
    urls.shuffle(Random());

    setState(() {
      imageUrls = urls;
      shouldShowImage = true; // Set the flag to true when images are fetched
    });
  }

  void navigateToOverViewCard(int tappedIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            OverViewCard(tappedIndex, imageUrls), // Pass imageUrls as well
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          (imageUrls.length / 2).ceil(), // Generate half the number of rows
          (rowIndex) {
            final startIndex = rowIndex * 2;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                2,
                (columnIndex) {
                  final containerIndex = startIndex + columnIndex;
                  if (containerIndex < imageUrls.length) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          tappedContainerIndex = containerIndex;
                        });
                        navigateToOverViewCard(tappedContainerIndex);
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.only(top: 8, bottom: 5),
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width * 0.46,
                        decoration: BoxDecoration(
                          color: tappedContainerIndex == containerIndex
                              ? Colors.grey.withOpacity(0.8)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child:
                            shouldShowImage // Check the flag to determine whether to show the image or shimmer animation
                                ? Image.network(
                                    imageUrls[containerIndex],
                                    fit: BoxFit.cover,
                                  )
                                : FutureBuilder(
                                    future: Future.delayed(
                                        const Duration(milliseconds: 800)),
                                    builder: (context, snapshot) {
                                      return snapshot.connectionState ==
                                              ConnectionState.done
                                          ? Image.network(
                                              imageUrls[containerIndex],
                                              fit: BoxFit.cover,
                                            )
                                          : Shimmer.fromColors(
                                              child: Container(
                                                color: Colors.white,
                                              ),
                                              baseColor: Colors.grey[300]!,
                                              highlightColor: Colors.grey[100]!,
                                            );
                                    },
                                  ),
                      ),
                    );
                  } else {
                    return const SizedBox(); // Empty container if there are no more images
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
