
import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals, {Key? key}) : super(key: key);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = "";
  List<Meal> displayedMeals = [];
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'].toString();
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// import '../widgets/meal_item.dart';
// import '../dummy_data.dart';

// class CategoryMealsScreen extends StatelessWidget {
//   static const routeName = '/category-meals';

//   const CategoryMealsScreen({Key? key}) : super(key: key);
//   // final String categoryId;
//   // final String categoryTitle;

//   // CategoryMealsScreen(this.categoryId, this.categoryTitle);

//   @override
//   Widget build(BuildContext context) {
//     final routeArgs =
//         ModalRoute.of(context)!.settings.arguments as Map<String, String>;
//     final categoryTitle = routeArgs['title'];
//     final categoryId = routeArgs['id'];
//     final categoryMeals = DUMMY_MEALS.where((meal) {
//       return meal.categories.contains(categoryId);
//     }).toList();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryTitle.toString()),
//       ),
//       body: ListView.builder(
//         itemBuilder: (ctx, index) {
//           return MealItem(
//             title: categoryMeals[index].title,
//             imageUrl: categoryMeals[index].imageUrl,
//             duration: categoryMeals[index].duration,
//             affordability: categoryMeals[index].affordability,
//             complexity: categoryMeals[index].complexity,
//           );
//         },
//         itemCount: categoryMeals.length,
//       ),
//     );
//   }
// }

