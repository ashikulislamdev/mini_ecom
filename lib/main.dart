import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mini_ecom/controllers/cart_provider.dart';
import 'package:mini_ecom/controllers/favorite_provider.dart';
import 'package:mini_ecom/controllers/main_screen_provider.dart';
import 'package:mini_ecom/controllers/producut_provider.dart';
import 'package:provider/provider.dart';

import 'views/ui/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
    ChangeNotifierProvider(create: (context) => ProductNotifier()),
    ChangeNotifierProvider(create: (context) => CartProvider()),
    ChangeNotifierProvider(create: (context) => FavoriteNotifire()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MainScreen(),
        );
      },
    );
  }
}
