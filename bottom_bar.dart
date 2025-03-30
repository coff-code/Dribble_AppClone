import 'dart:ui';

import 'package:dribble_app/search_page.dart';
import 'package:dribble_app/home_page.dart';
import 'package:dribble_app/chat_page.dart';
import 'package:dribble_app/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool ishome=true;
  bool issearch=false;
  bool islike=false;
  bool isprofile=false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        //bottomnaviagationbar container
        bottomNavigationBar:Container(
          height: 65,
          margin: EdgeInsets.symmetric(horizontal: 75,vertical: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.black54,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            //backdrop filter
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 25,
                sigmaY: 25
              ),
              child: Container(
                //tabbar
                child: TabBar(
                  onTap: (value) {
                    if(value==0){
                      setState(() {
                        ishome=!ishome;
                        issearch=false;
                        islike=false;
                        isprofile=false;
                      });
                    }else if(value==1){
                      setState(() {
                        issearch=!issearch;
                        ishome=false;
                        islike=false;
                        isprofile=false;
                      });
                    }else if(value==2){
                      setState(() {
                        islike=!islike;
                        issearch=false;
                        ishome=false;
                        isprofile=false;
                      });
                    }else if(value==3){
                      setState(() {
                        isprofile=!isprofile;
                        issearch=false;
                        islike=false;
                        ishome=false;
                      });
                    }
                  },
                  unselectedLabelColor: Colors.grey,
                  dividerColor: Colors.transparent,
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 2,vertical: 2),
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  tabs: [
                  Tab(
                    
                    icon:ishome?
                    Icon(Icons.home_filled,color: Colors.black,):
                    Icon(Icons.home_outlined,size: 30,)

                  ),
                  Tab(
                    icon: issearch?
                    Icon(CupertinoIcons.chat_bubble_fill,color: Colors.black,size: 24,):
                    Icon(CupertinoIcons.chat_bubble,size: 27,),
                  ),
                  Tab(
                    icon:
                    islike?
                     Icon(CupertinoIcons.search,size: 28,color: Colors.black,weight: 30,):
                     Icon(CupertinoIcons.search,size: 28,),
                  ),
                  Tab(
                    icon:isprofile?
                     Icon(Icons.person,size: 30,color: Colors.black,):                    
                     Icon(CupertinoIcons.person,size: 27,),
                  ),
                ],
                ),
              ),
            ),
          ),
          
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
          HomePage(),
           chatpage(),
          searchpage(),       
          ProfilePage()
        ]),
      ),
    );
  }
}