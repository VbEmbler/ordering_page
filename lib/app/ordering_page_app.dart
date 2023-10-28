import 'package:flutter/material.dart';
import 'package:ordering_page/core/theme/light.dart';
import 'package:ordering_page/features/ordering_page/widgets/ordering_page.dart';

class OrderingPageApp extends StatelessWidget {
  const OrderingPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ordering Page',
      theme: lightTheme,
      home: const OrderingPage(title: 'Ordering'),
    );
  }
}
