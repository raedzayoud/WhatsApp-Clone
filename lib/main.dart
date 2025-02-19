import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:whatsappclone/core/utlis/router.dart';
import 'package:whatsappclone/feature/authentication/data/repos/authentication_repo_impl.dart';
import 'package:whatsappclone/feature/authentication/presentation/manager/authentication/authentication_cubit.dart';
import 'package:whatsappclone/feature/authentication/presentation/view/login_view.dart';
import 'package:whatsappclone/feature/home/data/repos/chat/chat_repo_impl.dart';
import 'package:whatsappclone/feature/home/data/repos/home/home_repo_impl.dart';
import 'package:whatsappclone/feature/home/presentation/manager/chat_room_cubit/chat_room_cubit.dart';
import 'package:whatsappclone/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:whatsappclone/feature/home/presentation/view/home_view.dart';
import 'package:whatsappclone/feature/splash/presentation/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthenticationCubit(AuthenticationRepoImpl())
              ..checkAuthentication()),
        BlocProvider(create: (context)=>HomeCubit(HomeRepoImpl())),
        BlocProvider(create: (context)=>ChatRoomCubit(ChatRepoImpl())),
      ],
      child: GetMaterialApp(
          initialRoute: '/',
          theme: ThemeData(),
          debugShowCheckedModeBanner: false,
          getPages: AppRouter.getPages,
          home: BlocBuilder<AuthenticationCubit, AuthenticationState>(
              builder: (context, state) {
            if (state is AuthenticationInitial) {
              return const SplashView();
            } else if (state is AuthenticationSuccess) {
              return const HomeView();
            }
            else{
              return const Login();
            }
          })),
    );
  }
}



