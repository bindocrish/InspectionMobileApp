
class DateFilterList {
  String? title;
  String? slugName;
  DateTime? startDate;
  DateTime? endDate;

  DateFilterList({
    this.title,
    this.slugName,
    this.startDate,
    this.endDate,
  });

  factory DateFilterList.fromJson(Map<String, dynamic> json) => DateFilterList(
    title: json["title"],
    startDate: json["start_date"] != ""
        ? DateTime.parse(json["start_date"])
        : DateTime.now(),
    slugName: json["slug_name"].toString(),
    endDate: json["end_date"] != ""
        ? DateTime.parse(json["end_date"])
        : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "start_date": startDate,
    "slug_name": slugName,
    "end_date": endDate,
  };
}