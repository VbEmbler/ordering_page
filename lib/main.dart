import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ordering_page/app/ordering_page_app.dart';
import 'package:ordering_page/features/ordering_page/providers/ordering_page_provider.dart';
import 'package:ordering_page/features/ordering_page/providers/recipient_provider.dart';
import 'package:ordering_page/features/ordering_page/providers/sender_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => OrderingPageProvider()),
      ChangeNotifierProvider(create: (context) => SenderProvider()),
      ChangeNotifierProvider(create: (context) => RecipientProvider()),
    ],
    child: const OrderingPageApp(),
  ));
}
