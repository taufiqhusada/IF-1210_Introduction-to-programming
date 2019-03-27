program array1;
var
	a,res : array [1..100] of integer;
	n,k,i,cnt: integer;
	
begin
	readln(n);
	if (n=0) then begin writeln('Tidak ada bilangan'); end	
	else
	begin
		for i:= 1 to n do
		begin
			readln(a[i]);
		end;
		readln(k);
		if (k=-1) then 
		begin
			cnt:=0;
			for i:= 1 to n do
			begin
				if (a[i]<0) then 
				begin
					cnt+=1;
					res[cnt]:= a[i];
				end;
			end;
			writeln(cnt);
			for i:= 1 to cnt do
			begin
				writeln(res[i]);
			end;
		end
		else if (k=0) then
		begin
			cnt:=0;
			for i:= 1 to n do
			begin
				if (a[i]=0) then 
				begin
					cnt+=1;
					res[cnt]:= a[i];
				end;
			end;
			writeln(cnt);
		end
		else begin
			cnt:=0;
			for i:= 1 to n do
			begin
				if (a[i]>0) then 
				begin
					cnt+=1;
					res[cnt]:= a[i];
				end;
			end;
			writeln(cnt);
			for i:= 1 to cnt do
			begin
				writeln(res[i]);
			end;
		end;
	end;
end.
