import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/utils/dummy_data.dart';
import 'package:meals_app/utils/sizeConfig.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  Container buildSectionTitle(SizeConfig sc, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
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

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 200,
        width: 300,
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
              height: 300,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionTitle(sc, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10),
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
                        title: Text(meal.steps[index]),
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
