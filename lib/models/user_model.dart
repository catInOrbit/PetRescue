

class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({this.id, this.name, this.imageUrl, this.isOnline});
}

//YOU - current CustomElementRegistry
final User currentUser = User(
  id: 0,
  name: 'FPT Pet Center',
  imageUrl: 'assets/rescueCenterLogo.png',
  isOnline: true,
);

final User someOne1 = User(
  id: 1,
  name: 'someOne1',
  imageUrl: 'assets/someone1.png',
  isOnline: true,
);

final User someOne2 = User(
  id: 2,
  name: 'someOne2',
  imageUrl: 'assets/someone2.png',
  isOnline: false
);
