# Dokumentasi AI Challenge - Minggu 4: Networking & REST API

## 1. AI Prompt
Prompt yang digunakan untuk meng-generate repository layer endpoint `/comments`:
```text
Buatkan repository layer Flutter untuk endpoint GET /comments?postId={id}
dari JSONPlaceholder menggunakan Dio + flutter_riverpod.
Requirements:
- Model Comment dengan fromJson aman null (postId, id, name, email, body).
- CommentRepository dengan method fetchComments(postId) + timeout 10 detik.
- AsyncNotifierProvider dengan penanganan error otomatis (AsyncError)
  dan fungsi pesan error
  ramah pengguna untuk timeout, connection error, 404, dan 500.
- Satu unit test untuk fromJson dengan field yang hilang.
Jelaskan setiap bagian kode dalam komentar.
```

## 2. Implementasi Kode Hasil AI

### A. Model Data (`lib/data/models/comment.dart`)
Memetakan respons JSON dari endpoint `/comments` dengan casting defensif `as String? ?? ''` dan `(json['id'] as num?)?.toInt() ?? 0` untuk mencegah error runtime tipe null.

### B. Repository Layer (`lib/data/repositories/comment_repository.dart`)
Menggunakan Dio instance terpusat dengan parameter `postId` dan timeout 10 detik (`connectTimeout` / `receiveTimeout`).

### C. Provider (`lib/data/comment_providers.dart`)
Menggunakan `FamilyAsyncNotifier` (`AsyncNotifierProviderFamily`) agar dapat memuat komentar secara reaktif berdasarkan parameter `postId`.

### D. Testing (`test/comment_test.dart`)
Menguji deserialisasi saat data API tidak lengkap (missing fields) agar tidak terjadi uncaught exceptions.

## 3. AI Verification Checklist & Temuan

| Checklist | Status | Catatan Verifikasi |
|---|---|---|
| **UI memanggil Dio langsung?** | **Lolos** | UI hanya berinteraksi melalui Riverpod provider dan repository layer. |
| **`fromJson` aman null?** | **Lolos** | Semua field menggunakan cast aman (`as String? ?? ''`, `(json['field'] as num?)?.toInt() ?? 0`). |
| **DioExceptionType dipetakan?** | **Lolos** | Menggunakan `friendlyErrorMessage` terpusat untuk timeout, connection error, bad response 404, 500, dll. |
| **Base URL dan timeout terpusat?** | **Lolos** | Menggunakan `dioProvider` terpusat dari `api_client.dart` dengan override per-request jika diperlukan. |
| **Edge case pada unit test?** | **Lolos** | Menguji field JSON yang kosong/parsial dan pemetaan data normal. |
| **`flutter analyze` & `flutter test`** | **Lolos** | Seluruh kode dianalisis tanpa warning/error dan lulus unit test 100%. |

## 4. Perbaikan dan Penyesuaian Teknis
1. Mengintegrasikan `dioProvider` yang sudah dibuat pada Praktikum 1 agar tidak membuat instance Dio ganda.
2. Menggunakan `friendlyErrorMessage` yang telah direfaktor ke `lib/data/network_errors.dart` demi reusability dan konsistensi pesan UI.
3. Menambahkan pengujian edge case tambahan pada `test/comment_test.dart`.
