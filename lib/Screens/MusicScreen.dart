import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// orange = 249,124,92
// redpink = 234,42,79
// midnight blue = 14,36,83
// lightblue = 46,106,157

class MusicScreen extends StatefulWidget {
  final String playlistId; // Playlist ID

  const MusicScreen({required this.playlistId, Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() {
    return _MusicScreenState(playlistId: playlistId);
  }
}

class _MusicScreenState extends State<MusicScreen> {
  final String playlistId; // Playlist ID

  _MusicScreenState({required this.playlistId});

  List<dynamic> playlistItems = [];

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
      fetchPlaylist(token, playlistId); // Pass the playlist ID
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 14, 36, 83),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 36, 83),
        title: const Text('Spotify Playlist'),
      ),
      body: ListView.builder(
        itemCount: playlistItems.length,
        itemBuilder: (context, index) {
          final track = playlistItems[index]['track'];
          final album = track['album'];
          final albumImageUrl = album['images'][0]['url'];
          return Container(
            margin: const EdgeInsets.only(left: 8, right: 8, bottom: 7),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 249, 124, 92),
                      Color.fromARGB(255, 234, 42, 79),
                    ])),
            child: ListTile(
              leading: Image.network(
                albumImageUrl,
                width: 50.0,
                height: 50.0,
              ),
              title: Text(
                track['name'],
                style: const TextStyle(color: Colors.black),
              ),
              subtitle: Text(track['artists'][0]['name'],
                  style: const TextStyle(color: Colors.black)),
            ),
          );
        },
      ),
    );
  }
}