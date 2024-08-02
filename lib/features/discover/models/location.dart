import 'package:tourpedia/features/discover/models/position.dart';

class Location {
  String title;
  String place;
  String imageAsset;
  String description;
  Position position;

  Location({
    required this.title,
    required this.place,
    required this.imageAsset,
    required this.description,
    required this.position,
  });

  static List<Location> getLocations() {
    return [
      Location(
        title: 'Gunung Ijen',
        place: 'Banyuwangi',
        imageAsset: 'assets/images/destination/gunung_ijen.webp',
        description:
            "Gunung Ijen di Jawa Timur terkenal dengan danau kawah berwarna biru turqoise yang mempesona dan api birunya yang menyala di malam hari. Destinasi ini menawarkan pengalaman hiking yang menantang serta pemandangan alam yang menakjubkan.",
        position: Position(lat: -8.0563741, long: 114.2401622),
      ),
      Location(
        title: 'Goa Gong',
        place: 'Pacitan',
        imageAsset: 'assets/images/destination/goa_gong_pacitan.webp',
        description:
            'Goa Gong di Pacitan adalah salah satu gua terindah di Indonesia dengan stalaktit dan stalagmit yang spektakuler, serta pencahayaan alami yang memukau. Destinasi ini menawarkan pengalaman eksplorasi bawah tanah yang mempesona bagi para wisatawan.',
        position: Position(lat: -8.1644483, long: 110.9773615),
      ),
      Location(
        title: 'Pantai Kuta',
        place: 'Bali',
        imageAsset: 'assets/images/destination/pantai_kuta.webp',
        description:
            'Pantai Kuta di Bali adalah destinasi wisata populer dengan pasir putih yang indah, ombak yang ideal untuk berselancar, dan pemandangan matahari terbenam yang memukau. Pantai ini juga dikelilingi oleh berbagai restoran, bar, dan pusat perbelanjaan.',
        position: Position(lat: -8.7180325, long: 115.1680346),
      ),
      Location(
        title: 'Candi Borobudur',
        place: 'Magelang',
        imageAsset: 'assets/images/destination/candi_borobudur.webp',
        description:
            'Candi Borobudur adalah kompleks candi Buddha terbesar di dunia, terletak di Jawa Tengah, Indonesia. Dikenal dengan relief-reliefnya yang mengagumkan dan arsitektur monumentalnya, candi ini merupakan warisan budaya dunia yang menarik wisatawan dari seluruh penjuru.',
        position: Position(lat: -7.6078738, long: 110.1992452),
      ),
      Location(
        title: 'Air Terjun Sipisopiso',
        place: 'Sumatera Utara',
        imageAsset: 'assets/images/destination/air_terjun_sipisopiso.webp',
        description:
            'Air Terjun Sipisopiso di Sumatera Utara adalah air terjun tertinggi di Indonesia dengan panorama alam yang menakjubkan. Dikelilingi oleh hamparan perkebunan dan tebing curam, tempat ini menawarkan pemandangan yang memukau bagi pengunjung.',
        position: Position(lat: 2.9164873, long: 98.5169289),
      ),
      Location(
        title: 'Danau Toba',
        place: 'Sumatera Utara',
        imageAsset: 'assets/images/destination/danau_toba.webp',
        description:
            'Danau Toba di Sumatera Utara adalah danau vulkanik terbesar di Indonesia dengan pemandangan alam yang menakjubkan. Pulau Samosir di tengahnya menambah daya tarik wisata yang kaya budaya Batak.',
        position: Position(lat: 2.784459, long: 98.798908),
      ),
      Location(
        title: 'Kepulauan Raja Ampat',
        place: 'Papua Barat Daya',
        imageAsset: 'assets/images/destination/raja_ampat.webp',
        description:
            'Kepulauan Raja Ampat di Papua Barat adalah surga penyelaman dengan keanekaragaman hayati laut yang luar biasa, menawarkan pemandangan karang spektakuler dan pantai berpasir putih yang menakjubkan. Destinasi ini sempurna untuk pecinta alam dan petualang.',
        position: Position(lat: -0.6860, long: 130.2723),
      ),
      Location(
        title: 'Taman Nasional Komodo',
        place: 'Nusa Tenggara Timur',
        imageAsset: 'assets/images/destination/taman_nasional_komodo.webp',
        description:
            'Taman Nasional Komodo di Nusa Tenggara Timur adalah rumah bagi komodo, kadal terbesar di dunia, serta menawarkan keindahan alam yang luar biasa dan spot menyelam kelas dunia. Destinasi ini sempurna untuk petualangan alam dan eksplorasi bawah laut.',
        position: Position(lat: -8.527716, long: 119.4807449),
      ),
      Location(
        title: 'Museum Nasional Indonesia',
        place: 'Jakarta Utara',
        imageAsset: 'assets/images/destination/museum_nasional_indonesia.webp',
        description:
            'Museum Nasional Indonesia di Jakarta menampilkan koleksi artefak bersejarah dan budaya yang kaya, termasuk arca, keramik, dan tekstil. Destinasi ini memberikan wawasan mendalam tentang sejarah dan kebudayaan Indonesia.',
        position: Position(lat: -6.1764021, long: 106.8190152),
      ),
    ];
  }

  static List<Location> getSearchedlocation(String searchText) {
    return Location.getLocations()
        .where((location) => location.title.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }
}
