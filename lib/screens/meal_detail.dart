import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/utils/dummy_data.dart';
import 'package:meals_app/utils/sizeConfig.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  Container buildSectionTitle(SizeConfig sc, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: sc.screenWidth * 0.01),
      child: Text(
        "$title",
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 20 * sc.textScale,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget buildContainer(SizeConfig sc, Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(sc.screenWidth * 0.05),
        padding: EdgeInsets.all(sc.screenWidth * 0.02),
        height: sc.screenHeight * 0.2,
        width: sc.screenWidth * 0.5,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig();
    sc.init(context);
    final mealId = ModalRoute.of(context)!.settings.arguments;
    final meal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${meal.title}",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20 * sc.textScale,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: sc.screenHeight * 0.3,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionTitle(sc, "Ingredients"),
            buildContainer(
              sc,
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: sc.screenHeight * 0.005,
                          horizontal: sc.screenWidth * 0.01),
                      child: Text(
                        "${index + 1}. ${meal.ingredients[index]}",
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            buildSectionTitle(sc, "Steps"),
            buildContainer(
              sc,
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text(
                            "# ${index + 1}",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        title: Text(
                          meal.steps[index],
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: meal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
