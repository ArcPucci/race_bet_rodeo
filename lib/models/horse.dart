class Horse {
  final int id;
  final String name;
  final int no;
  final bool lastRaceWon;
  final int age;
  final String gender;
  final bool usesBlenders;
  final int win;
  final int lose;
  final String image;

  const Horse({
    required this.id,
    required this.name,
    required this.no,
    required this.lastRaceWon,
    required this.age,
    required this.gender,
    required this.usesBlenders,
    required this.win,
    required this.lose,
    required this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Horse &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          no == other.no &&
          lastRaceWon == other.lastRaceWon &&
          age == other.age &&
          gender == other.gender &&
          usesBlenders == other.usesBlenders &&
          win == other.win &&
          lose == other.lose &&
          image == other.image;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      no.hashCode ^
      lastRaceWon.hashCode ^
      age.hashCode ^
      gender.hashCode ^
      usesBlenders.hashCode ^
      win.hashCode ^
      lose.hashCode ^
      image.hashCode;
}