import 'package:flutter/material.dart';
import 'package:youtube_flutter_app/state_container.dart';
import 'package:youtube_flutter_app/ui/VideoDetail.dart';

class VideoItem extends StatelessWidget {
  VideoItem(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return _buildTiles(context);
  }

  Widget _buildTiles(BuildContext context) {
    final container = StateContainer.of(context);
    return GestureDetector(
      onTap: () {
        container.selectedIndex = -1;
        container.updateSelectedIndex(index: index);
//        Navigator.of(context).push(
//            MaterialPageRoute(builder: (_) => VideoDetail(index.toString())));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                tag: index.toString(),
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Color.fromRGBO(2, 18, 37, 0.8),
                        child: FlutterLogo(
                          size: 200,
                        ),
                        margin: EdgeInsets.zero,
                      ),
                    ),
                    Icon(
                      Icons.play_circle_outline,
                      size: 64,
                      color: Colors.white,
                    )
                  ],
                  alignment: Alignment(0, 0),
                  fit: StackFit.passthrough,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 8,
                      right: 8,
                      bottom: 8,
                    ),
                    child: CircleAvatar(
                      child: FlutterLogo(),
                      backgroundColor: Colors.redAccent,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            left: 8,
                            right: 8,
                          ),
                          child: Text(
                            "Avengers Infinity war",
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            bottom: 8,
                          ),
                          child: Text(
                            "Avengers Infinity war",
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
