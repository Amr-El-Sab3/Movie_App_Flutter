class DetailsModel {
  bool? adult;
  String? backdropPath;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  DetailsModel({
    this.adult,
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  DetailsModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] ?? false; // Fallback to false if null
    backdropPath = json['backdrop_path'] ?? ''; // Fallback to empty string if null
    budget = json['budget'] ?? 0;
    genres = (json['genres'] as List<dynamic>?)
        ?.map((v) => Genres.fromJson(v))
        .toList() ?? []; // Empty list if null
    homepage = json['homepage'] ?? '';
    id = json['id'] ?? 0;
    imdbId = json['imdb_id'] ?? '';
    originCountry = List<String>.from(json['origin_country'] ?? []);
    originalLanguage = json['original_language'] ?? '';
    originalTitle = json['original_title'] ?? '';
    overview = json['overview'] ?? '';
    popularity = (json['popularity'] as num?)?.toDouble() ?? 0.0;
    posterPath = json['poster_path'] ?? '';
    productionCompanies = (json['production_companies'] as List<dynamic>?)
        ?.map((v) => ProductionCompanies.fromJson(v))
        .toList() ?? [];
    productionCountries = (json['production_countries'] as List<dynamic>?)
        ?.map((v) => ProductionCountries.fromJson(v))
        .toList() ?? [];
    releaseDate = json['release_date'] ?? '';
    revenue = json['revenue'] ?? 0;
    runtime = json['runtime'] ?? 0;
    spokenLanguages = (json['spoken_languages'] as List<dynamic>?)
        ?.map((v) => SpokenLanguages.fromJson(v))
        .toList() ?? [];
    status = json['status'] ?? '';
    tagline = json['tagline'] ?? '';
    title = json['title'] ?? '';
    video = json['video'] ?? false;
    voteAverage = (json['vote_average'] as num?)?.toDouble() ?? 0.0;
    voteCount = json['vote_count'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult ?? false;
    data['backdrop_path'] = backdropPath ?? '';
    data['budget'] = budget ?? 0;
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    data['homepage'] = homepage ?? '';
    data['id'] = id ?? 0;
    data['imdb_id'] = imdbId ?? '';
    data['origin_country'] = originCountry ?? [];
    data['original_language'] = originalLanguage ?? '';
    data['original_title'] = originalTitle ?? '';
    data['overview'] = overview ?? '';
    data['popularity'] = popularity ?? 0.0;
    data['poster_path'] = posterPath ?? '';
    if (productionCompanies != null) {
      data['production_companies'] =
          productionCompanies!.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      data['production_countries'] =
          productionCountries!.map((v) => v.toJson()).toList();
    }
    data['release_date'] = releaseDate ?? '';
    data['revenue'] = revenue ?? 0;
    data['runtime'] = runtime ?? 0;
    if (spokenLanguages != null) {
      data['spoken_languages'] =
          spokenLanguages!.map((v) => v.toJson()).toList();
    }
    data['status'] = status ?? '';
    data['tagline'] = tagline ?? '';
    data['title'] = title ?? '';
    data['video'] = video ?? false;
    data['vote_average'] = voteAverage ?? 0.0;
    data['vote_count'] = voteCount ?? 0;
    return data;
  }
}
class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0; // Provide default value 0 if id is null
    name = json['name'] ?? ''; // Provide default value empty string if name is null
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['name'] = name ?? '';
    return data;
  }
}
class ProductionCompanies {
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  ProductionCompanies.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0; // Default value 0 for id
    logoPath = json['logo_path'] ?? ''; // Default empty string for logoPath
    name = json['name'] ?? ''; // Default empty string for name
    originCountry = json['origin_country'] ?? ''; // Default empty string for originCountry
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? 0;
    data['logo_path'] = logoPath ?? '';
    data['name'] = name ?? '';
    data['origin_country'] = originCountry ?? '';
    return data;
  }
}
class ProductionCountries {
  String? iso31661;
  String? name;

  ProductionCountries({this.iso31661, this.name});

  ProductionCountries.fromJson(Map<String, dynamic> json) {
    iso31661 = json['iso_3166_1'] ?? ''; // Default empty string for iso31661
    name = json['name'] ?? ''; // Default empty string for name
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_3166_1'] = iso31661 ?? '';
    data['name'] = name ?? '';
    return data;
  }
}
class SpokenLanguages {
  String? englishName;
  String? iso6391;
  String? name;

  SpokenLanguages({this.englishName, this.iso6391, this.name});

  SpokenLanguages.fromJson(Map<String, dynamic> json) {
    englishName = json['english_name'] ?? ''; // Default empty string for englishName
    iso6391 = json['iso_639_1'] ?? ''; // Default empty string for iso6391
    name = json['name'] ?? ''; // Default empty string for name
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['english_name'] = englishName ?? '';
    data['iso_639_1'] = iso6391 ?? '';
    data['name'] = name ?? '';
    return data;
  }
}
