import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pizza/core/utils/constants.dart';
import 'package:pizza/core/utils/errors.dart';
import 'package:pizza/features/posts/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(int postId);
  Future<Unit> updatePost(PostModel postModel);
  Future<Unit> addPost(PostModel postModel);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  late Dio dio;

  PostRemoteDataSourceImpl() {
    BaseOptions options = BaseOptions(
      baseUrl: POSTS_API_BASE_URL,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30)
    );
    dio = Dio(options);
  }
  
  @override
  Future<List<PostModel>> getAllPosts () async {
    Response response = await dio.get("/posts/");
    if(response.statusCode == 200) {
      // [{}, {}] => [PostModel, PostModel]
      final List data = response.data as List;
      return data.map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost (PostModel postModel) async {
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };
    Response response = await dio.post("/posts/", data: body);
    if(response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost (int postId) async {
    Response response = await dio.delete("/posts/${postId.toString()}");
    if(response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost (PostModel postModel) async {
    final postId = postModel.id.toString();
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };
    Response response = await dio.patch("/posts/$postId", data: body);
    if(response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}