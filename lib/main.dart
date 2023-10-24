import 'package:flutter/material.dart';
import 'package:testt/HOME_pages/Home.dart';
import 'package:testt/HOME_pages/categories/categories.dart';
import 'package:testt/HOME_pages/categories/categories_list.dart';
import 'package:testt/test.dart';
import 'package:testt/web_routes/web_routs_name.dart';
import 'package:url_strategy/url_strategy.dart';


void main() {
 setPathUrlStrategy();
  MyRoutes.setupRouter();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
    // home: test(),
      initialRoute: '/',
       onGenerateRoute: MyRoutes.router.generator,
   );


    // return MaterialApp.router(/
    //   title: 'Flutter Demo',
    //   debugShowCheckedModeBanner: false,
    //  routeInformationParser: VxInformationParser(),
    //  routerDelegate: VxNavigator(routes: {
    //    '/':(_,__)=> MaterialPage(child: Home()),
    //    MyRoutes.HomeRoute:(_,__)=>MaterialPage(child: Home()),
    //    MyRoutes.CategoriesRoute:(_,__)=>MaterialPage(child: catagories_screen()),
    //    MyRoutes.CategoriesRoute:(_,__)=>MaterialPage(child: catagories_screen_list()),
    //  }),
    //  // home: Home(),
    // );
  }
}




// ignore: camel_case_types
class firstRoute extends StatelessWidget {
  const firstRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GFG First Route'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Launch screen'),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        ), // Elevated


      ),
    );
  }
}

// ignore: camel_case_types
class secondRoute extends StatelessWidget {
  const secondRoute({Key? key}) : super(key: key);

  @override
// ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GFG Second Route"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ), // ElevatedButton
      ),


    );
  }
}

