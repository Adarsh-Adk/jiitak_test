import 'package:flutter/material.dart';

import '../../../../core/utils/custom_date_utils.dart';
import '../../../../core/values/app_constants.dart';
import '../../../../model/entities/job_description.dart';
import '../../../widgets/app_padding.dart';

class JobCard extends StatelessWidget {
  final JobDescription jobDescription;
  const JobCard({super.key, required this.jobDescription});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: AppConstants.borderRadius),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: AppConstants.borderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (jobDescription.image != null)
              Image.asset(jobDescription.image!),
            Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    jobDescription.title ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                    maxLines: 2,
                  ),
                  Column(
                    children: [
                      const AppPadding(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (jobDescription.typeOfCare != null)
                            Text(
                              jobDescription.typeOfCare ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                          if (jobDescription.salary != null)
                            Text(
                              "¥ ${jobDescription.salary}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontWeight: FontWeight.w800),
                            ),
                        ],
                      ),
                      const AppPadding(),
                    ],
                  ),
                  if (jobDescription.date != null &&
                      jobDescription.startTime != null &&
                      jobDescription.endTime != null)
                    Text(
                      CustomDateUtils.jobDateToString(
                          date: jobDescription.date!,
                          startTime: jobDescription.startTime!,
                          endTime: jobDescription.endTime!),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  if (jobDescription.address != null)
                    Text(
                      jobDescription.address!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  if (jobDescription.notes != null)
                    Text(
                      jobDescription.notes!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (jobDescription.employer != null)
                        Text(jobDescription.employer!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer
                                        .withOpacity(0.4))),
                      jobDescription.isFavorite == true
                          ? Icon(
                              Icons.favorite,
                              color: Theme.of(context).colorScheme.error,
                            )
                          : Icon(Icons.favorite_border_outlined),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
