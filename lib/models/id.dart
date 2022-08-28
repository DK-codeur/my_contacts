class Id {
    Id({
        this.name,
        this.value,
    });

    String? name;
    String? value;

    factory Id.fromJson(Map<String, dynamic> json) => Id(
        name: json["name"] ?? null,
        value: json["value"] ?? null,
    );
}