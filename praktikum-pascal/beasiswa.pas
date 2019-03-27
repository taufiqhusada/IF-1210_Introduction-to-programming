// Taufiq Husada Daryanto
// 16518238

program beasiswa;
var
	ip, pot: real;
	
begin
	readln(ip,pot);
	if (ip>=3.5) then begin writeln(4) end
	else if (pot<1) and (ip<3.5) then begin writeln(1) end
	else if (pot>=1) and (pot<5) and (ip<3.5) then
		begin
			if (ip>=2.0) then begin writeln(3) end
			else begin writeln(2) end
		end
	else begin writeln(0) end;

end.
