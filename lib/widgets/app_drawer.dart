


import 'package:flutter/material.dart';
import 'package:fullmark_task/screens/splash.dart';
import '../constants/colors.dart';

import '../constants/text_styles.dart';
import '../models/login_data_model.dart';
import '../providers/auth_provider.dart';

import 'package:provider/provider.dart';


class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerWidget> with TickerProviderStateMixin {
  late String userName ;
  late AnimationController controller;
  late Animation<Offset> animation;
  late AnimationController _controller;
  late Animation<double> _animation;
  late LoginData? student ;
   List doctorsList = [] ;
  @override
  void initState() {
    // TODO: implement initState
    student = context.read<AuthProvider>().student;
    super.initState();
     controller = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    _controller = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
     animation =  Tween<Offset>(begin: const Offset(0, 0), end : const Offset(0, 0.05)).animate(controller);
    _animation =  Tween<double>(begin: -1, end : 1).animate(_controller);
    controller.forward();
    _controller.forward();

  }



  @override
  void dispose() {
    controller.dispose();
    _controller.dispose();
    super.dispose();
  }

  Widget createTextWidget (Size size , String name){
    return  SizedBox(
      height: size.height *0.046,
      child: FittedBox(
          child: Text(name , style: appDrawerFont,)),
    );
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size ;

    return Drawer(
      elevation: 16,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          height: size.height,
          color: Colors.grey,
          child: FadeTransition(
            opacity: _animation,
            child: SlideTransition(
              position: animation,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20 , 0 , 0 , 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange[100],
                                borderRadius: BorderRadius.circular(90)
                            ),
                            child: Icon(Icons.person_rounded , size: size.width * 0.2,)),
                      ),
                    ),
                    Center(child:
                    SizedBox(height: size.height *0.055, child: FittedBox(child: Text( student != null ? student!.studentData!.firstName!.toUpperCase() : "Guest" , textAlign: TextAlign.center,)))) ,
                    SizedBox(height: size.height * 0.02,) ,
                    const Divider(thickness: 1.5,),
                    SizedBox(height: size.height * 0.01,) ,
                    GestureDetector(
                      child: Row(
                        children: [
                          const Icon(Icons.home_filled),
                          SizedBox(width: size.width * 0.1,) ,
                          createTextWidget(size, "Home")
                        ],
                      ),
                      onTap: (){
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                    ),

                    SizedBox(height: size.height * 0.01,) ,
                    GestureDetector(
                      child: Row(
                        children: [
                          const Icon(Icons.check),
                          SizedBox(width: size.width * 0.1,) ,
                          createTextWidget(size, "Activate request")

                        ],
                      ),
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (_)=>const ActivateRequestScreen()));
                      },
                    ),

                    SizedBox(height: size.height * 0.01,) ,
                    GestureDetector(
                      child: Row(
                        children: [
                          const Icon(Icons.move_to_inbox),
                          SizedBox(width: size.width * 0.1,) ,
                          createTextWidget(size, "Inbox")

                        ],
                      ),
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (_)=>const InboxScreen()));
                      },
                    ),
                    SizedBox(height: size.height * 0.01,) ,
                    GestureDetector(
                      child: Row(
                        children: [
                          const Icon(Icons.question_mark_rounded),
                          SizedBox(width: size.width * 0.1,) ,
                          createTextWidget(size, "Common questions")

                        ],
                      ),
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (_)=>const CommonQuestionsScreen()));
                      },
                    ),
                    SizedBox(height: size.height * 0.01,) ,
                    GestureDetector(
                      child: Row(
                        children: [
                          const Icon(Icons.person),
                          SizedBox(width: size.width * 0.1,) ,
                          createTextWidget(size, "Account")

                        ],
                      ),
                      onTap: (){
                      },
                    ),
                    SizedBox(height: size.height * 0.01,) ,
                    GestureDetector(
                      child: Row(
                        children: [
                          const Icon(Icons.schedule),
                          SizedBox(width: size.width * 0.1,) ,
                          createTextWidget(size, "Reparation")
                          ],
                      ),
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const ReSchedule()));
                      },
                    ),
                    SizedBox(height: size.height * 0.01,) ,
                    GestureDetector(
                      child: Row(
                        children: [
                          const Icon(Icons.play_circle_outline),
                          SizedBox(width: size.width * 0.1,) ,
                          createTextWidget(size, "Sessions")
                        ],
                      ),
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const AllSession()));
                      },
                    ),
                    // SizedBox(height: size.height * 0.01,) ,
                    // GestureDetector(
                    //   child: Row(
                    //     children: [
                    //       const Icon(Icons.info_outline),
                    //       SizedBox(width: size.width * 0.1,) ,
                    //       createTextWidget(size, "Final")
                    //     ],
                    //   ),
                    //   onTap: (){
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) => const FinalSchedule()));
                    //
                    //   },
                    // ),
                    SizedBox(height: size.height * 0.01,) ,
                    GestureDetector(
                      child: Row(
                        children: [
                          const Icon(Icons.school_sharp),
                          SizedBox(width: size.width * 0.1,) ,
                          createTextWidget(size, "Exams")
                        ],
                      ),
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateExam()));
                      },

                    ),
                    SizedBox(height: size.height * 0.01,) ,

                    // GestureDetector(
                    //   child: Row(
                    //     children: [
                    //       const Icon(Icons.history),
                    //       SizedBox(width: size.width * 0.1,) ,
                    //       createTextWidget(size, "Previous Exams")
                    //     ],
                    //   ),
                    //   onTap: (){
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) => const ExamsHistory()));
                    //   },
                    // ),
                    SizedBox(height: size.height * 0.01,) ,
                    GestureDetector(
                      child: Row(
                        children: [
                          const Icon(Icons.chat),
                          SizedBox(width: size.width * 0.1,) ,
                          createTextWidget(size, "Online Chats")
                        ],
                      ),
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateChat()));
                      },
                    ),
                    SizedBox(height: size.height * 0.01,) ,
                    GestureDetector(
                      child: Row(
                        children: [
                          const Icon(Icons.videocam_rounded),
                          SizedBox(width: size.width * 0.1,) ,
                          createTextWidget(size, "Online Meetings")
                        ],
                      ),
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => const OnlineMeetings()));
                      },
                    ),
                    SizedBox(height: size.height * 0.01,) ,
                    GestureDetector(
                      child: Row(
                        children: [
                          const Icon(Icons.logout),
                          SizedBox(width: size.width * 0.1,) ,
                          createTextWidget(size, "Log out")
                        ],
                      ),
                      onTap: ()async{
                        Navigator.pop(context);
                        await context.read<AuthProvider>().logOut();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SplashScreen()));
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // _launchURL(url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url, forceWebView: true ,enableJavaScript: true);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

}
