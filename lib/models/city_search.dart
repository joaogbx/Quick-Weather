class City {
  final String key;
  final String name;
  final String country;
  final String state;

  City({
    required this.key,
    required this.name,
    required this.country,
    required this.state,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      key: json['Key'],
      name: json['LocalizedName'],
      country: json['Country']['LocalizedName'],
      state: json['AdministrativeArea']['LocalizedName'],
    );
  }
}
