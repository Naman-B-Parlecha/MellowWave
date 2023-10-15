// List<String> categories = [
//   'Lofi Girl',
//   'Popular',
//   'Chillhop',
//   'Jazzhop',
//   'Ambient Lo-fi',
//   'Lofi Hip Hop',
//   'Electronic Lo-fi',
//   'Instrumental\nLo-Fi'
// ];
// List<String> catimages = [
//   "assets/images/lofigirl.jpg",
//   "assets/images/popular.png",
//   "assets/images/chillhop.jpg",
//   "assets/images/Jazzhop.jpg",
//   "assets/images/ambient.jpg",
//   "assets/images/HipHop.jpg",
//   "assets/images/electronic.jpg",
//   "assets/images/instrumental.jpg"
// ];

class CategoryList {
  CategoryList(
      {required this.name, required this.image, required this.playlist});
  String name;
  String image;
  String playlist;
}

List<CategoryList> catlist = [
  CategoryList(
      name: 'Lofi Girl',
      image: 'assets/images/lofigirl.jpg',
      playlist: '0vvXsWCC9xrXsKd4FyS8kM'),
  CategoryList(
      name: 'Popular',
      image: 'assets/images/popular.png',
      playlist: '1HVP7E8RkpieiGSxvATJbU'),
  CategoryList(
      name: 'ChillHop',
      image: 'assets/images/chillhop.jpg',
      playlist: '4lipzgtz9pwpGFCgyMO8sK'),
  CategoryList(
      name: 'JazzHop',
      image: 'assets/images/Jazzhop.jpg',
      playlist: '2Al9G2jrWkwDlRFMZaw1GX'),
  CategoryList(
      name: 'Ambient Lo-fi',
      image: 'assets/images/ambient.jpg',
      playlist: '4eWBwGl0c5wtp6k5Krp6My'),
  CategoryList(
      name: 'HipHop',
      image: 'assets/images/HipHop.jpg',
      playlist: '3BOxfexQyBa1tsEZ1tJFVQ'),
  CategoryList(
      name: 'Electronic Lo-Fi',
      image: 'assets/images/electronic.jpg',
      playlist: '10M75TUt3X1qbBhpuEw6el'),
  CategoryList(
      name: 'Instrumental Lo-fi',
      image: 'assets/images/instrumental.jpg',
      playlist: '4DvDLiZxLeUHWMErYhncB5'),
];
