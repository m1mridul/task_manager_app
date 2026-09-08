import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'task_list_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TaskListScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(child: _buildLogo()),
    );
  }

  Widget _buildLogo() {
    // For SVG asset:
    return SvgPicture.asset(
      'assets/images/book_logo.svg',
      width: 120,
      height: 120,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );
    
    /* For PNG/JPG asset, use:
    return Image.asset(
      'assets/images/pen_logo.png',
      width: 120,
      height: 120,
    );
    */
  }
}