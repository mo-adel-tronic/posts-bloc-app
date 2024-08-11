import 'package:dartz/dartz.dart';
import 'package:pizza/core/utils/errors.dart';
import 'package:pizza/features/posts/domain/entities/post.dart';
import 'package:pizza/features/posts/domain/repositories/posts_repo.dart';

class GetPostsUsecase {
  final PostsRepository repository;

  GetPostsUsecase(this.repository);

  Future<Either<Failure, List<Post>>> call() async {
    return await repository.getAllPosts();
  }
}