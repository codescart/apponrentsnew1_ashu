import 'dart:async';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testt/constants.dart';
class most_rated_prodect_slider extends StatefulWidget {
  const most_rated_prodect_slider({Key? key}) : super(key: key);

  @override
  State<most_rated_prodect_slider> createState() => _most_rated_prodect_sliderState();
}

class _most_rated_prodect_sliderState extends State<most_rated_prodect_slider> {

  late final PageController pageController;
  int pageNo =0;

  late final Timer carasouelTimer;





  get controller => null;
  @override
  void initState() {
    state();

    super.initState();
  }
  var lgth =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height:MediaQuery.of(context).size.height*1,
              width: MediaQuery.of(context).size.width*0.99,
              child: CarouselSlider(

                items: state_data.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: (){
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) =>  zoompic(image:'$i')),
                          // );
                        },
                        child: Container(
                          height:MediaQuery.of(context).size.height*1,

                          width: MediaQuery.of(context).size.width*0.99,
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
                                  i['image'].toString(), fit: BoxFit.fill,
                                  height:MediaQuery.of(context).size.height*1,),
                              )
                          ),
                        ),

                      );
                    },
                  );
                  // $i'
                }).toList(),
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height*1,
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
              )
          ),
        ],
      ),
    );
  }
  List state_data = [];

  Future<String> state() async {
    final res = await http.get(
        Uri.parse(Apiconst.bannerwithtype+"?type=3")
    );
    final resBody = json.decode(res.body)['data'];
    print("hhhhhhhhhhhhh");
    print(resBody);
    setState(() {
      state_data = resBody;
    });



    return "Sucess";
  }

}
