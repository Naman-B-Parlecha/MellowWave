import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() {
    return _DummyScreenState();
  }
}

class _DummyScreenState extends State<DummyScreen> {
  final audioplayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  List<String> musicUrls = [
    // Add your list of music URLs here
    'https://p.scdn.co/mp3-preview/ab99504c5434ae45590798c907a1a415a58cc032?cid=bfc704ac59b94b41ba6449ffb617515d',
    'https://p.scdn.co/mp3-preview/8c6a4e3859f9a66549dbafa08ef4a3667bd68aaf?cid=bfc704ac59b94b41ba6449ffb617515d'
    // Add more music URLs as needed
  ];
  int currentTrackIndex = 0;

  @override
  void dispose() {
    audioplayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioplayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioplayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioplayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    // Listen for player completion to play the next track
    audioplayer.onPlayerComplete.listen((event) {
      playNextTrack();
    });

    // Start playing the first track
    playTrack(currentTrackIndex);
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  void playTrack(int index) async {
    if (index < 0 || index >= musicUrls.length) {
      return;
    }
    final url = musicUrls[index];
    await audioplayer.play(UrlSource(url));
    currentTrackIndex = index;
  }

  void playNextTrack() {
    if (currentTrackIndex < musicUrls.length - 1) {
      playTrack(currentTrackIndex + 1);
    } else {
      // You've reached the end of the playlist, handle as needed (loop or stop).
      // For example, you can implement a loop to start playing the first track again:
      playTrack(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/back2.jpg',
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text('music name'),
              Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final position = Duration(seconds: value.toInt());
                    await audioplayer.seek(position);

                    await audioplayer.resume();
                  }),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(position)),
                      Text(formatTime(duration))
                    ]),
              ),
              CircleAvatar(
                radius: 35,
                child: IconButton(
                  icon:
                      Icon(isPlaying ? Icons.pause : Icons.play_arrow), // Içon
                  iconSize: 50,
                  onPressed: () async {
                    if (isPlaying) {
                      await audioplayer.pause();
                    } else {
                      playNextTrack();
                    }
                  },
                ),
              )
            ],
          )),
    );
  }
}
