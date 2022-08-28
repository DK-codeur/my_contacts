
import 'dob.dart';
import 'id.dart';
import 'location.dart';
import 'login.dart';
import 'name.dart';
import 'picture.dart';

class User {
    User({
        this.gender,
        this.name,
        this.location,
        this.email,
        this.login,
        this.dob,
        this.registered,
        this.phone,
        this.cell,
        this.id,
        this.picture,
        this.nat,
    });

    String? gender;
    Name? name;
    Location? location;
    String? email;
    Login? login;
    Dob? dob;
    Dob? registered;
    String? phone;
    String? cell;
    Id? id;
    Picture? picture;
    String? nat;

    factory User.fromJson(Map<String, dynamic> json) => User(
        gender: json["gender"] ?? null,
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        email: json["email"] ?? null,
        login: json["login"] == null ? null : Login.fromJson(json["login"]),
        dob: json["dob"] == null ? null : Dob.fromJson(json["dob"]),
        registered: json["registered"] == null ? null : Dob.fromJson(json["registered"]),
        phone: json["phone"] ?? null,
        cell: json["cell"] ?? null,
        id: json["id"] == null ? null : Id.fromJson(json["id"]),
        picture: json["picture"] == null ? null : Picture.fromJson(json["picture"]),
        nat: json["nat"] ?? null,
    );

}












