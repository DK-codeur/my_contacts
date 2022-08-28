
class Name {
    Name({
        this.title,
        this.first,
        this.last,
    });

    String? title;
    String? first;
    String? last;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"] ?? null,
        first: json["first"] ?? null,
        last: json["last"] ?? null,
    );

}