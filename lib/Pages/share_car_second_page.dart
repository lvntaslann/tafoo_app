import 'package:flutter/material.dart';
import 'package:tafoo/Pages/ai_waiting_page.dart';
import 'package:tafoo/Widgets/button/back_button.dart';
import 'package:tafoo/Widgets/button/my_next_button.dart';
import 'package:tafoo/Widgets/text/my_secondText_widget.dart';
import 'package:tafoo/Widgets/textfield/share_car_textfield.dart';
import 'package:tafoo/Widgets/text/title_text_widget.dart';

class ShareCarSecondPage extends StatefulWidget {
  const ShareCarSecondPage({Key? key}) : super(key: key);

  @override
  _ShareCarSecondPageState createState() => _ShareCarSecondPageState();
}

class _ShareCarSecondPageState extends State<ShareCarSecondPage> {
  TextEditingController yearController = TextEditingController();
  TextEditingController gearController = TextEditingController();
  TextEditingController fuelController = TextEditingController();
  TextEditingController carTypeController = TextEditingController();
  TextEditingController kilometerConroller = TextEditingController();
  TextEditingController costController = TextEditingController();

  void nextPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AiWaitingPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Color.fromRGBO(255, 255, 255, 0.95),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(child: AppBackButton()),
          MySecondTextWidget(),
          SizedBox(height: 35),
          TitleTextWidget(
            text: "Yıl",
          ),
          SizedBox(height: 3),
          ShareCarTextField(
            text: "2023",
            controller: yearController,
          ),
          SizedBox(height: 7),
          TitleTextWidget(
            text: "Vites tipi",
          ),
          SizedBox(height: 3),
          ShareCarTextField(
            text: "Otomatik",
            controller: gearController,
          ),
          SizedBox(height: 7),
          TitleTextWidget(
            text: "Yakıt tipi",
          ),
          SizedBox(height: 3),
          ShareCarTextField(
            text: "Dizel",
            controller: fuelController,
          ),
          SizedBox(height: 7),
          TitleTextWidget(
            text: "Kasa tipi",
          ),
          SizedBox(height: 3),
          ShareCarTextField(
            text: "Sedan",
            controller: carTypeController,
          ),
          SizedBox(height: 7),
          TitleTextWidget(
            text: "Kilometre",
          ),
          SizedBox(height: 3),
          ShareCarTextField(
            text: "10000",
            controller: kilometerConroller,
          ),
          SizedBox(height: 7),
          Row(
            children: [
              TitleTextWidget(text: "Aracınızın fiyatı"),
              SizedBox(width: 100),
              Column(
                children: [
                  Text(
                    "Yapay zeka ile belirle",
                    style: TextStyle(
                      color: Color(0XFF898989),
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 90,
                    color: Color(0xFFFE7F21),
                    margin: EdgeInsets.only(top: 3),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 3),
          ShareCarTextField(
            text: "100000",
            controller: costController,
          ),
          SizedBox(height: 7),
          MyNextButton(onTap: ()=>nextPage(),)
        ],
      ),
    );
  }
}