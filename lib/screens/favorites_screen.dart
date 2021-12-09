import 'package:contactless_dinein/screens/order_confirmation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late String _scanBarcode;
  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      // print("$barcodeScanRes #############################################################################@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
      
      Navigator.of(context).pushNamed(
        OrderConfirmationScreen.routeName,
      );
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Order'),
        icon: const Icon(Icons.outdoor_grill_outlined),
        onPressed: ()=> scanQR(),
      ),
        body: widget.favoriteMeals.isEmpty
            ? const Center(
                child: Text('You have no favorites yet - start adding some!'),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return MealItem(
                    id: widget.favoriteMeals[index].id,
                    title: widget.favoriteMeals[index].title,
                    imageUrl: widget.favoriteMeals[index].imageUrl,
                    duration: widget.favoriteMeals[index].duration,
                    affordability: widget.favoriteMeals[index].affordability,
                    complexity: widget.favoriteMeals[index].complexity,
                  );
                },
                itemCount: widget.favoriteMeals.length,
              ));
  }
}
