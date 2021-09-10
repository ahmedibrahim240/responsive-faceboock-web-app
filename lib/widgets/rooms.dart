import 'package:facebook_app/config/constants.dart';
import 'package:facebook_app/models/models.dart';
import 'package:facebook_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDasktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDasktop ? 5.0 : 0.0),
      elevation: isDasktop ? 1 : 0,
      shape: isDasktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isDasktop ? BorderRadius.circular(10.0) : null,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _CreateRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl!,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return OutlineButton(
      onPressed: () => print('Create Room'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      textColor: Constants.facebookBlue,
      borderSide: BorderSide(
        width: 3.0,
        color: Colors.blueAccent[100]!,
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Constants.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          Text(
            'Create\nRoom',
          ),
        ],
      ),
    );
  }
}
