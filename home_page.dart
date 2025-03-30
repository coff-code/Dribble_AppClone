import 'dart:ui';

import 'package:dribble_app/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          //sliver app bar

          SliverAppBar(
            floating: true,
            leading: Icon(CupertinoIcons.square_grid_2x2),
            centerTitle: true,
            title: Text("Dribble",style: GoogleFonts.aboreto(fontWeight: FontWeight.bold),),
            actions: [
             IconButton(onPressed: (){}, icon:Icon(CupertinoIcons.bell) ) 
            ],
          ),

          //sliver to box adapter

          SliverToBoxAdapter(
            child: Column(children: [
              stories(),
              posts()
            ],),
          )
        ],
      ),
    );
  }
}

//story widget

Widget stories(){
  return SizedBox(
    height: 120,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: storydetailsList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6),
              //profilepic
              child: CircleAvatar(
                radius: 37,
                backgroundColor: Colors.grey.shade900,
                backgroundImage: NetworkImage(storydetailsList[index].profile),
                    ),
            ),
            //username
            Text(storydetailsList[index].username,style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        );
      },
    ),
  );
}

//post widget

Widget posts(){
  //Listview Builder
  return ListView.builder(
    padding: EdgeInsets.all(0),
    physics: NeverScrollableScrollPhysics(),
    itemCount: postDetailsLists.length,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      //post container
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 12,vertical: 5),
      height: 400,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(40),
        //postimage
        image: DecorationImage(image: NetworkImage(postDetailsLists[index].postimage),fit: BoxFit.cover)
      ),
      //column
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          
          //top container
          //profile nd username container

        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          //backdropfilter
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              height: 65,
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black12,
              ),
              //row
              child:Row(children: [
                //profile image
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black,
                  backgroundImage: NetworkImage(postDetailsLists[index].profileimage),
                ),
                SizedBox(width: 5,),
                //username
                Text(postDetailsLists[index].username,style: TextStyle(color: Colors.white,fontSize: 16),)
              ],),
            ),
          ),
        ),

          //bottom container
          //likes,cmnts,share,bios container

        Container(
          //column
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             //likes,cmnts,share container
              Container(
                child: Row(children: [
                  Icon(Icons.favorite_border,color: Colors.white),
                  SizedBox(width: 3,),
                  Text(postDetailsLists[index].like.toString(),style: TextStyle(color: Colors.white),),
                  SizedBox(width: 10,),
                  Icon(CupertinoIcons.chat_bubble,color: Colors.white),
                  SizedBox(width: 3,),
                  Text(postDetailsLists[index].comments.toString(),style: TextStyle(color: Colors.white)),
                  SizedBox(width: 10,),
                  Icon(Icons.send_outlined,color: Colors.white,size: 23,),
                  SizedBox(width: 3,),
                  Text(postDetailsLists[index].share.toString(),style: TextStyle(color: Colors.white)),
                  SizedBox(width: 10,),             
                ],),
              ),
              SizedBox(height: 10,),
             // bios container            
               Container(
                padding: EdgeInsets.only(bottom: 13),
                child: Text(postDetailsLists[index].bios,style: TextStyle(color: Colors.white)),
          )
            ],           
          ),
        ),
      ],),
    );
  },);
}