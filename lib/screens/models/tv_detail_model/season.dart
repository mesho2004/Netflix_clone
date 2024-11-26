import 'dart:convert';

class Season {
  dynamic airDate;
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  dynamic posterPath;
  int? seasonNumber;
  int? voteAverage;

  Season({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });

  @override
  String toString() {
    return 'Season(airDate: $airDate, episodeCount: $episodeCount, id: $id, name: $name, overview: $overview, posterPath: $posterPath, seasonNumber: $seasonNumber, voteAverage: $voteAverage)';
  }

  factory Season.fromMap(Map<String, dynamic> data) => Season(
        airDate: data['air_date'] as dynamic,
        episodeCount: data['episode_count'] as int?,
        id: data['id'] as int?,
        name: data['name'] as String?,
        overview: data['overview'] as String?,
        posterPath: data['poster_path'] as dynamic,
        seasonNumber: data['season_number'] as int?,
        voteAverage: data['vote_average'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'air_date': airDate,
        'episode_count': episodeCount,
        'id': id,
        'name': name,
        'overview': overview,
        'poster_path': posterPath,
        'season_number': seasonNumber,
        'vote_average': voteAverage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Season].
  factory Season.fromJson(String data) {
    return Season.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Season] to a JSON string.
  String toJson() => json.encode(toMap());

  Season copyWith({
    dynamic airDate,
    int? episodeCount,
    int? id,
    String? name,
    String? overview,
    dynamic posterPath,
    int? seasonNumber,
    int? voteAverage,
  }) {
    return Season(
      airDate: airDate ?? this.airDate,
      episodeCount: episodeCount ?? this.episodeCount,
      id: id ?? this.id,
      name: name ?? this.name,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      seasonNumber: seasonNumber ?? this.seasonNumber,
      voteAverage: voteAverage ?? this.voteAverage,
    );
  }
}
