import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mymusic/consts/colors.dart';
import 'package:mymusic/consts/text_style.dart';

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar : AppBar(),
      body : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle,color: Colors.yellow,),
              alignment: Alignment.center,
              child: const Icon(Icons.music_note),
               )),
               const SizedBox(height : 12,),
            Expanded(child: Container( 
            padding : const EdgeInsets.all(8.0),  
              alignment: Alignment.center,
              decoration: BoxDecoration(color : whiteColor, borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
           child: Column(
            children: [
              Text("Music Name",style: ourStyle(color: bgdarkColor,family: bold,size: 24),),
               const SizedBox(height : 12),
              Text("Artist Name",style: ourStyle(color: bgdarkColor,family: bold,size: 20),),
               const SizedBox(height : 12),
               Row(
                children: [
                  Text("00.00",style :ourStyle(color:bgdarkColor),),
                  Expanded (child :Slider(value :0.0,thumbColor: sliderColor,activeColor: sliderColor,inactiveColor: bgColor ,onChanged:(newvalue){} ,)),
                  Text("04.00",style :ourStyle(color:bgdarkColor),),
                ],
               ),
 const SizedBox(height : 12),           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: (){}, icon:Icon(Icons.skip_previous_rounded,size: 40,color: bgdarkColor,)),
                CircleAvatar(
                  radius: 35,
                backgroundColor : bgdarkColor,
                child: Transform.scale(
                  scale: 2.5,
                  child : IconButton(onPressed: (){}, icon:Icon(Icons.play_arrow_rounded,color: whiteColor,)))
                ),
                IconButton(onPressed: (){}, icon:Icon(Icons.skip_next_rounded,size: 40,color: bgdarkColor,)),
              ],
            ),
            ],
           ),

              )),
          ],
        ),
      )    );
  }
}