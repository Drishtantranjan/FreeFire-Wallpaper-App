import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../agentOverview/rafaelOverview.dart';

class Rafael extends StatefulWidget {
  const Rafael({Key? key});

  @override
  State<Rafael> createState() => _RafaelState();
}

class _RafaelState extends State<Rafael> {
  Future<List<String>> fetchImages() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('rafael') // Replace 'rafael' with your collection name
        .get();

    final List<String> imageUrls = snapshot.docs
        .map((doc) => doc.get('general')
            as String) // Replace 'general' with the field name containing the image URL
        .toList();

    return imageUrls;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Image.asset(
          'assets/Rafael_text.png',
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
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              final List<String> imageUrls = snapshot.data!;
              final int itemCount = (imageUrls.length / 2).ceil();
              return Column(
                children: List.generate(itemCount, (index) {
                  final int startIndex = index * 2;
                  final int endIndex = startIndex + 1;
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildContainer(imageUrls, startIndex),
                        buildContainer(imageUrls, endIndex),
                      ],
                    ),
                  );
                }),
              );
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildContainer(List<String> imageUrls, int index) {
    if (index < imageUrls.length) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RafaelOverview(imageUrl: imageUrls[index]),
            ),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: MediaQuery.of(context).size.width * 0.46,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(imageUrls[index]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
