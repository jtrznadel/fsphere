import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsphere/core/common/views/loading_view.dart';
import 'package:fsphere/core/res/colors.dart';
import 'package:fsphere/core/res/fonts.dart';
import 'package:fsphere/core/res/media_res.dart';
import 'package:fsphere/features/on_boarding/presentation/cubit/cubit/on_boarding_cubit.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const routeName = '/';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    context.read<OnBoardingCubit>().isFirstLaunch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {
          if (state is OnBoardingStatus && !state.isFirstLaunch) {
            Navigator.pushReplacementNamed(context, '/');
          } else if (state is UserSet) {}
        },
        builder: (context, state) {
          if (state is CheckingIfUserIsFirstLauncher ||
              state is SettingFirstLaunch) {
            return const LoadingView();
          }
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                MediaRes.onBoarding,
                fit: BoxFit.cover,
                alignment: const Alignment(-1.25, 1),
              ),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: 'f/',
                              style: TextStyle(
                                fontSize: 32,
                                color: AppColors.primaryColor,
                                fontFamily: Fonts.merriweather,
                              ),
                              children: [
                                TextSpan(
                                  text: 'sphere',
                                  style: TextStyle(
                                    fontSize: 32,
                                    color: AppColors.neutralTextColor,
                                    fontFamily: Fonts.merriweather,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          RichText(
                            text: const TextSpan(
                              text: 'Explore the ',
                              style: TextStyle(
                                fontSize: 64,
                                color: AppColors.neutralTextColor,
                                fontFamily: Fonts.merriweather,
                              ),
                              children: [
                                TextSpan(
                                  text: 'sphere',
                                  style: TextStyle(
                                    fontSize: 64,
                                    color: AppColors.primaryColor,
                                    fontFamily: Fonts.merriweather,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '.',
                                      style: TextStyle(
                                        fontSize: 64,
                                        color: AppColors.neutralTextColor,
                                        fontFamily: Fonts.merriweather,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Capture, Share, Inspire',
                            style: TextStyle(
                              fontSize: 22,
                              color: AppColors.neutralTextColor,
                              fontFamily: Fonts.merriweather,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: OutlinedButton(
                              onPressed: () {
                                context
                                    .read<OnBoardingCubit>()
                                    .setFirstLaunch();
                              },
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                color: AppColors.primaryColor,
                              )),
                              child: const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.neutralTextColor,
                                    fontFamily: Fonts.merriweather,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
