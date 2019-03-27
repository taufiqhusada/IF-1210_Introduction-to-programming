// Taufiq Husada Daryanto
// 16518238

program alr;
var
	t: integer;
	
begin
	readln(t);
	if (t<0) then begin writeln('PADAT') end
	else if ((t>0) and (t<100)) then begin writeln('CAIR') end
	else if (t>100) then begin writeln('GAS') end
	else if (t=0) then begin writeln('ANTARA PADAT-CAIR') end
	else begin writeln('ANTARA CAIR-GAS') end;
	
end.
