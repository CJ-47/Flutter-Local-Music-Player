import 'package:flutter/material.dart';
import '../consts/colors.dart';
import '../consts/text_style.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgdarkColor,
      appBar: AppBar(
        actions: [IconButton(onPressed: (){}, icon:const Icon(Icons.search,color: bgColor,))],
        leading: Icon(Icons.sort_rounded,color: bgColor,),
        title :Text("Music Player",style :ourStyle(
        size : 18,
        family : bold,
        
      ))),
      
      body : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context,index){
return Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12)
  ),
  child: ListTile(title: Text("Music Name",style: ourStyle(family: bold,size: 15),),
  subtitle: Text("Artist Name",style: ourStyle(family: regular,size: 12),)
  ,
  leading: Icon(Icons.music_note,color: whiteColor,size: 32,),
  trailing: Icon(Icons.play_arrow,color: whiteColor,size:26),
  ),
);

          }),
      ),
    );
  }
}