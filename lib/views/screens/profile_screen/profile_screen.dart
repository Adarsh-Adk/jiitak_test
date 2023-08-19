import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/business_day_controller.dart';
import '../../../controller/business_hour_controller.dart';
import '../../../controller/food_photo_controller.dart';
import '../../../controller/interior_photo_controller.dart';
import '../../../controller/lunch_hour_controller.dart';
import '../../../controller/menu_photo_controller.dart';
import '../../../controller/out_door_photo_controller.dart';
import '../../../core/values/app_assets.dart';
import '../../../core/values/app_constants.dart';
import '../../widgets/app_padding.dart';
import '../stamp_details_screen/components/dismissable_image_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final outDoorController = Get.put(OutDoorPhotoController());
  final interiorController = Get.put(InteriorPhotoController());
  final foodController = Get.put(FoodPhotoController());
  final menuController = Get.put(MenuPhotoController());
  final businessHourController = Get.put(BusinessHourController());
  final lunchHourController = Get.put(LunchHourController());
  final businessDayController = Get.put(BusinessDayController());

  final businessStartTimeController = TextEditingController();
  final businessEndTimeController = TextEditingController();
  final lunchStartTimeController = TextEditingController();
  final lunchEndTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    businessStartTimeController.text =
        "${businessHourController.startTime.hour}:${businessHourController.startTime.minute}";
    businessEndTimeController.text =
        "${businessHourController.endTime.hour}:${businessHourController.endTime.minute}";
    lunchStartTimeController.text =
        "${lunchHourController.startTime.hour}:${lunchHourController.startTime.minute}";
    lunchEndTimeController.text =
        "${lunchHourController.endTime.hour}:${lunchHourController.endTime.minute}";
  }

  @override
  void dispose() {
    super.dispose();
    businessStartTimeController.dispose();
    businessEndTimeController.dispose();
    lunchStartTimeController.dispose();
    lunchEndTimeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
          color:
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3)),
      borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
    );
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding),
          height: 20,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFB8B8B8).withOpacity(0.5)),
          child: Center(
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () {}),
          ),
        ),
        centerTitle: true,
        title: Text(
          "店舗プロフィール編集",
          style: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: Theme.of(context).colorScheme.primaryContainer),
        ),
        actions: [
          SizedBox(
            width: 50,
            height: 50,
            child: Center(
              child: Stack(children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  child: Icon(
                    Icons.notifications_none,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1.5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        "99+",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 9,
                            color: Theme.of(context).colorScheme.onError),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 700,
          ),
          child: ListView(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding),
            children: [
              textWidget(context, label: "店舗名", data: "Mer キッチン"),
              textWidget(context, label: "代表担当者名", data: "林田　絵梨花"),
              textWidget(context, label: "店舗電話番号", data: "123 - 4567 8910"),
              textWidget(context, label: "店舗住所", data: "大分県豊後高田市払田791-13"),
              Image.asset(
                AppAssets.mapImage,
                fit: BoxFit.contain,
              ),
              labelWidget(context, label: "店舗外観", hint: "最大3枚まで"),
              Container(
                constraints:
                    const BoxConstraints(maxHeight: 100, maxWidth: 300),
                child: GetBuilder<OutDoorPhotoController>(builder: (_) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: outDoorController.list.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DisMissableImageWidget(
                                      onPressed: (value) {
                                        outDoorController.remove(value);
                                      },
                                      imagePath: outDoorController.list[index]),
                                )),
                        InkWell(
                          onTap: () => outDoorController.add(),
                          child: Container(
                            width: 90,
                            height: 90,
                            color: Theme.of(context).colorScheme.background,
                            child: const Center(child: Icon(Icons.add)),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              labelWidget(context, label: "店舗内観", hint: "1枚〜3枚ずつ追加してください"),
              Container(
                constraints:
                    const BoxConstraints(maxHeight: 100, maxWidth: 300),
                child: GetBuilder<InteriorPhotoController>(builder: (_) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: interiorController.list.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DisMissableImageWidget(
                                      onPressed: (value) {
                                        interiorController.remove(value);
                                      },
                                      imagePath:
                                          interiorController.list[index]),
                                )),
                        InkWell(
                          onTap: () => interiorController.add(),
                          child: Container(
                            width: 90,
                            height: 90,
                            color: Theme.of(context).colorScheme.background,
                            child: const Center(child: Icon(Icons.add)),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              labelWidget(context, label: "料理写真", hint: "1枚〜3枚ずつ追加してください"),
              Container(
                constraints:
                    const BoxConstraints(maxHeight: 100, maxWidth: 300),
                child: GetBuilder<FoodPhotoController>(builder: (_) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: foodController.list.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DisMissableImageWidget(
                                      onPressed: (value) {
                                        foodController.remove(value);
                                      },
                                      imagePath: foodController.list[index]),
                                )),
                        InkWell(
                          onTap: () => foodController.add(),
                          child: Container(
                            width: 90,
                            height: 90,
                            color: Theme.of(context).colorScheme.background,
                            child: const Center(child: Icon(Icons.add)),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              labelWidget(context, label: "メニュー写真", hint: "1枚〜3枚ずつ追加してください"),
              Container(
                constraints:
                    const BoxConstraints(maxHeight: 100, maxWidth: 300),
                child: GetBuilder<MenuPhotoController>(builder: (_) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: menuController.list.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DisMissableImageWidget(
                                      onPressed: (value) {
                                        menuController.remove(value);
                                      },
                                      imagePath: menuController.list[index]),
                                )),
                        InkWell(
                          onTap: () => menuController.add(),
                          child: Container(
                            width: 90,
                            height: 90,
                            color: Theme.of(context).colorScheme.background,
                            child: const Center(child: Icon(Icons.add)),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              labelWidget(context, label: "営業時間", hint: null),
              Row(
                children: [
                  Expanded(
                    child: GetBuilder<BusinessHourController>(builder: (cont) {
                      businessStartTimeController.text =
                          "${businessHourController.startTime.hour}:${businessHourController.startTime.minute}";

                      return TextFormField(
                        controller: businessStartTimeController,
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context,
                              initialTime: businessHourController.startTime);
                          if (time != null) {
                            businessHourController.setStartTime(time);
                          }
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                            fillColor: Theme.of(context).colorScheme.background,
                            enabledBorder: border,
                            disabledBorder: border,
                            focusedBorder: border,
                            border: border,
                            errorBorder: border.copyWith(
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            focusedErrorBorder: border.copyWith(
                                borderSide:
                                    const BorderSide(color: Colors.red))),
                      );
                    }),
                  ),
                  const Text(" ~ "),
                  Expanded(
                    child: GetBuilder<BusinessHourController>(builder: (_) {
                      businessEndTimeController.text =
                          "${businessHourController.endTime.hour}:${businessHourController.endTime.minute}";

                      return TextFormField(
                        controller: businessEndTimeController,
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context,
                              initialTime: businessHourController.endTime);
                          if (time != null) {
                            businessHourController.setEndTime(time);
                          }
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                            fillColor: Theme.of(context).colorScheme.background,
                            enabledBorder: border,
                            disabledBorder: border,
                            focusedBorder: border,
                            border: border,
                            errorBorder: border.copyWith(
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            focusedErrorBorder: border.copyWith(
                                borderSide:
                                    const BorderSide(color: Colors.red))),
                      );
                    }),
                  ),
                ],
              ),
              const AppPadding(),
              labelWidget(context, label: "ランチ時間", hint: null),
              Row(
                children: [
                  Expanded(
                    child: GetBuilder<LunchHourController>(builder: (_) {
                      lunchStartTimeController.text =
                          "${lunchHourController.startTime.hour}:${lunchHourController.startTime.minute}";

                      return TextFormField(
                        controller: lunchStartTimeController,
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context,
                              initialTime: lunchHourController.startTime);
                          if (time != null) {
                            lunchHourController.setStartTime(time);
                          }
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                            fillColor: Theme.of(context).colorScheme.background,
                            enabledBorder: border,
                            disabledBorder: border,
                            focusedBorder: border,
                            border: border,
                            errorBorder: border.copyWith(
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            focusedErrorBorder: border.copyWith(
                                borderSide:
                                    const BorderSide(color: Colors.red))),
                      );
                    }),
                  ),
                  const Text(" ~ "),
                  Expanded(
                    child: GetBuilder<LunchHourController>(builder: (_) {
                      lunchEndTimeController.text =
                          "${lunchHourController.endTime.hour}:${lunchHourController.endTime.minute}";
                      return TextFormField(
                        controller: lunchEndTimeController,
                        onTap: () async {
                          var time = await showTimePicker(
                              context: context,
                              initialTime: lunchHourController.endTime);
                          if (time != null) {
                            lunchHourController.setEndTime(time);
                          }
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                            fillColor: Theme.of(context).colorScheme.background,
                            enabledBorder: border,
                            disabledBorder: border,
                            focusedBorder: border,
                            border: border,
                            errorBorder: border.copyWith(
                                borderSide:
                                    const BorderSide(color: Colors.red)),
                            focusedErrorBorder: border.copyWith(
                                borderSide:
                                    const BorderSide(color: Colors.red))),
                      );
                    }),
                  ),
                ],
              ),
              const AppPadding(),
              labelWidget(context, label: "予算", hint: null),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.background,
                          enabledBorder: border,
                          disabledBorder: border,
                          focusedBorder: border,
                          border: border,
                          errorBorder: border.copyWith(
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedErrorBorder: border.copyWith(
                              borderSide: const BorderSide(color: Colors.red))),
                      initialValue: "¥ 1,000",
                    ),
                  ),
                  const Text(" ~ "),
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          fillColor: Theme.of(context).colorScheme.background,
                          enabledBorder: border,
                          disabledBorder: border,
                          focusedBorder: border,
                          border: border,
                          errorBorder: border.copyWith(
                              borderSide: const BorderSide(color: Colors.red)),
                          focusedErrorBorder: border.copyWith(
                              borderSide: const BorderSide(color: Colors.red))),
                      initialValue: "¥ 2,000",
                    ),
                  ),
                ],
              ),
              labelWidget(context, label: "定休日*", hint: null),
              GetBuilder<BusinessDayController>(builder: (con) {
                return SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    children: businessDayController.totalList
                        .map((e) => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Checkbox(
                                  value: businessDayController.selectedDays
                                      .contains(e),
                                  onChanged: (v) {
                                    businessDayController.toggle(e);
                                  },
                                  fillColor: MaterialStateProperty.all(
                                      Theme.of(context).colorScheme.background),
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer)),
                                  checkColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                                Text(e.day ?? "")
                              ],
                            ))
                        .toList(),
                  ),
                );
              }),
              textWidget(context, label: "座席数", data: "40席"),
              textWidget(context,
                  label: "キャッチコピー", data: "美味しい！リーズナブルなオムライスランチ！"),
              textWidget(context,
                  label: "来店プレゼント名", data: "いちごクリームアイスクリーム, ジュース"),
              const AppPadding(),
              ElevatedButton(onPressed: () {}, child: const Text("編集を保存"))
            ],
          ),
        ),
      ),
    );
  }

  Row labelWidget(BuildContext context,
      {required String label, required String? hint}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.primaryContainer,
              fontWeight: FontWeight.w700),
        ),
        Text(
          "*",
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: Theme.of(context).colorScheme.error),
        ),
        if (hint != null)
          Text(
            "  ($hint)",
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.6)),
          ),
      ],
    );
  }

  Column textWidget(BuildContext context,
      {required String label, required String data}) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
          color:
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3)),
      borderRadius: BorderRadius.circular(AppConstants.cornerRadius),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    fontWeight: FontWeight.w700)),
            Text(
              "*",
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.error),
            ),
          ],
        ),
        const AppPadding(
          dividedBy: 3,
        ),
        TextFormField(
          decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.background,
              enabledBorder: border,
              disabledBorder: border,
              focusedBorder: border,
              border: border,
              errorBorder: border.copyWith(
                  borderSide: const BorderSide(color: Colors.red)),
              focusedErrorBorder: border.copyWith(
                  borderSide: const BorderSide(color: Colors.red))),
          initialValue: data,
        ),
        const AppPadding(),
      ],
    );
  }
}
