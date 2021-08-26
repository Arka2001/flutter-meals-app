import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/routes/app_routes.dart';
import 'package:meals_app/utils/sizeConfig.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  Widget buildListTile(
      SizeConfig sc, String title, IconData icon, void Function()? onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26 * sc.textScale,
      ),
      title: Text(
        "$title",
        style: GoogleFonts.robotoCondensed(
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24 * sc.textScale,
          ),
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final sc = SizeConfig();
    sc.init(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: sc.screenHeight * 0.12,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking up",
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30 * sc.textScale,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          SizedBox(height: sc.screenHeight * 0.012),
          buildListTile(sc, "Meals", Icons.restaurant,
              () => Navigator.of(context).pushReplacementNamed(homePage)),
          buildListTile(sc, "Filters", Icons.settings,
              () => Navigator.of(context).pushReplacementNamed(filtersPage)),
        ],
      ),
    );
  }
}
