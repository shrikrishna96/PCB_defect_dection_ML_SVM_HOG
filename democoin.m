 clear all;
close all; 
clc;

% Add Path to svm library

pathPosalt = './traindb/alt/';       % positive example
pathNegalt = './traindb/Xalt/';    % negative example
  
pathPosant = './traindb/ant/';       % positive example
pathNegant = './traindb/Xant/';    % negative example

pathPosbb = './traindb/bb/';
pathNegbb = './traindb/Xbb/';

pathPoscls = './traindb/cls/';
pathNegcls = './traindb/Xcls/';

%pathPoshl = './traindb/hl/';
%pathNeghl = './traindb/Xhl/';

pathtest ='./test/';

tic;

if exist('model1.mat','file')
    load model1;
else
      [fposalt, fnegalt]= featurescoin1(pathPosalt, pathNegalt); 
SV1 = loadingV1(fposalt,fnegalt);   
     fprintf('Training SVM..\n');
     T1 = cell2mat(SV1(2,:));
    tP = SV1(3,:);
     P1 = cell2mat(tP); 
   [model1] = svmtrain(P1,T1');         
    save model1 model1;
end

if exist('model2.mat','file')
    load model2;
else
    [fposant,fnegant]=featurescoin2(pathPosant, pathNegant);
    SV2=loadingV2(fposant,fnegant);   
     fprintf('Training SVM..\n');
     T2 = cell2mat(SV2(2,:));
    tP = SV2(3,:);
     P2 = cell2mat(tP); 
   [model2] = svmtrain(P2,T2');         
    save model2 model2;
end

if exist('model3.mat','file')
    load model3;
else
      [fposbb, fnegbb] = featurescoin5(pathPosbb, pathNegbb); 
SV3 = loadingV5(fposbb,fnegbb);   
     fprintf('Training SVM..\n');
     T3 = cell2mat(SV3(2,:));
    tP = SV3(3,:);
     P3 = cell2mat(tP); 
   [model3] = svmtrain(P3,T3');         
    save model3 model3;
end

if exist('model4.mat','file')
    load model4;
else
      [fposcls, fnegcls] = featurescoin10(pathPoscls, pathNegcls); 
SV4 = loadingV10(fposcls,fnegcls);   
     fprintf('Training SVM..\n');
     T4 = cell2mat(SV4(2,:));
    tP = SV4(3,:);
     P4 = cell2mat(tP); 
   [model4] = svmtrain(P4,T4');         
    save model4 model4;
end

  toc; 
  tic;
     imlist = dir([pathtest '*.jpg']);
   for i = 1:length(imlist)
  img = imread([pathtest imlist(i).name]);
        img=imresize(img,[250 250]);
      
   
     x{i} = extractHOGFeatures(img,'CellSize',[50 50]);
  
   
end
     
       
