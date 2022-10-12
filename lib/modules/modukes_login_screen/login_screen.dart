
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modukes_components/componunts.dart';


class loginScreen extends StatefulWidget {
  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPasword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(

          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Login",
                    style: TextStyle
                    (fontSize: 40,
                      fontWeight:
                  FontWeight.bold),
                  ),
                  SizedBox(height: 40,),
                  defultForm(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      lable: "email",
                      prefix: Icons.email,
                    sufix: null,
                      onPressed : (){},
                      onTap: (){}

                  ),

                  SizedBox(height: 20,),
                  defultForm(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      lable: "password",
                      prefix: Icons.lock,
                      sufix: isPasword? Icons.visibility : Icons.visibility_off,
                    isPassword: isPasword,
                      onPressed : (){
                    setState(() {
                      isPasword =!isPasword;
                    });
                    },
                      onTap: (){}
                  ),

                  SizedBox(height: 20,),

                  defult_Button(



                      function: (){
                        if(formKey.currentState!.validate())
                        {
                            print(emailController);
                           print(passwordController);
                          }

                      },
                      text: "Login"
                  ),
                  SizedBox(height: 20,),
                  defult_Button(

                      function: (){
                        print(emailController);
                        print(passwordController);
                      },
                      text: "Rigester"
                  ),

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("don\'t have asa Account"),
                      TextButton(onPressed: (){}, child: Text('Rigester Now'))
                    ],
                  )
              ],
    ),
            ),
          ),
        ),
      )


    );
  }
}
