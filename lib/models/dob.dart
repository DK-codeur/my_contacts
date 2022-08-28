class Dob {
    Dob({
        this.date,
        this.age,
    });

    DateTime? date;
    int? age;

    factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        age: json["age"] ?? null,
    );
}