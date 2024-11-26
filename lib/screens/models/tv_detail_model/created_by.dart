import 'dart:convert';

class CreatedBy {
  int? id;
  String? creditId;
  String? name;
  String? originalName;
  int? gender;
  String? profilePath;

  CreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.originalName,
    this.gender,
    this.profilePath,
  });

  @override
  String toString() {
    return 'CreatedBy(id: $id, creditId: $creditId, name: $name, originalName: $originalName, gender: $gender, profilePath: $profilePath)';
  }

  factory CreatedBy.fromMap(Map<String, dynamic> data) => CreatedBy(
        id: data['id'] as int?,
        creditId: data['credit_id'] as String?,
        name: data['name'] as String?,
        originalName: data['original_name'] as String?,
        gender: data['gender'] as int?,
        profilePath: data['profile_path'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'credit_id': creditId,
        'name': name,
        'original_name': originalName,
        'gender': gender,
        'profile_path': profilePath,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreatedBy].
  factory CreatedBy.fromJson(String data) {
    return CreatedBy.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CreatedBy] to a JSON string.
  String toJson() => json.encode(toMap());

  CreatedBy copyWith({
    int? id,
    String? creditId,
    String? name,
    String? originalName,
    int? gender,
    String? profilePath,
  }) {
    return CreatedBy(
      id: id ?? this.id,
      creditId: creditId ?? this.creditId,
      name: name ?? this.name,
      originalName: originalName ?? this.originalName,
      gender: gender ?? this.gender,
      profilePath: profilePath ?? this.profilePath,
    );
  }
}
