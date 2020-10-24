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
  name: 'FPT Center Pet',
  imageUrl: 'lib/assets/rescueCenterLogo.png',
  isOnline: true,
);

final User someOne1 = User(
  id: 1,
  name: 'SomeOne1',
  imageUrl: 'lib/assets/someone1.png',
  isOnline: true,
);

