import 'package:flutter/material.dart';
import 'package:testt/constants.dart';
import 'package:testt/screen/deskcard.dart';
import 'package:testt/screen/dskcategoriescart.dart';
import 'package:testt/widget/sizes_helpers.dart';

class DskCategories extends StatefulWidget {
  const DskCategories({Key? key}) : super(key: key);

  @override
  State<DskCategories> createState() => _DskCategoriesState();
}

class _DskCategoriesState extends State<DskCategories> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child:  Scaffold(
          body:  SingleChildScrollView(
            child: Column(
              children: [
                Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Card(
                       child: Container(
                        width:displayWidth(context)*0.24,
                        height: displayHeight(context)*0.32,
                        child:Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                  child: Text('Save on code, scripts & plugins',style: TextStyle(fontSize: displayWidth(context)*0.017,fontWeight: FontWeight.w500),)),
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                  onPressed: () {
                           //        Navigator.push(context,  MaterialPageRoute(builder: (context)=>FeaturedCode()));
                                  },
                                  style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                          (Set<MaterialState> states) {
                                        if (states.contains(MaterialState.hovered))
                                          return nohovertextcolor;
                                        else{
                                          return null;
                                        }//<-- SEE HERE
                                        // Defer to the widget's default.
                                      },
                                    ),
                                  ),
                                  child: const Text(
                                    'Browse on sale code',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ) ,
                    ),
                     ),
                    Container(
                      width: displayWidth(context)*0.75,
                      height: displayWidth(context)*0.23,
                      // margin: EdgeInsets.only(left: 20),

                      child: GridView.builder(
                        itemCount: 3,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20.0,
                            mainAxisSpacing: 20.0
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return deskcategoriescard();

                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 35),
                  alignment: Alignment.centerLeft,
                  child: Text("Weekly bestsellers",style: TextStyle(fontSize: displayWidth(context)*0.02),),
                ),
                Container(
                  width: displayWidth(context)*0.95,
                  height: displayWidth(context)*0.23,
                  // margin: EdgeInsets.only(left: 20),
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return deskcategoriescard();

                    },
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(left: 35),
                  alignment: Alignment.centerLeft,
                  child: Text("Rising stars",style: TextStyle(fontSize: displayWidth(context)*0.02),),
                ),
                Container(
                  width: displayWidth(context)*0.95,
                  height: displayWidth(context)*0.23,
                  // margin: EdgeInsets.only(left: 20),
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return deskcategoriescard();

                    },
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}
