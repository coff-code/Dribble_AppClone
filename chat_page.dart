import 'package:flutter/material.dart';

class chatpage extends StatefulWidget {
  const chatpage({super.key});

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      
      title: Text("Chat",style: TextStyle(color: Colors.white,fontSize: 30),),
      backgroundColor: Colors.black,
      centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.black,
        child: Column(children: [
          Row(children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: const Color.fromARGB(255, 255, 1, 1),
              child: Icon(Icons.edit_note_outlined,color: Colors.white,),
            ),
            SizedBox(width: 10,),
            Text("New message",style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.bold),)
          ],),
          SizedBox(height: 20,),
           Row(children: [
            CircleAvatar(
              radius: 27,
              backgroundColor:Colors.white,
              child: Icon(Icons.person_add,color: Colors.black,),
            ),
            SizedBox(width: 10,),
            Text("Invite your friends",style: TextStyle(color: Colors.white,fontSize: 20),)
          ],),

        ],),
      ),


    );
  }
}