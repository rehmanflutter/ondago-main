import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ondago/Routes/routing.dart';
import 'package:ondago/views/Splash_and_onboarding/splich.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        title: 'Ondago',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff3A81F7)),
          useMaterial3: true,
        ),
        home: SplichScreen(),
        getPages: AppRouting.routes,
//debugShowCheckedModeBanner: false,
      );
    });
  }
}



// @override
// class HexagonContainer extends StatelessWidget {
//   // HexagonContainer({required this.size, required this.image});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ClipPath(
//           clipper: _HexagonClipper(),
//           child: Container(
//             width: 70,
//             height: 70,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.white,
//               ),
//               color: Colors.amber,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _HexagonClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();

//     path
//       ..moveTo(size.width / 2, 0) // moving to topCenter 1st, then draw the path
//       ..lineTo(size.width - 2, size.height * .25)
//       ..arcToPoint(
//         Offset(size.width, size.height * .25),
//         radius: Radius.circular(7),
//       )
//       ..lineTo(size.width, size.height * .75)
//       ..lineTo(size.width * .5, size.height)
//       ..lineTo(0, size.height * .75)
//       ..lineTo(0, size.height * .25)
//       ..close();

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }



