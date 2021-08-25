import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/routes/app_routes.dart';
import 'package:meals_app/utils/sizeConfig.dart';

class MealTile extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;

  MealTile({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.affordability,
    required this.complexity,
  });

  String get complexityText {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    } else if (complexity == Complexity.Hard) {
      return 'Hard';
    } else {
      return 'Challenging';
    }
  }

  String get affordabilityText {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (affordability == Affordability.Pricey) {
      return 'Pricey';
    } else {
      return 'Luxurious';
    }
  }

  void _selectMeal(BuildContext context) {
    Navigator.pushNamed(context, mealDetailsPage, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    final textScale = MediaQuery.of(context).textScaleFactor;
    final sc = new SizeConfig();
    sc.init(context);
    final _complexityText = complexityText;
    final _affordabilityText = affordabilityText;
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        margin: EdgeInsets.all(sc.screenWidth * 0.01),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl,
                      height: sc.screenHeight * 0.25,
                      width: double.infinity,
                      fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: sc.screenHeight * 0.02,
                  right: sc.screenHeight * 0.01,
                  child: Container(
                    width: sc.screenHeight * 0.3,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                        vertical: sc.screenHeight * 0.005,
                        horizontal: sc.screenHeight * 0.02),
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 26 * textScale,
                        ),
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(sc.screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text("$duration min", style: GoogleFonts.lato()),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work_outline),
                      SizedBox(width: 6),
                      Text("$_complexityText", style: GoogleFonts.lato()),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text("$_affordabilityText", style: GoogleFonts.lato()),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
