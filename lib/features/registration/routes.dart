import 'package:flutter_mobile_template/features/registration/first_vehicle_screen.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> registrationRoutes() {
  return [
    GoRoute(
      path: 'firstVehicle',
      builder: (context, state) => FirstVehiclenScreen(),
    ),
  ];
}
