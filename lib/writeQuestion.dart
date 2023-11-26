import 'package:flutter/material.dart';
import 'questionList.dart';
import 'todayQuestion.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'writeLetter.dart';

class writeQuestionWidget extends StatefulWidget {
  final int questionId;

  const writeQuestionWidget({required this.questionId, Key? key})
      : super(key: key);

  @override
  State<writeQuestionWidget> createState() => _writeQuestionWidgetState();
}

class _writeQuestionWidgetState extends State<writeQuestionWidget> {
  TextEditingController? questionController = TextEditingController();

  bool showWriteCard = false;
  late String questionText = '';
  List<Map<String, dynamic>> answerList = [];

  @override
  void initState() {
    super.initState();
    fetchQuestion();
    fetchAnswer();
  }

  Future<void> submitAnswer() async {
    final String answerText = questionController?.text ?? '';

    if (answerText.isNotEmpty) {
      final Map<String, dynamic> requestBody = {
        "answer": answerText,
      };

      final Uri url = Uri.parse('http://51.20.65.21:8080/answer/${widget.questionId}/4');

      final http.Response response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Answer submitted successfully, you may want to update the UI or show a success message
        print('Answer submitted successfully');
      } else {
        // Handle the error when the answer submission fails
        print('Answer submission failed: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    }
  }

  Future<void> fetchQuestion() async {
    final response = await http.get(Uri.parse('http://51.20.65.21:8080/question/1/${widget.questionId}'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(utf8.decode(response.bodyBytes));
      setState(() {
        questionText = responseData['question'];
      });
    } else {
      print('요청 실패: ${response.statusCode}');
    }
  }
  Future<void> fetchAnswer() async {
    final response = await http.get(Uri.parse('http://51.20.65.21:8080/answer?familyId=1&questionId=${widget.questionId}'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(utf8.decode(response.bodyBytes));
      setState((){
        answerList = List<Map<String, dynamic>>.from(responseData);
      });
    } else {
      print('요청 실패: ${response.statusCode}');
    }
  }

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
            Divider(
              thickness: 1,
              color: Color(0xFF7B7066),
              indent: 140,
              endIndent: 140,
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 45), // Set margin
              child: Text(
                questionText,
                style: TextStyle(
                  fontFamily: 'NanumMyeongjo',
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center, // Center-align the text
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
            if (showWriteCard) writeCardWidget(submitAnswer, questionController),
            for (var answerData in answerList)
              showCardWidget(
                answerData['memberName'],
                answerData['answer'],
              ),
          ],
        ),
    ),
    );
  }
}


class writeCardWidget extends StatefulWidget {
  final VoidCallback submitAnswer;
  final TextEditingController? questionController;

  const writeCardWidget(this.submitAnswer, this.questionController, {super.key});

  @override
  State<writeCardWidget> createState() => _writeCardWidgetState();
}

class _writeCardWidgetState extends State<writeCardWidget> {
  //TextEditingController? questionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(39, 5, 39, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Row(
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
              SizedBox(width: 150),
              ElevatedButton(
                onPressed: widget.submitAnswer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFF5E0CF),
                  padding: EdgeInsets.symmetric(horizontal: 15),
                ),
                child: Text(
                  '제출',
                  style: TextStyle(
                    fontFamily: 'NanumMyeongjo',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              )
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
                          controller: widget.questionController,
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
  final String memberName;
  final String answer;

  showCardWidget(this.memberName, this.answer, {Key? key}) : super(key:key);

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
              memberName,
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
            height: 150,
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
                        answer,
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
