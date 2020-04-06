function tf=graycriti(gray,portion,plot)

s=sort(gray(:),'ascend');
crit_ind=round(numel(gray)*portion);
criti=s(crit_ind);
tf=zeros(size(gray));
tf(gray>=criti)=0;
tf(gray<criti)=1;

if nargin==3
   class(plot);
   imshow(tf);
end

end