import 'dart:ui';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  // controllers
  final TextEditingController signInEmail = TextEditingController();
  final TextEditingController signInPassword = TextEditingController();

  final TextEditingController signUpEmail = TextEditingController();
  final TextEditingController signUpPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    signInEmail.dispose();
    signInPassword.dispose();
    signUpEmail.dispose();
    signUpPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              /// 🔵 Background circles
              Align(
                alignment: const AlignmentDirectional(20, -1.2),
                child: _circle(
                    context, Theme.of(context).colorScheme.tertiary),
              ),
              Align(
                alignment: const AlignmentDirectional(-2.7, -1.2),
                child: _circle(
                    context, Theme.of(context).colorScheme.secondary),
              ),
              Align(
                alignment: const AlignmentDirectional(2.7, -1.2),
                child: _circle(
                    context,
                    Theme.of(context).colorScheme.primary,
                    scale: 1.3),
              ),

              /// blur
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(),
              ),

              /// 🔽 Bottom content
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: Column(
                    children: [
                      /// Tabs
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: TabBar(
                          controller: tabController,
                          indicatorColor:
                          Theme.of(context).colorScheme.primary,
                          labelColor:
                          Theme.of(context).colorScheme.onBackground,
                          unselectedLabelColor:
                          Theme.of(context).colorScheme.onBackground,
                          tabs: const [
                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Text("Sign In",
                                  style: TextStyle(fontSize: 18)),
                            ),
                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Text("Sign Up",
                                  style: TextStyle(fontSize: 18)),
                            ),
                          ],
                        ),
                      ),

                      /// Views
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 UI Helpers

  Widget _circle(BuildContext context, Color color, {double scale = 1}) {
    return Container(
      height: MediaQuery.of(context).size.width / scale,
      width: MediaQuery.of(context).size.width / scale,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }




}