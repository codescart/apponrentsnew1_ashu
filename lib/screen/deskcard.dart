import 'package:flutter/material.dart';
import 'package:testt/constants.dart';
import 'package:testt/screen/ontapproduct.dart';
import 'package:testt/widget/deskstar.dart';
import 'package:testt/widget/sizes_helpers.dart';

class deskcard extends StatefulWidget {
  const deskcard({Key? key}) : super(key: key);

  @override
  State<deskcard> createState() => _deskcardState();
}

class _deskcardState extends State<deskcard> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        // height: displayHeight(context)*0.2,
        child:  Card(
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>OnTap()));
                },
                child: Container(
                  height: displayHeight(context)*0.18,
                  width:  displayWidth(context)*0.9,
                  color: Colors.red,
                  // child:  Image.asset('images/code.png',),
                ),
              ),
              SizedBox(height: 8,),
              Text('Every week, our staff personally hand-pick some of the ',style: TextStyle(fontSize: displayWidth(context)*0.012),),
              Text('Every week, our staff',style: TextStyle(fontSize: displayWidth(context)* 0.010),),
              SizedBox(height: 8,),
              Container(
                padding: EdgeInsets.only(left: 10,right: 10),
                width: displayWidth(context)*0.9,
                // height: displayHeight(context)*0.09,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: displayWidth(context)*0.12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Rs 12",style: TextStyle(fontSize: displayWidth(context)* 0.012),),
                            deskstar(),
                            Text('Sales 12',style: TextStyle(fontSize: displayWidth(context)* 0.012),),
                          ],
                        )
                    ),
                    Container(
                      width: displayWidth(context)*0.15,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            hoverColor: Colors.black12.withOpacity(0.1),
                            icon: const Icon(Icons.shopping_cart),
                            onPressed: () {},
                          ),
                          Container(
                            width: displayWidth(context)*0.10,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.hovered))
                                      return nohovertextcolor;
                                    else{
                                      return null;
                                    }//<-- SEE HERE
                                  },
                                ),
                              ),
                              child: Text(
                                'Live Preview',
                                style: TextStyle(fontSize:displayWidth(context)* 0.012),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
