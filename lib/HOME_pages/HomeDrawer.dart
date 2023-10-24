import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:testt/HOME_pages/categories/categories_list.dart';
import 'package:testt/HOME_pages/categories/home_categories_view.dart';
import 'package:testt/constants.dart';
import 'package:testt/responsive.dart';
import 'package:testt/screen/mobcard.dart';
import 'package:testt/screen/mobiledrawer.dart';
import 'package:testt/widget/appbar.dart';
import 'package:window_style_dropdown_menu/window_style_dropdown_menu.dart';


class HomeDrewer extends StatelessWidget with PreferredSizeWidget{
  final Size preferredSize;
  HomeDrewer({Key? key})  : preferredSize = const Size.fromHeight(50.0), super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Responsive(mobile: mobile(context),
      tablet: Tablet(context),
      desktop: desk(context),);
  }
  mobile(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){
            Navigator.pop(context);
          },),
          backgroundColor: Colors.white,
          title: Text(''),
          bottom: TabBar(
            indicator: BoxDecoration(
              color: Colors.red,
            ) ,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs:    [
              Tab(text:'MENU',),
              Tab(text:'SECTORS',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:10,left: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_box,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("Product",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Icon(Icons.account_circle,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("My account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.history,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),

                      Text("My orders",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.favorite_border,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("Favourite",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.login,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.login,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.question_mark,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("About us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.phone,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("Contact us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.logout_outlined,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Album>>(
                future: bowss(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) print(snapshot.error);
                  return snapshot.hasData
                      ? ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          // Navigator.push(context,MaterialPageRoute(builder: (context)=>
                          //     catagories_screen_list(id:snapshot.data![index].id, name:snapshot.data![index].name)
                          // ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(

                                    borderRadius: BorderRadius.all(Radius.circular(10)),

                                    child :
                                     snapshot.data![index].images_file == null?
                                     Image.asset('images/logo_horizon.png',
                                       fit: BoxFit.fill,
                                       height: 50,width: 50,
                                     ):
                                    Image.network(
                                      Apiconst.image_path+snapshot.data![index].images_file,
                                      fit: BoxFit.fill,
                                      height: 50,width: 50,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Text(snapshot.data![index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),

                                  ),

                                ],
                              ) ,

                            ],
                          ),
                        ),
                      );
                    },
                  ):CircularProgressIndicator();
                }
            )
          ],
        ),
      ),
    );



  }
  Tablet(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){
            Navigator.pop(context);
          },),
          backgroundColor: Colors.white,
          title: Text(''),
          bottom: TabBar(
            indicator: BoxDecoration(
              color: Colors.red,
            ) ,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs:    [
              Tab(text:'MENU',),
              Tab(text:'SECTORS',),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:10,left: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_box,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("Product",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    children: [
                      Icon(Icons.account_circle,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("My account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.history,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),

                      Text("My orders",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.favorite_border,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("Favourite",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.login,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("Login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.login,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("Register",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.question_mark,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("About us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.phone,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("Contact us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                  SizedBox(height: 15,),

                  Row(
                    children: [
                      Icon(Icons.logout_outlined,size: 35,color: Colors.grey,),
                      SizedBox(width: 20,),
                      Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,),),
                    ],
                  ),
                ],
              ),
            ),
            FutureBuilder<List<Album>>(
                future: bowss(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) print(snapshot.error);
                  return snapshot.hasData
                      ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>
                            catagories_screen_list(id:snapshot.data![index].id, name:snapshot.data![index].name)
                        ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(Apiconst.image_path+snapshot.data![index].images_file),
                                ),
                                SizedBox(width: 10,),
                                Text(snapshot.data![index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),

                                ),

                              ],
                            ) ,

                          ],
                        ),
                      ),
                    );
                  },
                ):CircularProgressIndicator();
              }
            )
          ],
        ),
      ),
    );



  }
  desk(BuildContext context) {
    return AppBar(
      elevation: 0.3,
      backgroundColor: Colors.white,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('images/logo_horizon.png', height: 30,),
          Column(
            children: [
              Container(
                height: 20,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<
                            Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text('Websites', style: TextStyle(fontSize: 15)),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<
                            Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Mobile Apps', style: TextStyle(fontSize: 15),),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<
                            Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text('Web Apps', style: TextStyle(fontSize: 15)),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<
                            Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text('Web & App', style: TextStyle(fontSize: 15)),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<
                            Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text('ERP', style: TextStyle(fontSize: 15),),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<
                            Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text(
                        'System Software', style: TextStyle(fontSize: 15),),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<
                            Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text('Games', style: TextStyle(fontSize: 15),),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<
                            Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Batting Games', style: TextStyle(fontSize: 15),),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, top: 5),
                height: 20,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 0.70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text('Websites', style: TextStyle(fontSize: 15)),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text('Mobile Apps', style: TextStyle(fontSize: 15),),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text('Web Apps', style: TextStyle(fontSize: 15)),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text('Web & App', style: TextStyle(fontSize: 15)),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text('ERP', style: TextStyle(fontSize: 15),),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text('System Software', style: TextStyle(fontSize: 15),),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text('Games', style: TextStyle(fontSize: 15),),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.focused))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.hovered))
                                return nohovertextcolor;
                              if (states.contains(MaterialState.pressed))
                                return pressedtextcolor;
                              return textcolor; // null throus error in flutter 2.2+.
                            }),
                      ),
                      onPressed: () {},
                      child: Text('Batting Games', style: TextStyle(fontSize: 15),),

                    ),
                  ],
                ),

              )
            ],
          ),
        ],
      ),
      actions: [
        Container(
            margin: EdgeInsets.all(8),
            child: Icon(Icons.shopping_cart, color: icontextcolor,)),
        Container(
            margin: EdgeInsets.all(8),
            child: Icon(Icons.person, color: icontextcolor,)),
      ],


    );
  }
  Future<List<Album>> bowss() async {
    final response = await http.post(
      Uri.parse(
          Apiconst.Categories_api+"?count=100"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var jsond = json.decode(response.body)["data"];
    print(response.body);
    List<Album> allround = [];
    for (var o in jsond) {
      Album al = Album(
        o["id"],
        o["images_file"],
        o["mispell_key"],
        o["name"],
        o["seo"],
        o["shortdescription"],
        o["status"],
      );
      allround.add(al);
    }
    return allround;
  }
}

class Album {
  String id;
  String images_file;
  String mispell_key;
  String name;
  String seo;
  String shortdescription;
  String status;

  Album(
      this.id,
      this.images_file,
      this.mispell_key,
      this.name,
      this.seo,
      this.shortdescription,
      this.status,
      );
}

