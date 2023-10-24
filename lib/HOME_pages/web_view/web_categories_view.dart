import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testt/HOME_pages/categories/categories_list.dart';
import 'package:testt/HOME_pages/Home.dart';
import 'package:testt/constants.dart';
import 'package:testt/screen/mobcategories.dart';
import 'package:shimmer/shimmer.dart';
import 'package:testt/web_routes/web_routs_name.dart';

import '../../widget/sizes_helpers.dart';

class web_categories_view extends StatefulWidget {
  static const routeName = '/catewisepro';

  final String? id;
  final String? images_file;
  final String? name;
  final String? seo;
  final String? shortdescription;
  final String? status;
  web_categories_view({

    this.id,
    this.images_file,
    this.name,
    this.seo,
    this.shortdescription,
    this.status
  });

  @override
  State<web_categories_view> createState() => _web_categories_viewState();
}

class _web_categories_viewState extends State<web_categories_view> {
  @override
  void initState() {
    // setcatId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var id=widget.id;
        var name=widget.name;

        Navigator.pushNamed(context,'/category/$id/$name');

        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) =>
        //         catagories_screen_list(
        //             id:widget.id,
        //             name:widget.name
        //         )
        //     ));
      },
      child: Container(
        height: MediaQuery.of(context).size.height*0.40,
        child:  Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),),
          child:  HoverWidget(
            hoverChild: Container(
              height: MediaQuery.of(context).size.height*0.40,
              width: MediaQuery.of(context).size.width*0.40,

              child: Column(
                children: [
                  Container(
                    height:MediaQuery.of(context).size.height*0.30,
                    width: MediaQuery.of(context).size.width,
                    child:
                    widget.images_file==null? Container():
                    ClipRRect(
                      borderRadius: BorderRadius.only
                        (topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.network(
                        Apiconst.image_path+"${widget.images_file}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),


                  Text(widget.name==null?'':"${widget.name}",
                    style: TextStyle( fontSize:14,
                      fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7),),),
                  SizedBox(height: 8,),
                  Container(
                    width: displayWidth(context)*0.9,
                    // height: displayHeight(context)*0.10,

                    child: Container(
                        margin: EdgeInsets.only(left: 5),
                        width: displayWidth(context)*0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 40,
                              child: Text(
                                widget.shortdescription==null?'':"${widget.shortdescription}"
                                ,maxLines: 2,

                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize:12),),
                            ),
                            SizedBox(height: 10,),


                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
            onHover: (PointerEnterEvent event) {  },
            child: Container(
              height: MediaQuery.of(context).size.height*0.40,
              width: MediaQuery.of(context).size.width*0.40,
              // color: Colors.red,

              child:  Column(
                children: [

                  Container(
                    height:MediaQuery.of(context).size.height*0.35,
                    width: MediaQuery.of(context).size.width,
                    child:
                    widget.images_file==null? Container():
                    ClipRRect(
                      borderRadius: BorderRadius.only
                        (topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.network(
                        Apiconst.image_path+"${widget.images_file}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(widget.name==null?'':"${widget.name}",
                    style: TextStyle( fontSize:MediaQuery.of(context).size.width/38,
                      fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.7),),),
                 ]
                  ),

             )
              ),


            ),
          ),
        );


  }
}




