import 'package:facebook_app/config/constants.dart';
import 'package:facebook_app/models/models.dart';
import 'package:facebook_app/widgets/profile_avatar.dart';
import 'package:facebook_app/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDasktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: isDasktop ? 5.0 : 0.0, vertical: 5.0),
      elevation: isDasktop ? 1 : 0,
      shape: isDasktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isDasktop ? BorderRadius.circular(10.0) : null,
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _PostHeader(post: post),
                  const SizedBox(height: 4.0),
                  Text(post.caption),
                  post.imageUrl != null
                      ? const SizedBox.shrink()
                      : const SizedBox(height: 6.0),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Constants.customCachedNetworkImage(
                context: context,
                url: post.imageUrl,
                borderRadius: 0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: _PostStars(post: post),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl!),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.0,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
      ],
    );
  }
}

class _PostStars extends StatelessWidget {
  final Post post;
  const _PostStars({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Constants.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                "${post.likes}",
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
            Text(
              "${post.comments} Comments",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              "${post.shares} Shares",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                Mdi.thumbUpOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Like',
              onTap: () => print('Like'),
            ),
            _PostButton(
              icon: Icon(
                Mdi.commentOutline,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              onTap: () => print('Comment'),
            ),
            _PostButton(
              icon: Icon(
                Mdi.shareOutline,
                color: Colors.grey[600],
                size: 25.0,
              ),
              label: 'Share',
              onTap: () => print('Share'),
            ),
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function onTap;

  const _PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        borderOnForeground: true,
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(width: 4.0),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
