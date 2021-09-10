import 'package:facebook_app/models/models.dart';
import 'package:facebook_app/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDasktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDasktop ? 5.0 : 0.0),
      elevation: isDasktop ? 1 : 0,
      shape: isDasktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
          : null,
      child: Container(
        padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isDasktop ? BorderRadius.circular(10.0) : null,
        ),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl!),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 10.0, thickness: 0.5),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Mdi.video,
                      color: Colors.red,
                    ),
                    label: Text("Live"),
                  ),
                  const VerticalDivider(width: 8.0),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: Text("Photo"),
                  ),
                  const VerticalDivider(width: 8.0),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label: Text("Room"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
