import 'package:dribble_app/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
       body: CustomScrollView(
        slivers: [
          
          //1.bacground and profile sliver app bar
      
          SliverAppBar(
            pinned: true,
            primary: false,
            toolbarHeight: 300,
            flexibleSpace:Container(
              margin: EdgeInsets.all(3),
              height: 300,
              child: Stack(
                children: [
                  //background container
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.grey.shade900,
                    image: DecorationImage(image: NetworkImage("https://i.pinimg.com/736x/68/a4/33/68a43387adc3975cf0ec51e64fbe2579.jpg"),fit: BoxFit.cover)
                    ),
                  ),
                  //profilepic
                  Positioned(
                    right: 0,
                    left: 0,
                    top: 150,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.black,
                              backgroundImage: NetworkImage("https://i.pinimg.com/474x/c9/4c/6c/c94c6c22df0adf7c9745c6e408125e69.jpg"),
                            ),
                          ),
                        ),
                        Text("Mr Mann65",style: GoogleFonts.aBeeZee(fontSize: 30),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
      
          //2.followers, posts, sliver app bar
      
          SliverAppBar(
            toolbarHeight: 70,
            primary: false,
            flexibleSpace: Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
               followers("475 K", "Followers"),
              VerticalDivider(
                indent: 10,
                endIndent: 15,
              ),
               followers("1665", "Followings"),
               VerticalDivider(
                 indent: 10,
                endIndent: 15,
               ),
               followers("10 ", "Posts")
              
              ],),
            ),
          ),
      
          //3.edit profile sliver app bar
          
          SliverAppBar(
            toolbarHeight: 30,
            flexibleSpace: Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(children: [
              Expanded(child: ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.grey.shade300)),
                onPressed: (){}, child: FittedBox(child: Text("Edit Profile",style: TextStyle(color: Colors.black,fontSize: 20),)))),
              SizedBox(width: 10,),
               Expanded(child: ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.grey.shade300)),
                onPressed: (){}, child: FittedBox(child: Text("Share ",style: TextStyle(color: Colors.black,fontSize: 16),)))),
              SizedBox(width: 10,),
               Expanded(child: ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.grey.shade300)),
                onPressed: (){}, child: FittedBox(child: Text("Insights",style: TextStyle(color: Colors.black,fontSize: 16),)))),            
              ],),
            ),
          ),
      
          //4.tab bar
      
          SliverAppBar(
            pinned: true,
            primary: false,
            flexibleSpace:  TabBar(
              labelColor: Colors.black,
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.grey.shade300,
              tabs: [
              Tab(
                icon: Icon(CupertinoIcons.square_grid_2x2_fill),
              ),
                 Tab(
                icon: Icon(CupertinoIcons.heart_fill,size: 28,),
              ),
               Tab(
                icon: Icon(CupertinoIcons.bookmark_fill,size: 24,),
              )
            ]),
          ),

          //5.tabbarview

          SliverFillRemaining(
           child:TabBarView(children: [        
           // gridview
           StaggeredGridView.countBuilder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(5),
            crossAxisCount: 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            itemCount:profilepostsdetailsList.length,
            shrinkWrap: true,
             itemBuilder: (context, index) {
             return Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
              image: DecorationImage(image: NetworkImage(profilepostsdetailsList[index].image.toString()),fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)
              ),
             );
           },
            staggeredTileBuilder: (index) => StaggeredTile.count(2,index.isEven?3:2),),         
           //No Post Text
              Container(
                child: Center(child: Column(
                  children: [
                    SizedBox(height: 100,),
                    Icon(Icons.camera_alt_outlined,size: 65,),
                    SizedBox(height: 20,),
                    Text("No Post Yet",style: GoogleFonts.aBeeZee(fontSize: 35),),
                  ],
                ),),
              ),
           //No Post Text
                Container(
                child: Center(child: Column(
                  children: [
                    SizedBox(height: 100,),
                    Icon(Icons.camera_alt_outlined,size: 65,),
                    SizedBox(height: 20,),
                    Text("No Post Yet",style: GoogleFonts.aBeeZee(fontSize: 35),),
                  ],
                ),),
              )
            ]),
          )
        ],
       ),
      ),
    );
  }
}

//widget

Widget followers(
  String num,
  String name
){
  return Column(children: [
    Text(num,style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold),),
    Text(name,style: TextStyle(color: Colors.grey,fontSize: 15),)
  ],);
}