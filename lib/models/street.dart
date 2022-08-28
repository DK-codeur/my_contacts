
class Street {
    Street({
        this.number,
        this.name,
    });

    int? number;
    String? name;

    factory Street.fromJson(Map<String, dynamic> json) => Street(
        number: json["number"] ?? null,
        name: json["name"] ?? null,
    );

}