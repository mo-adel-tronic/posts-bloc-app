import 'package:flutter/material.dart';
import 'package:pizza/features/posts/domain/entities/post.dart';
import 'package:pizza/features/posts/presentation/widgets/post_details_page/post_detail_w.dart';

class PostDetailPage extends StatelessWidget {
  final Post post;
  const PostDetailPage({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: const Text("Post Detail"),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: PostDetailWidget(post: post),
      ),
    );
  }
}