import '../../core/values/app_assets.dart';
import '../entities/job_description.dart';

class HomePageRepo {
  static List<JobDescription> getJobs() {
    List<JobDescription> jobList = [
      JobDescription(
          id: 1,
          image: AppAssets.homeImage1,
          title: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
          typeOfCare: "介護付き有料老人ホーム",
          salary: 6000.0,
          date: DateTime(2022, 5, 31),
          startTime: DateTime(
            2022,
            5,
            31,
            8,
          ),
          endTime: DateTime(
            2022,
            5,
            31,
            17,
          ),
          address: "北海道札幌市東雲町3丁目916番地17号",
          notes: "交通費 300円",
          employer: "住宅型有料老人ホームひまわり倶楽部",
          isFavorite: false),
      JobDescription(
          id: 2,
          image: AppAssets.homeImage2,
          title: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
          typeOfCare: "介護付き有料老人ホーム",
          salary: 6000.0,
          date: DateTime(2022, 5, 31),
          startTime: DateTime(
            2022,
            5,
            31,
            8,
          ),
          endTime: DateTime(
            2022,
            5,
            31,
            17,
          ),
          address: "北海道札幌市東雲町3丁目916番地17号",
          notes: "交通費 300円",
          employer: "住宅型有料老人ホームひまわり倶楽部",
          isFavorite: true),
      JobDescription(
          id: 3,
          image: AppAssets.homeImage1,
          title: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
          typeOfCare: "介護付き有料老人ホーム",
          salary: 6000.0,
          date: DateTime(2022, 5, 31),
          startTime: DateTime(
            2022,
            5,
            31,
            8,
          ),
          endTime: DateTime(
            2022,
            5,
            31,
            17,
          ),
          address: "北海道札幌市東雲町3丁目916番地17号",
          notes: "交通費 300円",
          employer: "住宅型有料老人ホームひまわり倶楽部",
          isFavorite: true),
      JobDescription(
          id: 4,
          image: AppAssets.homeImage2,
          title: "介護有料老人ホームひまわり倶楽部の介護職／ヘルパー求人（パート／バイト）",
          typeOfCare: "介護付き有料老人ホーム",
          salary: 6000.0,
          date: DateTime(2022, 5, 31),
          startTime: DateTime(
            2022,
            5,
            31,
            8,
          ),
          endTime: DateTime(
            2022,
            5,
            31,
            17,
          ),
          address: "北海道札幌市東雲町3丁目916番地17号",
          notes: "交通費 300円",
          employer: "住宅型有料老人ホームひまわり倶楽部",
          isFavorite: true),
    ];
    return jobList;
  }
}
