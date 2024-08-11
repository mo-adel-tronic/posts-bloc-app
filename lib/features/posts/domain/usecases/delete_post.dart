import 'package:dartz/dartz.dart';
import 'package:pizza/core/utils/errors.dart';
import 'package:pizza/features/posts/domain/repositories/posts_repo.dart';

class DeletePostUsecase {
  final PostsRepository repository;

  DeletePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int postId) async {
    return await repository.deletePost(postId);
  }
}