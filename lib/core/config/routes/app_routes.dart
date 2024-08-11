import 'package:flutter/material.dart';
import 'package:pizza/core/config/routes/routes_name.dart';
import 'package:pizza/features/posts/presentation/pages/post_add_update_page.dart';
import 'package:pizza/features/posts/presentation/pages/posts_pages.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppCharRoute.posts:
        return MaterialPageRoute(builder: (_) => const PostsPage());
      case AppCharRoute.addOrUpdate:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(builder: (_) => PostAddUpdatePage(
          isUpdatePost: args?['isUpdatePost'] ?? false,
          post: args?['post'],
          ));
    }
    return null;
  }
}