import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thflutter/constants/images_path.dart';
import 'package:thflutter/screens/home.dart';
import 'package:thflutter/screens/home_screen.dart';
import 'package:thflutter/screens/login.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h=MediaQuery.of(context).size.height;
    final w=MediaQuery.of(context).size.width;
    return Scaffold(
        body: SizedBox(
          height: h,
          width: w,
          child: Stack(
            children: [
              Positioned(
                top:0,
                  child: Container(
                    height: h*.79,
                    width: w,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(ImagesPath.onBoarding),
                        fit: BoxFit.cover,
                      ) // them thu muc Images vào Assets roi chen hinh vao
                    ),
              )),
              // Center(
              //   child: Image.asset(ImagesPath.onBoardingTitle,),
              //
              // ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: h*.243,
                  width: w,
                  decoration: BoxDecoration(
                    color:  Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: h*.032),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Hãy cùng nấu ăn nào', style: TextStyle(
                            fontSize: w*.06, fontWeight: FontWeight.w600
                          ),),
                          Text('Khám phá và bắt đầu nấy ăn ',
                            style: TextStyle(
                            fontSize: 14,
                              fontWeight: FontWeight.w300
                          ),),
                          SizedBox(height: h*.032,),
                          SizedBox(
                            width: w*.8,
                            child: ElevatedButton(
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context)=> LoginPage()));
                              },
                              child: const Text('Đăng nhập', style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
