import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  const FilterScreen({Key key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactose = false;

  Widget _buildSwitchTile(
      String title, String subTitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subTitle),
      onChanged: (value) {
        updateValue(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your filters')),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchTile('Gluten-free',
                    'Only include gluten free meals', _glutenFree, (v) {
                  setState(() {
                    _glutenFree = v;
                  });
                }),
                _buildSwitchTile(
                    'Lactose-free', 'Only include lactose free meals', _lactose,
                    (v) {
                  setState(() {
                    _lactose = v;
                  });
                }),
                _buildSwitchTile('Vegentarian-free',
                    'Only include Vegentarian free meals', _vegetarian, (v) {
                  setState(() {
                    _vegetarian = v;
                  });
                }),
                _buildSwitchTile(
                    'Vegan-free', 'Only include Vegan free meals', _vegan, (v) {
                  setState(() {
                    _vegan = v;
                  });
                }),
              ],
            ),
          )
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
