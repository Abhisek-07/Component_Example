class Option {
  final String name;
  final String icon;

  Option({
    required this.name,
    required this.icon,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      name: json['name'],
      icon: json['icon'],
    );
  }
}
