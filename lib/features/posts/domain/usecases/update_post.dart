import 'package:dartz/dartz.dart';
import 'package:pizza/core/utils/errors.dart';
import 'package:pizza/features/posts/domain/entities/post.dart';
import 'package:pizza/features/posts/domain/repositories/posts_repo.dart';

class UpdatePostUsecase {
  final PostsRepository repository;

  UpdatePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.updatePost(post);
  }
}