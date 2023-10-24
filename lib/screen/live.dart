import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testt/HOME_pages/HomeDrawer.dart';
import 'package:testt/HOME_pages/addtocartall.dart';
import 'package:testt/launch.dart';
import 'package:testt/livehelpers.dart';
import 'package:webviewx/webviewx.dart';

 mains() => runApp(
  DevicePreview(

    // enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home:  WebViewXPage(),
    );
  }
}

class WebViewXPage extends StatefulWidget {
  const WebViewXPage({
    Key? key,
  }) : super(key: key);

  @override
  _WebViewXPageState createState() => _WebViewXPageState();
}

class _WebViewXPageState extends State<WebViewXPage> {
   late WebViewXController webviewController;
   Size get screenSize => MediaQuery.of(context).size;
//
// @override
//   void initState() {
//   _setUrl();
//   // TODO: implement initState
//     super.initState();
//   }

  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }

  void _setUrl() {
    webviewController.loadContent(
      'https://flutter.dev',
      SourceType.url,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:   IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  HomeDrewer()),
          );

        },icon: Icon(Icons.menu),
        ),
        elevation: 0.3,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.redAccent,), onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddToCart(product_image: "pankaj",
                          category:"Ecommerce",
                          product_name:"Harsh",
                          discount: "0",
                          plan: "59999",

                        ))
            );
          },),

          IconButton(icon: Icon(Icons.call,color: Colors.redAccent,), onPressed: () { launchCaller(); },),
        ],
        title: Image.asset('images/logo_horizon.png', height: 40,),
      ),
      body: _buildWebViewX(),
      // Center(
      //   child: Container(
      //     padding: const EdgeInsets.all(10.0),
      //     child: Column(
      //       children: <Widget>[
      //         buildSpace(direction: Axis.vertical, amount: 10.0, flex: false),
      //         Container(
      //           padding: const EdgeInsets.only(bottom: 20.0),
      //           child: Text(
      //             'Play around with the buttons below',
      //             style: Theme.of(context).textTheme.headline6,
      //           ),
      //         ),
      //         buildSpace(direction: Axis.vertical, amount: 10.0, flex: false),
      //         Container(
      //           decoration: BoxDecoration(
      //             border: Border.all(width: 0.2),
      //           ),
      //           child: _buildWebViewX(),
      //         ),
      //         Expanded(
      //           child: Scrollbar(
      //             isAlwaysShown: true,
      //             child: SizedBox(
      //               width: min(screenSize.width * 0.8, 512),
      //               child: ListView(
      //                 children: _buildButtons(),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Widget _buildWebViewX() {
    return WebViewX(
      key:  ValueKey('Ecommerce'),
      // initialContent: initialContent,
      // initialSourceType: SourceType.html,
      initialContent: 'https://apponrent.com/',
      initialSourceType: SourceType.url,
      //
      // SourceType.url,
      height: screenSize.height ,
      width: screenSize.width,
      onWebViewCreated: (controller) => webviewController = controller,


      webSpecificParams: const WebSpecificParams(
        printDebugInfo: true,
      ),
      mobileSpecificParams: const MobileSpecificParams(
        androidEnableHybridComposition: true,
      ),
      navigationDelegate: (navigation) {
        debugPrint(navigation.content.sourceType.toString());
        return NavigationDecision.navigate;
      },
    );
  }

  Widget buildSpace({
    Axis direction = Axis.horizontal,
    double amount = 0.2,
    bool flex = true,
  }) {
    return flex
        ? Flexible(
      child: FractionallySizedBox(
        widthFactor: direction == Axis.horizontal ? amount : null,
        heightFactor: direction == Axis.vertical ? amount : null,
      ),
    )
        : SizedBox(
      width: direction == Axis.horizontal ? amount : null,
      height: direction == Axis.vertical ? amount : null,
    );
  }

}