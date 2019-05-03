unit U_load_save_exit;
{Unit yang berisikan beberapa prosedur untuk load, save, dan exit file.}
// author : Taufiq Husada Daryanto / 16518238
interface
	uses extralib;
	procedure loadAllFile(var datBuku: ArrBuku; var datUser : ArrUser; var datHistoryPeminjaman: ArrHistoryPeminjaman; var datHistoryPengembalian: ArrHistoryPengembalian; var datBukuHilang: ArrBukuHilang; var sizeBuku,sizeUser,sizePeminjaman,sizePengembalian,sizeBukuHilang:integer);
	procedure saveAllFile(datBuku: ArrBuku; datUser : ArrUser; datHistoryPeminjaman: ArrHistoryPeminjaman; datHistoryPengembalian: ArrHistoryPengembalian; datBukuHilang: ArrBukuHilang; sizeBuku,sizeUser,sizePeminjaman,sizePengembalian,sizeBukuHilang:integer);

	procedure loadBuku(namaFile : string; var dat : ArrBuku; var sizeFile: integer);
	procedure loadUser(namaFile : string; var dat : ArrUser; var sizeFile: integer);
	procedure loadHistoryPeminjaman(namaFile: string; var dat: ArrHistoryPeminjaman; var sizeFile:integer);
	procedure loadHistoryPengembalian(namaFile: string; var dat: ArrHistoryPengembalian; var sizeFile:integer);
	procedure loadBukuHilang(namaFile: string; var dat: ArrBukuHilang; var sizeFile:integer);

	procedure saveUser(namaFile : string; dat :ArrUser; sizeFile:integer );
	procedure saveBuku(namaFile : string; dat :ArrBuku; sizeFile:integer );
	procedure saveHistoryPeminjaman(namaFile: string; dat: ArrHistoryPeminjaman; sizeFile:integer);
	procedure saveHistoryPengembalian(namaFile: string; dat: ArrHistoryPengembalian; sizeFile:integer);
	procedure saveBukuHilang(namaFile: string; dat: ArrBukuHilang; sizeFile:integer);

	procedure exitFile(var isEndProgram: boolean);
