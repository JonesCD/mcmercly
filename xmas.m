clear all
ids = randi([100000000,999999999],8,1);
p = ids(1);
y = ids(2);
e = ids(3);
mo = ids(4);
r = ids(5);
ma = ids(6);
c = ids(7);
l = ids(8);
id1 = fopen('name_codes.txt','r+');
fprintf(id1,'Papa''s code is         %d\n',p);
fprintf(id1,'Yummy''s code is        %d\n',y);
fprintf(id1,'Rich''s code is         %d\n',r);
fprintf(id1,'Marilyn''s code is      %d\n',ma);
fprintf(id1,'Eric''s code is         %d\n',e);
fprintf(id1,'Chris''code is          %d\n',c);
fprintf(id1,'Lessa''s code is        %d\n',l);
fprintf(id1,'Mollie''s code is       %d\n',mo);
fclose(id1);
%now to assign people to eachother

mfin = 1;
while mfin<2 
    
%Papa gets Yummy
id2 = fopen('name_codes-giving.txt','r+');
fprintf(id2,'%d     is giving to ',p);
fprintf(id2,'Yummy');

%now for Yummy's pick (not Papa or Eric)
mi = 1;
while mi <=3
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d     is giving to ',y);
if ids(mi) == mo
    fprintf(id2,'Mollie');
end
if ids(mi) == r
    fprintf(id2,'Rich');
end
if ids(mi) == ma
    fprintf(id2,'Marilyn');
end
if ids(mi) == c
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
my = mi;


%Now for Eric's pick (not Papa or Yummy or Mollie, or my)
mi = 1;
while (mi<=4)|(mi==my)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d     is giving to ',e);
if ids(mi) == r
    fprintf(id2,'Rich');
end
if ids(mi) == ma
    fprintf(id2,'Marilyn');
end
if ids(mi) == c
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
me = mi;


%Now for Mollie's pick (not Eric or Yummy, my, me)
mi = 2;
while (mi==2)|(mi==3)|(mi==4)|(mi==my)|(mi==me)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d     is giving to ',mo);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == r
    fprintf(id2,'Rich');
end
if ids(mi) == ma
    fprintf(id2,'Marilyn');
end
if ids(mi) == c
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
mmo = mi;


%now for Rich's pick (not Yummy, Marilyn, my, me, mmo)
mi = 2;
while (mi==2)|(mi==5)|(mi==6)|(mi==my)|(mi==me)|(mi==mmo)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d     is giving to ',r);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == e
    fprintf(id2,'Eric');
end
if ids(mi) == mo
    fprintf(id2,'Mollie');
end
if ids(mi) == c
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
mr = mi;


%now for Marilyn's (not Yummy, Rich, Marilyn, my, me, mmo, mr)
mi = 2;
while (mi==2)|(mi==5)|(mi==6)|(mi==my)|(mi==me)|(mi==mmo)|(mi==mr)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d     is giving to ',ma);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == e
    fprintf(id2,'Eric');
end
if ids(mi) == mo
    fprintf(id2,'Mollie');
end
if ids(mi) == c
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
mma = mi;


%now for Chris' (not Yummy, Lessa, Chris, my, me, mmo, mr, mma)
mi = 2;
while (mi==2)|(mi==7)|(mi==8)|(mi==my)|(mi==me)|(mi==mmo)|(mi==mr)|(mi==mma)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d     is giving to ',c);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == e
    fprintf(id2,'Eric');
end
if ids(mi) == mo
    fprintf(id2,'Mollie');
end
if ids(mi) == r
    fprintf(id2,'Rich');
end
if ids(mi) == ma
    fprintf(id2,'Marilyn');
end
mc = mi;


%and finally Lessa's pick (not self, Chris, Yummy, or any previous)
clear mi;
temprand = randi([100000000,999999999],1,1);
diff = abs(temprand - ids);
[mindiff,minindex] = min(diff);
mi = minindex;
if (mi==2)|(mi==7)|(mi==8)|(mi==my)|(mi==me)|(mi==mmo)|(mi==mr)|(mi==mma)|(mi==mc)
    disp('picks did not work out at end, please try again')
else
    fprintf(id2,'\n%d     is giving to ',l);
    if ids(mi) == p
        fprintf(id2,'Papa');
    end
    if ids(mi) == e
        fprintf(id2,'Eric');
    end
    if ids(mi) == mo
        fprintf(id2,'Mollie');
    end
    if ids(mi) == r
        fprintf(id2,'Rich');
    end
    if ids(mi) == ma
        fprintf(id2,'Marilyn');
    end
    mfin=3;
end
end
ml=mi;


fclose(id2);
