import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:mymusic/consts/colors.dart';
import 'package:mymusic/consts/text_style.dart';
import 'package:mymusic/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends StatelessWidget {
  final SongModel data;
  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller=Get.find<PlayerController>();
       return Scaffold(
      backgroundColor: bgColor,
      appBar : AppBar(),
      body : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height:300,
              width: 300,
              decoration: const BoxDecoration(shape: BoxShape.circle,),
              alignment: Alignment.center,
              child: QueryArtworkWidget(id: data.id, type: ArtworkType.AUDIO,artworkHeight: double.infinity,artworkWidth: double.infinity,),
               )),
               const SizedBox(height : 12,),
            Expanded(child: Container( 
            padding : const EdgeInsets.all(8.0),  
              alignment: Alignment.center,
              decoration: BoxDecoration(color : whiteColor, borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
           child: Column(
            children: [
              Text(data.displayNameWOExt,style: ourStyle(color: bgdarkColor,family: bold,size: 24),),
               const SizedBox(height : 12),
              Text(data.artist.toString(),style: ourStyle(color: bgdarkColor,family: bold,size: 20),),
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
                Obx(() => 
                CircleAvatar(
                  radius: 35,
                backgroundColor : bgdarkColor,
                child: Transform.scale(
                  scale: 2.5,
                  child : IconButton(onPressed: (){
                    if(controller.isPlaying.value)
                    {
                      controller.audioPlayer.pause();
                      controller.isPlaying(false);
                    }
                    else
                    {
                      controller.audioPlayer.play();
                      controller.isPlaying(true);
                    }
                  },
                  icon : controller.isPlaying.value ? Icon(Icons.pause,color: whiteColor,) : Icon(Icons.play_arrow_rounded,color: whiteColor,)),)
                )),
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