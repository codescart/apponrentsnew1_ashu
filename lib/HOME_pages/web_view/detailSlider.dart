import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:testt/constants.dart';
import 'package:testt/screen/pinchzoom/pinchtozoom.dart';

class detailslider extends StatelessWidget {
   // detailslider({Key? key}) : super(key: key);



  final String other_images;
  detailslider({ required this.other_images,});

  final imageuri=Apiconst.productimage;

  @override
  Widget build(BuildContext context) {
    var ab = jsonDecode(other_images);
    print('gggggggg');
    print(ab);
    List<dynamic> abc = ab as List;

    return CarouselSlider(

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
                height:MediaQuery.of(context).size.height*0.25,

                width: MediaQuery.of(context).size.width,
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
                        height:MediaQuery.of(context).size.height*0.25,),
                    )
                ),
              ),

            );
          },
        );
        // $i'
      }).toList(),
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height*0.25,
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

    );
  }
}
