class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    this.id,
    this.name,
    this.imageUrl,
    this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Mentor',
  imageUrl: 'assets/images/MM_LogoRect.png',
  isOnline: true,
);

// USERS
final User doris = User(
  id: 1,
  name: 'Doris Espiritu',
  imageUrl: 'assets/images/dorisimage.jpg',
  isOnline: true,
);
