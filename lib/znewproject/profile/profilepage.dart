// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:campus_pay/znewproject/homepagez.dart';
import 'package:campus_pay/znewproject/profile/profilez.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var orientation, size, height, width;
  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sunny))],
      ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    height: height / 4,
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              radius: 50,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                    color: Colors.greenAccent,
                                    shape: BoxShape.circle),
                                child: const Icon(Icons.edit,
                                    size: 15, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Ezeike Awele',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                'Ezeikeawele@gmail.com',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('My Profile'),
                trailing: IconButton(
                    highlightColor: Colors.blue,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Profilez()));
                    },
                    icon: const Icon(Icons.chevron_right_outlined)),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: const Text('Purchase History'),
                trailing: IconButton(
                    highlightColor: Colors.blue,
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_right_outlined)),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                trailing: IconButton(
                    highlightColor: Colors.blue,
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_right_outlined)),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Icon(Icons.face),
                title: const Text('Invite a Friend'),
                trailing: IconButton(
                    highlightColor: Colors.blue,
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_right_outlined)),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
          onTap: () {
            FirebaseAuth.instance.signOut().then((value) =>
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: ((context) => Home()))));
          },
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.logout,
                  size: 20,
                ),
                Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: 16, decorationStyle: TextDecorationStyle.wavy),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  final Icon;
  final Text;
  final IconButton;
  const ProfileButton({Key? key, this.Icon, this.Text, this.IconButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 350,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(28)),
        color: Colors.grey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.person),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 140),
            child: Text(
              'My Profile',
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.forward))
        ],
      ),
    );
  }
}
