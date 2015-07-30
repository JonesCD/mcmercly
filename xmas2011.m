clear all
ids = randi([100000000,999999999],10,1);
p = ids(1);
y = ids(2);
mo = ids(3);
e = ids(4);
r = ids(5);
ma = ids(6);
cj = ids(7);
l = ids(8);
ct = ids(9);
cr = ids(10);
id1 = fopen('name_codes2011.txt','r+');
fprintf(id1,'Papa''s code is         \t%d\n\r\r\r\r\r\r\r',p);
fprintf(id1,'Yummy''s code is        \t%d\n\r\r\r\r\r\r\r',y);
fprintf(id1,'Rich''s code is         \t%d\n\r\r\r\r\r\r\r',r);
fprintf(id1,'Marilyn''s code is      \t%d\n\r\r\r\r\r\r\r',ma);
fprintf(id1,'Eric''s code is         \t%d\n\r\r\r\r\r\r\r',e);
fprintf(id1,'Mollie''s code is       \t%d\n\r\r\r\r\r\r\r',mo);
fprintf(id1,'Chris''code is          \t%d\n\r\r\r\r\r\r\r',cj);
fprintf(id1,'Lessa''s code is        \t%d\n\r\r\r\r\r\r\r',l);
fprintf(id1,'Courtney''s code is     \t%d\n\r\r\r\r\r\r\r',ct);
fprintf(id1,'Cathy''s code is        \t%d\n\r\r\r\r\r\r\r',cr);
fclose(id1);
%now to assign people to eachother

mfin = 1;
while mfin<2 

    
%Papa gets Yummy
id2 = fopen('name_codes-giving2011.txt','w+');
fprintf(id2,'%d \t     is giving to ',p);
fprintf(id2,'Yummy');

%now for Yummy's pick (not Papa or Mollie)
mi = 1;
while (mi==1)|(mi==2)|(mi==3)|(mi==10)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\r\r\n%d \t     is giving to ',y);
if ids(mi) == e
    fprintf(id2,'Eric');
end
if ids(mi) == r
    fprintf(id2,'Rich');
end
if ids(mi) == ma
    fprintf(id2,'Marilyn');
end
if ids(mi) == cj
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
if ids(mi) == ct
    fprintf(id2,'Courtney');
end
if ids(mi) == cr
    fprintf(id2,'Cathy');
end
my = mi;


%Now for Mollie's pick (not Yummy or Eric or my)
mi = 1;
while (mi==3)|(mi==4)|(mi==my)|(mi==2)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\r\r\n%d \t     is giving to ',mo);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == r
    fprintf(id2,'Rich');
end
if ids(mi) == ma
    fprintf(id2,'Marilyn');
end
if ids(mi) == cj
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
if ids(mi) == ct
    fprintf(id2,'Courtney');
end
if ids(mi) == cr
    fprintf(id2,'Cathy');
end
mmo = mi;


%Now for Eric's pick (not Yummy or Mollie, my, mmo)
mi = 1;
while (mi==3)|(mi==4)|(mi==my)|(mi==mmo)|(mi==7)|(mi==2)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\r\r\n%d \t     is giving to ',e);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == r
    fprintf(id2,'Rich');
end
if ids(mi) == ma
    fprintf(id2,'Marilyn');
end
if ids(mi) == cj
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
if ids(mi) == ct
    fprintf(id2,'Courtney');
end
if ids(mi) == cr
    fprintf(id2,'Cathy');
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
fprintf(id2,'\r\r\n%d \t     is giving to ',r);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == e
    fprintf(id2,'Eric');
end
if ids(mi) == mo
    fprintf(id2,'Mollie');
end
if ids(mi) == cj
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
if ids(mi) == ct
    fprintf(id2,'Courtney');
end
if ids(mi) == cr
    fprintf(id2,'Cathy');
end
mr = mi;


%now for Marilyn's (not Yummy, Rich, Marilyn, my, me, mmo, mr)
mi = 1;
while (mi==2)|(mi==5)|(mi==6)|(mi==my)|(mi==me)|(mi==mmo)|(mi==mr)|(mi==10)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\r\r\n%d \t     is giving to ',ma);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == e
    fprintf(id2,'Eric');
end
if ids(mi) == mo
    fprintf(id2,'Mollie');
end
if ids(mi) == cj
    fprintf(id2,'Chris');
end
if ids(mi) == l
    fprintf(id2,'Lessa');
end
if ids(mi) == ct
    fprintf(id2,'Courtney');
end
if ids(mi) == cr
    fprintf(id2,'Cathy');
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
fprintf(id2,'\r\r\n%d \t     is giving to ',cj);
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
if ids(mi) == ct
    fprintf(id2,'Courtney');
end
if ids(mi) == cr
    fprintf(id2,'Cathy');
end
mcj = mi;


%and Lessa's pick (not self, Chris, Yummy, or any previous)
mi = 1;
while (mi==2)|(mi==7)|(mi==8)|(mi==my)|(mi==me)|(mi==mmo)|(mi==mr)|(mi==mma)|(mi==mcj)|(mi==10)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\r\r\n%d \t     is giving to ',l);
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
if ids(mi) == ct
    fprintf(id2,'Courtney');
