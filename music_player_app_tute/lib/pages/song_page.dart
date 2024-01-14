import 'package:flutter/material.dart';
import 'package:music_player_app_tute/components/neu_box.dart';
import 'package:music_player_app_tute/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(builder: (context, value, child) {
      final playlist = value.playlist;

      final currentSong = playlist[value.currentSongIndex ?? 0];

      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 25.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back)),
                      const Text("P L A Y L I S T "),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.menu)),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  NeuBox(
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(currentSong.albumPath)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  currentSong.songName,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  currentSong.artistName,
                                )
                              ],
                            ),
                            const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.red,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("0:00"),
                            Icon(Icons.shuffle),
                            Icon(Icons.repeat),
                            Text("0:00")
                          ],
                        ),
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 0.0),
                        ),
                        child: const Slider(
                          min: 0.0,
                          max: 100.0,
                          value: 70,
                          activeColor: Colors.green,
                          onChanged: null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                            child:
                                const NeuBox(child: Icon(Icons.skip_previous))),
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                            child: const NeuBox(
                                child: Icon(Icons.play_arrow_rounded))),
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                      Expanded(
                        child: GestureDetector(
                            child: const NeuBox(
                                child: Icon(Icons.skip_next_rounded))),
                      ),
                    ],
                  )
                ]),
          ),
        ),
      );
    });
  }
}
