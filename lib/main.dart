import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(MemePlayer());

class MemePlayer extends StatelessWidget {
  //track number integer variable to follow up a meme's track position in the list
  int trackNumber = 0;

  //populate the app with more tracks
  List<String> memeTracks = [
    'Kama_hakuna.wav',
    'Iriz war iriz.wav',
    'Bure kabisa.wav',
    'Keep walking.wav',
    'Tununulie shai.wav',
    'That won\'t happen.wav',
    'Niko pekee yangu.wav',
  ];

  //explicit meme player function
  void memePlayer(int trackNumber) {
    final playMeme = AudioCache();
    //Add meme and text
    playMeme.play(memeTracks.elementAt(trackNumber));
  }

  //explicit function to populate UI accordingly
  Expanded buildButtons(Color color, int trackNumber) {
    return Expanded(
      child: OutlinedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
        child: Text(
          memeTracks.elementAt(trackNumber),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        onPressed: () {
          memePlayer(trackNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                buildButtons(Colors.red, 0),
                buildButtons(Colors.orange, 1),
                buildButtons(Colors.yellow, 2),
                buildButtons(Colors.green, 3),
                buildButtons(Colors.blue, 4),
                buildButtons(Colors.indigo, 5),
                buildButtons(Colors.deepPurple, 6),
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