end
if ids(mi) == cr
    fprintf(id2,'Cathy');
end
ml=mi;
    
%and Courtney's pick (not self, Cathy, Yummy, or any previous)
mi = 1;
while (mi==2)|(mi==9)|(mi==10)|(mi==my)|(mi==me)|(mi==mmo)|(mi==mr)|(mi==mma)|(mi==mcj)|(mi==ml)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id2,'\r\r\n%d \t     is giving to ',ct);
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
if ids(mi) == cj
    fprintf(id2,'Chris');
end
if ids(mi)== l
    fprintf(id2,'Lessa');
end
mct=mi;

%and finally Cathy's pick (not self, Courtney, Yummy, or any previous)
clear mi;
temprand = randi([100000000,999999999],1,1);
diff = abs(temprand - ids);
[mindiff,minindex] = min(diff);
mi = minindex;
if (mi==2)|(mi==9)|(mi==10)|(mi==my)|(mi==me)|(mi==mmo)|(mi==mr)|(mi==mma)|(mi==mcj)|(mi==ml)|(mi==mct)
    disp('first picks did not work out at end, please try again');
else
    fprintf(id2,'\r\r\n%d \t     is giving to ',cr);
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
if ids(mi) == cj
    fprintf(id2,'Chris');
end
if ids(mi)== l
    fprintf(id2,'Lessa');
end
mcath=mi;
     
    mfin=3;
    end
    
end
ml=mi;
fclose(id2);


%SECOND ROUND

while mfin < 4
    
%Papa's second pick (not self or Yummy or Mollie or other gift)

id3 = fopen('name_codes-giving2-2011.txt','w+');

mi = 1;
while (mi==1)|(mi==2)|(mi==3)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id3,'%d \t     is giving something small to ',p);
if ids(mi) == e
    fprintf(id3,'Eric');
end
if ids(mi) == cj
    fprintf(id3,'Chris');
end
if ids(mi) == l
    fprintf(id3,'Lessa');
end
if ids(mi) == r
    fprintf(id3,'Rich');
end
if ids(mi) == ma
    fprintf(id3,'Marilyn');
end
if ids(mi) == ct
    fprintf(id3,'Courtney');
end
if ids(mi) == cr
    fprintf(id3,'Cathy');
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
fprintf(id3,'\r\r\n%d \t     is giving something small to ',y);
if ids(mi) == e
    fprintf(id3,'Eric');
end
if ids(mi) == cj
    fprintf(id3,'Chris');
end
if ids(mi) == l
    fprintf(id3,'Lessa');
end
if ids(mi) == r
    fprintf(id3,'Rich');
end
if ids(mi) == ma
    fprintf(id3,'Marilyn');
end
if ids(mi) == ct
    fprintf(id3,'Courtney');
end
if ids(mi) == cr
    fprintf(id3,'Cathy');
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
fprintf(id3,'\r\r\n%d \t     is giving something small to ',mo);
if ids(mi) == p
    fprintf(id3,'Papa');
end
if ids(mi) == y
    fprintf(id3,'Yummy');
end
if ids(mi) == cj
    fprintf(id3,'Chris');
end
if ids(mi) == l
    fprintf(id3,'Lessa');
end
if ids(mi) == r
    fprintf(id3,'Rich');
end
if ids(mi) == ma
    fprintf(id3,'Marilyn');
end
if ids(mi) == ct
    fprintf(id3,'Courtney');
end
if ids(mi) == cr
    fprintf(id3,'Cathy');
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
fprintf(id3,'\r\r\n%d \t     is giving something small to ',e);
if ids(mi) == p
    fprintf(id3,'Papa');
end
if ids(mi) == y
    fprintf(id3,'Yummy');
end
if ids(mi) == cj
    fprintf(id3,'Chris');
end
if ids(mi) == l
    fprintf(id3,'Lessa');
end
if ids(mi) == r
    fprintf(id3,'Rich');
end
if ids(mi) == ma
    fprintf(id3,'Marilyn');
end
if ids(mi) == ct
    fprintf(id3,'Courtney');
end
if ids(mi) == cr
    fprintf(id3,'Cathy');
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
fprintf(id3,'\r\r\n%d \t     is giving something small to ',r);
if ids(mi) == p
    fprintf(id3,'Papa');
end
if ids(mi) == y
    fprintf(id3,'Yummy');
end
if ids(mi) == cj
    fprintf(id3,'Chris');
end
if ids(mi) == l
    fprintf(id3,'Lessa');
end
if ids(mi) == mo
    fprintf(id3,'Mollie');
end
if ids(mi) == e
    fprintf(id3,'Eric');
end
if ids(mi) == ct
    fprintf(id3,'Courtney');
end
if ids(mi) == cr
    fprintf(id3,'Cathy');
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
fprintf(id3,'\r\r\n%d \t     is giving something small to ',ma);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == y
    fprintf(id3,'Yummy');
