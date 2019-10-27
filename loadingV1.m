function V = loadingV1(fposcoin1,fnegcoin1)
out_max = 1;            
out_min = -1;       

if exist('V.mat','file')
    load V;
else
    V = cell (3,[]);
end

fprintf ('Loading positive images ');

for k=1:length(fposcoin1)
    fprintf ('.');    
    IM{1} = fposcoin1{k}';    
    
    for i=1:1
        V{1,end+1}= 'p';
        V{2,end} = out_max;
        V(3,end) = {IM{i}};
    end    
end

fprintf ('\nLoading negetive examples ');
for j=1:length(fnegcoin1)
    fprintf ('.');
    IM{1} = fnegcoin1{j}';
    
    for i=1:1
        V{1,end+1}= 'n';
        V{2,end} = out_min;
        V(3,end) = {IM{i}};
    end    
end
fprintf('\n');
