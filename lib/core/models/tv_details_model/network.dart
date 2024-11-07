import 'dart:convert';

class Network {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  Network({this.id, this.logoPath, this.name, this.originCountry});

  factory Network.fromMap(Map<String, dynamic> data) => Network(
        id: data['id'] as int?,
        logoPath: data['logo_path'] as String?,
        name: data['name'] as String?,
        originCountry: data['origin_country'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'logo_path': logoPath,
        'name': name,
        'origin_country': originCountry,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Network].
  factory Network.fromJson(String data) {
    return Network.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Network] to a JSON string.
  String toJson() => json.encode(toMap());

  Network copyWith({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) {
    return Network(
      id: id ?? this.id,
      logoPath: logoPath ?? this.logoPath,
      name: name ?? this.name,
      originCountry: originCountry ?? this.originCountry,
    );
  }
}
