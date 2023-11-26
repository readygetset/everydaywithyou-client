import 'package:everywithu/writeQuestion.dart';
import 'package:flutter/material.dart';
import 'todayQuestion.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'writeLetter.dart';

class questionListWidget extends StatefulWidget {
  const questionListWidget({Key? key}) : super(key: key);

  @override
  State<questionListWidget> createState() => _questionListWidgetState();
}

class _questionListWidgetState extends State<questionListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? searchController = TextEditingController();
  List<Map<String, dynamic>> questionList = [];

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://51.20.65.21:8080/question/1'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(utf8.decode(response.bodyBytes));
      setState((){
        questionList = List<Map<String, dynamic>>.from(responseData);
      });
    } else {
      print('요청 실패: ${response.statusCode}');
    }
  }

  Future<void> searchQuestions(String keyword) async {
    final response = await http.get(Uri.parse('http://51.20.65.21:8080/question/find?familyId=1&keyword=${keyword}'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        questionList = List<Map<String, dynamic>>.from(responseData);
      });
    } else {
      print('검색 실패: ${response.statusCode}');
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF2E7),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF2E7),
        centerTitle: true,
        title: Text(
          "질문 목록",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: 'NanumMyeongjo'
          ),
        ),
      ),// TO DO: scroll view
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
        child: Container(
            child:Column(
              children: [
                Divider(
                  thickness: 1,
                  color: Color(0xff7b7066),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(39, 20, 39, 20),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFFFF9F5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(999),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                          ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(999),
                          borderSide: BorderSide(
                            color: Color(0xffFFF9F5),
                          ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(999),
                        borderSide: BorderSide(
                          color: Colors.transparent, // Set the initial border color
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: Color(0xFF7B7066),
                        iconSize: 25,
                        onPressed: (){
                          searchQuestions(searchController?.text ?? '');
                          //TO DO
                          //쿼리 보내기
                        },
                      ),
                    ),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'NanumMyeongjo'
                    ),
                  ),
                ),
                for (var questionData in questionList)
                  showCardWidget(
                      questionData['questionId'],
                      questionData['question'],
                  ),
              ],
            ),
        )
      )
    );
  }
}
class showCardWidget extends StatelessWidget {
  final int questionId;
  final String question;

  showCardWidget(this.questionId, this.question, {Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => writeQuestionWidget(questionId: questionId),
            ),
          );
        },
      child: Container(
        padding: EdgeInsets.fromLTRB(39, 5, 39, 5),
        child: Card(
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
                      alignment: Alignment.centerRight,
                      child: Text(
                        question,
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
      )
    );
  }
}


