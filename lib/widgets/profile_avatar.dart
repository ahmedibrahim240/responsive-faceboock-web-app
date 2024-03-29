import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_app/config/constants.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;
  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
    this.hasBorder = false,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Constants.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 17.0 : 20.0,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        if (isActive)
          Positioned(
            bottom: 0.0,
            right: 0.0,
            child: Container(
              height: 15.0,
              width: 15.0,
              decoration: BoxDecoration(
                color: Constants.online,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