end
if ids(mi) == cj
    fprintf(id3,'Chris');
end
if ids(mi) == l
    fprintf(id3,'Lessa');
end
if ids(mi) == mo
    fprintf(id3,'Mollie');
end
if ids(mi) == e
    fprintf(id3,'Eric');
end
if ids(mi) == ct
    fprintf(id3,'Courtney');
end
if ids(mi) == cr
    fprintf(id3,'Cathy');
end
mma2 = mi;

%Chris's second pick (not self or Lessa or mc or mp2 or my2 or mmo2 or me2 or mr2 or mma2)
mi = 1;
while (mi==7)|(mi==8)|(mi==mcj)|(mi==mp2)|(mi==my2)|(mi==mmo2)|(mi==me2)|(mi==mr2)|(mi==mma2)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id3,'\r\r\n%d \t     is giving something small to ',cj);
if ids(mi) == p
    fprintf(id3,'Papa');
end
if ids(mi) == y
    fprintf(id3,'Yummy');
end
if ids(mi) == r
    fprintf(id3,'Rich');
end
if ids(mi) == ma
    fprintf(id3,'Marilyn');
end
if ids(mi) == mo
    fprintf(id3,'Mollie');
end
if ids(mi) == e
    fprintf(id3,'Eric');
end
if ids(mi) == ct
    fprintf(id3,'Courtney');
end
if ids(mi) == cr
    fprintf(id3,'Cathy');
end
mcj2 = mi;

%Lessa's second pick (not self or Chris or mc or mp2 or my2 or mmo2 or me2 or mr2 or mma2)
mi = 1;
while (mi==7)|(mi==8)|(mi==ml)|(mi==mp2)|(mi==my2)|(mi==mmo2)|(mi==me2)|(mi==mr2)|(mi==mma2)|(mi==mcj2)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id3,'\r\r\n%d \t     is giving something small to ',l);
if ids(mi) == p
    fprintf(id3,'Papa');
end
if ids(mi) == y
    fprintf(id3,'Yummy');
end
if ids(mi) == r
    fprintf(id3,'Rich');
end
if ids(mi) == ma
    fprintf(id3,'Marilyn');
end
if ids(mi) == mo
    fprintf(id3,'Mollie');
end
if ids(mi) == e
    fprintf(id3,'Eric');
end
if ids(mi) == ct
    fprintf(id3,'Courtney');
end
if ids(mi) == cr
    fprintf(id3,'Cathy');
end
ml2 = mi;

%Courtney's second pick (not self or Chris or mc or mp2 or my2 or mmo2 or me2 or mr2 or mma2)
mi = 1;
while (mi==9)|(mi==10)|(mi==mct)|(mi==mp2)|(mi==my2)|(mi==mmo2)|(mi==me2)|(mi==mr2)|(mi==mma2)|(mi==mcj2)|(mi==ml2)
    temprand = randi([100000000,999999999],1,1);
    diff = abs(temprand - ids);
    [mindiff,minindex] = min(diff);
    mi = minindex;
end
fprintf(id3,'\r\r\n%d \t     is giving something small to ',ct);
if ids(mi) == p
    fprintf(id2,'Papa');
end
if ids(mi) == y
    fprintf(id3,'Yummy');
end
if ids(mi) == r
    fprintf(id3,'Rich');
end
if ids(mi) == ma
    fprintf(id3,'Marilyn');
end
if ids(mi) == mo
    fprintf(id3,'Mollie');
end
if ids(mi) == e
    fprintf(id3,'Eric');
end
if ids(mi) == cj
    fprintf(id3,'Chris');
end
if ids(mi) == l
    fprintf(id3,'Lessa');
end
mct2 = mi;

%and finally Cathy's second pick (not self, Courtney, or any previous)
clear mi;
temprand = randi([100000000,999999999],1,1);
diff = abs(temprand - ids);
[mindiff,minindex] = min(diff);
mi = minindex;
if (mi==9)|(mi==10)|(mi==mcath)|(mi==mp2)|(mi==my2)|(mi==mmo2)|(mi==me2)|(mi==mr2)|(mi==mma2)|(mi==mcj2)|(mi==ml2)|(mi==mct2)
    disp('second picks did not work out at end, please try again');
else
    fprintf(id3,'\r\r\n%d \t    is giving something small to ',cr);
    if ids(mi) == p
        fprintf(id3,'Papa');
    end
    if ids(mi) == y
        fprintf(id3,'Yummy');
    end
    if ids(mi) == e
        fprintf(id3,'Eric');
    end
    if ids(mi) == mo
        fprintf(id3,'Mollie');
    end
    if ids(mi) == r
        fprintf(id3,'Rich');
    end
    if ids(mi) == ma
        fprintf(id3,'Marilyn');
    end
    if ids(mi) == cj
        fprintf(id3,'Chris');
    end
    if ids(mi) == l
        fprintf(id3,'Lessa');
    end
    mfin=5;
end
end

fclose(id3);
