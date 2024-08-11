import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pizza/core/utils/network_info.dart';
import 'package:pizza/features/posts/data/data_sources/post_local_data_source.dart';
import 'package:pizza/features/posts/data/data_sources/post_remote_data_source.dart';
import 'package:pizza/features/posts/data/repositories/post_repository_impl_v1.dart';
import 'package:pizza/features/posts/domain/repositories/posts_repo.dart';
import 'package:pizza/features/posts/domain/usecases/addpost.dart';
import 'package:pizza/features/posts/domain/usecases/delete_post.dart';
import 'package:pizza/features/posts/domain/usecases/get_all_posts.dart';
import 'package:pizza/features/posts/domain/usecases/update_post.dart';
import 'package:pizza/features/posts/presentation/bloc/post_add_delete_update_bloc/post_add_delete_update_bloc.dart';
import 'package:pizza/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - posts

// Bloc

  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
      addPost: sl(), updatePost: sl(), deletePost: sl()));

// Usecases

  sl.registerLazySingleton(() => GetPostsUsecase(sl()));
  sl.registerLazySingleton(() => AddPostUsecase(sl()));
  sl.registerLazySingleton(() => DeletePostUsecase(sl()));
  sl.registerLazySingleton(() => UpdatePostUsecase(sl()));

// Repository

  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl());
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));

//! Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

//! External


  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}