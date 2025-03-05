// import 'package:calorie_detection_mobile_app/screens/loginScreen.dart';
// import 'package:calorie_detection_mobile_app/screens/registerScreen.dart';
// import 'package:calorie_detection_mobile_app/widget/customButton.dart';
// import 'package:flutter/material.dart';
// import '../config/theme.dart';

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           color: Colors.white
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   alignment: Alignment.center,
//                   margin: const EdgeInsets.only(bottom: 20.0),
//                   child: const Text(
//                     "Snap, Scan, and Track Your Food’s Calories",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.bold,
//                       color: primaryMain,
//                       letterSpacing: 2.0,
//                       fontFamily: 'Roboto',
//                     ),
//                   ),
//                 ),
                
//                 Container(
//                   alignment: Alignment.center,
//                   margin: const EdgeInsets.only(bottom: 20.0),
//                   decoration: const BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Colors.white,
//                   ),
//                   child: Image.asset(
//                     'assets/images/logo1.png',
//                     width: 180,
//                     height: 180,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 Custombutton(
//                   text: 'Sign In',
//                   icon: Icons.login,
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const LoginScreen()),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 15),
//                 Custombutton(
//                   text: 'Sign Up',
//                   icon: Icons.create,
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const Registerscreen()),
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 30),
//                 const Text(
//                   "OR",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Custombutton(
//                   text: 'Continue Without Signing In',
//                   icon: Icons.camera,
//                   onPressed: () {
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
