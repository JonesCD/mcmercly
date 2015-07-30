clear all
ids = randi([100000000,999999999],8,1);
p = ids(1);
y = ids(2);
mo = ids(3);
e = ids(4);
r = ids(5);
ma = ids(6);
c = ids(7);
l = ids(8);
id1 = fopen('name_codes.txt','r+');
fprintf(id1,'Papa''s code is         \t%d\n\r\r\r\r\r\r\r\r\r\r',p);
fprintf(id1,'Yummy''s code is        \t%d\n\r\r\r\r\r\r\r\r\r\r',y);
fprintf(id1,'Rich''s code is         \t%d\n\r\r\r\r\r\r\r\r\r\r',r);
fprintf(id1,'Marilyn''s code is      \t%d\n\r\r\r\r\r\r\r\r\r\r',ma);
fprintf(id1,'Eric''s code is         \t%d\n\r\r\r\r\r\r\r\r\r\r',e);
fprintf(id1,'Chris''code is          \t%d\n\r\r\r\r\r\r\r\r\r\r',c);
fprintf(id1,'Lessa''s code is        \t%d\n\r\r\r\r\r\r\r\r\r\r',l);
fprintf(id1,'Mollie''s code is       \t%d\n\r\r\r\r\r\r\r\r\r\r',mo);
fclose(id1);
%now to assign people to eachother

mfin = 1;
while mfin<2 
    
%Papa gets Yummy
id2 = fopen('name_codes-giving.txt','w');
fprintf(id2,'%d \t     is giving to ',p);
fprintf(id2,'Yummy');


%now for Yummy's pick (not Papa or Mollie)
mi = 1;
while mi <=3
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d \t    is giving to ',y);
if ids(mi) == e
    fprintf(id2,'Eric');
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


%Now for Mollie's pick (not Yummy or Eric or my)
mi = 1;
while (mi==3)|(mi==4)|(mi==my)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d \t     is giving to ',mo);
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


%Now for Eric's pick (not Yummy or Mollie, my, mmo)
mi = 1;
while (mi==3)|(mi==4)|(mi==my)|(mi==mmo)|(mi==7)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d \t    is giving to ',e);
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
me = mi;


%now for Rich's pick (not Yummy, Marilyn, my, me, mmo)
mi = 1;
while (mi==2)|(mi==5)|(mi==6)|(mi==my)|(mi==me)|(mi==mmo)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d \t     is giving to ',r);
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
mi = 1;
while (mi==2)|(mi==5)|(mi==6)|(mi==my)|(mi==me)|(mi==mmo)|(mi==mr)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d \t     is giving to ',ma);
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
mi = 1;
while (mi==2)|(mi==7)|(mi==8)|(mi==my)|(mi==me)|(mi==mmo)|(mi==mr)|(mi==mma)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d \t      is giving to ',c);
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
    disp('first picks did not work out at end, please try again');
else
    fprintf(id2,'\n%d \t      is giving to ',l);
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


%SECOND ROUND

while mfin < 4
    
%Papa's second pick (not self or Yummy or Mollie or other gift)

id3 = fopen('name_codes-giving2.txt','w');
mi = 1;
while (mi==1)|(mi==2)|(mi==3)|(mi==my)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'%d \t     is giving something small to ',p);
if ids(mi) == e
    fprintf(id2,'Eric');
end
if ids(mi) == c
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
if ids(mi) == r
    fprintf(id2,'Rich');
end
if ids(mi) == ma
    fprintf(id2,'Marilyn');
end
mp2 = mi;
    
%Yummy's second pick (not self or Papa or Mollie or my or mp2)
mi = 1;
while (mi==1)|(mi==2)|(mi==3)|(mi==mp2)|(mi==my)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d \t     is giving something small to ',y);
if ids(mi) == e
    fprintf(id2,'Eric');
end
if ids(mi) == c
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
if ids(mi) == r
    fprintf(id2,'Rich');
end
if ids(mi) == ma
    fprintf(id2,'Marilyn');
end
my2 = mi;
    
    
%Mollie's second pick (not self or Eric or mmo or mp2 or my2)
mi = 1;
while (mi==3)|(mi==4)|(mi==mmo)|(mi==mp2)|(mi==my2)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d \t     is giving something small to ',mo);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == y
    fprintf(id2,'Yummy');
end
if ids(mi) == c
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
if ids(mi) == r
    fprintf(id2,'Rich');
end
if ids(mi) == ma
    fprintf(id2,'Marilyn');
end
mmo2 = mi;
    
%Eric's second pick (not self or Mollie or me or mp2 or my2 or mmo2)
mi = 1;
while (mi==3)|(mi==4)|(mi==me)|(mi==mp2)|(mi==my2)|(mi==mmo2)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d \t     is giving something small to ',e);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == y
    fprintf(id2,'Yummy');
end
if ids(mi) == c
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
if ids(mi) == r
    fprintf(id2,'Rich');
end
if ids(mi) == ma
    fprintf(id2,'Marilyn');
end
me2 = mi;

%Rich's second pick (not self or Marilyn or mr or mp2 or my2 or mmo2 or me2)
mi = 1;
while (mi==5)|(mi==6)|(mi==mr)|(mi==mp2)|(mi==my2)|(mi==mmo2)|(mi==me2)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d \t     is giving something small to ',r);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == y
    fprintf(id2,'Yummy');
end
if ids(mi) == c
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
if ids(mi) == mo
    fprintf(id2,'Mollie');
end
if ids(mi) == e
    fprintf(id2,'Eric');
end
mr2 = mi;

%Marilyn's second pick (not self or Rich or mma or mp2 or my2 or mmo2 or me2 or mr2)
mi = 1;
while (mi==5)|(mi==6)|(mi==mma)|(mi==mp2)|(mi==my2)|(mi==mmo2)|(mi==me2)|(mi==mr2)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d \t     is giving something small to ',ma);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == y
    fprintf(id2,'Yummy');
end
if ids(mi) == c
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
if ids(mi) == mo
    fprintf(id2,'Mollie');
end
if ids(mi) == e
    fprintf(id2,'Eric');
end
mma2 = mi;

%Chris's second pick (not self or Lessa or mc or mp2 or my2 or mmo2 or me2 or mr2 or mma2)
mi = 1;
while (mi==7)|(mi==8)|(mi==mc)|(mi==mp2)|(mi==my2)|(mi==mmo2)|(mi==me2)|(mi==mr2)|(mi==mma2)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\n%d \t     is giving something small to ',c);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == y
    fprintf(id2,'Yummy');
end
if ids(mi) == c
    fprintf(id2,'Rich');
end
if ids(mi) == l
    fprintf(id2,'Marilyn');
end
if ids(mi) == mo
    fprintf(id2,'Mollie');
end
if ids(mi) == e
    fprintf(id2,'Eric');
end
mc2 = mi;


%and finally Lessa's second pick (not self, Chris, or any previous)
clear mi;
temprand = randi([100000000,999999999],1,1);
diff = abs(temprand - ids);
[mindiff,minindex] = min(diff);
mi = minindex;
if (mi==7)|(mi==8)|(mi==ml)|(mi==mp2)|(mi==my2)|(mi==mmo2)|(mi==me2)|(mi==mr2)|(mi==mma2)|(mi==mc2)
    disp('second picks did not work out at end, please try again');
else
    fprintf(id2,'\n%d \t    is giving something small to ',l);
    if ids(mi) == p
        fprintf(id2,'Papa');
    end
    if ids(mi) == y
        fprintf(id2,'Yummy');
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
    mfin=5;
end
end

fclose(id3);
