import 'dart:math';

class Review {
  final String name;
  final String date;
  final double rating;
  final String review;

  Review({
    required this.name,
    required this.date,
    required this.rating,
    required this.review,
  });

  static List<Review> getReview() {
    return [
      Review(
        name: 'Budi Santoso',
        date: '29 Juni 2024',
        rating: 5.0,
        review: 'Pemandangannya luar biasa, sangat memukau!',
      ),
      Review(
        name: 'Ayu Lestari',
        date: '28 Juni 2024',
        rating: 3.0,
        review: 'Pemandangan indah, sangat direkomendasikan!',
      ),
      Review(
        name: 'Dewi Anggraini',
        date: '27 Juni 2024',
        rating: 4.0,
        review: 'Tempat yang sangat cantik, cocok untuk liburan.',
      ),
      Review(
        name: 'Eko Prasetyo',
        date: '26 Juni 2024',
        rating: 5.0,
        review:
            'Sungguh pemandangan yang menakjubkan, saya sangat menikmatinya!',
      ),
      Review(
        name: 'Fitria Sari',
        date: '25 Juni 2024',
        rating: 3.0,
        review: 'Pemandangan bagus, tapi agak ramai.',
      ),
      Review(
        name: 'Gita Permata',
        date: '24 Juni 2024',
        rating: 5.0,
        review: 'Keindahan alam yang luar biasa, sangat memuaskan.',
      ),
      Review(
        name: 'Hendra Saputra',
        date: '23 Juni 2024',
        rating: 4.0,
        review: 'Pemandangan sangat indah, pengalaman tak terlupakan.',
      ),
      Review(
        name: 'Intan Puspita',
        date: '22 Juni 2024',
        rating: 5.0,
        review: 'Destinasi wisata yang sangat indah, recommended!',
      ),
      Review(
        name: 'Joko Susilo',
        date: '21 Juni 2024',
        rating: 3.0,
        review: 'Pemandangan bagus, tapi fasilitas kurang.',
      ),
      Review(
        name: 'Kartika Dewi',
        date: '20 Juni 2024',
        rating: 4.0,
        review: 'Sangat indah, cocok untuk berlibur bersama keluarga.',
      ),
      Review(
        name: 'Lukman Hakim',
        date: '19 Juni 2024',
        rating: 5.0,
        review: 'Luar biasa, pemandangan yang menakjubkan!',
      ),
      Review(
        name: 'Maya Rahayu',
        date: '18 Juni 2024',
        rating: 3.0,
        review: 'Pemandangan yang sangat cantik dan menenangkan.',
      ),
      Review(
        name: 'Nurul Hidayah',
        date: '17 Juni 2024',
        rating: 5.0,
        review: 'Tempat yang sangat indah, sangat direkomendasikan!',
      ),
      Review(
        name: 'Oka Putra',
        date: '16 Juni 2024',
        rating: 4.0,
        review: 'Pemandangan yang luar biasa, sangat memuaskan.',
      ),
      Review(
        name: 'Putu Widiastuti',
        date: '15 Juni 2024',
        rating: 3.0,
        review: 'Keindahan alam yang memukau, sangat menyenangkan.',
      ),
      Review(
        name: 'Qori Rahma',
        date: '14 Juni 2024',
        rating: 4.0,
        review: 'Tempat yang sangat cantik, pengalaman yang menyenangkan.',
      ),
      Review(
        name: 'Rizky Ardiansyah',
        date: '13 Juni 2024',
        rating: 5.0,
        review: 'Sungguh pemandangan yang indah, sangat memuaskan!',
      ),
      Review(
        name: 'Siti Aminah',
        date: '12 Juni 2024',
        rating: 3.0,
        review: 'Pemandangan yang luar biasa, sangat menyenangkan.',
      ),
      Review(
        name: 'Taufik Hidayat',
        date: '11 Juni 2024',
        rating: 5.0,
        review: 'Tempat yang sangat indah, sangat memuaskan.',
      ),
      Review(
        name: 'Umi Salamah',
        date: '10 Juni 2024',
        rating: 4.0,
        review: 'Pemandangan yang cantik, sangat direkomendasikan.',
      ),
    ];
  }

  static List<Review> getRandomReviews(int count) {
    List<Review> reviews = getReview();
    reviews.shuffle(Random());
    return reviews.take(count).toList();
  }
}
