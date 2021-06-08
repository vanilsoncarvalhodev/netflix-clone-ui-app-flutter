import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final dynamic video;

  const Video({ Key key, this.video }) : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  VideoPlayerController _controller;
  Color cor;

  @override
  void initState() { 
    super.initState();
    cor = widget.video["cor"];
    _controller = VideoPlayerController.asset(widget.video["videoUrl"])
      ..initialize().then((_) {
        setState(() {
          _controller.pause();          
        });
      });
  }

  @override
  void dispose() { 
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = _controller.value.volume == 0;
    return Column(
      children: [
        _controller.value.initialized ?
          Container(
            height: 200,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2)
                  ),
                ),
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                        ? null
                        : Icons.play_arrow,
                        size: 50,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();                    
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  height: 8,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    colors: VideoProgressColors(
                      playedColor: cor,
                      bufferedColor: cor.withOpacity(0.2),
                      backgroundColor: cor.withOpacity(0.2)
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          isMuted ? Icons.volume_mute : Icons.volume_up,
                          color: Colors.white,
                          size: 15,
                        ),
                        onPressed: () {
                          setState(() {
                            _controller.setVolume(isMuted ? 1 : 0);                          
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          :
          Container(
            height: 200,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.video["img"]),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}