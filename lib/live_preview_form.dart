import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testt/responsive.dart';
import 'package:http/http.dart'as http;


class live_preview_form extends StatefulWidget {
  final String id;
   live_preview_form({required this.id});

  @override
  State<live_preview_form> createState() => _live_preview_formState();
}

class _live_preview_formState extends State<live_preview_form> {

  InputDecoration getInputDecoration(String hintext, IconData iconData) {
    return InputDecoration(
      counter: Offstage(),

      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Colors.white, width: 2),
      ),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Color(0xFFF65054)),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        borderSide: BorderSide(color: Color(0xFFF65054)),
      ),
      filled: true,
      prefixIcon: Icon(
        iconData,
        color:  Color(0xFFebd197),
      ),
      hintStyle: const TextStyle(color: Colors.black54, fontSize: 14),
      hintText: hintext,
      // fillColor: kBackgroundColor,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
    );
  }

  final _formKey = GlobalKey<FormState>();

  Color _currentColor = Colors.blue;
  Color _Texcolor = Colors.red;
  Color _Hoverolor = Colors.black45;
  final _controller = CircleColorPickerController(
    initialColor: Colors.blue,
  );
  final TextColor = CircleColorPickerController(
    initialColor: Colors.black45,
  );
  final HoverColor = CircleColorPickerController(
    initialColor: Colors.red,
  );
  final TextEditingController _name = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _compName = TextEditingController();
  final TextEditingController _address = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Wrap( //will break to another line on overflow
        direction: Axis.vertical, //use vertical to show  on vertical axis
        children: <Widget>[ //button first

          // Container(
          //     margin:EdgeInsets.all(10),
          //     child: FloatingActionButton(
          //       onPressed: (){
          //         //action code for button 2
          //       },
          //       backgroundColor: Colors.white,
          //       child: Image.asset('images/wp.gif'),
          //     )
          // ), // button second
          // button third

          // Add more buttons here
        ],),
      // appBar: HomeDrewer(),
      body: Responsive(
        mobile: mobile(context),
        tablet: tablet(context),
        desktop: desk(context),
      ),
    );

  }
  mobile(BuildContext context){
    return Center(
      child: ListView(
          children: [

            Center(
              child: SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  children: [
                    file == null?
                    const  CircleAvatar(
                      radius: 70,
                      backgroundImage:AssetImage('assets/images/download.png'),
                    ):CircleAvatar(radius: 70, backgroundImage: FileImage(file!,),),
                    Positioned(
                      right: 0,
                      bottom:0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: IconButton(
                          onPressed: () {
                            _choose();
                          },
                          icon: const Icon(Icons.camera_alt,size: 25,color: Colors.white,),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),

            SizedBox(height: 20),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.name,
                        maxLength: 30,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Name',
                          Icons.person,
                        ),
                        controller: _name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Name';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,

                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Mobile No',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Mobile Number',
                          Icons.phone_android,
                        ),
                        controller: _mobile,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mobile Number';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,

                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.emailAddress,
                        //maxLength: 10,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Email',
                          Icons.mail_outline_outlined,
                        ),
                        controller: _email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Company Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Company Name',
                          Icons.email,
                        ),
                        controller: _compName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Company Name';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,

                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Address',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Address',
                          Icons.maps_home_work_outlined,
                        ),
                        controller: _address,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Address';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,

                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          15.0),
                                    ),
                                    elevation: 5,
                                    content: Stack(
                                      clipBehavior: Clip.none, children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close),
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        height: 380,
                                        child: Column(
                                          children: [
                                            Center(
                                              child: CircleColorPicker(
                                                controller: _controller,
                                                onChanged: (color) {
                                                  setState(() => _currentColor
                                                  = color);
                                                },
                                              ),
                                            ),
                                            ElevatedButton.icon(
                                              icon: Icon(Icons.remove_red_eye),
                                              label: Text("Submit", style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold
                                              ),),

                                              onPressed: ()  {
                                                final snackBar = SnackBar(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(10))),
                                                  behavior: SnackBarBehavior.floating,
                                                  content: Text('Generating Color!'),

                                                );
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    snackBar);
                                                Navigator.pop(context);
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
                                          ],
                                        ),
                                      )
                                    ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              color:_currentColor,
                            ),
                            child:   Center(child: Text('Font Color')),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          15.0),
                                    ),
                                    elevation: 5,
                                    content: Stack(
                                      clipBehavior: Clip.none, children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close),
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        height: 380,
                                        child: Column(
                                          children: [
                                            Center(
                                              child: CircleColorPicker(
                                                controller: TextColor,
                                                onChanged: (color) {
                                                  setState(() => _Texcolor
                                                  = color);
                                                },
                                              ),
                                            ),
                                            ElevatedButton.icon(
                                              icon: Icon(Icons.remove_red_eye),
                                              label: Text("Submit", style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold
                                              ),),

                                              onPressed: ()  {
                                                final snackBar = SnackBar(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(10))),
                                                  behavior: SnackBarBehavior.floating,
                                                  content: Text('Generating Color!'),

                                                );
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    snackBar);
                                                Navigator.pop(context);
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
                                          ],
                                        ),
                                      )
                                    ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              color:_Texcolor,
                            ),
                            child: Center(child: Text('BackGround Color')),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          15.0),
                                    ),
                                    elevation: 5,
                                    content: Stack(
                                      clipBehavior: Clip.none, children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close),
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        height: 380,
                                        child: Column(
                                          children: [
                                            Center(
                                              child: CircleColorPicker(
                                                controller: HoverColor,
                                                onChanged: (color) {
                                                  setState(() => _Hoverolor
                                                  = color);
                                                },
                                              ),
                                            ),
                                            ElevatedButton.icon(
                                              icon: Icon(Icons.remove_red_eye),
                                              label: Text("Submit", style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold
                                              ),),

                                              onPressed: ()  {
                                                final snackBar = SnackBar(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(10))),
                                                  behavior: SnackBarBehavior.floating,
                                                  content: Text('Generating Color!'),

                                                );
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    snackBar);
                                                Navigator.pop(context);
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
                                          ],
                                        ),
                                      )
                                    ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              color:_Hoverolor,
                            ),
                            child:Center(child: Text('Hover Color')),
                          ),
                        ),
                      ],
                    ),

                  ],
                )
            ),
            SizedBox(height: 25,),
            InkWell(
              onTap: (){
                uploadImage(
                  _name.text,_mobile.text,
                  _email.text,_compName.text,
                  _address.text,_controller.toString(),
                  TextColor.toString(),_Hoverolor.toString(),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)
                  ),
                  color:Colors.redAccent,
                ),
                height: 50,
                width: MediaQuery.of(context).size.width*0.30,
                child: Center(child: Text("Proceed",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),),
              ),
            ),

          ]),
    );
  }
  tablet(BuildContext context){
    return Center(
      child: ListView(
          children: [

            Center(
              child: SizedBox(
                height: 115,
                width: 115,
                child: Stack(
                  children: [
                    file == null?
                    const  CircleAvatar(
                      radius: 70,
                      backgroundImage:AssetImage('assets/images/download.png'),
                    ):CircleAvatar(radius: 70, backgroundImage: FileImage(file!,),),
                    Positioned(
                      right: 0,
                      bottom:0,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(50)
                        ),
                        child: IconButton(
                          onPressed: () {
                            _choose();
                          },
                          icon: const Icon(Icons.camera_alt,size: 25,color: Colors.white,),
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),

            SizedBox(height: 20),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.name,
                        maxLength: 30,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Name',
                          Icons.person,
                        ),
                        controller: _name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Name';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,

                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Mobile No',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Mobile Number',
                          Icons.phone_android,
                        ),
                        controller: _mobile,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mobile Number';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,

                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.number,
                        //maxLength: 10,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Email',
                          Icons.mail_outline_outlined,
                        ),
                        controller: _email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Company Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Company Name',
                          Icons.email,
                        ),
                        controller: _compName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Company Name';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,

                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Address',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Address',
                          Icons.maps_home_work_outlined,
                        ),
                        controller: _address,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Address';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,

                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          15.0),
                                    ),
                                    elevation: 5,
                                    content: Stack(
                                      clipBehavior: Clip.none, children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close),
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        height: 380,
                                        child: Column(
                                          children: [
                                            Center(
                                              child: CircleColorPicker(
                                                controller: _controller,
                                                onChanged: (color) {
                                                  setState(() => _currentColor
                                                  = color);
                                                },
                                              ),
                                            ),
                                            ElevatedButton.icon(
                                              icon: Icon(Icons.remove_red_eye),
                                              label: Text("Submit", style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold
                                              ),),

                                              onPressed: ()  {
                                                final snackBar = SnackBar(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(10))),
                                                  behavior: SnackBarBehavior.floating,
                                                  content: Text('Generating Color!'),

                                                );
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    snackBar);
                                                Navigator.pop(context);
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
                                          ],
                                        ),
                                      )
                                    ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              color:_currentColor,
                            ),
                            child:   Center(child: Text('Font Color')),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          15.0),
                                    ),
                                    elevation: 5,
                                    content: Stack(
                                      clipBehavior: Clip.none, children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close),
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        height: 380,
                                        child: Column(
                                          children: [
                                            Center(
                                              child: CircleColorPicker(
                                                controller: TextColor,
                                                onChanged: (color) {
                                                  setState(() => _Texcolor
                                                  = color);
                                                },
                                              ),
                                            ),
                                            ElevatedButton.icon(
                                              icon: Icon(Icons.remove_red_eye),
                                              label: Text("Submit", style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold
                                              ),),

                                              onPressed: ()  {
                                                final snackBar = SnackBar(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(10))),
                                                  behavior: SnackBarBehavior.floating,
                                                  content: Text('Generating Color!'),

                                                );
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    snackBar);
                                                Navigator.pop(context);
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
                                          ],
                                        ),
                                      )
                                    ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              color:_Texcolor,
                            ),
                            child: Center(child: Text('BackGround Color')),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          15.0),
                                    ),
                                    elevation: 5,
                                    content: Stack(
                                      clipBehavior: Clip.none, children: <Widget>[
                                      Positioned(
                                        right: -40.0,
                                        top: -40.0,
                                        child: InkResponse(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close),
                                            backgroundColor: Colors.red,
                                          ),
                                        ),
                                      ),

                                      Container(
                                        height: 380,
                                        child: Column(
                                          children: [
                                            Center(
                                              child: CircleColorPicker(
                                                controller: HoverColor,
                                                onChanged: (color) {
                                                  setState(() => _Hoverolor
                                                  = color);
                                                },
                                              ),
                                            ),
                                            ElevatedButton.icon(
                                              icon: Icon(Icons.remove_red_eye),
                                              label: Text("Submit", style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold
                                              ),),

                                              onPressed: ()  {
                                                final snackBar = SnackBar(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(10))),
                                                  behavior: SnackBarBehavior.floating,
                                                  content: Text('Generating Color!'),

                                                );
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    snackBar);
                                                Navigator.pop(context);
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
                                          ],
                                        ),
                                      )
                                    ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              color:_Hoverolor,
                            ),
                            child:Center(child: Text('Hover Color')),
                          ),
                        ),
                      ],
                    ),

                  ],
                )
            ),
            SizedBox(height: 25,),
            InkWell(
              onTap: (){
                uploadImage(
                  _name.text,_mobile.text,
                  _email.text,_compName.text,
                  _address.text,_controller.toString(),
                  TextColor.toString(),_Hoverolor.toString(),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12)
                  ),
                  color:Colors.redAccent,
                ),
                height: 50,
                width: MediaQuery.of(context).size.width*0.30,
                child: Center(child: Text("Proceed",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),),
              ),
            ),

          ]),
    );
  }
  desk(BuildContext context){
    return  Center(
      child: Container(
        width: MediaQuery.of(context).size.width*0.50,
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  15.0),
            ),
            elevation: 5,
          child:  ListView(
              children: [

                Center(
                  child: SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      children: [
                        file == null?
                        const  CircleAvatar(
                          radius: 70,
                          backgroundImage:AssetImage('assets/images/download.png'),
                        ):CircleAvatar(radius: 70, backgroundImage: FileImage(file!,),),
                        Positioned(
                          right: 0,
                          bottom:0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: IconButton(
                              onPressed: () {
                                _choose();
                              },
                              icon: const Icon(Icons.camera_alt,size: 25,color: Colors.white,),
                            ),
                          ),
                        ),
                      ],
                    ),

                  ),
                ),

              SizedBox(height: 20),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.name,
                        maxLength: 30,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Name',
                          Icons.person,
                        ),
                        controller: _name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Name';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,

                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Mobile No',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Mobile Number',
                          Icons.phone_android,
                        ),
                        controller: _mobile,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Mobile Number';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,

                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.number,
                        //maxLength: 10,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Email',
                          Icons.mail_outline_outlined,
                        ),
                        controller: _email,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Company Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Company Name',
                          Icons.email,
                        ),
                        controller: _compName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Company Name';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,

                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 17.0, bottom: 5.0),
                        child: Text(
                          'Address',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 0.0, right: 15.0, bottom: 8.0),
                      child: TextFormField(
                        cursorColor: Color(0xFFebd197),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Address',
                          Icons.maps_home_work_outlined,
                        ),
                        controller: _address,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Address';
                          }
                          return null;
                        },
                        // keyboardType: TextInputType.name,

                      ),
                    ),

                  Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
 children: [
   InkWell(
     onTap: (){
       showDialog(
           context: context,
           builder: (BuildContext context) {
             return AlertDialog(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(
                     15.0),
               ),
               elevation: 5,
               content: Stack(
                 clipBehavior: Clip.none, children: <Widget>[
                 Positioned(
                   right: -40.0,
                   top: -40.0,
                   child: InkResponse(
                     onTap: () {
                       Navigator.of(context).pop();
                     },
                     child: CircleAvatar(
                       child: Icon(Icons.close),
                       backgroundColor: Colors.red,
                     ),
                   ),
                 ),

                 Container(
                   height: 380,
                   child: Column(
                     children: [
                       Center(
                         child: CircleColorPicker(
                           controller: _controller,
                           onChanged: (color) {
                             setState(() => _currentColor
                             = color);
                           },
                         ),
                       ),
                       ElevatedButton.icon(
                         icon: Icon(Icons.remove_red_eye),
                         label: Text("Submit", style: TextStyle(
                             color: Colors.white,
                             fontSize: 15,
                             fontWeight: FontWeight.bold
                         ),),

                         onPressed: ()  {
                           final snackBar = SnackBar(
                             elevation: 5,
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(
                                     Radius.circular(10))),
                             behavior: SnackBarBehavior.floating,
                             content: Text('Generating Color!'),

                           );
                           ScaffoldMessenger.of(context).showSnackBar(
                               snackBar);
                           Navigator.pop(context);
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
                     ],
                   ),
                 )
               ],
               ),
             );
           });
     },
     child: Container(
       height: 50,
       width: 100,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
           topRight: Radius.circular(12),
           topLeft: Radius.circular(12),
           bottomRight: Radius.circular(12),
           bottomLeft: Radius.circular(12),
         ),
         color:_currentColor,
       ),
       child:   Center(child: Text('Font Color')),
     ),
   ),
   InkWell(
     onTap: (){
       showDialog(
           context: context,
           builder: (BuildContext context) {
             return AlertDialog(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(
                     15.0),
               ),
               elevation: 5,
               content: Stack(
                 clipBehavior: Clip.none, children: <Widget>[
                 Positioned(
                   right: -40.0,
                   top: -40.0,
                   child: InkResponse(
                     onTap: () {
                       Navigator.of(context).pop();
                     },
                     child: CircleAvatar(
                       child: Icon(Icons.close),
                       backgroundColor: Colors.red,
                     ),
                   ),
                 ),

                 Container(
                   height: 380,
                   child: Column(
                     children: [
                       Center(
                         child: CircleColorPicker(
                           controller: TextColor,
                           onChanged: (color) {
                             setState(() => _Texcolor
                             = color);
                           },
                         ),
                       ),
                       ElevatedButton.icon(
                         icon: Icon(Icons.remove_red_eye),
                         label: Text("Submit", style: TextStyle(
                             color: Colors.white,
                             fontSize: 15,
                             fontWeight: FontWeight.bold
                         ),),

                         onPressed: ()  {
                           final snackBar = SnackBar(
                             elevation: 5,
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(
                                     Radius.circular(10))),
                             behavior: SnackBarBehavior.floating,
                             content: Text('Generating Color!'),

                           );
                           ScaffoldMessenger.of(context).showSnackBar(
                               snackBar);
                           Navigator.pop(context);
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
                     ],
                   ),
                 )
               ],
               ),
             );
           });
     },
     child: Container(
       height: 50,
       width: 100,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
           topRight: Radius.circular(12),
           topLeft: Radius.circular(12),
           bottomRight: Radius.circular(12),
           bottomLeft: Radius.circular(12),
         ),
         color:_Texcolor,
       ),
       child: Center(child: Text('BackGround Color')),
     ),
   ),
   InkWell(
     onTap: (){
       showDialog(
           context: context,
           builder: (BuildContext context) {
             return AlertDialog(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(
                     15.0),
               ),
               elevation: 5,
               content: Stack(
                 clipBehavior: Clip.none, children: <Widget>[
                 Positioned(
                   right: -40.0,
                   top: -40.0,
                   child: InkResponse(
                     onTap: () {
                       Navigator.of(context).pop();
                     },
                     child: CircleAvatar(
                       child: Icon(Icons.close),
                       backgroundColor: Colors.red,
                     ),
                   ),
                 ),

                 Container(
                   height: 380,
                   child: Column(
                     children: [
                       Center(
                         child: CircleColorPicker(
                           controller: HoverColor,
                           onChanged: (color) {
                             setState(() => _Hoverolor
                             = color);
                           },
                         ),
                       ),
                       ElevatedButton.icon(
                         icon: Icon(Icons.remove_red_eye),
                         label: Text("Submit", style: TextStyle(
                             color: Colors.white,
                             fontSize: 15,
                             fontWeight: FontWeight.bold
                         ),),

                         onPressed: ()  {
                           final snackBar = SnackBar(
                             elevation: 5,
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(
                                     Radius.circular(10))),
                             behavior: SnackBarBehavior.floating,
                             content: Text('Generating Color!'),

                           );
                           ScaffoldMessenger.of(context).showSnackBar(
                               snackBar);
                         Navigator.pop(context);
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
                     ],
                   ),
                 )
               ],
               ),
             );
           });
     },
     child: Container(
       height: 50,
       width: 100,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.only(
               topRight: Radius.circular(12),
               topLeft: Radius.circular(12),
             bottomRight: Radius.circular(12),
             bottomLeft: Radius.circular(12),
           ),
           color:_Hoverolor,
         ),
       child:Center(child: Text('Hover Color')),
     ),
   ),
 ],
),

                  ],
                )
            ),
                SizedBox(height: 25,),
                InkWell(
                  onTap: (){
                    uploadImage(
                      _name.text,_mobile.text,
                        _email.text,_compName.text,
                        _address.text,_controller.toString(),
                        TextColor.toString(),_Hoverolor.toString(),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12)
                      ),
                      color:Colors.redAccent,
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.30,
                    child: Center(child: Text("Proceed",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),),
                  ),
                ),

        ])),
      ),
    );
  }
  File? file;
  final picker = ImagePicker();

  void _choose() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery,
        imageQuality: 50, maxHeight: 500, maxWidth: 500);
    setState(() {
      if (pickedFile != null) {
        file = File(pickedFile.path);
        print('objectsssssssss');
        print(file);
        print('aaaaaaaaaaaaaaa');

      } else {
        print('No image selected.');
      }
    });
  }
  uploadImage(String _name, String _mobile,
      String _email, String _compName,
      String _address, String _controller,String _TextColor, String _Hoverolor) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'deviceId';
    final deviceId = prefs.getString(key) ?? "0";
    print(deviceId);
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    print('qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
    var url = Uri.parse('https://backend.foundercodes.com/pankaj.php');
    print('pppppppqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
    var request = http.MultipartRequest('POST', url)
      ..headers.addAll(headers);
    request.fields["name"]=_name;
    request.fields["email"]=_email;
    request.fields["mobile"]=_mobile;
    request.fields["device_id"]='2';
    request.fields["comp_name"]=_compName;
    request.fields["pid"]=widget.id;
    request.fields["address"]=_address;
    request.fields["font_color"]=_controller;
    request.fields["bgcolor"]=_TextColor;
    request.fields["hover_color"]=_Hoverolor;
    print('pppppppqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
    file!=null?
    request.files.add(await http.MultipartFile.fromPath('sendimage', file!.path)):'';

    final response = await request.send();
    print('lllllllllllll');
    if (response.statusCode == 200) {
    //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
      print('Image uploaded successfully');
      Fluttertoast.showToast(
          msg: 'Profile Uploaded Sucessfully ',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.transparent,
          textColor: Colors.green,
          fontSize: 16.0);
    }
    else {
      print('Error uploading image: ${response.reasonPhrase}');
      Fluttertoast.showToast(
          msg: 'Name, Phone, Profile image is required',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.transparent,
          textColor: Colors.red,
          fontSize: 16.0);
    }
  }
}
