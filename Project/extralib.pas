unit extralib;
{unit yang berisi type dan fungsi serta prosedur yang dibutuhkan di program lainnya}
// Author: Taufiq Husada Daryanto/ 16518238
interface
	// pembuatan type 
	type 
		Tanggal = record
			d,m,y: integer;
		end;

		Buku = record
			ID_Buku 		: string;
			Judul_Buku		: string;
			Author 			: string;
			Jumlah_Buku		: integer;
			Tahun_Penerbit	: integer;
			Kategori 		: string;
		end;

		User = record
			Nama	 	: string;
			Alamat		: string;
			Username 	: string;
			Password	: string;
			Role		: string;
		end;

		HistoryPeminjaman = record
			Username	:string;
			ID_Buku		:string;
			Tanggal_Peminjaman: Tanggal;
			Tanggal_Batas_Pengembalian: Tanggal;
			Status_Pengembalian: string;
		end;

		HistoryPengembalian = record
			Username	:string;
			ID_Buku		:string;
			Tanggal_Pengembalian: Tanggal;
		end;

		BukuHilang = record
			Username	:string;
			ID_Buku_hilang	:string;
			Tanggal_Laporan: Tanggal;
		end;

		ArrBuku = array[1..100] of Buku;
		ArrUser = array[1..100] of User;
		ArrHistoryPeminjaman = array[1..100] of HistoryPeminjaman;
		ArrHistoryPengembalian = array[1..100] of HistoryPengembalian;
		ArrBukuHilang = array[1..100] of BukuHilang;

		Arr = array [1..100] of string;
		nestedArr = array[1..100] of array[1..100] of string;

	function stringParser(s : string):Arr; // fungsi untuk memparsing string menjadi element di array
	procedure loadFileToArr(namaFile : string; var dat : nestedArr; var sizeFile: integer); //meload file  ke variable dat
	function strToInt(s: string): integer; // fumgsi untuk mengubaha string menjadi integer 
	function intToStr(num: integer): string; // fumgsi untuk mengubah integer menjadi string
	function strToDate(s:string): Tanggal; // fungsi untuk memgubaah string menhadi tanggal
	function dateToStr(date: Tanggal): string; // fungsi untuk mengubah tanggal menjadi string

	function cariJudulBuku(dat: ArrBuku; id: string): string;// fungsi untuk mencari judul buku bedasarkan id buku
	function hash(passAwal: string): string; // fungsi untuk hashing password

