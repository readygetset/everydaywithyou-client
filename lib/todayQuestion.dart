import 'package:flutter/material.dart';

class todayQuestionWidget extends StatefulWidget {
  const todayQuestionWidget({super.key});

  @override
  State<todayQuestionWidget> createState() => _todayQuestionWidgetState();
}

class _todayQuestionWidgetState extends State<todayQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffFFF2E7),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF2E7),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(0xFF7B7066),
          ),
          onPressed: ()async{

          }
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:Image.asset('assets/png/main.png',
              fit: BoxFit.cover
          ).image,
          ),
        ),
        child:Column(
          children: [
            Divider(
              thickness: 1,
              color: Color(0xff7b7066),
            ),
            SizedBox(height: 110),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 45.0), // Add right margin
                  child: Text(
                    '매일',
                    style: TextStyle(
                      fontFamily: 'NanumMyeongjo',
                      fontSize: 64,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 45.0), // Add right margin
                  child: Text(
                    '그대와',
                    style: TextStyle(
                      fontFamily: 'NanumMyeongjo',
                      fontSize: 64,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15
            ),
            Divider(
              thickness: 1,
              indent: 50,
              endIndent: 50,
              color: Color(0xFF7B7066),
            ),
            SizedBox(
              height: 15
            ),
            Text(
              '오늘의 질문',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF000000),
                fontWeight: FontWeight.w500,
                fontSize: 32,
                fontFamily: 'NanumMyeongjo',
              ),
            ),
            SizedBox(
              height: 15
            ),
            Text(
              '당신의 어릴 적 꿈은?',
              style: TextStyle(
                fontFamily: 'NanumMyeongjo',
                color: Color(0xFF000000),
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              indent: 50,
              endIndent: 50,
              color: Color(0xFF7B7066),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: ()async{
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF5E0CF),
                ),
                child: Text(
                      '답변하기',
                  style: TextStyle(
                    fontFamily: 'NanumMyeongjo',
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000000),
                  ),
                  textAlign: TextAlign.center,
                ),
            ),
          ],
        )
      )
    );
  }
}
