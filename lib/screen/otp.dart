import 'package:flutter/material.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
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
                          Image.asset('images/otp.png',height: 200,width: 200,),
                          Text('Verify Mobile Number',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
                          Container(
                              padding: EdgeInsets.all(20),
                              child: Text('Enter 6 digit verification code sen to')),
                          Container(
                              padding: EdgeInsets.all(10),
                              child: Text('7307466925')),
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
