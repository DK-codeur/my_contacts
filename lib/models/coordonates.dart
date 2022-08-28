

class Coordinates {
    Coordinates({
        this.latitude,
        this.longitude,
    });

    String? latitude;
    String? longitude;

    factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"] ?? null,
        longitude: json["longitude"] ?? null,
    );

}