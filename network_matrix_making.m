%2020-10-28_EunG
%positive or negative mask mat file load
%network list based on atlas mat file load


network_list=input('wrtie of network list(ex. ["DMN";"Salience"]): ');
[h,~]=size(network_list);

for i=1:h
    eval(['list',num2str(i),'=find(network==i);'])
    [j,~]=size(eval(['list',num2str(i)]));
    for k=1:j
        eval(['N',num2str(i),'(:,',num2str(k),')=positive_network(:,list',num2str(i),'(',num2str(k),',1));'])
        eval(['sN',num2str(i),'=sum(N',num2str(i),',2);'])      
    end
end

for x=1:h
    %[j,~]=size(eval(['list',num2str(i)]));
    for k=1:h
        eval(['total(',num2str(k),',',num2str(x),')=sum(sN',num2str(x),'(list',num2str(k),'(:,1),:));'])
    end
end

    
%heatmap(total,'Colormap',jet)
%heatmap(total/sum(sum(total)),'Colormap',parula)
%half plot
heatmap(tril(total),'Colormap',jet)

