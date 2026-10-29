% =========================================================================
% PROGRAM UTAMA: RESPONSI 1 PRAKTIKUM METODE NUMERIK
% Nama Program : Responsi1_Lengkap.m
% Deskripsi    : Menyelesaikan Kasus 1 (Galat), Kasus 2 (SPL), dan
%                Kasus 3 (Persamaan Non-Linier) menggunakan GNU Octave.
% =========================================================================

clear; clc; close all;

fprintf('=========================================================\n');
fprintf('       EKsekusi PROGRAM RESPONSI 1 METODE NUMERIK        \n');
fprintf('=========================================================\n\n');

%% =========================================================================
% KASUS 1: GALAT DAN DERET TAYLOR / MACLAURIN
% =========================================================================
fprintf('--- MENJALANKAN KASUS 1: Galat & Deret Maclaurin ---\n');

% 1. Inisialisasi Parameter Kasus 1
lambda = 12;
v = 36;
x = 10;
h0 = 5;
t = linspace(0, 5, 100); % Rentang waktu 0 sampai 5 dengan 100 titik diskrit

% 2. Perhitungan Eksak (Menggunakan fungsi bawaan Octave)
h_eksak = h0 .* (cos((t * v) / lambda) + exp(x));

% 3. Fungsi Pendekatan Deret Maclaurin untuk Suku n = 23, 24, 25
% Inisialisasi matriks penampung hasil
h_n23 = zeros(size(t));
h_n24 = zeros(size(t));
h_n25 = zeros(size(t));

% Looping untuk setiap titik waktu t
for i = 1:length(t)
    ti = t(i);

    % --- Pendekatan cos(x_cos) menggunakan Deret Maclaurin ---
    % x_cos = (ti * v) / lambda
    x_cos = (ti * v) / lambda;

    sum_cos_23 = 0; sum_cos_24 = 0; sum_cos_25 = 0;
    for k = 0:25
        term = ((-1)^k * (x_cos^(2*k))) / factorial(2*k);
        if k <= 23, sum_cos_23 = sum_cos_23 + term; end
        if k <= 24, sum_cos_24 = sum_cos_24 + term; end
        if k <= 25, sum_cos_25 = sum_cos_25 + term; end
    end

    % --- Pendekatan exp(x) menggunakan Deret Maclaurin ---
    sum_exp_23 = 0; sum_exp_24 = 0; sum_exp_25 = 0;
    for k = 0:25
        term = (x^k) / factorial(k);
        if k <= 23, sum_exp_23 = sum_exp_23 + term; end
        if k <= 24, sum_exp_24 = sum_exp_24 + term; end
        if k <= 25, sum_exp_25 = sum_exp_25 + term; end
    end

    % Menghitung nilai h pendekatan
    h_n23(i) = h0 * (sum_cos_23 + sum_exp_23);
    h_n24(i) = h0 * (sum_cos_24 + sum_exp_24);
    h_n25(i) = h0 * (sum_cos_25 + sum_exp_25);
end

% 4. Perhitungan Galat Mutlak dan Rerata Galat
galat_23 = abs(h_eksak - h_n23);
galat_24 = abs(h_eksak - h_n24);
galat_25 = abs(h_eksak - h_n25);

rerata_galat_23 = mean(galat_23);
rerata_galat_24 = mean(galat_24);
rerata_galat_25 = mean(galat_25);

fprintf('Rerata Galat Mutlak (n=23) : %.6f\n', rerata_galat_23);
fprintf('Rerata Galat Mutlak (n=24) : %.6f\n', rerata_galat_24);
fprintf('Rerata Galat Mutlak (n=25) : %.6f\n\n', rerata_galat_25);

