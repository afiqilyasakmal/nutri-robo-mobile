[![Staging](https://github.com/afiqilyasakmal/nutri-robo-mobile/actions/workflows/staging.yml/badge.svg)](https://github.com/afiqilyasakmal/nutri-robo-mobile/actions/workflows/staging.yml)
## Link Tautan APK
## Anggota Kelompok
Anindya Lokeswara - 2106633696 (Home) <br>
Bimo Henokh Barata - 2106752395 (FAQ) <br>
Afiq Ilyasa Akmal - 2106751291 (Blog) <br>
Eldira Lahanny Permata Sherman - 2106640360 (Target Health) <br>
Kathleen Daniella Wijaya - 2106637366 (Tracker) <br>
## Tentang nutri-robo
Nutri-robo merupakan aplikasi yang dibuat dengan tujuan untuk mengusung tema Global Health. Secara garis besar, nutri-robo merupakan sebuah aplikasi yang akan membantu penggunanya untuk meningkatkan kualitas kesehatan masyarakat global dengan cara pemenuhan kebutuhan gizi, olahraga, dan waktu tidur. Nutri-robo akan memberikan suatu target yang sesuai dengan data diri masing-masing pengguna dan target ini perlu dipenuhi agar dapat mencapai kehidupan yang lebih sehat. Tidak berhenti sampai di situ saja, nutri-robo juga akan memberikan rekomendasi terkait makanan, olahraga, dan waktu tidur serta memberikan daily motivation dan feedback bagi pengguna untuk mempertahankan kebiasaan yang sudah baik dan meningkatkan kebiasaan yang masih bisa ditingkatkan. <br>

### Beberapa alasan kelompok kami memutuskan untuk membuat aplikasi nutri-robo antara lain adalah:

Stunting <br>
Terdapat banyak femomena stunting atau gagal tumbuh karena kekurangan gizi di Indonesia. Permasalahan stunting merupakan masalah yang serius karena dapat berdampak pada kualitas Sumber Daya Manusia (SDM). Dampak jangka pendeknya antara lain adalah terganggunya perkembangan otak yang dapat mempengaruhi kecerdasan serta gangguan pertumbuhan fisik dan metabolisme dalam tubuh. Dampak jangka panjang stunting adalah kemampuan kognitif, prestasi belajar, dan sistem kekebalan tubuh menurun, berisiko tinggi untuk terkena penyakit diabetes, jantung, kanker, stroke, dan disabilitas pada usia tua. <br>

Obesitas <br>
Selain masalah stunting, angka obesitas di Indonesia juga cukup tinggi. Data Riskesdas 2018 menunjukkan bahwa 21,8% masyarakat Indonesia mengalami obesitas. Angka ini cukup tinggi jika dibandingkan dengan negara lain. Jika stunting lebih banyak dialami oleh anak-anak dan balita, masalah kelebihan berat badan (obesitas) justru lebih dominan dialami oleh populasi dewasa. Obesitas berisiko 2 kali lipat mengakibatkan terjadinya serangan jantung koroner, stroke, diabetes melitus, dan hipertensi, serta berisiko 3 kali lipat terkena batu empedu. <br>

Dehidrasi <br>
Berdasarkan studi terkini, 46,1% masyarakat Indonesia mengalami dehidrasi ringan. Angka ini sangatlah tinggi sehingga membutuhkan perhatian khusus agar dapat segera ditangani. Saat tubuh tidak mendapatkan air yang cukup, maka seseorang dapat mengalami dehidrasi yang dapat membuat tekanan darah rendah, mual dan muntah, sembelit, sakit kepala, stroke, tidak bertenaga, kulit kering, serta penyakit batu ginjal dan infeksi saluran kencing. <br>

Insomnia <br>
Insomnia merupakan gangguan yang menyebabkan penderitanya sulit tidur sehingga tidak mendapatkan waktu tidur yang cukup. Di Indonesia sendiri, CNN Indonesia menyatakan bahwa penderita insomnia diperkirakan mencapai 10%, yang artinya dari total 238 juta penduduk indonesia, sekitar 23 juta jiwa menderita insomnia. Gangguan ini dapat menyebabkan stroke, penyakit jantung, tekanan darah tinggi, obesitas, penurunan sistem kekebalan tubuh, bahkan gangguan kesehatan mental. <br>

Oleh karena itu, agar tubuh tetap sehat dan terhindar dari berbagai penyakit kronis atau penyakit tidak menular, maka pola hidup masyarakat perlu ditingkatkan ke arah yang lebih sehat dengan konsumsi gizi seimbang serta tidur dan olahraga yang cukup. Dengan demikian, kami berharap dengan adanya aplikasi nutri-robo, kami dapat membantu peningkatan kualitas hidup masyarakat global dengan cara memberi motivasi dan pemahaman mengenai pentingnya pemenuhan gizi dan tidur per hari, serta menjadi asisten kesehatan secara pribadi yang bersifat interaktif dan tidak membosankan. <br>

### Persona
Pengguna <br>
Mengakses akun dan menggunakan fitur-fitur yang tersedia bagi pengguna. <br>
Role ini terbagi menjadi dua yaitu, user dan instruktur. Kedua role ini dibedakan dengan adanya simbol verifikasi di sebelah nama instruktur. Selain itu, instruktur memiliki akses untuk mengunggah sebuah artikel dalam modul blog, sementara user hanya boleh mengomentari artikel. <br>

Admin <br>
Melakukan authorization dan authentication pengguna, menjadi pengawas kegiatan pada aplikasi nutri-robo, melakukan interaksi dengan pengguna seperti memberikan feedback dan mengunggah artikel di modul blog. <br>

### Daftar Modul
#### Home (landing page) 
Sambutan bagi pengguna pada aplikasi nutri-robo <br>
Latar belakang dibuatnya nutri-robo secara singkat <br>
Navigation bar ke menu-menu lain yang tersedia pada aplikasi nutri-robo <br>
Feedback user pada nutri-robo <br>

#### Profile
Data diri pengguna <br>
Kebutuhan kalori, air, olahraga, dan waktu tidur untuk setiap pengguna berdasarkan data pengguna (target yang harus dicapai untuk mencapai kehidupan yang sehat) <br>

#### Tracker
Tracker untuk mencatat konsumsi pengguna baik makanan maupun minuman, apakah pengguna olahraga atau tidak, serta waktu tidur pengguna <br>
Feedback bagi pengguna agar dapat mempertahankan kebiasaan yang sudah baik dan meningkatkan kebiasaan yang masih kurang sehingga dapat mencapai kehidupan yang lebih sehat lagi <br>

#### Blog
Widget untuk daily motivation bagi pengguna <br>
Tips-tips kesehatan yang dapat diunggah oleh admin dan instruktur dan dapat dikomentari oleh user <br>
Berita terbaru terkait kesehatan <br>

#### FAQ
Jawaban dari pertanyaan yang sering ditanyakan oleh pengguna <br>

### Alur Pengintegrasian dengan Web Service <br>
1. Menambahkan dependency `http` ke proyek untuk bertukar data melalui HTTP request <br>
2. Membuat model sesuai dengan respons dari data yang berasal dari web service <br>
3. Melakukan pengambilan data pada suatu web service dengan menggunakan dependensi http get <br>
4. Mengkonversikan objek yang sudah didapatkan dari web service ke model yang telah dibuat sebelumnya <br>
5. Menampilkan data yang terlah berhasil dikonversi ke aplikasi menggunakan `FutureBuilder` <br>
