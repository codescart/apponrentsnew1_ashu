import 'package:flutter/material.dart';
import 'package:testt/constants.dart';
import 'package:testt/HOME_pages/addtocartall.dart';
import 'package:testt/screen/ontapproduct.dart';
import 'package:testt/widget/sizes_helpers.dart';
import 'package:testt/widget/mobstar.dart';

class mobcategoriescart extends StatefulWidget {
  const mobcategoriescart({Key? key}) : super(key: key);

  @override
  State<mobcategoriescart> createState() => _mobcategoriescartState();
}

class _mobcategoriescartState extends State<mobcategoriescart> {
  @override
  Widget build(BuildContext context) {
    return  Container(

      child:  Card(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>OnTap()));
              },
              child: Container(
                height: displayHeight(context)*0.22,
                width:  displayWidth(context)*0.9,
                color: Colors.red,
                // child:  Image.asset('images/code.png',),
              ),
            ),
            SizedBox(height: 8,),
            Text('Every week, our staff personally hand-pick some of the ',style: TextStyle(fontSize: displayWidth(context)*0.038),),
            Text('Every week, our staff',style: TextStyle(fontSize: displayWidth(context)* 0.038),),
            SizedBox(height: 8,),
            Container(
              width: displayWidth(context)*0.9,
              // height: displayHeight(context)*0.10,

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 5),
                      width: displayWidth(context)*0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rs 12",style: TextStyle(fontSize: displayWidth(context)* 0.040),),
                          mobstar(),
                          Text('Sales 12',style: TextStyle(fontSize: displayWidth(context)* 0.040),),
                        ],
                      )
                  ),
                  Container(
                    width: displayWidth(context)*0.4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          hoverColor: Colors.black12.withOpacity(0.1),
                          icon: const Icon(Icons.shopping_cart),
                          onPressed: () {
                            Navigator.push(context,  MaterialPageRoute(builder: (context)=>AddToCart(product_image: '', category: '', product_name: '', discount: '', plan: '',)));
                          },
                        ),
                        Container(
                          width: displayWidth(context)*0.26,
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
                            child: const Text(
                              'Live Preview',
                              style: TextStyle(fontSize:10),
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
    );
  }
}
