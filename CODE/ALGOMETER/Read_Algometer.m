function data = Read_Algometer(ALG)
data=[];
a=[];
while ALG.BytesAvailable>0
    a=[a fscanf(ALG)];
end;
b=findstr(a,'N');
if isempty(b);
    return;
end;

c=findstr(a,char(13));
c=[1 c(1:end-1)];

if length(b)==length(c)
else
    disp('ERROR');
end;

for i=1:length(c);
    v(i)=str2num(a(c(i)+1:b(i)-1));
end;
data=v;
end

