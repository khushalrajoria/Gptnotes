import 'package:animate_do/animate_do.dart';

import 'package:chatnotes/controllers/openAIservices.dart';
import 'package:chatnotes/controllers/pallete.dart';
import 'package:chatnotes/widgets/feature_box.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter/material.dart';


import '../widgets/utils/drawer.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final speechToText =SpeechToText();
  String lastWords='';
  String? generatedContent;
  String? generatedImageUrl;
    FlutterTts flutterTts = FlutterTts();

  final OpenAIService openAIService =OpenAIService();
  @override 
 // we ourself made this initState as we want to initiate the 'plubgings' we made
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

Future<void> initTextToSpeech() async{
  await flutterTts.setSharedInstance(true);
  setState(() {});
}

// all copied from the 'pub.dev' website
Future<void> initSpeechToText() async{
  await speechToText.initialize();
  setState(() {});
}


Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

 Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }
  
  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

Future<void> systemSpeak(String content) async{
    await flutterTts.speak(content);
}


@override
void dispose(){
  super.dispose();
  speechToText.stop();
  flutterTts.stop();
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BounceInDown(child: "khushnik".text.make()),
        centerTitle: true,
      ),
        drawer: const MyDrawer(),
      body:SingleChildScrollView(
        child: Column(
              children: [
                // VR assistant picture
                ZoomIn(
                  child: Stack(
                    children:[
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        height: 120,
                        width: 120,
                        margin: const EdgeInsets.only(top: 4),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 14, 181, 211),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Container(
                      //  child: Image.network("https://cdn-icons-png.flaticon.com/256/8360/8360529.png",scale: 1.65,),
                      alignment: Alignment.center,
                      height: 123,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      image: DecorationImage(
                     image: NetworkImage("https://cdn-icons-png.flaticon.com/256/8360/8360529.png"),
                        ),
                    ),)
                    ]
                  ),
                ),
            // chat Bubble
              FadeInRight(
                child: Visibility(
                  visible: generatedImageUrl==null,
                  child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 23,
                          vertical: 12,
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),// we use copy with as use the copied properties but with this
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Pallete.borderColor,
                          ),
                          borderRadius: BorderRadius.circular(20).copyWith(
                            topLeft: Radius.zero,
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:10.0),
                          child: generatedContent==null ? "Good morning what task can I do for you?".text.xl3.color(Pallete.mainFontColor).fontFamily('Cera Pro').make() : '$generatedContent'.text.xl2.make(),
                        ),
                  ),
                ),
              ),
              if(generatedImageUrl!=null) Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(generatedImageUrl!)),
              ),
              SlideInLeft(
                child: Visibility(
                  visible: generatedContent==null && generatedImageUrl==null,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(left: 35,top: 10),
                    padding:const EdgeInsets.all(12),
                  child: "Here are a few features".text.xl3.color(Pallete.mainFontColor).fontFamily('Cera Pro').fontWeight(FontWeight.bold).make()),
                ),
              ),
                // features list
                Visibility(
                  visible: generatedContent==null && generatedImageUrl==null,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        SlideInUp( delay: const Duration(milliseconds: 200),
                          child: const FeatureBox(color: Pallete.firstSuggestionBoxColor, headerText: 'ChatGPT',descText: 'A smater way to stay organized and informed with ChatGPT',)),
                        SlideInUp( delay: const Duration(milliseconds: 400),
                          child: const FeatureBox(color: Pallete.secondSuggestionBoxColor, headerText: 'Dall-E',descText: 'Get inspired and stay creative with your personal assistant powered by Dall-E',)),
                        SlideInUp(delay: const Duration(milliseconds: 600),
                          child: const FeatureBox(color: Pallete.thirdSuggestionBoxColor, headerText: 'Smart Voice Assistant ',descText: 'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',)),
                      ],
                    ),
                  ),
                )],
        ),
      ),
        floatingActionButton: FloatingActionButton(
            onPressed: ()async {
              if(await speechToText.hasPermission && speechToText.isNotListening) {
               await startListening();
              }else if(speechToText.isListening){
               final speech = await openAIService.isArtPromptAPI(lastWords);
               if(speech.contains('https')){
                generatedImageUrl=speech;
                generatedContent=null;
                setState(() {});
               }else{
                generatedImageUrl=null;
                generatedContent=speech;
                await systemSpeak(speech);
                setState(() {});
               }  
               await systemSpeak(speech);
                await stopListening();
              }else{
                initSpeechToText();
              }
        
            },child: Icon(speechToText.isListening ? Icons.stop_circle_outlined: Icons.mic)),
        
    );
  }
}


//  after making the UI we opened 'info.plist' file copied two sting key pairs and replace thier text with the 'permissions' on the 'pub.dev' page of flutter from where we are taking the speech to text dependancy
// actually the website tells you what and where to copy paste things ( pasted all the manifest things just above <permissoion>)

//  To do animations we are using a package called 'animate_do' package

// tasks left to do:
// edit options 
// chatGPT in emulator
// chatGPT options in notes boxex
