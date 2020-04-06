%从文件名中提取最后一个整数
%size(name)=[1,N]
%class(name)='char'

function num=name2num(name)
begin=0; over=0;
for ii=numel(name):-1:1
    if int8(name(ii))>=47 && int8(name(ii))<=58%当前为是数字
        if over==0 
            over=ii;
        else
            continue
        end
    elseif over~=0  
        begin=ii+1;
    end
    
    if begin~=0
        break
    end
end

num=str2double(name(begin:over));

end