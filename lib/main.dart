
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/repository/auth/login_http_api_repository.dart';
import 'package:login/repository/auth/login_repository.dart';
import 'bloc/Login/login_bloc.dart';
import 'config/routes/routes.dart';
import 'config/routes/routs_name.dart';

GetIt getIt = GetIt.instance;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // We're using the manual installation on non-web platforms since Google sign in plugin doesn't yet support Dart initialization.
  // See related issue: https://github.com/flutter/flutter/issues/96391

  // We store the app and auth to make testing with a named instance easier.
  await Firebase.initializeApp();
  serviceLocator();
  runApp(const MyApp());
}

void serviceLocator() {
  getIt.registerLazySingleton<LoginRepository>(()=> LoginHttpApiRepository());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> LoginBloc(loginRepository: getIt())),
      ],
      child: MaterialApp(
        title: 'Octel Space',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: Routs.generateRoute,
        //home: const Splashscreen(),
      ),
    );
  }
}
