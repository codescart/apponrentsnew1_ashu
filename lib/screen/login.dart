import 'package:flutter/material.dart';
import 'package:testt/constants.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Center(
             child: Card(
              child: Container(
                height: 700,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_back),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/login.png',height: 200,width: 200,),
                          Text('Enter Mobile Number',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
                          Container(
                            padding: EdgeInsets.all(20),
                              child: Text('Enter your 10-digit mobile number to receive the verification code')),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(left: 10,top: 60),
                            child: Text("Mobile Number"),
                          ),
                           Container(
                              padding: EdgeInsets.all(10),
                             child: TextField(
                               keyboardType: TextInputType.number,
                               decoration: InputDecoration(
                                 prefixText:"+91",
                                 border: OutlineInputBorder(
                                     borderSide: BorderSide(color: Colors.blueAccent,width: 2) ,
                                     borderRadius: BorderRadius.circular(8)),
                                     hintText: 'Enter your Phone Number.....',
                               ),
                             ),
                           ),
                          SizedBox(height: 40,),
                          Container(
                            height: 50,
                            width: 280,
                            child: ElevatedButton(onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red
                            ),
                                child:  Text("Get Verification Code")),
                          )

                        ],
                      ),
                    )
                  ],
                ),
              ),
          ),
           ),
        ],
      ),
    );
  }
}