implementation
	procedure loadAllFile(var datBuku: ArrBuku; var datUser : ArrUser; var datHistoryPeminjaman: ArrHistoryPeminjaman; var datHistoryPengembalian: ArrHistoryPengembalian; var datBukuHilang: ArrBukuHilang; var sizeBuku,sizeUser,sizePeminjaman,sizePengembalian,sizeBukuHilang:integer);
	// spesifikasi: procedure untuk me-load semua file yang dibutuhkan (dari csv ke array yang ditujukan)
	var //kamus
		namaFileBuku,namaFileUser, namaFilePeminjaman, namaFilePengembalian, namaFileBukuHilang:string;
	begin	// algoritma
		writeln('LOAD FILE');
		write('Masukkan nama file buku: ');
		readln(namaFileBuku);
		write('Masukkan nama file user: ');
		readln(namaFileUser);
		write('Masukkan nama file peminjaman: ');
		readln(namaFilePeminjaman);
		write('Masukkan nama file namaFilePengembalian: ');
		readln(namaFilePengembalian);
		write('Masukkan nama file buku hilang: ');
		readln(namaFileBukuHilang);
		loadBuku(namaFileBuku,datBuku,sizeBuku); // load file buku
		loadUser(namaFileUser,datUser,sizeUser);	// load file user
		loadHistoryPeminjaman(namaFilePeminjaman,datHistoryPeminjaman,sizePeminjaman); // load file history peminjaman
		loadHistoryPengembalian(namaFilePengembalian,datHistoryPengembalian,sizePengembalian);	// load file history pengembalian
		loadBukuHilang(namaFileBukuHilang,datBukuHilang,sizeBukuHilang);	// load file buku hilang
		writeln('Semua file telah ter-load');
	end;

	procedure saveAllFile(datBuku: ArrBuku; datUser : ArrUser; datHistoryPeminjaman: ArrHistoryPeminjaman; datHistoryPengembalian: ArrHistoryPengembalian; datBukuHilang: ArrBukuHilang; sizeBuku,sizeUser,sizePeminjaman,sizePengembalian,sizeBukuHilang:integer);
	// spesifikasi : program untuk me-save semua array ke file yang ditujukan
	var
		namaFileBuku,namaFileUser, namaFilePeminjaman, namaFilePengembalian, namaFileBukuHilang:string;
	begin
		writeln('SAVING FILE');
		write('Masukkan nama file buku: ');
		readln(namaFileBuku);
		write('Masukkan nama file user: ');
		readln(namaFileUser);
		write('Masukkan nama file peminjaman: ');
		readln(namaFilePeminjaman);
		write('Masukkan nama file namaFilePengembalian: ');
		readln(namaFilePengembalian);
		write('Masukkan nama file buku hilang: ');
		readln(namaFileBukuHilang);
		saveBuku(namaFileBuku,datBuku,sizeBuku);	// save file buku
		saveUser(namaFileUser,datUser,sizeUser);	// svae file user
		saveHistoryPeminjaman(namaFilePeminjaman,datHistoryPeminjaman,sizePeminjaman);	// save file history peminjaman
		saveHistoryPengembalian(namaFilePengembalian,datHistoryPengembalian,sizePengembalian);	// savae file history pengembalian
		saveBukuHilang(namaFileBukuHilang,datBukuHilang,sizeBukuHilang);	// save file buku hilang
		writeln('Semua file telah disimpan');
	end;

	procedure loadBuku(namaFile : string; var dat : ArrBuku; var sizeFile: integer);
	// spesifikasi: procedure untuk load file buku dari csv ke array 
	var
		i : integer;
		tempDat : nestedArr;
	begin
		loadFileToArr(namaFile, tempDat, sizeFile);
		for i:=1 to sizeFile do 
		begin
			dat[i].ID_Buku:= tempDat[i][1];
			dat[i].Judul_Buku:=tempDat[i][2];
			dat[i].Author:=tempDat[i][3];
			dat[i].Jumlah_Buku:=strToInt(tempDat[i][4]);
			dat[i].Tahun_Penerbit:=strToInt(tempDat[i][5]);
			dat[i].Kategori:=tempDat[i][6];
		end;
	end;

	procedure loadUser(namaFile : string; var dat : ArrUser; var sizeFile: integer);
	// spesifikasi: procedure untuk load file user dari csv ke array 
	var
		i : integer;
		tempDat : nestedArr;
	begin
		loadFileToArr(namaFile, tempDat, sizeFile);
		for i:=1 to sizeFile do 
		begin
			dat[i].Nama:= tempDat[i][1];
			dat[i].Alamat:=tempDat[i][2];
			dat[i].Username:=tempDat[i][3];
			dat[i].Password:=tempDat[i][4];
			dat[i].Role:=tempDat[i][5];
		end;
	end;

	procedure loadHistoryPeminjaman(namaFile: string; var dat: ArrHistoryPeminjaman; var sizeFile:integer);
	// spesifikasi: procedure untuk load file buku dari history peminjaman ke array 	
	var
		i : integer;
		tempDat : nestedArr;
	begin
		loadFileToArr(namaFile, tempDat, sizeFile);
		for i:=1 to sizeFile do 
		begin
			dat[i].Username:= tempDat[i][1];
			dat[i].ID_Buku:=tempDat[i][2];
			dat[i].Tanggal_Peminjaman:=strToDate(tempDat[i][3]);
			dat[i].Tanggal_Batas_Pengembalian:=strToDate(tempDat[i][4]);
			dat[i].Status_Pengembalian:=tempDat[i][5];
		end;
	end;
	
	procedure loadHistoryPengembalian(namaFile: string; var dat: ArrHistoryPengembalian; var sizeFile:integer);
	// spesifikasi: procedure untuk load file history pengembalian (dari csv ke array)
	var
		i : integer;
		tempDat : nestedArr;
	begin
		loadFileToArr(namaFile, tempDat, sizeFile);
		for i:=1 to sizeFile do 
		begin
			dat[i].Username:= tempDat[i][1];
			dat[i].ID_Buku:=tempDat[i][2];
			dat[i].Tanggal_Pengembalian:=strToDate(tempDat[i][3]);
		end;
	end;

	procedure loadBukuHilang(namaFile: string; var dat: ArrBukuHilang; var sizeFile:integer);
	// spesifikasi: procedure untuk load file buku hilang (dari csv ke array)
	var
		i : integer;
		tempDat : nestedArr;
	begin
		loadFileToArr(namaFile, tempDat, sizeFile);
		for i:=1 to sizeFile do 
		begin
			dat[i].Username:= tempDat[i][1];
			dat[i].ID_Buku_Hilang:=tempDat[i][2];
			dat[i].Tanggal_Laporan:=strToDate(tempDat[i][3]);
		end;
	end;

	procedure saveBuku(namaFile : string; dat :ArrBuku; sizeFile: integer );
	// spesifikasi: procedure untuk save file buku
	var
		tempFile : TextFile;
		i : integer;
	begin
		Assign(tempFile, namaFile);
		rewrite(tempFile);
		//mulai masukan ke file
		for i := 1 to sizeFile do begin
				write(tempFile, dat[i].ID_Buku);
				write(tempFile, ',');
				write(tempFile, dat[i].Judul_Buku);
				write(tempFile, ',');
				write(tempFile, dat[i].Author);
				write(tempFile, ',');
				write(tempFile, dat[i].Jumlah_Buku);
				write(tempFile, ',');
				write(tempFile, dat[i].Tahun_Penerbit);
				write(tempFile, ',');
				writeln(tempFile, dat[i].Kategori);
		end;
		Close(tempFile);
	end;

	procedure saveUser(namaFile : string; dat :ArrUser; sizeFile: integer );
	// spesifikasi: procedure untuk save file user
	var
		tempFile : TextFile;
		i: integer;
	begin
		Assign(tempFile, namaFile);
		rewrite(tempFile);
		//mulai masukan ke file
		for i := 1 to sizeFile do begin
				write(tempFile, dat[i].Nama);
				write(tempFile, ',');
				write(tempFile, dat[i].Alamat);
				write(tempFile, ',');
				write(tempFile, dat[i].Username);
				write(tempFile, ',');
				write(tempFile, dat[i].Password);
				write(tempFile, ',');
				writeln(tempFile, dat[i].Role);
		end;
		Close(tempFile);
	end;

	procedure saveHistoryPeminjaman(namaFile: string; dat: ArrHistoryPeminjaman; sizeFile:integer);
	// spesifikasi: procedure untuk save file history peminjaman
	var
		tempFile : TextFile;
		i : integer;
	begin
		Assign(tempFile, namaFile);
		rewrite(tempFile);
		//mulai masukan ke file
		for i := 1 to sizeFile do begin
				write(tempFile, dat[i].Username);
				write(tempFile, ',');
				write(tempFile, dat[i].ID_Buku);
				write(tempFile, ',');
				write(tempFile, dateToStr(dat[i].Tanggal_Peminjaman));
				write(tempFile, ',');
				write(tempFile, dateToStr(dat[i].Tanggal_Batas_Pengembalian));
				write(tempFile, ',');
				writeln(tempFile, dat[i].Status_Pengembalian);
		end;
		Close(tempFile);
	end;
	
	procedure saveHistoryPengembalian(namaFile: string; dat: ArrHistoryPengembalian; sizeFile:integer);
	// spesifikasi: procedure untuk save file history pengembalian
	var
		tempFile : TextFile;
		i : integer;
	begin
		Assign(tempFile, namaFile);
		rewrite(tempFile);
		//mulai masukan ke file
		for i := 1 to sizeFile do begin
				write(tempFile, dat[i].Username);
				write(tempFile, ',');
				write(tempFile, dat[i].ID_Buku);
				write(tempFile, ',');
				writeln(tempFile, dateToStr(dat[i].Tanggal_Pengembalian));
		end;
		Close(tempFile);
	end;

	procedure saveBukuHilang(namaFile: string; dat: ArrBukuHilang; sizeFile:integer);
	// spesifikasi: procedure untuk save file buku hilang
	var
		tempFile : TextFile;
		i : integer;
	begin
		Assign(tempFile, namaFile);
		rewrite(tempFile);
		//mulai masukan ke file
		for i := 1 to sizeFile do begin
				write(tempFile, dat[i].Username);
				write(tempFile, ',');
				write(tempFile, dat[i].ID_Buku_Hilang);
				write(tempFile, ',');
				writeln(tempFile, dateToStr(dat[i].Tanggal_Laporan));
		end;
		Close(tempFile);
	end;

	procedure exitFile(var isEndProgram: boolean);
	// spesifikasi: procedure untuk exit file
	var
		inputUser : char;
	begin
		write('Apakah Anda mau melakukan penyimpanan file yang sudah dilakukan (Y/N) ?');
		readln(inputUser);
		if (inputUser='y') or (inputUser='Y') then // jika user ingin melakukan penyimpanan
		begin
			isEndProgram:=true;	
			writeln('Data akan disimpan');
		end
		else writeln('Data tidak disimpan');
	end;
end.