% 5. Visualisasi Grafik Kasus 1
figure('Name', 'Kasus 1: Perbandingan Gelombang Air Laut', 'Color', 'white');
plot(t, h_eksak, 'k-', 'LineWidth', 2); hold on;
plot(t, h_n23, 'r--', 'LineWidth', 1.5);
plot(t, h_n24, 'g-.', 'LineWidth', 1.5);
plot(t, h_n25, 'b:', 'LineWidth', 1.5);
xlabel('Waktu (t)');
ylabel('Tinggi Gelombang (h)');
title('Perbandingan Perhitungan Eksak dan Pendekatan Deret Maclaurin');
legend('Eksak', 'n = 23', 'n = 24', 'n = 25', 'Location', 'northwest');
grid on; hold off;


%% =========================================================================
% KASUS 2: SISTEM PERSAMAAN LINIER (SPL) METODE LANGSUNG
% =========================================================================
fprintf('--- MENJALANKAN KASUS 2: SPL Metode Langsung ---\n');

% Penyusunan Matriks Koefisien (A) dan Vektor Konstanta (B)
% Setelah konversi satuan ke Kilogram (kg):
% x1 = Beras, x2 = Telur, x3 = Tepung, x4 = Ayam
A = [2.5, 1.5, 5.0, 0.5;   % Adel
     4.0, 0.75, 1.0, 2.0;   % Briza (40 hg = 4 kg)
     2.0, 1.5,  0.5, 6.0;   % Caca  (2000g=2kg, 15hg=1.5kg, 50dag=0.5kg, 6000g=6kg)
     1.0, 4.25, 2.0, 0.9];  % Dinda (4250g=4.25kg, 20hg=2kg, 9hg=0.9kg)

B = [161000;
     149000;
     251500;
     173000];

% Menyelesaikan SPL menggunakan Metode Langsung (Operator Backslash / Eliminasi Gauss)
harga_bahan = A \ B;

fprintf('Hasil Harga Bahan Makanan per Kilogram:\n');
fprintf('  - Harga Beras (x1)  : Rp %.2f\n', harga_bahan(1));
fprintf('  - Harga Telur (x2)  : Rp %.2f\n', harga_bahan(2));
fprintf('  - Harga Tepung (x3) : Rp %.2f\n', harga_bahan(3));
fprintf('  - Harga Ayam (x4)   : Rp %.2f\n\n', harga_bahan(4));


%% =========================================================================
% KASUS 3: PERSAMAAN NON-LINIER (METODE BISEKSI)
% =========================================================================
fprintf('--- MENJALANKAN KASUS 3: Persamaan Non-Linier (Biseksi) ---\n');

% 1. Definisi Fungsi Non-Linier f(r) = 4*pi*r^3 - 900 = 0
f = @(r) 4 * pi * r^3 - 900;

% 2. Menentukan Batas Awal (Berdasarkan analisis grafik f(r))
% Misal ambil interval awal xl = 1 dan xu = 5
xl = 1;
xu = 5;

% Pengecekan awal syarat biseksi
if f(xl) * f(xu) > 0
    error('Interval awal tidak mengapit akar! Silakan ganti nilai xl dan xu.');
end

% 3. Algoritma Metode Biseksi
tol = 1e-6;   % Toleransi error
max_iter = 100;
iter = 0;
r_akar = 0;

while (xu - xl) / 2 > tol && iter < max_iter
    iter = iter + 1;
    r_akar = (xl + xu) / 2;

    if f(r_akar) == 0
        break; % Akar pas ditemukan
    elseif f(xl) * f(r_akar) < 0
        xu = r_akar;
    else
        xl = r_akar;
    end
end

% 4. Menghitung Volume Tabung di Luar Bola
% V_luar = (2/3) * pi * r^3
v_luar = (2/3) * pi * (r_akar^3);

fprintf('Hasil Perhitungan Kasus 3:\n');
fprintf('  - Jari-jari (r) bola/tabung : %.4f cm\n', r_akar);
fprintf('  - Volume Tabung di Luar Bola : %.4f cm^3\n', v_luar);
fprintf('  - Jumlah Iterasi Biseksi     : %d\n', iter);
fprintf('=========================================================\n');
