import 'package:ecommerce_mobile/bloc/authentication/authentication_event.dart';
import 'package:ecommerce_mobile/bloc/product_type/product_type_bloc.dart';
import 'package:ecommerce_mobile/ui/auth/login_screen.dart';
import 'package:ecommerce_mobile/ui/main/home/home_screen.dart';
import 'package:ecommerce_mobile/ui/main/main_screen.dart';
import 'package:ecommerce_mobile/ui/test_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/brand/brand_bloc.dart';
import 'bloc/counter/counter_bloc.dart';
import 'firebase_options.dart';
import 'res/app_locale.dart';
import 'res/resources.dart';
import 'routes/route_generator.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAuth.instance.setLanguageCode("vn");

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
        BlocProvider<ProductTypeBloc>(
          create: (BuildContext context) => ProductTypeBloc(),
        ),
        BlocProvider<BrandBloc>(
          create: (BuildContext context) => BrandBloc(),
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
    final resource = Resources(context);

    return MaterialApp(
      // initialRoute: SignInScreen.id,
      onGenerateRoute: RouteGenerator().generateRoute,
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      builder: EasyLoading.init(),
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: resource.style.textDefault,
          bodyMedium: resource.style.textDefault,
          bodySmall: resource.style.textDefault,
        ),
      ),
      home: StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _authenticationBloc.add(LoadProfileEvent());
            return new DefaultTextStyle(
              style: resource.style.textDefault,
              child: const MainScreen(),
            );
          }
          return new DefaultTextStyle(
            style: resource.style.textDefault,
            child: const LoginScreen(),
          );
        },
      ),
    );
  }
}
