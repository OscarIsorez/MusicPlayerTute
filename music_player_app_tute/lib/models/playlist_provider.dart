import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player_app_tute/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
      songName: 'Song 1',
      artistName: 'Artist 1',
      albumPath: 'assets/OIG1.jpeg',
      audioPath: "assets/lofi.mp3",
    ),
    Song(
      songName: 'Song 2',
      artistName: 'Artist 2',
      albumPath: 'assets/OIG2.jpeg',
      audioPath:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
    ),
    Song(
      songName: 'Song 3',
      artistName: 'Artist 3',
      albumPath: 'assets/OIG3.jpeg',
      audioPath:
          "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
    )
  ];

  final AudioPlayer _audioPlayer = AudioPlayer();

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  bool _isPlaying = false;

  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;

    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));

  }

  PlaylistProvider() {
    listenToDuration();
  }

  void listenToDuration() {
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    _audioPlayer.onPlayerComplete.listen((event) {});
  }

  int? _currentSongIndex;

  List<Song> get playlist => _playlist;

  int? get currentSongIndex => _currentSongIndex;

  set currentSongIndex(int? index) {
    _currentSongIndex = index;
    notifyListeners();
  }
}
