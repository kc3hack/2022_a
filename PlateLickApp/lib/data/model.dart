class Model {
  final int id;
  final String imagePath;
  final String name;

  Model({
    required this.id,
    required this.imagePath,
    required this.name,
  });
}

List<Model> navBtn = [
  Model(id: 0, imagePath: 'assets/NavbarIcon/home.png', name: 'Home'),
  Model(id: 1, imagePath: 'assets/NavbarIcon/search.png', name: 'Recipe'),
  Model(id: 2, imagePath: 'assets/NavbarIcon/heart.png', name: 'Like'),
  Model(
      id: 3,
      imagePath: 'assets/NavbarIcon/notification.png',
      name: 'notification'),
  Model(id: 4, imagePath: 'assets/NavbarIcon/user.png', name: 'Profile'),
];
