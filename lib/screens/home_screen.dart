import 'package:facebook_app/config/constants.dart';
import 'package:facebook_app/data/data.dart';
import 'package:facebook_app/models/models.dart';
import 'package:facebook_app/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        mobile: _HomeScreenMobile(scrollController: _trackingScrollController),
        desktop:
            _HomeScreenDesktop(scrollController: _trackingScrollController),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  const _HomeScreenMobile({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          if (!Responsive.isDesktop(context))
            SliverAppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              floating: true,
              centerTitle: false,
              title: Text(
                "facebook",
                style: const TextStyle(
                  color: Constants.facebookBlue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
              ),
              actions: [
                CircleButton(
                  icon: Icons.search,
                  onPressed: () {},
                  iconSize: 30.0,
                ),
                CircleButton(
                  icon: Mdi.facebookMessenger,
                  onPressed: () {},
                  iconSize: 30.0,
                ),
              ],
            ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(
                currentUser: currentUser,
                stories: stories,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final Post post = posts[index];
                  return PostContainer(
                    post: post,
                  );
                },
                childCount: posts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const _HomeScreenDesktop({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        Container(
          width: 600.0,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    currentUser: currentUser,
                    stories: stories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final Post post = posts[index];
                      return PostContainer(
                        post: post,
                      );
                    },
                    childCount: posts.length,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ContactsList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}
