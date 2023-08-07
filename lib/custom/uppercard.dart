import 'package:flutter/material.dart';
import 'package:freefire_wallpaper/Characters/andrew.dart';
import 'package:freefire_wallpaper/Characters/antonio.dart';
import 'package:freefire_wallpaper/Characters/caroline.dart';
import 'package:freefire_wallpaper/Characters/hayato.dart';
import 'package:freefire_wallpaper/Characters/kla.dart';
import 'package:freefire_wallpaper/Characters/laura.dart';
import 'package:freefire_wallpaper/Characters/maxim.dart';
import 'package:freefire_wallpaper/Characters/moco.dart';
import 'package:freefire_wallpaper/Characters/paloma.dart';
import 'package:freefire_wallpaper/Characters/rafael.dart';

class TopCard extends StatefulWidget {
  const TopCard({
    Key? key,
  }) : super(key: key);

  @override
  State<TopCard> createState() => _TopCardState();
}

class _TopCardState extends State<TopCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Andrew()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/andrew.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
              width: 250,
              child: Center(
                child: Image.asset(
                  'assets/Andrew_text.png',
                  width: 100,
                  height: 200,
                ),
              ),
            ),
          ),
        ),
        ////////////
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Maxim()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/maxim.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
              width: 250,
              child: Center(
                child: Image.asset(
                  'assets/Maxim_text.png',
                  width: 100,
                  height: 200,
                ),
              ),
            ),
          ),
        ),
        ////////////
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Antonio()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/antonio.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
              width: 250,
              child: Center(
                child: Image.asset(
                  'assets/Antonio_text.png',
                  width: 100,
                  height: 200,
                ),
              ),
            ),
          ),
        ), //////////
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Laura()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/Laura.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
              width: 250,
              child: Center(
                child: Image.asset(
                  'assets/Laura_text.png',
                  width: 100,
                  height: 200,
                ),
              ),
            ),
          ),
        ),
        //////////
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Caroline()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/Carolin.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
              width: 250,
              child: Center(
                child: Image.asset(
                  'assets/Caroline_text.png',
                  width: 100,
                  height: 200,
                ),
              ),
            ),
          ),
        ),
        ///////////////
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Hayato()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/hayato.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
              width: 250,
              child: Center(
                child: Image.asset(
                  'assets/Hayato_text.png',
                  width: 100,
                  height: 200,
                ),
              ),
            ),
          ),
        ),
        ////////////
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Kla()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/kla.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
              width: 250,
              child: Center(
                child: Image.asset(
                  'assets/Kla_text.png',
                  width: 100,
                  height: 200,
                ),
              ),
            ),
          ),
        ),
        ///////////////
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Moco()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/moco.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
              width: 250,
              child: Center(
                child: Image.asset(
                  'assets/Moco_text.png',
                  width: 100,
                  height: 200,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Paloma()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/paloma.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
              width: 250,
              child: Center(
                child: Image.asset(
                  'assets/Paloma_text.png',
                  width: 100,
                  height: 200,
                ),
              ),
            ),
          ),
        ),
        //////////
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 5),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Rafael()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/Rafael.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
              width: 250,
              child: Center(
                child: Image.asset(
                  'assets/Rafael_text.png',
                  width: 100,
                  height: 200,
                ),
              ),
            ),
          ),
        ),
        /////
      ]),
    );
  }
}
