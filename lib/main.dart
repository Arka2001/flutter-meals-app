import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals App',
      theme: ThemeData(
        primaryColor: Colors.pink.shade600,
        accentColor: Colors.amberAccent,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: homePage,
      routes: route,
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final SizeConfig sc = SizeConfig();
//     sc.init(context);

//     final _textScale = sc.textScale;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {},
//           icon: Icon(
//             Icons.dehaze_rounded,
//             color: Colors.white,
//           ),
//         ),
//         title: Text(
//           "Delicious Meals",
//           style: GoogleFonts.poppins(
//             textStyle: TextStyle(
//               color: Colors.white,
//               fontSize: 20 * _textScale,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
