import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/utils/sizeConfig.dart';

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
      ),
      home: MyHomePage(title: 'DeliMeals Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final SizeConfig sc = SizeConfig();
    sc.init(context);

    final _textScale = sc.textScale;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.dehaze_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Delicious Meals",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 20 * _textScale,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
