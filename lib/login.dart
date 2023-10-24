import 'package:flutter/material.dart';
import 'package:testt/constants.dart';
import 'package:testt/responsive.dart';
import 'package:testt/widget/text_input_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
     child: Scaffold(
       appBar: AppBar(
         title: Text("login"),
       ),
       body: Responsive(
         mobile:  body(),
         desktop: desktop(),
         tablet: body(),
       ),
     ),
    );
  }
Widget body(){
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Tiktok'
              ,style: TextStyle(
                  fontSize: 35,
                  color: buttonColors,
                  fontWeight: FontWeight.w900
              ),
            ),
            const Text('Register',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),),
            SizedBox(height: 15,),
            Stack(
              children: [
                CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage('images/image.jpg'),
                  backgroundColor: Colors.black,
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child:IconButton(onPressed: ()  {}
                    , icon:  const Icon(Icons.add_a_photo) ,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal:20),
              child: TextInputField(
                controller: _usernameController,
                lableText: 'UserName',
                icon:  Icons.person,),
            ),
            SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal:20),
              child: TextInputField(
                 controller: _emailController,
                lableText: 'Email',
                icon:  Icons.email,),
            ),

            SizedBox(height: 15,),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal:20),
              child: TextInputField(
                 controller: _passwordController,
                lableText: 'Password',
                isObscure: true,
                icon:  Icons.lock,),
            ),
            SizedBox(height: 20,),

            Container(
              width: MediaQuery.of(context).size.width-40,
              height: 50,
              decoration: BoxDecoration(
                  color: buttonColors,
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: InkWell(
                child: Center(
                  child: InkWell(
                    child: const Text('Register',
                      style: TextStyle(
                          fontSize: 20,fontWeight: FontWeight.w700),),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?',style: TextStyle(fontSize:20),),
                SizedBox(width: 10,),
                InkWell(
                    child: Text('Login',style: TextStyle(fontSize: 20,color: buttonColors),)
                ),
              ],
            )

          ],
        ),
      ),
    );
}

  Widget desktop(){
    return SingleChildScrollView(
      child: Center(
        child: Container(
          height:MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/image.jpg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 600),
            height:600,
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Apponrents'
                  ,style: TextStyle(
                      fontSize: 35,
                      color: buttonColors,
                      fontWeight: FontWeight.w900
                  ),
                ),
                const Text('Register',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),),
                SizedBox(height: 15,),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 64,
                      backgroundImage: AssetImage('images/image.jpg'),
                      backgroundColor: Colors.black,
                    ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child:IconButton(onPressed: ()  {}
                        , icon:  const Icon(Icons.add_a_photo) ,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal:20),
                  child: TextInputField(
                    controller: _usernameController,
                    lableText: 'UserName',
                    icon:  Icons.person,),
                ),
                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal:20),
                  child: TextInputField(
                    controller: _emailController,
                    lableText: 'Email',
                    icon:  Icons.email,),
                ),

                SizedBox(height: 15,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal:20),
                  child: TextInputField(
                    controller: _passwordController,
                    lableText: 'Password',
                    isObscure: true,
                    icon:  Icons.lock,),
                ),
                SizedBox(height: 20,),

                Container(
                  width: 460,
                  height: 50,
                  decoration: BoxDecoration(
                      color: buttonColors,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: InkWell(
                    child: Center(
                      child: InkWell(
                        child: const Text('Register',
                          style: TextStyle(
                              fontSize: 20,fontWeight: FontWeight.w700),),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?',style: TextStyle(fontSize:20),),
                    SizedBox(width: 10,),
                    InkWell(
                        child: Text('Login',style: TextStyle(fontSize: 20,color: buttonColors),)
                    ),
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
