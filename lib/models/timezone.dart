class Timezone {
    Timezone({
        this.offset,
        this.description,
    });

    String? offset;
    String? description;

    factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        offset: json["offset"] ?? null,
        description: json["description"] ?? null,
    );

 
}