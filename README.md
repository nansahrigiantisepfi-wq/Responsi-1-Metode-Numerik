
# Responsi 1 Praktikum Metode Numerik

## Deskripsi Proyek

Program ini dibuat untuk menyelesaikan tugas Responsi 1 Praktikum Metode Numerik menggunakan bahasa pemrograman MATLAB/Octave. Program terdiri dari tiga kasus, yaitu perhitungan galat menggunakan Deret Maclaurin, penyelesaian Sistem Persamaan Linier (SPL) menggunakan metode langsung, dan penyelesaian persamaan non-linier menggunakan Metode Biseksi.

Program dirancang untuk melakukan perhitungan numerik secara otomatis, menampilkan hasil pada Command Window, serta menampilkan grafik perbandingan hasil eksak dan hasil pendekatan pada kasus pertama.

## Identitas

- **Nama:** Sepfi Nangsarigianti
- **NIM:** L03252013
- **Mata Kuliah:** Praktikum Metode Numerik
- **Tugas:** Responsi 1
- **Bahasa Pemrograman:** MATLAB/Octave

## Tujuan

1. Memahami penerapan Deret Maclaurin untuk menghampiri fungsi matematika.
2. Menghitung galat mutlak dan rata-rata galat.
3. Menyelesaikan Sistem Persamaan Linier menggunakan metode langsung.
4. Menentukan akar persamaan non-linier menggunakan Metode Biseksi.
5. Menerapkan konsep metode numerik ke dalam program komputer.
6. Menampilkan hasil perhitungan secara sistematis.

## Pembahasan Program

### 1. Kasus 1 — Galat dan Deret Maclaurin

Kasus pertama membandingkan hasil perhitungan eksak dengan hasil pendekatan menggunakan Deret Maclaurin. Program menghitung fungsi tinggi gelombang berdasarkan parameter yang telah ditentukan.

**Parameter yang digunakan:**

- Lambda (\(\lambda\)) = 12
- Kecepatan (\(v\)) = 36
- Parameter \(x\) = 10
- Tinggi awal (\(h_0\)) = 5
- Rentang waktu \(t\) = 0 sampai 5
- Jumlah titik waktu = 100

**Persamaan nilai eksak:**

\[
h(t)=h_0\left[\cos\left(\frac{tv}{\lambda}\right)+e^x\right]
\]

**Deret Maclaurin fungsi cosinus:**

\[
\cos(z)=\sum_{k=0}^{n}\frac{(-1)^kz^{2k}}{(2k)!}
\]

**Deret Maclaurin fungsi eksponensial:**

\[
e^x=\sum_{k=0}^{n}\frac{x^k}{k!}
\]

Program menghitung pendekatan dengan \(n=23\), \(n=24\), dan \(n=25\). Selanjutnya, galat mutlak dihitung menggunakan persamaan:

\[
E=\left|h_{\text{eksak}}-h_{\text{pendekatan}}\right|
\]

Rata-rata galat dihitung menggunakan fungsi `mean()` untuk seluruh titik waktu.

**Output yang dihasilkan:**

- Rata-rata galat mutlak untuk \(n=23\).
- Rata-rata galat mutlak untuk \(n=24\).
- Rata-rata galat mutlak untuk \(n=25\).
- Grafik perbandingan hasil eksak dan hasil pendekatan Deret Maclaurin.

### 2. Kasus 2 — Sistem Persamaan Linier (SPL)

Kasus kedua menyelesaikan permasalahan penentuan harga bahan makanan per kilogram berdasarkan data pembelian empat orang, yaitu Adel, Briza, Caca, dan Dinda.

Variabel yang digunakan:

- \(x_1\) = harga beras per kilogram.
- \(x_2\) = harga telur per kilogram.
- \(x_3\) = harga tepung per kilogram.
- \(x_4\) = harga ayam per kilogram.

Sistem persamaan disusun dalam bentuk matriks:

\[
AX=B
\]

Matriks koefisien:

\[
A=
\begin{bmatrix}
2.5&1.5&5.0&0.5\\
4.0&0.75&1.0&2.0\\
2.0&1.5&0.5&6.0\\
1.0&4.25&2.0&0.9
\end{bmatrix}
\]

Vektor konstanta:

\[
B=
\begin{bmatrix}
161000\\
149000\\
251500\\
173000
\end{bmatrix}
\]

