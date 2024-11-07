import 'dart:convert';

class LastEpisodeToAir {
  int? id;
  String? name;
  String? overview;
  int? voteAverage;
  int? voteCount;
  String? airDate;
  int? episodeNumber;
  String? episodeType;
  String? productionCode;
  int? runtime;
  int? seasonNumber;
  int? showId;
  dynamic stillPath;

  LastEpisodeToAir({
    this.id,
    this.name,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
  });

  factory LastEpisodeToAir.fromMap(Map<String, dynamic> data) {
    return LastEpisodeToAir(
      id: data['id'] as int?,
      name: data['name'] as String?,
      overview: data['overview'] as String?,
      voteAverage: data['vote_average'] as int?,
      voteCount: data['vote_count'] as int?,
      airDate: data['air_date'] as String?,
      episodeNumber: data['episode_number'] as int?,
      episodeType: data['episode_type'] as String?,
      productionCode: data['production_code'] as String?,
      runtime: data['runtime'] as int?,
      seasonNumber: data['season_number'] as int?,
      showId: data['show_id'] as int?,
      stillPath: data['still_path'] as dynamic,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'overview': overview,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'air_date': airDate,
        'episode_number': episodeNumber,
        'episode_type': episodeType,
        'production_code': productionCode,
        'runtime': runtime,
        'season_number': seasonNumber,
        'show_id': showId,
        'still_path': stillPath,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [LastEpisodeToAir].
  factory LastEpisodeToAir.fromJson(String data) {
    return LastEpisodeToAir.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [LastEpisodeToAir] to a JSON string.
  String toJson() => json.encode(toMap());

  LastEpisodeToAir copyWith({
    int? id,
    String? name,
    String? overview,
    int? voteAverage,
    int? voteCount,
    String? airDate,
    int? episodeNumber,
    String? episodeType,
    String? productionCode,
    int? runtime,
    int? seasonNumber,
    int? showId,
    dynamic stillPath,
  }) {
    return LastEpisodeToAir(
      id: id ?? this.id,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      airDate: airDate ?? this.airDate,
      episodeNumber: episodeNumber ?? this.episodeNumber,
      episodeType: episodeType ?? this.episodeType,
      productionCode: productionCode ?? this.productionCode,
      runtime: runtime ?? this.runtime,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      showId: showId ?? this.showId,
      stillPath: stillPath ?? this.stillPath,
    );
  }
}
