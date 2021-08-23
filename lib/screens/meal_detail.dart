import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/utils/sizeConfig.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig();
    sc.init(context);
    final mealId = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
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
        child: Text("Meal Details"),
      ),
    );
  }
}
