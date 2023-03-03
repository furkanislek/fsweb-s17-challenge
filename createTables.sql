create table kullanici (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    adi TEXT NOT NULL,
    soyadi TEXT NOT NULL,
    uyelik_tarihi DATETIME NOT NULL,
    son_paylasim_tarihi DATETIME
);

create table ilanlar (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    resim TEXT,
    baslik TEXT,
    aciklama TEXT,
    etiketler TEXT,
    kullaniciId INT,
    CONSTRAINT kullaniciIdFk FOREIGN KEY (kullaniciId) REFERENCES kullanici(id),
    kategoriID INT,
    CONSTRAINT kategoriIdFk FOREIGN KEY (kategoriID) REFERENCES kategoriler(id)
);

create table kategoriler (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    kategori_name Text
);

create table sepet (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ürün TEXT NOT NULL,
    fiyat int NOT NULL
);

ALTER TABLE
    sepet
ADD
    COLUMN kullanici_id INT NOT NULL;

ALTER TABLE
    sepet
ADD
    CONSTRAINT sepet_kullanici_id FOREIGN KEY (kullanici_id) REFERENCES kullanici(id);

create table alt_kategoriler (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    alt_kategori_id int NOT NULL,
    CONSTRAINT altkategoriIdFk FOREIGN KEY (alt_kategori_id) REFERENCES kategoriler(id),
    name TEXT NOT NULL
);

create table sepetteki_ilanlar (
    id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
    ilan_id INT,
    CONSTRAINT ilan_idFK FOREIGN KEY (ilan_id) REFERENCES ilanlar(id),
    sepet_id int,
    CONSTRAINT sepet_idFK FOREIGN KEY (sepet_id) REFERENCES sepet(id)
);