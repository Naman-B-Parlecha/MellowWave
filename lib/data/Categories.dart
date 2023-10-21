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
  CategoryList({
    required this.name,
    required this.image,
    required this.playlist,
    // required this.ytlist,
  });
  String name;
  String image;
  String playlist;
  // String ytlist;
}

List<CategoryList> catlist = [
  CategoryList(
    name: 'Lofi Girl',
    image: 'assets/images/lofigirl.jpg',
    // playlist: '65hhA7dhjhBfO6xItDuF95',
    playlist: '0vvXsWCC9xrXsKd4FyS8kM',
    // ytlist: 'PL3kdYPF3fI7Vn-77pzZsnq48ImwQqM8zo',
  ),
  CategoryList(
    name: 'Popular',
    image: 'assets/images/popular.png',
    // playlist: '6VdhMb7toWJYmJdk9CiURj',
    playlist: '1HVP7E8RkpieiGSxvATJbU',
    // ytlist: 'PL3kdYPF3fI7WHaSDVmCxQvECdJ-Ep0A2i',
  ),
  CategoryList(
    name: 'ChillHop',
    image: 'assets/images/chillhop.jpg',
    // playlist: '58YvC6cR5ZIaE2ajMdcqyS',
    playlist: '4lipzgtz9pwpGFCgyMO8sK',
    // ytlist: 'PL3kdYPF3fI7VzOoT8eYdhAS2Nb0anB5YF',
  ),
  CategoryList(
    name: 'JazzHop',
    image: 'assets/images/Jazzhop.jpg',
    // playlist: '0PWk4XGOd8OzC9twFYCvks',
    playlist: '2Al9G2jrWkwDlRFMZaw1GX',
    // ytlist: '',
  ),
  CategoryList(
    name: 'Ambient Lo-fi',
    image: 'assets/images/ambient.jpg',
    // playlist: '12KbCGrgkUqLCLhYvy8lcf',
    playlist: '4eWBwGl0c5wtp6k5Krp6My',
    // ytlist: 'PL3kdYPF3fI7UOtLp0sceeFSnRnIICiCDb',
  ),
  CategoryList(
    name: 'HipHop',
    image: 'assets/images/HipHop.jpg',
    // playlist: '3EhBDWFjL8O3m5SrCcE6ik',
    playlist: '3BOxfexQyBa1tsEZ1tJFVQ',
    // ytlist: '',
  ),
  CategoryList(
    name: 'Electronic Lo-Fi',
    image: 'assets/images/electronic.jpg',
    // playlist: '7LgOuhrUlgy8EC0btsT6I6',
    playlist: '10M75TUt3X1qbBhpuEw6el',
    // ytlist: '',
  ),
  CategoryList(
      name: 'Instrumental Lo-fi',
      image: 'assets/images/instrumental.jpg',
      // playlist: '0aJjUcrrnLxSL3ANCEFRiU',
      playlist: '4DvDLiZxLeUHWMErYhncB5'
      // ytlist: '',
      ),
  CategoryList(
      name: 'Chilling Out',
      image: 'assets/images/chilling.jpg',
      // playlist: '6ZrcD7LvU0LKTAG4iqLpMI',
      playlist: '37i9dQZF1DX32oVqaQE8BM'
      // ytlist: 'PL3kdYPF3fI7UykSgU1tDsU7ojVhHIgUCp',
      )
];
