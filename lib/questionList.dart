import 'package:everywithu/writeQuestion.dart';
import 'package:flutter/material.dart';

class questionListWidget extends StatefulWidget {
  const questionListWidget({Key? key}) : super(key: key);

  @override
  State<questionListWidget> createState() => _questionListWidgetState();
}

class _questionListWidgetState extends State<questionListWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? searchController = TextEditingController();

  @override
  void initState(){
    super.initState();
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>writeQuestionWidget()));
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>writeQuestionWidget()));
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
                showCardWidget(),
                showCardWidget(),
                showCardWidget()
              ],
            ),
        )
      )
    );
  }
}
class showCardWidget extends StatelessWidget {
  const showCardWidget({super.key});
  final String answer = '';

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      '당신의 어릴 적 꿈은?',
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