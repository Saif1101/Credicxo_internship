import 'package:credixco_intern/application/journeys/home/track_details_page.dart';
import 'package:credixco_intern/data/models/track_model.dart';
import 'package:flutter/material.dart';

class TrackCard extends StatelessWidget {
  const TrackCard({
    Key? key,
    required this.track,
  }) : super(key: key);

  final TrackModel track;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: InkWell(
        onTap: (() => Navigator.pushNamed(context, TrackDetailsPage.routeName, arguments: track)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.music_note),
                    SizedBox(width: 5,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            track.trackName! + track.trackName!,
                            style: TextStyle(fontSize: 18),
                            softWrap: true,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 3,),
                          Text(track.albumName ?? 'Unnamed')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 1,),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(track.artistName ?? 'Unnamed', 
                      overflow: TextOverflow.ellipsis,),
                    Icon(Icons.arrow_right_alt_rounded, ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}