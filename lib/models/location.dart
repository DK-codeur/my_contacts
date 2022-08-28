import 'coordonates.dart';
import 'street.dart';
import 'timezone.dart';

class Location {
    Location({
        this.street,
        this.city,
        this.state,
        this.country,
        this.postcode,
        this.coordinates,
        this.timezone,
    });

    Street? street;
    String? city;
    String? state;
    String? country;
    String? postcode;
    Coordinates? coordinates;
    Timezone? timezone;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: json["street"] == null ? null : Street.fromJson(json["street"]),
        city: json["city"] ?? null,
        state: json["state"] ?? null,
        country: json["country"] ?? null,
        postcode: json["postcode"].toString(),
        coordinates: json["coordinates"] == null ? null : Coordinates.fromJson(json["coordinates"]),
        timezone: json["timezone"] == null ? null : Timezone.fromJson(json["timezone"]),
    );

 
}