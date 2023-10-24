import 'package:flutter/material.dart';
import 'package:testt/constants.dart';
import 'package:testt/screen/mobcategoriescart.dart';
import 'package:testt/widget/sizes_helpers.dart';

class MobCaregoris extends StatefulWidget {
  const MobCaregoris({Key? key}) : super(key: key);

  @override
  State<MobCaregoris> createState() => _MobCaregorisState();
}

class _MobCaregorisState extends State<MobCaregoris> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child:  Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(
                width:displayWidth(context)*0.94,
                height: displayHeight(context)*0.32,
                child:Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                          child: Text('Save on code, scripts & plugins',
                            style: TextStyle(fontSize: displayWidth(context)*0.057,fontWeight: FontWeight.w500),)),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0
                ),
                itemBuilder: (BuildContext context, int index) {
                  return mobcategoriescart();
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
