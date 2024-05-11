import 'package:go_router/go_router.dart';
import 'package:toad_app/app/features/home/ui/add_task_screen.dart';
import 'package:toad_app/app/features/home/ui/edit_task_screen.dart';
import 'package:toad_app/app/features/home/ui/home_screen.dart';

class AppRoutes {
  static List<GoRoute> routes = [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/addTask',
      name: 'addTAsk',
      builder: (context, state) => const AddTaskScreen(),
    ),
    GoRoute(
      path: '/editTask',
      name: 'editTask',
      builder: (context, state) => const EditTaskScreen(),
    ),
  ];
}
