import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/values/app_constants.dart';
import '../../../model/entities/stamp.dart';
import '../../../model/repository/stamp_screen_repo.dart';
import '../../widgets/app_padding.dart';

class StampDetailsScreen extends StatelessWidget {
  const StampDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA8B1FF),
      appBar: AppBar(
        title: Text(
          "スタンプカード詳細",
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFA8B1FF),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.do_not_disturb_on_outlined,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          )
        ],
        leading: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding),
          height: 20,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Color(0xFF949EFF)),
          child: Center(
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {}),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(80, kBottomNavigationBarHeight / 1.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const AppPadding(),
                  Text(
                    "Mer キッチン",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "現在の獲得数  30 個",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w800),
                  ),
                  const AppPadding(),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 700,
          ),
          child: Column(
            children: [
              Flexible(
                child: SingleChildScrollView(
                  primary: true,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.defaultPadding),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: const BorderRadius.only(
                            topLeft:
                                Radius.circular(AppConstants.cornerRadius * 4),
                            topRight: Radius.circular(
                                AppConstants.cornerRadius * 4))),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppConstants.defaultPadding / 2),
                      children: [
                        const AppPadding(
                          multipliedBy: 3,
                        ),
                        Container(
                          constraints: const BoxConstraints(
                              maxHeight: 250, maxWidth: 350),
                          child: ListView.builder(
                              itemCount: 2,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 0,
                                  color: Theme.of(context).colorScheme.surface,
                                  clipBehavior: Clip.hardEdge,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: AppConstants.borderRadius),
                                  child: SizedBox(
                                    width: 250,
                                    height: 150,
                                    child: Center(
                                      child: Wrap(
                                          children: StampScreenRepo.getStars()
                                              .map((e) => SvgPicture.asset(
                                                  StampScreenRepo.getStars()[
                                                      index]))
                                              .toList()),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const AppPadding(),
                        Text("スタンプ獲得履歴",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.w800)),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: StampScreenRepo.getData().length,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              Stamp stamp = StampScreenRepo.getData()[index];
                              return ListTile(
                                title: Text(
                                  "${stamp.dateTime?.year}/${stamp.dateTime?.month}/${stamp.dateTime?.day}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer
                                              .withOpacity(0.4)),
                                ),
                                subtitle: Text(
                                  stamp.description ?? "",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                trailing: Text(
                                  stamp.trailing ?? "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(fontWeight: FontWeight.w800),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