Program menyelesaikan sistem persamaan menggunakan operator backslash (`\`) pada MATLAB/Octave:

```matlab
harga_bahan = A \ B;
```

Operator tersebut digunakan untuk mendapatkan solusi sistem persamaan linier secara langsung.

**Output yang dihasilkan:**

- Harga beras per kilogram.
- Harga telur per kilogram.
- Harga tepung per kilogram.
- Harga ayam per kilogram.

Hasil perhitungan ditampilkan dalam satuan rupiah dengan dua angka di belakang koma.

### 3. Kasus 3 — Persamaan Non-Linier Metode Biseksi

Kasus ketiga menggunakan Metode Biseksi untuk menentukan akar persamaan non-linier.

Fungsi yang digunakan:

\[
f(r)=4\pi r^3-900
\]

**Parameter yang digunakan:**

- Batas bawah awal (\(x_l\)) = 1.
- Batas atas awal (\(x_u\)) = 5.
- Toleransi galat = \(10^{-6}\).
- Iterasi maksimum = 100.

**Tahapan perhitungan:**

1. Mendefinisikan fungsi non-linier.
2. Menentukan batas bawah dan batas atas.
3. Memeriksa apakah interval awal mengapit akar.
4. Menghitung titik tengah interval.
5. Mengevaluasi nilai fungsi pada titik tengah.
6. Memperbarui interval berdasarkan tanda hasil evaluasi fungsi.
7. Mengulangi proses hingga toleransi terpenuhi atau iterasi maksimum tercapai.

Titik tengah interval dihitung menggunakan rumus:

\[
r_m=\frac{x_l+x_u}{2}
\]

Proses dihentikan ketika:

\[
\frac{x_u-x_l}{2}\leq10^{-6}
\]

Program kemudian menghitung volume menggunakan rumus yang tercantum dalam kode:

\[
V_{\text{luar}}=\frac{2}{3}\pi r^3
\]

**Output yang dihasilkan:**

- Nilai jari-jari hasil pendekatan dalam cm.
- Volume tabung di luar bola dalam cm³.
- Jumlah iterasi Metode Biseksi.

## Teknologi dan Fungsi yang Digunakan

Program menggunakan MATLAB/Octave dan memanfaatkan beberapa fungsi berikut:

| Fungsi/Operator | Kegunaan |
|---|---|
| `clear` | Menghapus variabel dari workspace. |
| `clc` | Membersihkan Command Window. |
| `close all` | Menutup seluruh jendela grafik. |
| `fprintf()` | Menampilkan teks dan hasil perhitungan. |
| `linspace()` | Membuat titik-titik dalam suatu interval. |
| `zeros()` | Membuat array bernilai nol. |
| `factorial()` | Menghitung faktorial. |
| `abs()` | Menghitung nilai mutlak. |
| `mean()` | Menghitung rata-rata galat. |
| `plot()` | Membuat grafik. |
| `A \ B` | Menyelesaikan Sistem Persamaan Linier. |
| `for` dan `while` | Melakukan perulangan. |
| `if` dan `elseif` | Menjalankan percabangan berdasarkan kondisi. |

## Persyaratan Sistem

Untuk menjalankan program, diperlukan:

- MATLAB atau GNU Octave.
- Komputer atau laptop yang dapat menjalankan aplikasi tersebut.
- File program dengan ekstensi `.m`.

GNU Octave dapat diunduh melalui situs resmi: https://octave.org/

MATLAB dapat diakses melalui: https://www.mathworks.com/products/matlab.html

Program menggunakan fungsi dasar MATLAB/Octave sehingga tidak memerlukan library tambahan khusus.

## Cara Menjalankan Program

1. Unduh atau clone repository ini.
2. Buka aplikasi MATLAB atau GNU Octave.
3. Buka folder tempat file program disimpan.
4. Pastikan file program memiliki ekstensi `.m`.
5. Jalankan program melalui Command Window dengan menuliskan nama file tanpa ekstensi `.m`.

Contoh, apabila nama file adalah `RESPONSI_SEPFINANGSARIGIANTI_l03252013.m`:

```matlab
RESPONSI_SEPFINANGSARIGIANTI_l03252013
```

Alternatifnya, buka file pada editor MATLAB/Octave, kemudian klik tombol **Run**.

Setelah program berjalan, hasil ketiga kasus akan ditampilkan pada Command Window. Grafik perbandingan pada Kasus 1 juga akan muncul dalam jendela grafik.

## Hasil yang Diharapkan

Program menghasilkan:

1. Rata-rata galat mutlak dari pendekatan Deret Maclaurin.
2. Grafik perbandingan nilai eksak dan pendekatan.
3. Harga empat jenis bahan makanan berdasarkan penyelesaian SPL.
4. Akar pendekatan persamaan non-linier menggunakan Metode Biseksi.
5. Volume berdasarkan rumus yang digunakan dalam program.
6. Jumlah iterasi yang dilakukan oleh Metode Biseksi.

Nilai numerik aktual diperoleh dengan menjalankan program pada MATLAB atau GNU Octave.

## Kesimpulan

Program Responsi 1 Praktikum Metode Numerik menerapkan tiga metode numerik, yaitu Deret Maclaurin untuk pendekatan fungsi dan perhitungan galat, metode langsung untuk menyelesaikan Sistem Persamaan Linier, serta Metode Biseksi untuk mencari akar persamaan non-linier.

Melalui program ini, konsep matematika dapat diterapkan menjadi algoritma komputasi yang menghasilkan nilai numerik dan visualisasi. Program juga membantu memahami penggunaan perulangan, percabangan, operasi matriks, serta penyajian hasil perhitungan secara sistematis.

## Lisensi

Program ini dibuat untuk keperluan pembelajaran dan penyelesaian tugas Praktikum Metode Numerik.

---

**Responsi 1 Praktikum Metode Numerik | MATLAB/Octave**
