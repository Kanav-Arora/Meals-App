import 'package:flutter/material.dart';
import 'package:meal_app/Data/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = "MealDetailScreen";
  Size size;

  Function helper;

  MealDetailScreen(this.helper);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildSectionList(List<String> list) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      height: 150,
      width: size.width - 50,
      child: ListView.builder(
        key: UniqueKey(),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.yellow,
            child: Padding(
                padding: EdgeInsets.all(5),
                child: Center(child: Text(list[index]))),
          );
        },
        itemCount: list.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final routesArgs = ModalRoute.of(context).settings.arguments;
    final Meal data = routesArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              data.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, 'Ingredients'),
          buildSectionList(data.ingredients),
          buildSectionTitle(context, 'Steps'),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            height: 150,
            width: size.width - 50,
            child: ListView.builder(
              key: UniqueKey(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          index.toString(),
                        ),
                      ),
                      title: Text(data.steps[index]),
                    ),
                    Divider(
                      thickness: 1.5,
                    )
                  ],
                );
              },
              itemCount: data.steps.length,
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.bookmark),
        onPressed: () {
          return helper(data.id);
        },
      ),
    );
  }
}
