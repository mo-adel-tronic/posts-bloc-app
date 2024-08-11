import 'package:dartz/dartz.dart';
import 'package:pizza/core/utils/errors.dart';
import 'package:pizza/features/posts/domain/entities/post.dart';

/* 
! V1
? abstract class PostsRepository {
?  Future<List<Post>> getAllPosts();
?  Future<bool> deletePost(int id);
?  Future<bool> updatePost(Post post);
?  Future<bool> addPost(Post post);
?} 

*/

//! V2

abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> deletePost(int id);
  Future<Either<Failure, Unit>> updatePost(Post post);
  Future<Either<Failure, Unit>> addPost(Post post);
} 