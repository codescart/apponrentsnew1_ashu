import 'dart:convert';
import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testt/HOME_pages/web_view/detailSlider.dart';
import 'package:testt/launch.dart';
import 'package:testt/live_preview_form.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tab_container/tab_container.dart';
import 'package:testt/constants.dart';
import 'package:testt/responsive.dart';
import 'package:testt/HOME_pages/Home.dart';
import 'package:testt/HOME_pages/addtocartall.dart';
import 'package:testt/screen/live.dart';
import 'package:testt/screen/pinchzoom/pinchtozoom.dart';
import 'package:testt/screen/screenshorts.dart';
import 'package:http/http.dart' as http;
import 'package:testt/screen/video/videoplayyer.dart';
import 'package:testt/widget/sizes_helpers.dart';
import 'package:carousel_indicator/carousel_indicator.dart';


class OnTap extends StatefulWidget {
  final String id;
  final String product_name;
  final String product_category;

  OnTap({
    required this.id,

    required this.product_name, required this.product_category,
  });



  @override
  State<OnTap> createState() => _OnTapState();
}


class _OnTapState extends State<OnTap> {
  bool _showContent = false;
  @override
  void initState() {
    Detail();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(icon: Icon(Icons.call,color: Colors.redAccent,), onPressed: () { launchCaller(); },),

        ],
        title: Image.asset('images/logo_horizon.png', height: 40,),
      ),
      floatingActionButton: Wrap( //will break to another line on overflow
        direction: Axis.vertical, //use vertical to show  on vertical axis
        children: <Widget>[ //button first
          Container(
              margin:EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: (){
                 final pname=widget.product_name.toString();
                  final sku= "FCAOR4440"+datas[0]['id']==null?'0': datas[0]['id'].toString();
                  final category=
                  datas[0]['product_category']==null?'0': datas[0]['product_category'].toString();
                 // openwhatsapp("hi we are v");
                  openwhatsapp("hi we are visted your site https://apponrent.com we have some query on related product its name is "
                      "*$pname* its item no is *$sku* on *$category* sector");
                },
                backgroundColor: Colors.transparent,
                splashColor:Colors.transparent,
                child: Image.asset('images/wp.gif'),
              )
          ),
          // button third// Add more buttons here
        ],
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
                child: Text(
                  //"rrr",
                    datas[0]['product_category']==null?'0': datas[0]['product_category'].toString(),

                   // widget.product_category.toString(),
                  style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold, fontSize: 19,),),
              ),
              Icon(Icons.arrow_forward_ios, size: 19,),
              SizedBox(width: 10,),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  datas[0]['product_name']==null?'0': datas[0]['product_name'].toString(),
                  //widget.product_name!,

                  style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold, fontSize: 19,),),
              ),
              Icon(Icons.arrow_forward_ios, size: 22,),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text('Details', style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold, fontSize: 19,),),
              ),

            ],
          ),

          Responsive(
            mobile: mobile(context),
            tablet: tablet(context),
            desktop: desk(context),
          ),
        ],
      ),
    );
  }

  String dropdownvalue = 'Select your Purchase plan';




  mobile(BuildContext context){
     return
       datas==null?Container():

         Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              child: Text(
                datas[0]['product_name']==null?'0':datas[0]['product_name'].toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                  fontSize:MediaQuery.of(context).size.width/25,),),
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  detailslider(
                      other_images:img
                  ),
                  SizedBox(height: 20,),
                  Container(

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          width:MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.remove_red_eye),
                            label: Text("Live Preview", style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width/25,
                                fontWeight: FontWeight.bold
                            ),),

                            onPressed: () async {
                             // mains();
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => live_preview_form(
                                    id:datas[0]['id']==null?'0':datas[0]['id'].toString(),
                                  )));



                            },

                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              onPrimary: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),


                        Container(
                          width:MediaQuery.of(context).size.width * 0.4,

                          child: ElevatedButton.icon(
                            icon: Icon(Icons.remove_red_eye),
                            label: Text("Screenshots", style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width/25,
                                fontWeight: FontWeight.bold
                            ),),

                            onPressed: () async {
                              // Navigator.push(context, MaterialPageRoute(
                              //     builder: (context) => ScreenShorts(
                              //         image:datas[0]['other_images'].toString(),
                              //       product_category:datas[0]['product_category'].toString(),
                              //       product_name:datas[0]['product_name'].toString(),
                              //     )));
                            },

                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                              onPrimary: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  RichText(
                      text:
                      TextSpan(
                      text: 'Price : ₹',

                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                            text: datas[0]['discount']==null?'0': datas[0]['discount'].toString()+'(% off)',

                            style: TextStyle(
                              color: Color(0xffF80849),
                              fontSize: 15,
                            ),

                        )
                      ])),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                        '* Price is in US dollars and excludes tax'),
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(Icons.ac_unit, size: 15,),
                      Text(
                        " SKU :  FCAOR4440"+datas[0]['id']==null?'0': datas[0]['id'].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500, fontSize: 15),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                     Image.asset("images/sandtimer.gif",height: 20,),
                      Text(
                        " Estimated time :  "+datas[0]['time']==null?'0':datas[0]['time'].toString(),
                        style: TextStyle(
                          color: Colors.grey,
                            fontWeight: FontWeight.w500, fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Container(
                        width: 270,
                        child: Text(dropdownvalue, style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                      ),
                      PopupMenuButton<String>(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        icon: const Icon(Icons.sort),
                        onSelected: (final String newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            const value = true;
                          });
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            datas[0]['year_10price']==null?'':'₹'+datas[0]['year_10price'].toString() +'@ 10 Years '+'₹'+datas[0]['year_10'].toString()+'/m',
                            datas[0]['year_5price']==null?'':'₹'+datas[0]['year_5price'].toString() +'@ 5 Years '+'₹'+datas[0]['year_5'].toString()+'/m',
                            datas[0]['year_2price']==null?'':'₹'+datas[0]['year_2price'].toString() +'@ 2 Years '+'₹'+datas[0]['year_2'].toString()+'/m',
                            datas[0]['month_12price']==null?'':'₹'+datas[0]['month_12price'].toString() +'@ 12 month '+'₹'+datas[0]['month_12'].toString()+'/m',
                            datas[0]['month_6price']==null?'':'₹'+datas[0]['month_6price'].toString() +'@ 6 month '+'₹'+datas[0]['month_6'].toString()+'/m',

                            datas[0]['month_3price']==null?'':'₹'+datas[0]['month_3price'].toString() +'@ 3 month '+'₹'+datas[0]['month_3'].toString()+'/m',
                            'Selling Full Source code & Setup ₹'+datas[0]['selling_price'],


                          ].map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),

                    ],
                  ),
                 Divider(thickness: 1,),
                  Row(
                    children: [
                      Icon(Icons.check, size: 18,),
                      Text('     Quality checked by Envato')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, size: 18,),
                      Text('   Quality checked by Envato')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, size: 18,),
                      Text('    Quality checked by Envato')
                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [

                      Container(
                        width:MediaQuery.of(context).size.width * 0.4,

                        child: ElevatedButton.icon(
                          icon: Icon(Icons.shopping_cart),
                          label: Text("Add to Cart", style: TextStyle(
                              color: Colors.white,
                              fontSize:MediaQuery.of(context).size.width/25,
                              fontWeight: FontWeight.bold
                          ),),

                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddToCart(product_image: datas[0]['product_image']==null?'0':datas[0]['product_image'].toString(),
                                          category:datas[0]['category']==null?'0':datas[0]['category'].toString(),
                                          product_name:datas[0]['product_name']==null?'0':datas[0]['product_name'].toString(),
                                          discount: datas[0]['discount']==null?'0':datas[0]['discount'].toString(),
                                          plan: dropdownvalue,

                                        ))
                            );
                          },

                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                            shadowColor: Colors.red,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width:MediaQuery.of(context).size.width * 0.4,

                        child: ElevatedButton.icon(
                          icon: Icon(Icons.favorite_border),
                          label: Text("Favorite", style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width/25,
                              fontWeight: FontWeight.bold
                          ),),

                          onPressed: () {
                            Add_wish_list();
                          },

                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            onPrimary: Colors.white,
                            shadowColor: Colors.red,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 10,),

                  Text("Description", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),),
                  Text(
                    datas[0]['full_description']==null?'0':datas[0]['full_description'].toString(),
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,),
                  SizedBox(height: 15,),

                  Text("Feature", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),),
                  Text(datas[0]['features']==null?'0':datas[0]['features'].toString(),
                    textAlign: TextAlign.justify
                    , style: TextStyle(
                      ),),

                ],
              ),
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.topLeft,
              child: Text("FAQ", style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            FutureBuilder<List<Album>>(
                future: bowss(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 6),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return  Card(
                          margin: const EdgeInsets.all(10),
                          child: Column(children: [
                            // The title
                            ListTile(
                              title: Text(snapshot.data![index].title),
                              trailing: IconButton(
                                icon: Icon(
                                    _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                                onPressed: () {
                                  setState(() {
                                    _showContent = !_showContent;
                                  });
                                },
                              ),

                            ),
                            // Show or hide the content based on the state
                            _showContent
                                ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Divider(
                                    thickness: 1.5,
                                  ),
                                ),
                                Container(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                  child: Text(snapshot.data![index].description,
                                      textAlign: TextAlign.justify
                                  ),
                                ),
                              ],
                            )
                                : Container()
                          ]),
                        );


                      })
                      : Container();


                }),

            SizedBox(height: 20,),
            Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: VideoPlayerScreen(vvideo:   datas[0]['video_url']==null?'0':datas[0]['video_url'].toString(),))

          ],
        ),

      );

  }

  tablet(BuildContext context){
    return
      datas==null?Container():

      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              child: Text(
                datas[0]['product_name']==null?'0':datas[0]['product_name'].toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize:MediaQuery.of(context).size.width/25,),),
            ),
            SizedBox(height: 20,),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  detailslider(
                      other_images:img
                  ),
                  SizedBox(height: 20,),
                  Container(

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Container(
                          width:MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton.icon(
                            icon: Icon(Icons.remove_red_eye),
                            label: Text("Live Preview", style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width/25,
                                fontWeight: FontWeight.bold
                            ),),

                            onPressed: () async {
                              mains();
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => live_preview_form(
                                    id:datas[0]['id']==null?'0':datas[0]['id'].toString(),
                                  )));


                              final snackBar = SnackBar(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))),
                                behavior: SnackBarBehavior.floating,
                                content: Text('Generating PDF!'),

                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                  snackBar);
                            },

                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              onPrimary: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),


                        Container(
                          width:MediaQuery.of(context).size.width * 0.4,

                          child: ElevatedButton.icon(
                            icon: Icon(Icons.remove_red_eye),
                            label: Text("Screenshots", style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width/25,
                                fontWeight: FontWeight.bold
                            ),),

                            onPressed: () async {
                              // Navigator.push(context, MaterialPageRoute(
                              //     builder: (context) => ScreenShorts(
                              //         image:datas[0]['other_images'].toString(),
                              //       product_category:datas[0]['product_category'].toString(),
                              //       product_name:datas[0]['product_name'].toString(),
                              //     )));
                            },

                            style: ElevatedButton.styleFrom(
                              primary: Colors.teal,
                              onPrimary: Colors.white,
                              shadowColor: Colors.red,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),

                  RichText(
                      text:
                      TextSpan(
                          text: 'Price : ₹',

                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: datas[0]['discount']==null?'0': datas[0]['discount'].toString()+'(% off)',

                              style: TextStyle(
                                color: Color(0xffF80849),
                                fontSize: 15,
                              ),

                            )
                          ])),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                        '* Price is in US dollars and excludes tax'),
                  ),
                  SizedBox(height: 10),

                  Row(
                    children: [
                      Icon(Icons.ac_unit, size: 15,),
                      Text(
                        " SKU :  FCAOR4440"+datas[0]['id']==null?'0': datas[0]['id'].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500, fontSize: 15),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Image.asset("images/sandtimer.gif",height: 20,),
                      Text(
                        " Estimated time :  "+datas[0]['time']==null?'0':datas[0]['time'].toString(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500, fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Container(
                        width: 270,
                        child: Text(dropdownvalue, style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                      ),
                      PopupMenuButton<String>(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        icon: const Icon(Icons.sort),
                        onSelected: (final String newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            const value = true;
                          });
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            datas[0]['year_10price']==null?'':'₹'+datas[0]['year_10price'].toString() +'@ 10 Years '+'₹'+datas[0]['year_10'].toString()+'/m',
                            datas[0]['year_5price']==null?'':'₹'+datas[0]['year_5price'].toString() +'@ 5 Years '+'₹'+datas[0]['year_5'].toString()+'/m',
                            datas[0]['year_2price']==null?'':'₹'+datas[0]['year_2price'].toString() +'@ 2 Years '+'₹'+datas[0]['year_2'].toString()+'/m',
                            datas[0]['month_12price']==null?'':'₹'+datas[0]['month_12price'].toString() +'@ 12 month '+'₹'+datas[0]['month_12'].toString()+'/m',
                            datas[0]['month_6price']==null?'':'₹'+datas[0]['month_6price'].toString() +'@ 6 month '+'₹'+datas[0]['month_6'].toString()+'/m',

                            datas[0]['month_3price']==null?'':'₹'+datas[0]['month_3price'].toString() +'@ 3 month '+'₹'+datas[0]['month_3'].toString()+'/m',
                            'Selling Full Source code & Setup ₹'+datas[0]['selling_price'],


                          ].map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      ),

                    ],
                  ),
                  Divider(thickness: 1,),
                  Row(
                    children: [
                      Icon(Icons.check, size: 18,),
                      Text('     Quality checked by Envato')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, size: 18,),
                      Text('   Quality checked by Envato')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.check, size: 18,),
                      Text('    Quality checked by Envato')
                    ],
                  ),
                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [

                      Container(
                        width:MediaQuery.of(context).size.width * 0.4,

                        child: ElevatedButton.icon(
                          icon: Icon(Icons.shopping_cart),
                          label: Text("Add to Cart", style: TextStyle(
                              color: Colors.white,
                              fontSize:MediaQuery.of(context).size.width/25,
                              fontWeight: FontWeight.bold
                          ),),

                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddToCart(product_image: datas[0]['product_image']==null?'0':datas[0]['product_image'].toString(),
                                          category:datas[0]['category']==null?'0':datas[0]['category'].toString(),
                                          product_name:datas[0]['product_name']==null?'0':datas[0]['product_name'].toString(),
                                          discount: datas[0]['discount']==null?'0':datas[0]['discount'].toString(),
                                          plan: dropdownvalue,

                                        ))
                            );
                          },

                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            onPrimary: Colors.white,
                            shadowColor: Colors.red,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width:MediaQuery.of(context).size.width * 0.4,

                        child: ElevatedButton.icon(
                          icon: Icon(Icons.favorite_border),
                          label: Text("Favorite", style: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width/25,
                              fontWeight: FontWeight.bold
                          ),),

                          onPressed: () {
                            Add_wish_list();
                          },

                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            onPrimary: Colors.white,
                            shadowColor: Colors.red,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 10,),

                  Text("Description", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),),
                  Text(
                    datas[0]['full_description']==null?'0':datas[0]['full_description'].toString(),
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,),
                  SizedBox(height: 15,),

                  Text("Feature", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),),
                  Text(datas[0]['features']==null?'0':datas[0]['features'].toString(),
                    textAlign: TextAlign.justify
                    , style: TextStyle(
                    ),),

                ],
              ),
            ),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.topLeft,
              child: Text("FAQ", style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            FutureBuilder<List<Album>>(
                future: bowss(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);
                  return snapshot.hasData
                      ? ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 6),
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return  Card(
                          margin: const EdgeInsets.all(10),
                          child: Column(children: [
                            // The title
                            ListTile(
                              title: Text(snapshot.data![index].title),
                              trailing: IconButton(
                                icon: Icon(
                                    _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                                onPressed: () {
                                  setState(() {
                                    _showContent = !_showContent;
                                  });
                                },
                              ),

                            ),
                            // Show or hide the content based on the state
                            _showContent
                                ? Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Divider(
                                    thickness: 1.5,
                                  ),
                                ),
                                Container(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                  child: Text(snapshot.data![index].description,
                                      textAlign: TextAlign.justify
                                  ),
                                ),
                              ],
                            )
                                : Container()
                          ]),
                        );


                      })
                      : Container();


                }),

            SizedBox(height: 20,),
            Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: VideoPlayerScreen(vvideo:   datas[0]['video_url']==null?'0':datas[0]['video_url'].toString(),))

          ],
        ),

      );

  }


  desk(BuildContext context){
    final imageuri=Apiconst.productimage;
    var a = datas==null?'["https://foundercodes.com/assets/front/img/header_logo_16531367321911830739.png"]':datas[0]['other_images'].toString();
   // datas[0]['other_images'].toString()
    var ab = jsonDecode(a);

    List<dynamic> abc = ab as List;

    return datas==null? Container():
      Padding(
        padding: const EdgeInsets.all(15.0),
        child:

            Row(
            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[


                //Column 1------
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      datas[0]['product_name']==null?"0":
                      datas[0]['product_name'],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize:MediaQuery.of(context).size.width/45,),),
                    Container(
                      height: 400,
                     // height:MediaQuery.of(context).size.height*.65,

                      width: MediaQuery.of(context).size.width*.65,
                      child: CarouselSlider(

                        items: abc.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return InkWell(
                                onTap: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  zoompic(image: imageuri+'$i')),
                                  );
                                },
                                child: Container(
                                  //height:MediaQuery.of(context).size.height*.65,
                                    height: 400,
                                  width: MediaQuery.of(context).size.width*.65,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            15.0),
                                      ),
                                      elevation: 5,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            15.0),
                                        child: Image.network(
                                          imageuri+i, fit: BoxFit.fill,
                                         height:400,)
                                         // height:MediaQuery.of(context).size.height*.65,),
                                      )
                                  ),
                                ),

                              );
                            },
                          );
                          // $i'
                        }).toList(),
                        options: CarouselOptions(
                          height: 400,
                          //height: MediaQuery.of(context).size.height*0.25,
                          aspectRatio: 12/9,
                          viewportFraction: 1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        ),

                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width:MediaQuery.of(context).size.width * 0.15,
                            child: ElevatedButton.icon(
                              icon: Icon(Icons.remove_red_eye),
                              label: Text("Live Preview", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width/90,
                                  fontWeight: FontWeight.bold
                              ),),

                              onPressed: () async {
                               // mains();
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => live_preview_form(
                                      id:datas[0]['id']==null?'0':datas[0]['id'].toString(),
                                    )));


                                final snackBar = SnackBar(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  behavior: SnackBarBehavior.floating,
                                  content: Text('Generating PDF!'),

                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                    snackBar);
                              },

                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                onPrimary: Colors.white,
                                shadowColor: Colors.red,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width:MediaQuery.of(context).size.width * 0.15,

                            child: ElevatedButton.icon(
                              icon: Icon(Icons.remove_red_eye),
                              label: Text("Screenshots", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width/90,
                                  fontWeight: FontWeight.bold
                              ),),

                              onPressed: () async {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => ScreenShorts(
                                      image:datas[0]['other_images']==null?'0':datas[0]['other_images'].toString(),
                                      product_category:datas[0]['product_category']==null?'0':datas[0]['product_category'].toString(),
                                      product_name:datas[0]['product_name']==null?'0':datas[0]['product_name'].toString(),
                                    )));
                              },

                              style: ElevatedButton.styleFrom(
                                primary: Colors.teal,
                                onPrimary: Colors.white,
                                shadowColor: Colors.red,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("Description", style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.60,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          datas[0]['full_description']==null?'0':datas[0]['full_description'].toString(),
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.justify,),
                      ),
                    ),
                    SizedBox(height: 30,),

                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("Feature", style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.60,

                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(datas[0]['features']==null?'0':datas[0]['features'].toString(),
                          textAlign: TextAlign.start
                          , style: TextStyle(
                          ),),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("FAQ's", style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height:MediaQuery.of(context).size.height ,
                      width:MediaQuery.of(context).size.width * 0.65,
                      child: FutureBuilder<List<Album>>(
                          future: bowss(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) print(snapshot.error);
                            return snapshot.hasData
                                ? ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 6),
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return  Fars(title:snapshot.data![index].title,title2:snapshot.data![index].description);




                                })
                                : Container();


                          }),
                    ),
                  ],
                ),
                //Column 2------
                Column(
                 // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 400,
                     child:  Row(
                       mainAxisAlignment: MainAxisAlignment
                           .spaceBetween,
                       children: [
                         Text(dropdownvalue, style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold)),
                         Spacer(),
                         PopupMenuButton<String>(
                           color: Colors.white,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10),
                           ),
                           icon: const Icon(Icons.sort,color: Colors.black,),
                           onSelected: (final String newValue) {
                             setState(() {
                               dropdownvalue = newValue;
                               const value = true;
                             });
                           },
                           itemBuilder: (BuildContext context) {
                             return [
                               datas[0]['year_10price']==null?'':'₹'+datas[0]['year_10price'].toString() +'@ 10 Years '+'₹'+datas[0]['year_10'].toString()+'/m',
                               datas[0]['year_5price']==null?'':'₹'+datas[0]['year_5price'].toString() +'@ 5 Years '+'₹'+datas[0]['year_5'].toString()+'/m',
                               datas[0]['year_2price']==null?'':'₹'+datas[0]['year_2price'].toString() +'@ 2 Years '+'₹'+datas[0]['year_2'].toString()+'/m',
                               datas[0]['month_12price']==null?'':'₹'+datas[0]['month_12price'].toString() +'@ 12 month '+'₹'+datas[0]['month_12'].toString()+'/m',
                               datas[0]['month_6price']==null?'':'₹'+datas[0]['month_6price'].toString() +'@ 6 month '+'₹'+datas[0]['month_6'].toString()+'/m',
                               datas[0]['month_3price']==null?'':'₹'+datas[0]['month_3price'].toString() +'@ 3 month '+'₹'+datas[0]['month_3'].toString()+'/m',
                               'Selling Full Source code & Setup ₹'  +datas[0]['selling_price'].toString(),
                             ].map((String choice) {
                               return PopupMenuItem<String>(
                                 value: choice,
                                 child: Text(choice),
                               );
                             }).toList();
                           },
                         ),

                       ],
                     ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                       // padding: EdgeInsets.all(10),
                        width: 400,
                          height: 300,
                          //alignment: Alignment.topRight,
                      // margin: EdgeInsets.all(10),
                       child:Card(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(
                               15.0),
                         ),
                         elevation: 5,
                         child: Padding(
                           padding: const EdgeInsets.all(20.0),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             //crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Align(
                                 alignment: Alignment.bottomLeft,
                                 child: RichText(
                                     text:
                                     TextSpan(
                                         text: 'Price : ₹'+datas[0]['selling_price']==null?'0':datas[0]['selling_price'].toString(),

                                         style: TextStyle(
                                           color: Colors.black,
                                           fontSize: 22,
                                         ),
                                         children: [
                                           TextSpan(
                                             text: datas[0]['discount']==null?'0':datas[0]['discount'].toString()+'(% off)',

                                             style: TextStyle(
                                               color: Color(0xffF80849),
                                               fontSize: 18,
                                             ),

                                           )
                                         ])),
                               ),
                               Align(
                                 alignment: Alignment.bottomLeft,
                                 child: Text(
                                     '* Price is in US dollars and excludes tax'),
                               ),
                               SizedBox(height: 20),

                               Row(
                                 children: [
                                   Icon(Icons.ac_unit, size: 15,),
                                   Text(
                                     " SKU :  FCAOR4440"+datas[0]['id']==null?'0':datas[0]['id'].toString(),

                                     style: TextStyle(
                                         color: Colors.black,
                                         fontWeight: FontWeight.w500, fontSize: 15),),
                                 ],
                               ),
                               SizedBox(height: 20,),
                               Align(
                                 alignment: Alignment.bottomLeft,
                                 child: Row(
                                   children: [
                                     Image.asset("images/sandtimer.gif",height: 20,),
                                     Text(
                                       " Estimated time :  "+datas[0]['time']==null?'0':datas[0]['time'].toString(),

                                       style: TextStyle(
                                           color: Colors.grey,
                                           fontWeight: FontWeight.w500, fontSize: 20),),
                                   ],
                                 ),
                               ),
                               SizedBox(
                                 height: 25,
                               ),
                               Align(
                                 alignment: Alignment.bottomLeft,
                                 child: Row(
                                   children: [
                                     Icon(Icons.check, size: 18,),
                                     Text('    Quality checked by Envato')
                                   ],
                                 ),
                               ),
                               Align(
                                 alignment: Alignment.bottomLeft,
                                 child: Row(
                                   children: [
                                     Icon(Icons.check, size: 18,),
                                     Text('   Quality checked by Envato')
                                   ],
                                 ),
                               ),

                               Align(
                                 alignment: Alignment.bottomLeft,
                                 child: Row(
                                   children: [
                                     Icon(Icons.check, size: 18,),
                                     Text('    Quality checked by Envato')
                                   ],
                                 ),
                               ),
                             ],
                           ),
                         ),
                       )
                      ),
                    ),
                    SizedBox(height: 20,),

                    Container(
                      height: 2,
                      color: Colors.black,),

                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width:MediaQuery.of(context).size.width * 0.15,

                            child: ElevatedButton.icon(
                              icon: Icon(Icons.shopping_cart),
                              label: Text("Add to Cart", style: TextStyle(
                                  color: Colors.white,
                                  fontSize:MediaQuery.of(context).size.width/90,
                                  fontWeight: FontWeight.bold
                              ),),

                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            AddToCart(product_image: datas[0]['product_image']==null?'0':datas[0]['product_image'].toString(),
                                              category:datas[0]['category']==null?'0':datas[0]['category'].toString(),
                                              product_name:datas[0]['product_name']==null?'0':datas[0]['product_name'].toString(),
                                              discount: datas[0]['discount']==null?'0':datas[0]['discount'].toString(),
                                              plan: dropdownvalue,

                                            ))
                                );
                              },

                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                onPrimary: Colors.white,
                                shadowColor: Colors.red,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width:MediaQuery.of(context).size.width * 0.15,

                            child: ElevatedButton.icon(
                              icon: Icon(Icons.favorite_border),
                              label: Text("Favorite", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width/90,
                                  fontWeight: FontWeight.bold
                              ),),

                              onPressed: () {
                                Add_wish_list();
                              },

                              style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent,
                                onPrimary: Colors.white,
                                shadowColor: Colors.red,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    Center(
                      child: Container(
                          height: 270,
                          width: 370,
                         // width: MediaQuery.of(context).size.width*.65,
                          child: VideoPlayerScreen(vvideo:   datas[0]['video_url']==null?'0':datas[0]['video_url'].toString(),)),
                    ),
                    SizedBox(
                      height: 600,
                    )
                  ],
                ),
              ],
            ),
      );
  }

  Future<List<Album>> bowss() async {
    final response = await http.post(
      Uri.parse(
        "https://backend.apponrent.com/mobile_app/faqs?count=20&group_id=1"
         ),
    );
    var jsond = json.decode(response.body)["data"];
    print(response.body);
    List<Album> allround = [];
    for (var o in jsond) {
      Album al = Album(
        o["id"],
        o["title"],
        o["group_id"],
        o["description"],

      );
      allround.add(al);
    }
    return allround;
  }
  var datas;
  var img;
  Detail() async{
    final id=widget.id;
    final prefs = await SharedPreferences.getInstance();
    final key = 'deviceId';
    final deviceId = prefs.getString(key) ?? "0";

    print('https://backend.apponrent.com/obile_app/get_product?device_id=$deviceId&pid=$id');
    final response = await http.post(
      Uri.parse('https://backend.apponrent.com/mobile_app/get_product?device_id=$deviceId&pid=$id'),


    );
    var data = jsonDecode(response.body);
    print(datas);
    print('llllllllllllllssssssssssssssssssssssssssssss');
    if (data['error'] == 200) {
      setState(() {
        datas=data['data'];
        img=datas[0]['other_images'];
      });
    }
  }


  Add_wish_list()async {
    print("pjunlike");
    print('${widget.id}');
    final id=widget.id;
    final prefs = await SharedPreferences.getInstance();
    final key = 'deviceId';
    final deviceId = prefs.getString(key) ?? "0";
    final url= Apiconst.addwishlisht+"product_id=$id&device_id=$deviceId&status=1";
    final unlikeapi= await http.get(Uri.parse(url));
    print(url);

    final data=jsonDecode(unlikeapi.body);
    if (data['error'] == 200) {
      Fluttertoast.showToast(
          msg: data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else {
      Fluttertoast.showToast(
          msg: data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    print(data);
  }



}


class Album {
  String id;
  String title;
  String group_id;
  String description;


  Album(
      this.id,
      this.title,
      this.group_id,
      this.description,
      );
}

class Fars extends StatefulWidget {
  final String title; final String title2;
   Fars({Key? key, required this.title, required this.title2}) : super(key: key);

  @override
  State<Fars> createState() => _FarsState();
}

class _FarsState extends State<Fars> {
  bool  _showContent=false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(children: [
        // The title
        ListTile(
          title: Text(widget.title),
          trailing: IconButton(
            icon: Icon(
                _showContent ? Icons.arrow_drop_up : Icons.arrow_drop_down),
            onPressed: () {
              setState(() {
                _showContent = !_showContent!;
              });
            },
          ),

       ),
        // Show or hide the content based on the state
        _showContent!
            ? Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                thickness: 1.5,
              ),
            ),
            Container(
              padding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(widget.title2,
                  textAlign: TextAlign.justify
              ),
            ),
          ],
        )
            : Container()
      ]),
    );
  }
}
