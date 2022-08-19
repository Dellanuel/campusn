// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:campus_pay/znewproject/homepagez.dart';
import 'package:campus_pay/znewproject/profile/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeE extends StatefulWidget {
  const HomeE({Key? key}) : super(key: key);

  @override
  State<HomeE> createState() => _HomeEState();
}

class _HomeEState extends State<HomeE> {
  var orientation, size, height, width;
  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height / 8,
        title: Text('Campus Pay',
            style: GoogleFonts.alumniSansInlineOne(
              fontSize: 26,
              letterSpacing: 1.5,
            )),

        centerTitle: false,

        actions: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                )),
            child: Center(
              child: IconButton(
                  splashRadius: 15,
                  iconSize: 15,
                  icon: const Icon(
                    Icons.person,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
                  }),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                )),
            child: Center(
              child: IconButton(
                  splashRadius: 15,
                  iconSize: 15,
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const ProfilePage()));
                  }),
            ),
          ),
          const SizedBox(width: 5),
        ],
        // bottom: const TabBar(tabs: [
        //   Tab(
        //     icon: Icon(Icons.home),
        //   ),
        //   Tab(
        //     icon: Icon(LineAwesomeIcons.shopping_cart),
        //   )
        // ]),
      ),
      body: const Home(),
    );
  }
}
