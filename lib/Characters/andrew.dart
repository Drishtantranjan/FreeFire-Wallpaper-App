import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../agentOverview/andrewOverview.dart';

class Andrew extends StatefulWidget {
  const Andrew({Key? key});

  @override
  State<Andrew> createState() => _AndrewState();
}

class _AndrewState extends State<Andrew> {
  Future<List<String>> fetchImages() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('andrew') // Replace 'andrew' with your collection name
        .get();

    final List<String> imageUrls = snapshot.docs
        .map((doc) => doc.get('general')
            as String) // Replace 'general' with the field name containing the image URL
        .toList();

    return imageUrls;
  }

  void openOverviewPage(BuildContext context, String imageUrl) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AndrewOverview(imageUrl: imageUrl),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Image.asset(
          'assets/Andrew_text.png',
          height: 30,
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<String>>(
          future: fetchImages(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              final List<String> imageUrls = snapshot.data!;
              final int rowCount = (imageUrls.length / 2).ceil();

              return Column(
                children: List.generate(rowCount, (index) {
                  final int startIndex = index * 2;
                  final int endIndex = startIndex + 2;
                  final List<String> rowImages = imageUrls.sublist(
                    startIndex,
                    endIndex.clamp(0, imageUrls.length),
                  );

                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 0.0, right: 0, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: rowImages.map((imageUrl) {
                        return GestureDetector(
                          onTap: () => openOverviewPage(context, imageUrl),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.35,
                            width: MediaQuery.of(context).size.width * 0.46,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }),
              );
            } else {
              return Center(
                child: Text('No data available'),
              );
            }
          },
        ),
      ),
    );
  }
}
