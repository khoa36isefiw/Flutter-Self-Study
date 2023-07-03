import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lesson24_favorite_color/model/Favorites.dart';
import 'package:lesson24_favorite_color/screen/favoritePage.dart';
import 'package:lesson24_favorite_color/screen/homePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FavoriteApp());
}

GoRouter router() {
  // quản lý các path
  return GoRouter(
    routes: [
      //để định nghĩa các path trong ứng dụng.
      GoRoute(
        path: HomePage.routeName,
        builder: (context, state) => const HomePage(),
        routes: [
          GoRoute(
            path: FavoritePage.routeName,
            builder: (context, state) => const FavoritePage(),
          ),
        ],
      ),
    ],
  );
}

class FavoriteApp extends StatelessWidget {
  const FavoriteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(), // create new Favorites object
      child: MaterialApp.router(
        // config router for App
        title: 'Favorite App',
        theme: ThemeData(
          colorSchemeSeed: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          useMaterial3: true,
        ),
        routerConfig: router(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
