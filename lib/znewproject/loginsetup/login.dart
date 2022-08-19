// import 'package:campus_pay/znewproject/homepagez.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_login/flutter_login.dart';

// class Login extends StatefulWidget {
//   Login({
//     Key? key,
//   }) : super(key: key);
//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     Future<String> signupUser(email, password) async {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password)
//           .then((signinUser) async {
//         await UserManagement().newUser(email, password);
//       }).catchError((e) {
//         print(e);
//       });
//       return '';
//     }

//     Future<String> loginUser(LoginData user) async {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: user.name, password: user.password)
//           .then((user) {
//         Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (context) => const Home()));
//       }).catchError((e) {
//         print(e);
//       });
//       return '';
//     }

//     return FlutterLogin(
//       title: 'Bookie',
//       onLogin: loginUser,
//       onSignup: (v) => signupUser(v.name, v.password),
//       onSubmitAnimationCompleted: () {
//         Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (context) => const Home(),
//         ));
//       },
//       onRecoverPassword: (string) {
//         return null;
//       },
//     );
//   }
// }

// class UserManagement {
//   Future newUser(email, password) async {
//     await FirebaseFirestore.instance.collection('users').add({
//       'email': email,
//       'uid': password,
//     }).catchError((e) {
//       print(e);
//     });
//   }
// }

// User? currentUser = FirebaseAuth.instance.currentUser;
