import 'package:evently/ui/screens/add_event/add_event.dart';
import 'package:evently/ui/screens/home/home.dart';
import 'package:evently/ui/screens/login/login.dart';
import 'package:evently/ui/screens/onboarding/onboarding.dart';
import 'package:evently/ui/screens/register/register.dart';
import 'package:flutter/material.dart';

abstract final class AppRoutes {
  static Route get onboarding {
    return MaterialPageRoute(builder: (_) => const Onboarding());
  }

  static Route get login {
    return MaterialPageRoute(builder: (_) => const Login());
  }

  static Route get home {
    return MaterialPageRoute(builder: (_) => const Home());
  }

  static Route get register {
    return MaterialPageRoute(builder: (_) => const Register());
  }

  static Route get addEvent {
    return MaterialPageRoute(builder: (_) => const AddEvent());
  }
}
