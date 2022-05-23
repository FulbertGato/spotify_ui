import 'package:flutter/material.dart';
import 'package:spotify_ui/ui/screens/album_screen.dart';

class AlbumCardWidget extends StatelessWidget {
  final ImageProvider image;
  final String label;
  // final Function onTap;
   final double size;
  const AlbumCardWidget({ Key? key, required this.image, required this.label, this.size = 120}) : super(key: key);

  @override
   Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumScreen(
              image: image,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: image,
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),
          Text(label),
        ],
      ),
    );
  }
}