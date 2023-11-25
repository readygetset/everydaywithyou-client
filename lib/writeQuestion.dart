import 'package:flutter/material.dart';
import 'writeQuestion.dart';
import 'questionList.dart';
import 'todayQuestion.dart';

class writeQuestionWidget extends StatefulWidget {
  const writeQuestionWidget({super.key});

  @override
  State<writeQuestionWidget> createState() => _writeQuestionWidgetState();
}

class _writeQuestionWidgetState extends State<writeQuestionWidget> {
  bool showWriteCard = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF2E7),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF2E7),
        iconTheme: IconThemeData(color: Color(0XFF7B7066)),
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>questionListWidget()));
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>questionListWidget()));
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
                  SizedBox(height: 30),
                  Text(
                    '2023.11.25',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'NanumMyeongjo',
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0xFF7B7066),
                    indent: 140,
                    endIndent: 140,
                  ),
                  SizedBox(height: 20),
                  Text(
                    '당신의 어릴 적 꿈은?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'NanumMyeongjo',
                    ),
                  ),
                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed:(){
                      setState(() {
                        showWriteCard = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF5E0CF),
                    ),
                    child:Text(
                      '답변 추가하기',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'NanumMyeongjo',
                          color: Color(0xFF000000)
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  if(showWriteCard) writeCardWidget(),
                  showCardWidget(),
                  showCardWidget()
                ],

              ),
            ),

      );
  }
}


class writeCardWidget extends StatefulWidget {
  const writeCardWidget({super.key});

  @override
  State<writeCardWidget> createState() => _writeCardWidgetState();
}

class _writeCardWidgetState extends State<writeCardWidget> {
  TextEditingController? questionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(39, 5, 39, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15), // Adjust the margin as needed
            child: Text(
              '막둥이',
              style: TextStyle(
                fontFamily: 'NanumMyeongjo',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          Card(
            color: Colors.white, // Set the overall card color to white
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: 350,
              height: 100,
              child: Stack(
                children: [
                  // Brown-colored section on the left
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    width: 22,
                    child: Container(
                      color: Color(0xFFE8D8CB),
                    ),
                  ),
                  // White section on the right with text
                  Positioned(
                    left: 22,
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      color: Color(0xFFFFF9F5),
                      child: Align(
                        alignment: Alignment.center,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: '답변을 입력해주세요.',
                            contentPadding: EdgeInsets.zero, // Remove default content padding
                            border: InputBorder.none, // Remove underline
                            hintStyle: TextStyle(
                              fontFamily: 'NanumMyeongjo',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          textAlign: TextAlign.center, // Center-align the text
                          controller: questionController,
                          style: TextStyle(
                            fontFamily: 'NanumMyeongjo',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





class showCardWidget extends StatelessWidget {
  const showCardWidget({super.key});
  final String name = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(39, 5, 39, 5),
      child: Column(
        children:[
          Row(
            children:[
              VerticalDivider(
                thickness: 1,
                color: Color(0xFF000000),
                indent: 5,
                endIndent: 25,
              ),
              SizedBox(height: 15),
              Text(
              '막둥이',
              style: TextStyle(
                fontFamily: 'NanumMyeongjo',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            ]
          ),
          Card(
          color: Colors.white, // Set the overall card color to white
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior: Clip.antiAlias,
          child: Container(
            width: 350,
            height: 100,
            child: Stack(
              children: [
                // Brown-colored section on the left
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: 22,
                  child: Container(
                    color: Color(0xFFE8D8CB),
                  ),
                ),
                // White section on the right with text
                Positioned(
                  left: 22,
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: Color(0xFFFFF9F5),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '대통령',
                        style: TextStyle(
                          fontFamily: 'NanumMyeongjo',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]
      ),
    );
  }
}
