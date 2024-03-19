import 'package:ecommerce_mobile/bloc/authentication/authentication_event.dart';
import 'package:ecommerce_mobile/ui/authentication/sign_in_screen.dart';
import 'package:ecommerce_mobile/ui/home/home_screen.dart';
import 'package:ecommerce_mobile/ui/test_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/counter/counter_bloc.dart';
import 'firebase_options.dart';
import 'res/app_locale.dart';
import 'routes/route_generator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  auth = FirebaseAuth.instanceFor(app: app);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (BuildContext context) => CounterBloc(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => AuthenticationBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;
  late AuthenticationBloc _authenticationBloc;
  @override
  void initState() {
    localization.init(
      mapLocales: [
        MapLocale('en', AppLocale.EN),
        MapLocale('vn', AppLocale.VN),
      ],
      initLanguageCode: 'en',
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
    _authenticationBloc = BlocProvider.of(context);
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: SignInScreen.id,
      onGenerateRoute: RouteGenerator().generateRoute,
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      builder: EasyLoading.init(),
      home: StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _authenticationBloc.add(LoadProfileEvent());
            return const HomeScreen();
          }
          return const SignInScreen();
        },
      ),
    );
  }
}
