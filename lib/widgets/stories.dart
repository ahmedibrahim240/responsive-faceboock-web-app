import 'package:facebook_app/config/constants.dart';
import 'package:facebook_app/models/models.dart';
import 'package:facebook_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;
  const Stories({
    Key? key,
    required this.currentUser,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDasktop = Responsive.isDesktop(context);
    return Container(
      color: isDasktop ? Colors.transparent : Colors.white,
      height: 200.0,
      child: ListView.builder(
        itemCount: 1 + stories.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                isAddStory: true,
                currentUser: currentUser,
              ),
            );
          }
          final Story story = stories[index - 1];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(
              story: story,
            ),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final User? currentUser;
  final Story? story;
  final bool isAddStory;

  const _StoryCard({
    Key? key,
    this.currentUser,
    this.isAddStory = false,
    this.story,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDasktop = Responsive.isDesktop(context);
    return Stack(
      children: [
        Constants.customCachedNetworkImage(
          context: context,
          url: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
          width: 110.0,
          height: double.infinity,
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: Constants.storyGradient,
            boxShadow: isDasktop
                ? const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                    ),
                  ]
                : null,
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: (isAddStory)
              ? Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => print("add stroy"),
                    icon: Icon(
                      Icons.add,
                      color: Constants.facebookBlue,
                      size: 30.0,
                    ),
                  ),
                )
              : ProfileAvatar(
                  imageUrl: story!.user.imageUrl!,
                  hasBorder: story!.isViewed,
                ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            (isAddStory) ? "Add to Story" : story!.user.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
