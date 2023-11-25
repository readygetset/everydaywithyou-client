import 'package:flutter/material.dart';

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
              },
              icon: Icon(
                Icons.email,
                color: Color(0xFF7B7066),
              ),
          )
        ],
      ),
      body: Column(
        children: [
          Divider(
            thickness: 1,
            color: Color(0xff7b7066),
          ),
          SizedBox(height: 30),
          Container(
            height: 620,
            color: Color(0xFFFFF9F5),
            child: Container(
              color: Color(0xFFF5E0CF),
            ),
          )
        ],
      ),
    );
  }
}
