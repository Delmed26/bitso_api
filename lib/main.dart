import 'package:bitso_api/screens/home_screen.dart';
import 'package:bitso_api/services/currencies_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CurrenciesService(), lazy: false,
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bitso API',
      initialRoute: 'HomeScreen',
      routes: {
        'HomeScreen': (context) => HomeScreen()
      },
      theme: ThemeData.dark().copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: const Color.fromARGB(255, 22, 219, 101),
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(33, 40, 52, 1),
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(17, 19, 30, 1)
        )
      ),
    );
  }
}

//#212834 #11131e