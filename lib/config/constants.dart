import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Constants {
  static const Color scaffold = Color(0xFFF0F2F5);

  static const Color facebookBlue = Color(0xFF1777F2);

  static const LinearGradient createRoomGradient = LinearGradient(
    colors: [
      Color(0xFF496AE1),
      Color(0xFFCE48B1),
    ],
  );

  static const Color online = Color(0xFF4BCB1F);

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black26],
  );
  static customCachedNetworkImage({
    String? url,
    required BuildContext context,
    BoxFit? boxFit,
    double? width,
    double? height,
    double? borderRadius,
  }) {
    try {
      if (url == null) {
        return Container();
      } else {
        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius ?? 12.0),
          child: (Uri.parse(url).isAbsolute)
              ? CachedNetworkImage(
                  imageUrl: url,
                  fit: (boxFit) ?? BoxFit.cover,
                  width: width ?? null,
                  height: height ?? null,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )
              : Icon(
                  Icons.image,
                  color: Constants.facebookBlue,
                ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
