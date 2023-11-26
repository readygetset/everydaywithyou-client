import 'package:everywithu/showLetter.dart';
import 'package:flutter/material.dart';
import 'writeQuestion.dart';
import 'todayQuestion.dart';
import 'questionList.dart';
import 'showLetter.dart';

const List<String> list = <String>['대장', '공주', '근육맨'];

class writeLetter extends StatefulWidget {
  const writeLetter({super.key});

  @override
  State<writeLetter> createState() => _writeLetterState();
}

class _writeLetterState extends State<writeLetter> {
  String subject = list.first;
  TextEditingController? apoloController = TextEditingController();

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
              Icons. mark_email_unread,
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
      body: SingleChildScrollView(
          child: Column(
              children: [
                Divider(
                  thickness: 1,
                  color: Color(0xff7b7066),
                ),
                SizedBox(height: 50),
                Row(
                    children:[
                      SizedBox(
                        width: 30,
                      ),
                      DropdownButton(
                          value: subject,
                          items: list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Color(0xFF7B7066),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'NanumMyeongjo',
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              subject = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10),
                      Text(
                        '에게',
                        style: TextStyle(
                          color: Color(0xFF7B7066),
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'NanumMyeongjo',
                        ),
                      )
                    ]
                ),
                SizedBox(height: 10),
                Card(
                  color: Colors.white, // Set the overall card color to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: 350,
                    height: 450,
                    child: Column(
                      children:[
                        SizedBox(height: 60),
                        Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: '메세지를 입력해주세요.',
                              contentPadding: EdgeInsets.zero, // Remove default content padding
                              border: InputBorder.none, // Remove underline
                              hintStyle: TextStyle(
                                fontFamily: 'NanumMyeongjo',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            textAlign: TextAlign.center, // Center-align the text
                            controller: apoloController,
                            style: TextStyle(
                              fontFamily: 'NanumMyeongjo',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 250),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFF5E0CF),
                            elevation: 0,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: ((context) {
                                return AlertDialog(
                                    backgroundColor: Color(0xFFFFFFFF),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '편지가 전달되었습니다.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'NanumMyeongjo',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                              height: 3
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/letter.png',
                                          height: 60,
                                        )
                                      ],
                                    ),
                                    actions: <Widget>[
                                      Container(
                                        child: TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(); //창 닫기
                                          },
                                          child: Text(
                                              "확인",
                                              style: TextStyle(
                                                  fontFamily: 'NanumMyeongjo',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Color(0xFF000000)
                                              )
                                          ),
                                        ),
                                      ),
                                    ]
                                );
                              }),
                            );
                          },
                              child: Text(
                                '편지 보내기',
                                style: TextStyle(
                                  fontFamily: 'NanumMyeongjo',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color(0xFF000000)
                                ),
                              )

                            )
                      ]
                    ),
                    ),
                ),
              ]
          )
      )
    );
  }
}
