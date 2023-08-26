import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../data.dart';

class VideoCard extends StatelessWidget {
  final Video video;

  const VideoCard({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //todo: Video thumbnail and timestamp
        Stack(
          children: [
            //* Video Thumbnail
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.network(
                video.thumbnailUrl,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            //* Timestamp of the video duration
            Positioned(
              bottom: 28.0,
              right: 25.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(08),
                ),
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  video.duration,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
        //todo: Video Deets displayed below

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //* Author profile
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 10.0),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    video.author
                        .profileImageUrl, // Use the author's profile image URL
                  ),
                  radius: 20,
                ),
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //* Video title
                  Flexible(
                    child: Text(
                      video.title,
                      maxLines: 2,
                      
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 15.0,
                            color: white,
                          ),

                          
                    ),
                  ),

                  const SizedBox(
                    height: 2,
                  ),
                  //* Video author name
                  Flexible(
                    child: Text(
                      '${video.author.username} ° ${video.viewCount} ° ${timeago.format(video.timestamp)}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Icon(Icons.more_vert),
            )
          ],
        )
      ],
    );
  }
}
