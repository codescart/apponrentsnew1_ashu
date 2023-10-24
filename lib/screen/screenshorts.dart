import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:testt/constants.dart';
import 'package:testt/launch.dart';

class ScreenShorts extends StatefulWidget {
 final String image;
 final String product_category;
 final String product_name;
 ScreenShorts( {required this.image,
   required this.product_category,
   required this.product_name,});


  @override
  State<ScreenShorts> createState() => _ScreenShortsState();
}

class _ScreenShortsState extends State<ScreenShorts> {




  Widget nonTransparentWidget() => FullScreenWidget(
    backgroundColor: Colors.white,
    backgroundIsTransparent: false,
    child: Center(
      child: Hero(
        tag: "nonTransparent",
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            Apiconst.image_path+"${widget.image}",
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
  );

  Widget customWidget() => FullScreenWidget(
    child: SafeArea(
      child: Card(
        elevation: 4,
        child: Container(
          height: 350,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Hero(
                tag: "customWidget",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                   Apiconst.image_path+"${widget.image}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final imageuri=Apiconst.productimage;
    var a = '${widget.image}';
    var ab = jsonDecode(a);

    List<dynamic> abc = ab as List;
    return
    Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(Icons.call,color: Colors.redAccent,), onPressed: () { launchCaller(); },),

        ],
        title: Image.asset('images/logo_horizon.png', height: 40,),
      ),
        body: ListView(
          children: [
            Row(
              children: [
                SizedBox(height: 40, width: 10,),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(widget.product_category, style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold, fontSize: 15,),),
                ),
                Icon(Icons.arrow_forward_ios, size: 19,),
                SizedBox(width: 10,),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(widget.product_name, style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold, fontSize: 15,),),
                ),
                Icon(Icons.arrow_forward_ios, size: 20,),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Details', style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold, fontSize: 15,),),
                ),
                Icon(Icons.arrow_forward_ios, size: 20,),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text('Screenshort', style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold, fontSize: 15,),),
                ),

              ],
            ),
            SingleChildScrollView(
              child: Column(
                children:[
                  Container(
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height*99,
                  child: GridView.builder(
                    itemCount: abc.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return FullScreenWidget(
                        backgroundColor: Colors.white,
                        child: Center(
                          child: Hero(
                            tag: "customBackground",
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                imageuri+abc[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                  ),
                ],
              ),
            ),
          ],
        ),

    );
  }
}