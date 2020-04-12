import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildDrawerItems(String title, IconData icon) {
    return ListTile(
      onTap: () {},
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            padding: EdgeInsets.all(20),
            width: double.infinity,
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Need Help?",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildDrawerItems(
            'Meals',
            Icons.restaurant,
          ),
          buildDrawerItems(
            'Filter',
            Icons.settings,
          ),
        ],
      ),
    );
  }
}
