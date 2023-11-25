import 'package:flutter/material.dart';

class writeQuestionWidget extends StatefulWidget {
  const writeQuestionWidget({super.key});

  @override
  State<writeQuestionWidget> createState() => _writeQuestionWidgetState();
}

class _writeQuestionWidgetState extends State<writeQuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF2E7),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFFFFF2E7),
        leading: IconButton(
          color: Color(0xFF7B7066),
          icon: Icon(Icons.menu),
          onPressed: ()async{
          },
        ),
        title: Text(
          '오늘의 질문',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
            fontFamily: 'NanumMyeongjo',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              thickness: 1,
              color: Color(0xff7b7066),
            ),
            SizedBox(height: 10),
            Text(
              '2023.11.25',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: 'NanumMyeongjo',
              ),
            ),
            Divider(
              thickness: 1,
              color: Color(0xFF7B7066),
              indent: 132,
              endIndent: 300,
            ),
            Text(
              '당신의 어릴 적 꿈은?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: 'NanumMyeongjo',
              ),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed:(){
                _writeQuestionWidgetState();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF5E0CF),
              ),
              child:Text(
                '답변 추가하기',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'NanumMyeongjo',
                    color: Color(0xFF000000)
                ),
              ),
            ),
            showCardWidget(),
            showCardWidget()
          ],

        ),
      ),
    );
  }
}


class wrtieCardWidget extends StatefulWidget {
  const wrtieCardWidget({super.key});

  @override
  State<wrtieCardWidget> createState() => _wrtieCardWidgetState();
}

class _wrtieCardWidgetState extends State<wrtieCardWidget> {
  TextEditingController? questionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        image:DecorationImage(
          image: AssetImage('assets/images/writeBackground.png'),
          fit:BoxFit.cover
        )
      ),
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
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: '답변을 입력해주세요.'
                      ),
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
                      alignment: Alignment.centerRight,
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
