program hargaMakanan;
var
	n,x,i,res,genap,ganjil: longint;
	
begin
	readln(n);
	res:=0;
	ganjil:=0;
	genap:=0;
	for i:= 1 to n do
	begin
		readln(x);
		if ((i mod 2) = 1) then begin ganjil+=x; end
		else begin genap+=x end;
	end;
	res+=genap*200 + ganjil*100;
	writeln(res, ' rupiah');
end.