implementation

	function stringParser(s : string):Arr;
	{ spesifikasi: fungsi yang menerima input string dan mengoutputkan array hasil parsing dari string tersebut (‘a1,a2,a3’) menjadi array [a1,a2,a3] 
	I.S. : string dari line di csv, yang masih ada coma nya
	F.S. : Array yang berisi substring dari string tersebut, tanpa tanda coma }
	var 
		temp : Arr;
		strCopy: string;
		i,j,panjang : integer;
	// algoritma
	begin
		j := 1; // inisialisasi
		panjang := length(s); 
		strCopy:='';	// variable unutk menampung string sementara
		{ Traverse stringnya, dan jika menemukan coma maka akan dipisah karakternya kemudian dimasukkan ke array}
		for i:=1 to panjang do begin // traverse string (1 line di csv)
			if(s[i] = ',') then begin // jika ketemu koma, maka di parsing		
				temp[j]:=strCopy;
				strCopy:='';
				j+=1;
			end else begin
				strCopy+=s[i];	// jika belum ketemu koma, maka bagian string ditambahkan ke strCopy
			end;
		end;
		temp[j]:=strCopy;	// untuk bagian yang terakhir

		stringParser := temp;	//return array temp
	end;


	procedure loadFileToArr(namaFile : string; var dat : nestedArr; var sizeFile: integer);	
	{ Spesifikasi: procedure yang membaca file .csv, kemudian mengeload data yang di csv dan dimasukkan ke dalam array 2 dimensi 
	I.S. : file CSV yang sudah ada isinya, sizeFile yang diinisialisasi dengan 0
	F.S. : Array yang berisi string-string dari csv, dan juga sizeFile yang menyimpan jumlah baris yang terisi di csv}
	var
		tempFile : TextFile;
		s :	string;
		isLineKosong : boolean;
	// algoritma
	begin
		sizeFile := 1; //iterator
		isLineKosong:=false; // inisalisasi, belum menemukan line kosong
		Assign(tempFile, namaFile); //buka filehandling
		reset(tempFile);
		{membaca line per line di csv nya, kemudian memparsing setiap linenya yang kemudian disimpan ke dalam array}
		while (not eof(tempFile)) and (isLineKosong=false) do // jika belum end of file, dan belum menemukan line kosong
		begin
			readln(tempFile, s); 	// membaca 1 line di csv
			dat[sizeFile] := stringParser(s);
			if (dat[sizeFile][1]<>'') then begin	// jika bukan line kosong
				 sizeFile += 1;	
			end
			else begin	// jika line kosong
				isLineKosong:=true;
			end;
		end;
		sizeFile-=1; // menyesuaikan valuenya
		Close(tempFile);	// close file
	end;

	function strToInt(s: string): integer;
	{ Spesifikasi: fungsi yang menerima input string yang sebenarnya sebuah angka, kemudian mengubah string tersebut menjadi tipe integer
	I.S. : string angka
	F.S. : integer angka }
	var
		i,temp,len,pengali:integer;
	// algoritma
	begin
		temp:=0;		// inisialisasi
		pengali:=1;		
		len:= length(s);
		{traverse string nya, kemudian ubah ke ascii dan dikurangkan 48 (karena ascii ‘0’ adalah 48, 
		kemudian mengalikan dengan pengali yang bersesuaian kemudian menjumlahkan semuanya ke dalam temp integer}
		for i:= len downto 1 do // traverse digitnya
		begin
			temp+=pengali*(ord(s[i])-48);	// convert string to int dengan manipulasi ascii code
			pengali*=10;
		end;
		strToInt:=temp;	// return integer
	end;

	function intToStr(num: integer): string;
	{ Spesifikasi: fungsi yang menerima angka dalam tipe integer, kemudian mengubahnya menjadi tipe string 
	I.S. : integer angka
	F.S. : string angka }
	// kamus
	var
		s,snew: string;
		temp,i: integer;
	// algoritma
	begin
		temp:=num;
		s:='';
		{ambil digit terkecil dari integer tersebut, kemudian ubah ke char dengan terlebih dahulu tambahkan 48 (ascii code ‘0’ adalah 48),
		 kemudian gabungkan ke string temporary nya}
		while(num>0) do begin	
			temp:=num mod 10;	// memproses digit terkecil
			s+=chr(temp+48);	// memgubah jadi char dengan memanipulasi ascii codenya
			num:= num div 10;	// menhilangkan digit terkecil
		end;
		snew:='';

		{reverse string yang didapat, supaya digitnya bersesuaian}
		for i:=length(s) downto 1 do begin	// reverse string
			snew+=s[i];
		end;
		intToStr:=snew;	//return
	end;

	function strToDate(s:string): Tanggal;
	{Spesifikasi: fungsi untuk mengubah date dalam tipe string(‘day/month/year’) menjadi variable dengan tipe bentukan Tanggal
	I.S. : string berisi tanggalan
	F.S. : tanggalan yang jenis variable nya Tanggal}
	// kamus
	var
		date: Tanggal;
	//algoritma
	begin
		{mengambil char di indeks yang dituju, kemudian di masukkan ke variable date di komponen Tanggal yang bersesuaian}
		date.d:=strToInt(s[1]+s[2]);	// komponen day
		date.m:=strToInt(s[4]+s[5]);	// komponen month
		date.y:=strToInt(s[7]+s[8]+s[9]+s[10]);	// komponen year
		strToDate:=date;
	end;

	function dateToStr(date: Tanggal): string;
	{ Spesifikasi: fungsi untuk mengubah variable bertipe Tanggal menjadi string yang terkait
	I.S. : tanggalan yang jenis variable nya Tanggal
	F.S. : string yang berisi tanggalan}
	// kamus
	var
		tempd,tempm,temp:string;
	// algoritma
	begin	
		{ubah setiap integer di komponen date, menjadi string dengan fungsi intToStr, kemudian gabung semua komponennya dengan format d/m/y}
		{jika komponen day atau month hanya 1 digit, maka tambahkan ‘0’ di depannya  supaya formatnya konsisten yaitu dd/mm/yyyy}
		tempd:=intToStr(date.d);
		if (length(tempd)<=1) then begin
			temp:='';
			temp+='0'+tempd;
			tempd:=temp;
		end;
		tempm:=intToStr(date.m);
		if (length(tempm)<=1) then begin
			temp:='';
			temp+='0'+tempm;
			tempm:=temp;
		end;
		dateToStr:= tempd+'/'+tempm+'/'+intToStr(date.y);
	end;

	function cariJudulBuku(dat: ArrBuku; id: string): string;
	{ fungsi untuk mencari judul buku bedasarkan id buku
	asumsi id buku ada
	I.S. : dat (array buku) yang sudah terisi datanya, dan string dari id buku
	F.S. : string dari judul buku yang sesuai ID nya}
	// kamus
	var
		i:integer;
		isFound: boolean;
		judul: string;
	// algoritma
	begin
		i:=1;
		isFound:=false;
		{traversing array buku, kemudian cari id yang sesuai, dan simpan judulnya}
		while(i<=100) and (isFound=false) do begin // traverse dat
			if (dat[i].ID_Buku=id) then begin	// jika ketemu
				isFound:=true;
				judul:=dat[i].Judul_Buku;	// assign ke judulnya
			end;
			i+=1;
		end;
		cariJudulBuku:=judul;	// return judul
	end;

	function hash(passAwal: string): string; 
	{fungsi untuk hashing password
	I.S. : password awal 
	F.S. : password hasil hashing}
	// kamus
	var
		panjang,i: integer;
		hasil: string;
	//algoritma
	begin
		{inisialisasi}
		panjang:= length(passAwal);
		hasil := '';

		{traverse string password dan lakukan hashing dengan algoritma khusus, dan hasilnya selalu unique untuk setiap string yang beda}
		for i:= 1 to panjang do begin
			hasil:=hasil+passAwal[i]; 	{gabungkan setiap karakter ke string hasil}
			if (i mod 2 = 0) then hasil:=hasil+'#';
			if (i mod 3 = 0) then hasil:=hasil+'4';
		end;
		hash:=hasil;
	end;

end.	