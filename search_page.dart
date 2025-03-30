import 'package:dribble_app/details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class searchpage extends StatefulWidget {
  const searchpage({super.key});

  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  bool issearch=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onTap: () {
            setState(() {
              issearch=!issearch;
            });
          },
          decoration: InputDecoration(
            prefixIcon: Icon(CupertinoIcons.search),
            hintText: "Search",
            prefixStyle: TextStyle(color: Colors.black,fontSize: 20),
            fillColor: Colors.grey.shade300,
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none)
          ),
        ),
        actions: [
          issearch?
          GestureDetector(
            onTap: () {
              setState(() {
                issearch=false;
                FocusScope.of(context).unfocus();
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 15),
              child: Text("Cancel",style: TextStyle(color: Colors.black,fontSize: 18),)),
          ):
          Container()
        ],
      ),
      body: issearch?
      Container():
      Container(
        child: StaggeredGridView.countBuilder(
          padding: EdgeInsets.all(9),
          crossAxisCount: 4, 
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          itemCount: searchpostsLists.length,
          itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(image: NetworkImage(searchpostsLists[index].image.toString()),fit: BoxFit.cover),
            color: Colors.black,
            ),
          );
        }, staggeredTileBuilder: (index) => StaggeredTile.count(2,index.isEven?3:2),),
      ),

    );
  }
}