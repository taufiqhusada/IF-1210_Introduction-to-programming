program segiempat;
var
	n,i,j: integer;
	c1,c2: char;
	
begin
	readln(n);
	readln(c1);
	readln(c2);
	if (n<=0) then begin writeln('Masukan tidak valid') end
	else if (c1=c2) then begin writeln('Masukan tidak valid') end
	else
		begin
			for i:=1 to n do
				begin
					if (i=1) or (i=n) then 
						begin
							for j:=1 to n do
							begin write(c1) end;
						end
					else
						begin
							write(c1);
							for j:=2 to (n-1) do 
								begin
									write(c2);
								end;
							write(c1);
						end;
					writeln;
				end;
		end;
end.
