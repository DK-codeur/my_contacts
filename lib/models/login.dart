
class Login {
    Login({
        this.uuid,
        this.username,
        this.password,
        this.salt,
        this.md5,
        this.sha1,
        this.sha256,
    });

    String? uuid;
    String? username;
    String? password;
    String? salt;
    String? md5;
    String? sha1;
    String? sha256;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"] == null ? null : json["uuid"],
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
        salt: json["salt"] == null ? null : json["salt"],
        md5: json["md5"] == null ? null : json["md5"],
        sha1: json["sha1"] == null ? null : json["sha1"],
        sha256: json["sha256"] == null ? null : json["sha256"],
    );

}