import 'package:flutter/material.dart';
import 'todayQuestion.dart';
import 'writeQuestion.dart';
import 'questionList.dart';
import 'writeLetter.dart';

class showLetter extends StatefulWidget {
  const showLetter({super.key});

  @override
  State<showLetter> createState() => _showLetterState();
}

class _showLetterState extends State<showLetter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF2E7),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF2E7),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>showLetter()));
              },
              icon: Icon(
                Icons.mark_email_unread,
                color: Color(0xFF7B7066),
              ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFFF5E0CF),
        child: ListView(
            children: [
              Container(
                height: 20,
              ),
              ListTile(
                leading: Icon(
                  Icons.menu,
                  color: Color(0XFF7B7066),
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>todayQuestionWidget()));
                },
              ),
              Divider(
                thickness: 1,
                color: Color(0xFF7B7066),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Color(0XFF7B7066),
                ),
                title: Text(
                  '홈',
                  style: TextStyle(
                    color: Color(0xFF7B7066),
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'NanumMyeongjo',
                  ),
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>todayQuestionWidget()));
                },
              ),
              Divider(
                thickness: 1,
                color: Color(0xFF7B7066),
              ),
              ListTile(
                leading: Icon(
                  Icons.message,
                  color: Color(0xFF7B7066),
                ),
                title: Text(
                  '질문목록',
                  style: TextStyle(
                    color: Color(0xFF7B7066),
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'NanumMyeongjo',
                  ),
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> questionListWidget()));
                },
              ),
              Divider(
                thickness: 1,
                color: Color(0xFF7B7066),
              ),
              ListTile(
                leading: Icon(
                  Icons.create,
                  color: Color(0xFF7B7066),
                ),
                title: Text(
                  '편지 쓰기',
                  style: TextStyle(
                    color: Color(0xFF7B7066),
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'NanumMyeongjo',
                  ),
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>writeLetter()));
                },
              ),
              Divider(
                thickness: 1,
                color: Color(0xFF7B7066),
              ),
            ]
        ),
      ),
      body: Column(
        children: <Widget>[
          Divider(
            thickness: 1,
            color: Color(0xff7b7066),
          ),
          SizedBox(height: 75),
          Stack(
            children: [
              Container(
                height: 500,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xFFFFF9F5),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned(
                top: 20,
                left: 30,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/profile.png',
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(width: 20),
                    Text(
                      '익명의 사과 메세지',
                      style: TextStyle(
                        fontFamily: 'NanumMyeongjo',
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 70,
                left: 27,
                child: Container(
                  height: 400,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5E0CF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: 90,
                left: 30,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 8,
                    text: TextSpan(
                      text: '엄마,\n미안해\n다음번에는 안그럴게 봐줘.',
                      style: TextStyle(
                        fontFamily: 'NanumMyeongjo',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color(0xFF000000),
                        height: 1.2,
                      ),
                    ),
                  ),
                )
              ),
              Positioned(
                top: 400,
                left: 130,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFF9F5),
                    elevation: 0,
                  ),
                  child: Text(
                    '확인',
                    style: TextStyle(
                      fontFamily: 'NanumMyeongjo',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xFF000000),
                      height: 1.2,
                    ),
                  ),
                ))
            ],
          )
        ],
      ),
    );
  }
}
