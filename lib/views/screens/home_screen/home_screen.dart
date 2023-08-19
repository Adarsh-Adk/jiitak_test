import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../controller/home_date_controller.dart';
import '../../../core/utils/custom_date_utils.dart';
import '../../../core/values/app_assets.dart';
import '../../../core/values/app_constants.dart';
import '../../../core/values/app_strings.dart';
import '../../../model/repository/home_page_repo.dart';
import '../../widgets/app_padding.dart';
import 'widgets/job_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeDateController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Icon(
          MdiIcons.mapMarkerOutline,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: TextFormField(
                      readOnly: true, initialValue: AppStrings.homeAppBarText),
                  actions: [
                    SvgPicture.asset(AppAssets.filterIcon),
                    const SizedBox(
                      width: AppConstants.defaultPadding,
                    ),
                    Icon(
                      Icons.favorite_border_outlined,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(
                      width: AppConstants.defaultPadding,
                    ),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary.withOpacity(0.52)
                    ])),
                    child: Center(
                      child: GetBuilder<HomeDateController>(
                        builder: (_) {
                          return Text(
                            c.getDate(),
                            style: Theme.of(context).textTheme.headlineSmall,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: AppPadding(),
                ),
                SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: CustomDateUtils.getNext7days()
                          .map((e) => InkWell(
                                onTap: () {
                                  c.setDate(e.dateTime!);
                                },
                                child: GetBuilder<HomeDateController>(
                                    builder: (_) {
                                  return Container(
                                    width: 55,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal:
                                            AppConstants.defaultPadding / 4),
                                    padding: const EdgeInsets.all(
                                        AppConstants.defaultPadding / 1),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            AppConstants.cornerRadius),
                                        color: c.dateTime == e.dateTime!
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Theme.of(context)
                                                .colorScheme
                                                .surface),
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            "${e.label}\n${e.date}",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                    fontWeight: FontWeight.w800,
                                                    color: c.dateTime ==
                                                            e.dateTime!
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .surface
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .primaryContainer),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: AppPadding(),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.defaultPadding * 2),
                  sliver: SliverList(
                      delegate: SliverChildListDelegate(HomePageRepo.getJobs()
                          .map((e) => Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: AppConstants.defaultPadding / 2),
                              child: JobCard(jobDescription: e)))
                          .toList())),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
