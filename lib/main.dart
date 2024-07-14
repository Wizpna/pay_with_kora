import 'package:flutter/material.dart';
import 'package:korapay/korapay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay with Kora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pay with Kora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: MaterialButton(
          color: Colors.blue,
          onPressed: () {
            final uniqueTransRef = PayWithKora().generateUuidV4();
            PayWithKora().now(
              context: context,
              secretKey: "enter your korapay secretKey here",
              customerEmail: "amadipromise07@gmail.com",
              reference: uniqueTransRef,
              currency: "NGN",
              amount: 1000.00,
              transactionCompleted: () {
                print("Transaction Successful");
              },
              transactionNotCompleted: () {
                print("Transaction Not Successful!");
              },
              paymentChannel: ["card", "bank_transfer", "pay_with_bank"],
              customerName: 'Promise Amadi',
              callbackUrl: 'https://www.korahq.com',
            );
          },
          child: const Text(
            "Pay with kora",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
