enum TypeNews {
  latest,
  world,
  business,
  entertainment,
  health,
  science,
  sport,
  technology,
}

extension TypeNewsExtension on TypeNews {
  bool get isLatest => this == TypeNews.latest;
  bool get isWorld => this == TypeNews.world;
  bool get isBusiness => this == TypeNews.business;
  bool get isEntertainment => this == TypeNews.entertainment;
  bool get isHealth => this == TypeNews.health;
  bool get isScience => this == TypeNews.science;
  bool get isSport => this == TypeNews.sport;
  bool get isTechnology => this == TypeNews.technology;
}
