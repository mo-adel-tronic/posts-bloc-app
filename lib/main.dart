import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza/core/config/routes/app_routes.dart';
import 'package:pizza/features/posts/presentation/bloc/post_add_delete_update_bloc/post_add_delete_update_bloc.dart';
import 'package:pizza/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:pizza/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(DevicePreview(builder: (context) => MyApp(
    appRouter: AppRouter(),
  )));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({
    super.key,
    required this.appRouter,
  });
  @override
  Widget build (BuildContext context) {
    return MultiBlocProvider(
      providers: [
          BlocProvider(
              create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())
          ),
          BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: DevicePreview.appBuilder,
          onGenerateRoute: appRouter.generateRoute,
        )
    );
  }
}