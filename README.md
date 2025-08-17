# 📱 Suitmedia Mobile Test - Flutter  

## 📌 Deskripsi Proyek  
Project **Suitmedia Mobile Test** ini merupakan tugas individu sebagai bagian dari **test magang berdampak di Suitmedia**.  
Aplikasi ini dibuat menggunakan **Flutter** dengan state management **Provider**, integrasi API eksternal, serta navigasi multi-screen.  

### 📝 Ringkasan Fitur  
1. **First Screen**  
   - Input nama user.  
   - Input kata untuk diperiksa apakah **palindrome** atau tidak.  
   - Tombol untuk memeriksa palindrome.  
   - Tombol untuk melanjutkan ke halaman berikutnya.  

2. **Second Screen**  
   - Menampilkan sapaan kepada nama user dari halaman pertama.  
   - Menampilkan **nama user yang dipilih** dari halaman ketiga.  
     - Jika belum memilih user → tampil pesan “Pilih user terlebih dahulu”.  
     - Jika sudah memilih → tampil nama user terpilih.  
   - Tombol navigasi menuju halaman ketiga untuk memilih user.  

3. **Third Screen**  
   - Mengambil data akun dari API **reqres.in**.  
   - Menampilkan daftar user berupa **nama dan email**.  
   - User yang dipilih akan ditampilkan di halaman kedua.  

🔄 Setiap halaman memiliki:  
- Navigasi untuk kembali ke halaman sebelumnya.  
- Indikator posisi halaman.  

## ⚙️ Teknologi yang Digunakan  
- **Framework**: Flutter  
- **Bahasa Pemrograman**: Dart  
- **State Management**: Provider  
- **API**: reqres.in  
- **Tools**: Android Studio / VS Code, Git  

## 🎯 Tujuan  
1. Menguji kemampuan membuat aplikasi Flutter dengan navigasi multi-screen.  
2. Mengimplementasikan **state management** (Provider) untuk pengelolaan data.  
3. Mengintegrasikan API eksternal (reqres.in) untuk menampilkan data user.  
4. Membuat fitur logika sederhana (palindrome checker).  
