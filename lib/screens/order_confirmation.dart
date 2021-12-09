import 'package:flutter/material.dart';

class OrderConfirmationScreen extends StatelessWidget {
  static const routeName = '/order-confirmation';
  const OrderConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Order Confirmation'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx7FfWrqJ5ro7SdxlBsnmCo_mwrnRly5mHUg&usqp=CAU',
            
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05,),
          const Center(
            child: Text('Thank you for your order!',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          const Center(
            child: Text('Your order will be deliverd shortly.'),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
          ElevatedButton.icon(onPressed: () => Navigator.of(context).pushNamed("/"), icon: const Icon(Icons.home), label: const Text("Go to Home")),
        ],
      ),
    );
  }
}
