import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../providers/auth_provider.dart';
import '../screens/home_screen.dart';
import '../screens/signup_screen.dart';
import '../widgets/loading_widget.dart';
import '../widgets/regular_button.dart';
import '../widgets/text_editor.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  bool loading = false ;



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    loading = context.watch<AuthProvider>().loading;
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
        bottom:  Radius.elliptical(size.width * 0.7, 55),
                ),
              ),
        // RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(size.width *0.4) , bottomRight: Radius.circular(size.width *0.4))) ,
        toolbarHeight: size.height * 0.35,
        backgroundColor: black,
        title:SizedBox(child: Image.asset("assets/images/logo.png" , fit: BoxFit.fill,), width: size.width *0.75,)
         ),
      body: _buildBody(size),
    );
  }
  _buildBody(Size size){
    return Stack(
      children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: SizedBox(
            width: size.width,
            height: size.height,
            child:SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        textEditor(userNameController, "User Name" , TextInputType.text, size),
                        textEditor(passwordController, "Password" , TextInputType.text, size),
                        Align(
                            alignment : Alignment.centerRight,
                            child: GestureDetector(
                              child: const Text("Forget Password ?",style: TextStyle(color: Colors.blue) , textAlign: TextAlign.end,),
                              onTap: (){},
                            )),
                        SizedBox(
                          height:  size.height * 0.02,),
                        regularButton(size, black!, "Sign In", () => onPressed(userName: userNameController.text , password: passwordController.text)),
                        SizedBox(
                          height:  size.height * 0.01,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have account ?"),
                            SizedBox(
                                width: size.width * 0.03),
                            GestureDetector(
                              child: const Text("Sign Up Now",
                                style: TextStyle(
                                    color: Colors.blue),),
                              onTap: (){
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUp()));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )


                ],
              ),
            ),
        ),
         ),
        loading == true ?
        loadingWidget() :
        const SizedBox(),
      ],
    );
  }
  onPressed({String? userName, String? password}){
    if(userName!.isNotEmpty && password!.isNotEmpty) {
      context.read<AuthProvider>().signIn(context, userName, password);
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("All fields are required" , textAlign: TextAlign.center,) , backgroundColor: Colors.red,));
    }
  }
}
