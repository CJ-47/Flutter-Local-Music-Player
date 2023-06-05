import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:mymusic/consts/colors.dart';
import 'package:mymusic/consts/text_style.dart';
import 'package:mymusic/controllers/player_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends StatelessWidget {
  final List<SongModel> data;
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
           Obx(() =>  Expanded(child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height:300,
              width: 300,
              decoration: const BoxDecoration(shape: BoxShape.circle,),
              alignment: Alignment.center,
              child: QueryArtworkWidget(id: data[controller.playIndex.value].id, type: ArtworkType.AUDIO,artworkHeight: double.infinity,artworkWidth: double.infinity,),
               ))),
               const SizedBox(height : 12,),
             Container( 
              width: 370,
              margin:EdgeInsets.all(6.0),
              
            padding : const EdgeInsets.all(1.0),  
              alignment: Alignment.center,
              decoration: BoxDecoration(color : whiteColor, borderRadius: BorderRadius.all( Radius.circular(16))),
           
           
           child: Obx (()=>
             Container( margin :const EdgeInsets.all(8.0)  ,       
                          color:whiteColor,
               child: Column(
                children: [ 
                      const SizedBox(height : 12,),
                  Text(data[controller.playIndex.value].displayNameWOExt,textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,style: ourStyle(color: bgdarkColor,family: bold,size: 24),),
                   const SizedBox(height : 6),
                  Text(data[controller.playIndex.value].artist.toString(),style: ourStyle(color: bgdarkColor,family: bold,size: 20),),
                   const SizedBox(height : 12),
                   Obx(() => 
                   Row(
                    children: [
                      Text(controller.position.value,style :ourStyle(color:bgdarkColor),),
                      Expanded (child :Slider(value :controller.value.value,min: Duration(seconds: 0).inSeconds.toDouble(),max:controller.max.value,thumbColor: sliderColor,activeColor: sliderColor,inactiveColor: bgColor ,onChanged:(newvalue){
                        controller.changeDurationtoSeconds(newvalue.toInt());
                        newvalue=newvalue;
                      } ,)),
                      Text(controller.duration.value,style :ourStyle(color:bgdarkColor),),
                    ],
                   )),
                         const SizedBox(height : 12),           
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed: (){
                      if(controller.playIndex.value !=0)
                      {
                        controller.playSong(data[controller.playIndex.value-1].uri, controller.playIndex.value-1);
                      }
                    }, icon:Icon(Icons.skip_previous_rounded,size: 40,color: bgdarkColor,)),
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
                    IconButton(onPressed: (){
                        
                      if(controller.playIndex.value !=data.length-1)
                      {
                        controller.playSong(data[controller.playIndex.value+1].uri, controller.playIndex.value+1);
                      }
                        
                    }, icon:Icon(Icons.skip_next_rounded,size: 40,color: bgdarkColor,)),
                  ],
                ),
                ],
               ),
             ),
           ),

              ),
          ],
        ),
      )    );
  }
}