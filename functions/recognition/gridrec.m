%取十字!
function gridrec(gray)
[x,y]=size(gray);
x=round(x/2);
y=round(y/2);
for ii=1:200
   if gray(x,y)==0
       x=x+1;
   else 
       break
   end
end

if gray(x,y)==0
    error('can not find the first point of value 1');
else
    gray(x,y)=3;
end

front=[];
if gray(x,y+1)==1
   gray(x,y+1)=2; front=[front; x,y+1];
end
if gray(x+1,y)==1
    gray(x+1,y)=2; front=[front; x+1,y];
end
if gray(x,y-1)==1
    gray(x,y-1)=2; front=[front; x,y-1];
end
if gray(x-1,y)==1
    gray(x-1,y)=2; front=[front; x-1,y];
end

for ii=1:size(front,1)
   
end

end

function neibhour