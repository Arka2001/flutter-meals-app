import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: Text("Filters Screen"),
      ),
    );
  }
}
