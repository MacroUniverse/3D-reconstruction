%建系tri33类似cam33
function tri33=pmd12tri33(pmd1)
    P1=pmd1(1,:);
    i=vunit(pmd1(2,:)-P1);
    v2=pmd1(3,:)-P1;
    k=vunit(cross(i,v2));
    j=cross(k,i);
    tri33=[i;j;k];
end