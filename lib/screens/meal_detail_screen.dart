import 'package:flutter/material.dart';
import '../dumy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget getContainerText(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.title),
    );
  }

  Widget getContainerBox(BuildContext context, Widget widget) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((x) => x.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
              ),
            ),
            getContainerText(context, 'Ingredients'),
            getContainerBox(
                context,
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, idx) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(selectedMeal.ingredients[idx]),
                      ),
                    );
                  },
                )),
            getContainerText(context, 'Steps'),
            getContainerBox(
                context,
                ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, idx) => Column(
                    children: <Widget>[
                      ListTile(
                        leading: Text('# ${(idx + 1)}'),
                        title: Text(selectedMeal.steps[idx]),
                      ),
                      Divider(),
                    ],
                  ),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
