def L(h):
    h=h.lstrip('#'); c=[int(h[i:i+2],16)/255 for i in (0,2,4)]
    c=[x/12.92 if x<=0.04045 else ((x+0.055)/1.055)**2.4 for x in c]
    return 0.2126*c[0]+0.7152*c[1]+0.0722*c[2]
def cr(a,b):
    a,b=L(a),L(b); return (max(a,b)+0.05)/(min(a,b)+0.05)
pairs=[
("tinta","#121212","putih","#FFFFFF"),
("tinta.kedua","#5B5B66","putih","#FFFFFF"),
("kobalt","#3048FF","putih","#FFFFFF"),
("putih","#FFFFFF","kobalt","#3048FF"),
("kobalt.muda","#DCE1FF","kobalt","#3048FF"),
("lime","#D4F25C","kobalt","#3048FF"),
("tinta","#121212","lime","#D4F25C"),
("kobalt","#3048FF","lime","#D4F25C"),
("putih","#FFFFFF","tinta","#121212"),
("lime","#D4F25C","tinta","#121212"),
("tinta","#121212","kertas.buku","#F6F5F1"),
("tinta.kedua","#5B5B66","kertas.buku","#F6F5F1"),
("kobalt","#3048FF","kertas.buku","#F6F5F1"),
("tinta","#121212","abu","#EDEDF0"),
("tinta.kedua","#5B5B66","abu","#EDEDF0"),
("galat","#B42318","putih","#FFFFFF"),
("berhasil","#2E7652","putih","#FFFFFF"),
("tinta","#121212","halftone-titik(kobalt 25%)","#CBD1FF"),
]
cats=[("Bangunan","#FF8A5B"),("Makanan","#FF6FA3"),("Kendaraan","#FFD84D"),("Tanaman","#7FD6A6"),("Papan nama","#9DB4FF"),("Minuman","#5ED1E0"),("Hewan","#C7A6FF"),("Barang","#E0C39A"),("Lainnya","#D6D6DC")]
for n1,a,n2,b in pairs: print(f"{n1} {a} di {n2} {b}: {cr(a,b):.2f}")
print("-- kategori: tinta #121212 di atasnya; dan non-teks vs putih")
for n,c in cats: print(f"{n} {c}: teks {cr('#121212',c):.2f}; vs putih {cr(c,'#FFFFFF'):.2f}")
print("lime vs putih (non-teks):", round(cr('#D4F25C','#FFFFFF'),2))
print("kobalt vs putih (non-teks):", round(cr('#3048FF','#FFFFFF'),2))
