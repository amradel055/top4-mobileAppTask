import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/helper.dart';
import '../constants/text_styles.dart';
import '../providers/auth_provider.dart';
import '../providers/data_handler_provider.dart';
import '../screens/login_screen.dart';
import '../widgets/drop_down_list.dart';
import '../widgets/loading_widget.dart';
import '../widgets/regular_button.dart';
import '../widgets/text_editor.dart';
import 'package:provider/provider.dart';

import '../widgets/text_editor_email.dart';
import '../widgets/text_editor_singUp.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? governorateValue;
  String? gradeValue;
  int? selectedGradeId;
  List grade = [] ;
  List _grades = [] ;
  var selectedGovernorate ;
  var userNameController = TextEditingController();
  var firstNameController = TextEditingController();
  var fatherNameController = TextEditingController();
  var grandFatherNameController = TextEditingController();
  var familyNameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  bool loading = false ;
  List governorateList = [];
  List _governorateList = [];
  List statesList = [];
  List _statesList = [];
  String? statesValue;
  var selectedState ;
  @override
  void initState() {
    // TODO: implement initState
    getGrades();
    context.read<DataHandler>().getCities().then((value){
      governorateList = context.read<DataHandler>().cities ;
      governorateList.forEach((element) {_governorateList.add(element["name"]);});
    });
    super.initState();
  }
  
  getGrades() async{
    await context.read<DataHandler>().getGrades().then((_){
      grade = context.read<DataHandler>().grades ;
    });
    setState(() {
      grade.forEach((element) { _grades.add(element["name"]);});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    loading = context.watch<AuthProvider>().loading ;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          shape:  RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom:  Radius.elliptical(size.width * 0.7, 55),
            ),
          ),
          // RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(size.width *0.4) , bottomRight: Radius.circular(size.width *0.4))) ,
          toolbarHeight: size.height * 0.2,
          backgroundColor: black,
          title:Column(
            children: [
              SizedBox(height: size.height * 0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: yellow ,
                      borderRadius: BorderRadius.circular(60)
                    ),
                    child: IconButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn()));
                    }, icon: Icon(Icons.arrow_back , color: black,)),
                  ),
                   Text("Create an account" , style: titleTextStyle,),
                ],
              ),
            ],
          )
      ),
      body: _buildBody(size),
    );
  }

  _buildBody(Size size){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(

        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child:SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children:[

                  textEditorSignUp(firstNameController, "First Name" , TextInputType.text , size),
                  textEditorSignUp(fatherNameController, "Father Name" , TextInputType.text, size),
                  textEditorSignUp(grandFatherNameController, "GrandFather Name" , TextInputType.text, size),
                  textEditorSignUp(familyNameController, "Family Name" , TextInputType.text, size),
                  textEditorSignUp(phoneController, "Phone" , TextInputType.phone, size),
                  textEditor(emailController, "E-Mail" , TextInputType.emailAddress, size),
                  appDropDown("Governorate" , size , _governorateList , onChanged , governorateValue),
                  appDropDown("State" , size , _statesList , onStateChanged , statesValue),
                  appDropDown("Grade" , size , _grades , onGardeChanged , gradeValue),
                  textEditorSignUp(userNameController, "User Name" , TextInputType.text , size , hintText: "This will be used for login"),
                  textEditor(passwordController, "Password" , TextInputType.text, size),
                  textEditor(rePasswordController, "Re-enter Password" , TextInputType.text, size),
                  regularButton(
                      size,
                      black!,
                      "SignUp",
                          () => onPressed(
                          email: emailController.text ,
                          familyName: familyNameController.text ,
                          fatherName: fatherNameController.text ,
                          firstName: firstNameController.text ,
                          grandFatherName: grandFatherNameController.text ,
                          mobile: phoneController.text ,
                          password: passwordController.text ,
                          userName: userNameController.text ,
                            rePassword: rePasswordController.text
                      )
                  ),

                  GestureDetector(
                    child: const Text("Already Have Account ?" , style: TextStyle(color: Colors.blue , fontSize: 14),) ,
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignIn()));
                    },
                  )
                ],
              ),
            ),
          ),
          loading == true ?
          loadingWidget() :
          const SizedBox(),
        ]

      ),
    );
  }
  onPressed(
      {
        String? userName,
      String? firstName,
      String? fatherName,
      String? grandFatherName,
      String? familyName,
      String? mobile,
      String? password,
        String? rePassword,
      String? email}){
    if(
    userName!.isNotEmpty&&
    firstName!.isNotEmpty&&
    fatherName!.isNotEmpty&&
    grandFatherName!.isNotEmpty&&
    familyName!.isNotEmpty&&
    mobile!.isNotEmpty&&
    password!.isNotEmpty&&
    email!.isNotEmpty
    && rePassword!.isNotEmpty
    ){

      if(!email.contains("@")){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please Enter a valid email address" , textAlign: TextAlign.center,)
              , backgroundColor: Colors.red,));
      }
      else if (mobile.length != 11){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please Enter a valid phone number" , textAlign: TextAlign.center,)
              , backgroundColor: Colors.red,));
      } else if (password != rePassword){
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Passwords aren't match" , textAlign: TextAlign.center,)
              , backgroundColor: Colors.red,));
      }
      else {
        context.read<AuthProvider>().signUp(context ,userName, firstName,
            fatherName, grandFatherName, familyName, mobile, password, email , selectedGradeId , selectedState != null ? selectedState["id"] : 1);

      }

    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("All fields are required" , textAlign: TextAlign.center,),
            backgroundColor: Colors.red,));
    }
  }

 void onChanged(String? newValue) {
    setState(() {
      governorateValue = newValue;
      selectedGovernorate = governorateList[
      governorateList.indexWhere((element) => element["name"] == newValue)];
    });
    print('isssssssssssssss $selectedGovernorate');
    context.read<DataHandler>().getCityState(selectedGovernorate["id"]).then((value){
      setState(() {
        statesList = context.read<DataHandler>().states ;
        statesList.forEach((element) {_statesList.add(element["name"]);});
      });
    });
  }

  void onStateChanged(String? newValue) {
    setState(() {
     statesValue = newValue ;
     selectedState = statesList[statesList.indexWhere((element) => element["name"] == newValue)] ;
    });
  }



  void onGardeChanged(newValue){
    setState(() {
      gradeValue = newValue;
      selectedGradeId = grade[grade.indexWhere((element) => element["name"] == newValue)]["id"];
    });
  }
}


