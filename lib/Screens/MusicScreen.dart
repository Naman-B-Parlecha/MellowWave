import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:audioplayers/audioplayers.dart';
// orange = 249,124,92
// redpink = 234,42,79
// midnight blue = 14,36,83
// lightblue = 46,106,157

class MusicScreen extends StatefulWidget {
  final String playlistId;
  final String playlistimg;
  final String playlistname;
  const MusicScreen(
      {required this.playlistId,
      required this.playlistimg,
      required this.playlistname,
      super.key});

  @override
  State<MusicScreen> createState() {
    return _MusicScreenState(
        playlistId: playlistId,
        playlistimage: playlistimg,
        playlistname: playlistname);
  }
}

class _MusicScreenState extends State<MusicScreen> {
  final String playlistId; // Playlist ID
  final String playlistimage;
  final String playlistname;
  _MusicScreenState(
      {required this.playlistId,
      required this.playlistimage,
      required this.playlistname});

  List<dynamic> playlistItems = [];

  final audioplayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  List<String> musicUrls = [];
  int currentTrackIndex = 0;

  @override
  void dispose() {
    audioplayer.dispose();
    super.dispose();
  }

  Future<String> authenticateSpotify() async {
    const String tokenUrl = 'https://accounts.spotify.com/api/token';
    const String clientId = 'bfc704ac59b94b41ba6449ffb617515d';
    const String clientSecret = 'a626dc290c954fd086aaf82ad87752f5';
    final String credentials =
        base64.encode(utf8.encode('$clientId:$clientSecret'));

    final response = await http.post(
      Uri.parse(tokenUrl),
      headers: {
        'Authorization': 'Basic $credentials',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'client_credentials',
      },
    );

    if (response.statusCode == 200) {
      final token = json.decode(response.body)['access_token'];
      return token;
    } else {
      throw Exception('Failed to authenticate with Spotify');
    }
  }

  Future<void> fetchPlaylist(String accessToken, String playlistId) async {
    final String apiUrl =
        'https://api.spotify.com/v1/playlists/$playlistId/tracks';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      setState(() {
        playlistItems = json.decode(response.body)['items'];
      });
    } else {
      throw Exception('Failed to load playlist');
    }
  }

  @override
  void initState() {
    super.initState();
    authenticateSpotify().then((token) {
      fetchPlaylist(token, playlistId);
    });

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
    // playTrack(currentTrackIndex);
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

  void playPreviousTrack() {
    if (currentTrackIndex < musicUrls.length - 1 && currentTrackIndex > 0) {
      playTrack(currentTrackIndex - 1);
    } else {
      // You've reached the end of the playlist, handle as needed (loop or stop).
      // For example, you can implement a loop to start playing the first track again:
      playTrack(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? content;

    if (playlistItems.isEmpty) {
      content = const Center(
        child: CircularProgressIndicator(color: Color(0xFFEFC28D)),
      );
    } else {
      content = SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              height: 350,
              width: 285,
              decoration: const BoxDecoration(
                color: Color(0xFFEFC28D),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      image: DecorationImage(
                        image: AssetImage(playlistimage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 50,
                    width: 250,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Color(0xFF292541),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    child: Text(
                      playlistname,
                      style: GoogleFonts.stylish(
                        color: const Color(0xFFEFC28D),
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Controlling music here
            // MusicControlBox(),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF292541),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              width: 350,
              height: 200,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Ghost in Mist',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'softy',
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
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
                            Text(
                              formatTime(position),
                              style: TextStyle(color: Color(0xFFEFC28D)),
                            ),
                            Text(formatTime(duration),
                                style: TextStyle(color: Color(0xFFEFC28D)))
                          ]),
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Boxicons.bx_shuffle,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {
                              playPreviousTrack();
                            },
                            icon: const Icon(
                              Boxicons.bx_chevrons_left,
                              size: 45,
                            )),
                        IconButton(
                          icon: Icon(isPlaying
                              ? Icons.pause
                              : Icons.play_arrow), // Içon
                          iconSize: 50,
                          onPressed: () async {
                            if (isPlaying) {
                              await audioplayer.pause();
                            } else {
                              playNextTrack();
                            }
                          },
                        ),
                        IconButton(
                            onPressed: () {
                              playNextTrack();
                            },
                            icon: const Icon(
                              Boxicons.bx_chevrons_right,
                              size: 45,
                            )),
                      ],
                    )
                  ]),
            ),
            // music controller
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: playlistItems.length,
              itemBuilder: (context, index) {
                final track = playlistItems[index]['track'];
                final album = track['album'];
                final albumImageUrl = album['images'][0]['url'];
                String preview = track['preview_url'];
                if (preview != '') {
                  musicUrls.add(preview);
                }
                return Container(
                  height: 75,
                  margin: const EdgeInsets.only(left: 8, right: 8, bottom: 7),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFF292541)),
                  child: ListTile(
                    leading: ClipOval(
                      child: Image.network(
                        albumImageUrl,
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    title: Text(
                      track['name'],
                      style: const TextStyle(
                          color: Color(0xFFEFC28D),
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      track['artists'][0]['name'],
                      style: const TextStyle(
                          color: Color(0xFFEFC28D),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      );
    }
    return Scaffold(
        backgroundColor: const Color(0xFF48426D),
        appBar: AppBar(
          backgroundColor: const Color(0xFF48426D),
          title: Text(
            '\t\t\t\t\t\t\t\t\tMellowWave',
            style: GoogleFonts.montserrat(
                color: const Color(0xFFEFC28D),
                fontWeight: FontWeight.w600,
                fontSize: 22),
          ),
        ),
        body: content);
  }
}
