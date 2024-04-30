import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_today/core/di/app_di.dart';
import 'package:nasa_today/features/apod/presentation/cubit/apod_details_cubit.dart';
import 'package:nasa_today/features/apod/presentation/pages/apod_image_fullscreen_page.dart';
import 'package:nasa_today/features/components/fade_in_text_view.dart';
import 'package:nasa_today/features/components/custom_image_view.dart';
import 'package:nasa_today/features/components/custom_video_view.dart';

const apodImageHeroAnimationTag = 'photeTag';

class ApodDetailsPage extends StatelessWidget {
  const ApodDetailsPage({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => di.get<ApodDetailsCubit>()..getApod(),
          )
        ],
        child: const ApodDetailsPageBody(),
      );
}

class ApodDetailsPageBody extends StatelessWidget {
  const ApodDetailsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocBuilder<ApodDetailsCubit, ApodDetailsState>(builder: (context, state) {
        return switch (state) {
          InitState() => const Center(child: Text('Start loading image..')),
          LoadingState() => const Center(child: CircularProgressIndicator()),
          DataLoadedState() => SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                children: [
                  state.data.isImage
                      ? CustomImageView(
                          imageTag: apodImageHeroAnimationTag,
                          imageHeight: size.height / 2,
                          imageUrl: state.data.url,
                          imageWidth: size.width,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (context) {
                                  return ApodImageFullscreenPage(
                                    imageTag: apodImageHeroAnimationTag,
                                    imageUrl: state.data.url!,
                                    size: size,
                                  );
                                },
                              ),
                            );
                          },
                        )
                      : const CustomVideoView(),
                  if (state.data.explanation case final explenation?) ...{
                    Container(
                      alignment: Alignment.center,
                      // color: Colors.white,
                      padding: EdgeInsets.only(
                        left: size.width * .15,
                        right: size.width * .15,
                        top: size.height * .1,
                      ),
                      child: FadeInTextView(text: explenation),
                    ),
                  },
                ],
              ),
            ),
          ErrorState() => const Center(
              child: Text('''Ops, it seems like error happened while loading image =)'''),
            ),
        };
      }),
    );
  }
}
