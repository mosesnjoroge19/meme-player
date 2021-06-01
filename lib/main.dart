import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(MemePlayer());

class MemePlayer extends StatefulWidget {
  //track number integer variable to follow up a meme's track position in the list
  @override
  _MemePlayerState createState() => _MemePlayerState();
}

class _MemePlayerState extends State<MemePlayer> {
  int trackNumber = 0;

  List<String> memeTracks = [
    'Kama_hakuna',
    'Iriz war iriz',
    'Bure kabisa',
    'Keep walking',
    'Tununulie shai',
    'That won\'t happen',
    'Niko pekee yangu',
  ];

  bool memePlay(int trackNumber) {
    final playMeme = AudioPlayer();
    //Add meme and text
    playMeme.play(memeTracks.elementAt(trackNumber) + '.wav');
    return true;
  }

  void memeStop(int trackNumber) {
    final stopMeme = AudioPlayer();
    stopMeme.stop();
  }

  Expanded buildButtons(int trackNumber) {
    return Expanded(
      child: OutlinedButton(
        // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
        child: Text(
          memeTracks.elementAt(trackNumber),
          style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        onPressed: () {
          setState(() {
          memePlay(trackNumber) == false
              ? memePlay(trackNumber)
              : memeStop(trackNumber);  
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Meme Player'),
          backgroundColor: Colors.deepPurple,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //build UI
                buildButtons(0),
                buildButtons(1),
                buildButtons(2),
                buildButtons(3),
                buildButtons(4),
                buildButtons(5),
                buildButtons(6),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//TODO Set the UI to be scrollable
//TODO: Change the buttons to list tile with music player icons
