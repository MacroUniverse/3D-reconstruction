%从格式inte中寻找1个单解域,函数在文件中修改

function inte1=onesolveinte(inte,pmd0,N)

if isnan(inte(1));%如果输入定义域为空
    inte1=nan;return
end

inte1=nan;%预备输出为空

for ii=1:size(inte,1) %判断单解域

    %判断符号
    signL=sign(pmdtrial(pmd0,inte(ii,1),N));
    signR=sign(pmdtrial(pmd0,inte(ii,2),N));
    if signL==signR %非单解域
        continue
    elseif signL==-signR %是单解域
        inte1=inte(ii,:);break
    else
        error('sorry, your RP is too low');
    end
    
end
end