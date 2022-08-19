import 'package:campus_pay/znewproject/homepagez.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase.dart';

class ShoppingcartforHome extends StatefulWidget {
  const ShoppingcartforHome({Key? key}) : super(key: key);

  @override
  State<ShoppingcartforHome> createState() => _ShoppingcartforHomeState();
}

class _ShoppingcartforHomeState extends State<ShoppingcartforHome> {
  List<QueryDocumentSnapshot> listMap = [];
  var orientation, size, height, width;
  @override
  void initState() {
    super.initState();
    readBooks().then((value) {
      listMap.addAll(value);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height / 8,
        title: const Text('Cart'),
      ),
      body: // the cart page algorithm...........
          Consumer(builder: (context, ref, child) {
        List<Map> _cart = ref.watch(D);
        int tottal = 0;
        for (var item in _cart) {
          tottal = (item['price'] + tottal);
        }
        int cp = 0;
        int cptotal = 0;
        for (var item in _cart) {
          if (item['price'] <= 4000) {
            cp = 200;
          } else if (item['price'] <= 10000) {
            cp = 300;
          } else if (item['price'] > 10000) {
            cp = 500;
          } else {
            cp = 0;
          }
          cptotal = (cptotal + cp);
        }

        int finaltotal = 0;
        finaltotal = (cptotal + tottal);

        // the ui for each item in the cartpage
        return ListView(
          children: [
            SizedBox(
              height: height / 2,
              child: ListView.builder(
                  itemCount: _cart.length,
                  itemBuilder: (BuildContext context, index) {
                    return Card(
                      // color: Colors.black,
                      shadowColor: Colors.black87,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: height / 10,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 65,
                                backgroundImage:
                                    NetworkImage(listMap[index][frontImage]),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 40),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(_cart[index][name]),
                                    Text(_cart[index][price].toString())
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Sub Total'),
                    trailing: Text(tottal.toString()),
                  ),
                  ListTile(
                    title: const Text('CP fee'),
                    trailing: Text(cptotal.toString()),
                  ),
                  ListTile(
                    title: const Text('Total'),
                    trailing: Text(finaltotal.toString()),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('PAY'),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
