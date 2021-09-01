import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/utils/sizeConfig.dart';
import '../widgets/drawer_widget.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  SwitchListTile buildListTile(String title, String subtitle, bool switchValue,
      double textScale, Function(bool newValue) changeValue) {
    return SwitchListTile(
      title: Text(
        "$title",
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 16 * textScale,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      subtitle: Text(
        "$subtitle",
        style: GoogleFonts.poppins(),
      ),
      value: switchValue,
      onChanged: changeValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    final SizeConfig sc = SizeConfig();
    sc.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Filters",
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24 * sc.textScale,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildListTile(
                  "Gluten Free",
                  "Only include gluten free food",
                  _glutenFree,
                  sc.textScale,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                buildListTile(
                  "Vegetarian",
                  "Only include vegetarian food",
                  _vegetarian,
                  sc.textScale,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                buildListTile(
                  "Vegan",
                  "Only include vegan food",
                  _vegan,
                  sc.textScale,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                buildListTile(
                  "Lactose Free",
                  "Only include lactose free food",
                  _lactoseFree,
                  sc.textScale,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
