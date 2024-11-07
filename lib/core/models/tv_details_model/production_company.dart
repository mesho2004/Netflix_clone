import 'dart:convert';

class ProductionCompany {
  int? id;
  dynamic logoPath;
  String? name;
  String? originCountry;

  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  factory ProductionCompany.fromMap(Map<String, dynamic> data) {
    return ProductionCompany(
      id: data['id'] as int?,
      logoPath: data['logo_path'] as dynamic,
      name: data['name'] as String?,
      originCountry: data['origin_country'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'logo_path': logoPath,
        'name': name,
        'origin_country': originCountry,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductionCompany].
  factory ProductionCompany.fromJson(String data) {
    return ProductionCompany.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductionCompany] to a JSON string.
  String toJson() => json.encode(toMap());

  ProductionCompany copyWith({
    int? id,
    dynamic logoPath,
    String? name,
    String? originCountry,
  }) {
    return ProductionCompany(
      id: id ?? this.id,
      logoPath: logoPath ?? this.logoPath,
      name: name ?? this.name,
      originCountry: originCountry ?? this.originCountry,
    );
  }
}
