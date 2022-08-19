// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:campus_pay/homeshoppingcart.dart';
import 'package:campus_pay/znewproject/drawermenu.dart';
import 'package:campus_pay/znewproject/profile/profilepage.dart';
import 'package:campus_pay/znewproject/zsellpage/sellhome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../firebase.dart';
import '../main.dart';
import 'prodinfo.dart';

final StateProvider<List<Map>> D = StateProvider((ref) => cart);

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var orientation, size, height, width;
  List<QueryDocumentSnapshot> listMap = [];
  @override
  void initState() {
    super.initState();
    readBooks().then((value) {
      listMap.addAll(value);
      setState(() {});
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    orientation = MediaQuery.of(context).orientation;

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: Stack(children: [
        Container(
          child: listMap.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  children: List.generate(
                      listMap.length,
                      (index) => InkWell(
                            onTap: () =>
                                Navigator.of(context).push(CupertinoPageRoute(
                                    builder: (context) => ProdInfo(
                                          data: listMap[index],
                                        ))),
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Column(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    listMap[index][frontImage]),
                                                fit: BoxFit.cover),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(6)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(listMap[index][name]),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              // cart.add(listMap[index]);
                                              globalref?.read(D).addAll(cart);
                                            },
                                            icon: const Icon(
                                              Icons.shopping_cart,
                                              size: 15,
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                ),
        ),
        Positioned(
          bottom: 90,
          right: 6,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shape: const CircleBorder(
                    side: BorderSide(width: 70),
                  ),
                  fixedSize: const Size(50, 50)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const ShoppingcartforHome())));
              },
              child: const Icon(Icons.shopping_cart)),
        )
      ]),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.sell),
          tooltip: 'Sell It',
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SellPagez()));
          }),
    );
  }
}

const frontImage = 'FrontImage';
const name = 'BookName';
const edition = 'Edition';
const location = 'Location';
const price = 'Price';
const backimage = 'BackImage';
const severemarking = 'Marking';

const unapprovedUloadedBooks = 'UnapprovedUloadedBooks';

Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> read() async {
  return await FirebaseFirestore.instance
      .collection(unapprovedUloadedBooks)
      .get()
      .then((value) => value.docs);
}

Future write(String name, String url) async {
  return await FirebaseFirestore.instance
      .collection(unapprovedUloadedBooks)
      .add({});
}

Future upload(File file) async {
  var v =
      FirebaseStorage.instance.ref('Books').child(DateTime.now().toString());
  var x = v.putFile(file);
  x.whenComplete(() {});
}
