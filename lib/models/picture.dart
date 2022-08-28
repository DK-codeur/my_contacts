
class Picture {
    Picture({
        this.large,
        this.medium,
        this.thumbnail,
    });

    String? large;
    String? medium;
    String? thumbnail;

    factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"] ?? null,
        medium: json["medium"] ?? null,
        thumbnail: json["thumbnail"] ?? null,
    );

}