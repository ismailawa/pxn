import 'dart:convert';

class Vendor {
  Vendor({
    this.id,
    this.name,
    this.description,
    this.logo,
    this.location,
  });

  final int id;
  final String name;
  final String description;
  final String logo;
  final String location;

  factory Vendor.fromJson(String str) => Vendor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vendor.fromMap(Map<String, dynamic> json) => Vendor(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        logo: json["logo"] == null ? null : json["logo"],
        location: json["location"] == null ? null : json["location"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "logo": logo == null ? null : logo,
        "location": location == null ? null : location,
      };
}
