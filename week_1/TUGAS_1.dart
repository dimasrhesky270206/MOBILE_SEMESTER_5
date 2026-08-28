// 1. Fungsi untuk menghitung luas persegi panjang
double hitungLuasPersegiPanjang(double panjang, double lebar) {
  return panjang * lebar;
}

// 2. Class Profil
class Profil {
  String nama;
  String nim;
  String? email; // email boleh kosong (null)

  Profil({
    required this.nama,
    required this.nim,
    this.email,
  });
}

void main() {
  // 3. Memanggil fungsi hitung luas
  double panjang = 10.0;
  double lebar = 5.0;

  double luas = hitungLuasPersegiPanjang(panjang, lebar);

  print("Panjang : $panjang");
  print("Lebar   : $lebar");
  print("Luas    : $luas");

  print("\n-------------------");

  // Memanggil class Profil dengan email
  Profil profil1 = Profil(
    nama: "Dimas Handarhesky",
    nim: "244107020209",
    email: "dimas@gmail.com",
  );

  print("Nama  : ${profil1.nama}");
  print("NIM   : ${profil1.nim}");
  print("Email : ${profil1.email ?? 'Email tidak tersedia'}");

  print("\n-------------------");

  // Profil dengan email kosong
  Profil profil2 = Profil(
    nama: "Dimas Ganjar",
    nim: "244107020201",
  );

  print("Nama  : ${profil2.nama}");
  print("NIM   : ${profil2.nim}");
  print("Email : ${profil2.email ?? 'Email tidak tersedia'}");
}