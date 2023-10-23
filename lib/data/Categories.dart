class CategoryList {
  CategoryList({
    required this.name,
    required this.image,
    required this.playlist,
  });
  String name;
  String image;
  String playlist;
}

List<CategoryList> catlist = [
  CategoryList(
    name: 'Lofi Girl',
    image: 'assets/images/lofigirl.jpg',
    playlist: '0vvXsWCC9xrXsKd4FyS8kM',
  ),
  CategoryList(
    name: 'Popular',
    image: 'assets/images/popular.png',
    playlist: '37i9dQZF1DWWQRwui0ExPn',
  ),
  CategoryList(
    name: 'ChillHop',
    image: 'assets/images/chillhop.jpg',
    playlist: '58YvC6cR5ZIaE2ajMdcqyS',
  ),
  CategoryList(
    name: 'JazzHop',
    image: 'assets/images/Jazzhop.jpg',
    playlist: '37i9dQZF1DX0SM0LYsmbMT',
  ),
  CategoryList(
    name: 'Ambient Lo-fi',
    image: 'assets/images/ambient.jpg',
    playlist: '37i9dQZF1DX3Ogo9pFvBkY',
  ),
  CategoryList(
    name: 'HipHop',
    image: 'assets/images/HipHop.jpg',
    playlist: '37i9dQZF1DX36Xw4IJIVKA',
  ),
  CategoryList(
    name: 'Electronic Lo-Fi',
    image: 'assets/images/electronic.jpg',
    playlist: '37i9dQZF1DXdLK5wjKyhVm',
  ),
  CategoryList(
      name: 'Instrumental Lo-fi',
      image: 'assets/images/instrumental.jpg',
      playlist: '37i9dQZF1DX0jgyAiPl8Af'),
  CategoryList(
      name: 'Relaxing',
      image: 'assets/images/chilling.jpg',
      playlist: '37i9dQZF1DX32oVqaQE8BM')
];
