import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/sizeConfig.dart';

class CategoryMealScreen extends StatelessWidget {
  // final String id;
  // final String title;

  // CategoryMealScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig();
    sc.init(context);

    final widgetArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final title = widgetArgs['title'];
    final id = widgetArgs['id'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$title",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20 * sc.textScale,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Text("The recipes for $title food !"),
      ),
    );
  }
}
