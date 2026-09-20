# Week 4 - Networking & REST API

Project Flutter untuk tugas Codelab Minggu 4: Networking & REST API (Praktikum 1 - 4).

## Fitur Utama
1. **Praktikum 1: Dio & Model Data**
   - Model data [Post](file:///d:/SEMESTER%205/week_4/lib/data/models/post.dart) dengan parsing `fromJson` aman null (defensive casting).
   - Konfigurasi Dio terpusat pada [api_client.dart](file:///d:/SEMESTER%205/week_4/lib/data/api_client.dart) (BaseOptions, timeout 10 detik, LogInterceptor).
   - [PostRepository](file:///d:/SEMESTER%205/week_4/lib/data/repositories/post_repository.dart) sebagai satu-satunya pintu gerbang ke API dummy (JSONPlaceholder).

2. **Praktikum 2: Provider & Error Handling**
   - State management menggunakan `flutter_riverpod` ([providers.dart](file:///d:/SEMESTER%205/week_4/lib/data/providers.dart)) dengan `AsyncNotifier` dan `AsyncValue`.
   - Pemetaan error teknis ke pesan ramah pengguna pada [network_errors.dart](file:///d:/SEMESTER%205/week_4/lib/data/network_errors.dart) (menangani timeout, koneksi terputus, bad response 404, 401/403, 500).
   - UI [PostListPage](file:///d:/SEMESTER%205/week_4/lib/pages/post_list_page.dart) menangani 4 state: loading, error (+ tombol Coba lagi), empty, dan success (pull-to-refresh).

3. **Praktikum 3: Pagination Dasar**
   - Infinite scroll pagination (10 item per halaman) menggunakan query `_page` dan `_limit`.
   - [PagedPostsNotifier](file:///d:/SEMESTER%205/week_4/lib/data/paged_posts.dart) dengan guard ganda pencegah request berulang.
   - UI [PagedPostPage](file:///d:/SEMESTER%205/week_4/lib/pages/paged_post_page.dart) dengan `ScrollController` mendeteksi scroll 200px sebelum ujung bawah serta indikator pemuatan dan pesan akhir data.

4. **Praktikum 4: Refactoring, Testing & AI Challenge**
   - Ekstraksi widget baris post menjadi [PostTile](file:///d:/SEMESTER%205/week_4/lib/pages/widgets/post_tile.dart).
   - Halaman detail post [PostDetailPage](file:///d:/SEMESTER%205/week_4/lib/pages/post_detail_page.dart) dengan rute `GoRouter` (`/post/:id`).
   - Repository layer untuk endpoint `/comments` ([comment.dart](file:///d:/SEMESTER%205/week_4/lib/data/models/comment.dart), [comment_repository.dart](file:///d:/SEMESTER%205/week_4/lib/data/repositories/comment_repository.dart)) beserta dokumentasi [docs/AI_CHALLENGE.md](file:///d:/SEMESTER%205/week_4/docs/AI_CHALLENGE.md).
   - Pengujian unit test otomatis dengan mock repository palsu pada [test/post_test.dart](file:///d:/SEMESTER%205/week_4/test/post_test.dart) dan [test/comment_test.dart](file:///d:/SEMESTER%205/week_4/test/comment_test.dart).

## Struktur Folder
```text
week_4/
├── lib/
│   ├── main.dart
│   ├── router.dart
│   ├── data/
│   │   ├── api_client.dart
│   │   ├── comment_providers.dart
│   │   ├── network_errors.dart
│   │   ├── paged_posts.dart
│   │   ├── providers.dart
│   │   ├── models/
│   │   │   ├── comment.dart
│   │   │   └── post.dart
│   │   └── repositories/
│   │       ├── comment_repository.dart
│   │       └── post_repository.dart
│   └── pages/
│       ├── paged_post_page.dart
│       ├── post_detail_page.dart
│       ├── post_list_page.dart
│       └── widgets/
│           └── post_tile.dart
├── test/
│   ├── comment_test.dart
│   └── post_test.dart
└── docs/
    └── AI_CHALLENGE.md
```

## Cara Menjalankan
1. Masuk ke direktori:
   ```bash
   cd week_4
   ```
2. Jalankan analisis kode:
   ```bash
   flutter analyze
   ```
3. Jalankan pengujian unit test:
   ```bash
   flutter test
   ```
4. Jalankan aplikasi:
   ```bash
   flutter run
   ```
