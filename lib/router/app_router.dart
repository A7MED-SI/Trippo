import 'package:flutter/material.dart';
import 'package:trippo/features/city/presentation/screens/city_screen.dart';
import 'package:trippo/features/map/presentation/pages/map_screen.dart';
import 'package:trippo/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:trippo/features/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:trippo/features/authentication/presentation/screens/reset_password_screen.dart';
import 'package:trippo/features/place/presentation/pages/images_screen.dart';
import 'package:trippo/features/place/presentation/pages/place_screen.dart';
import 'package:trippo/features/place/presentation/pages/review_screen.dart';

import '../features/explore/presentation/pages/search_screen.dart';
import '../features/home/presentation/pages/home_screen.dart';
import '../features/plan/presentation/pages/plan_screen.dart';
import '../features/profile/presentation/pages/profile_screen.dart';
import '../features/profile/presentation/pages/setting_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case PlanScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const PlanScreen(),
        );
      case ExploreScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ExploreScreen(),
        );
      case MapScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const MapScreen(),
        );
      case SettingScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const SettingScreen(),
        );
      case ProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case AuthenticationScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const AuthenticationScreen(),
        );
      case ForgotPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordScreen(),
        );
      case ResetPasswordScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        ); case PlaceScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const PlaceScreen(),
        );
      case ReviewsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ReviewsScreen(),
        );
      case ImagesScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const ImagesScreen(),
        );
        case CityScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const CityScreen(),
        );
    }
  }
}
