import 'package:flutter/material.dart';
import 'package:peliculas2/config/app_theme.dart';
import 'package:peliculas2/screens/screens.dart';
import 'package:provider/provider.dart';

import 'providers/movies_provider.dart';

 
void main() => runApp(AppState());


class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => MoviesProvider(), lazy: false ),
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
      title: 'Películas',
      initialRoute: 'home',
      routes: {
        'home':    ( _ ) => HomeScreen(),
        'details': ( _ ) => DetailsScreen(),
        'top_rated': ( _ ) => TopRatedScreen(),
      },
      theme: AppTheme(selectedColor: 1).theme(),
    );
  }
}