function [C1,C2,C5,C10,C50]=test(Img)

% Add Path to svm library

pathPosang = './train/extrahole/';       % positive example
pathNegang = './train/Xextrahole/';    % negative example
  
pathPosdisg = './train/missinghole/';       % positive example
pathNegdisg = './train/Xmissinghole/';    % negative example

pathPoshap = './train/openckt/';
pathNeghap = './train/Xopenckt/';

pathPosneut = './train/shortckt/';
pathNegneut = './train/Xshortckt/';


pathPosall = './train/alldefect/';
pathNegall = './train/Xalldefect/';

if exist('model1.mat','file')
    load model1;
else
      [fposang, fnegang]= featurescoin1(pathPosang, pathNegang); 
SV1 = loadingV1(fposang,fnegang);   
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
    [fposdisg,fnegdisg]=featurescoin2(pathPosdisg, pathNegdisg);
    SV2=loadingV2(fposdisg,fnegdisg);   
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
      [fposhap, fneghap] = featurescoin5(pathPoshap, pathNeghap); 
SV3 = loadingV5(fposhap,fneghap);   
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
      [fposneut, fnegneut] = featurescoin10(pathPosneut, pathNegneut); 
SV4 = loadingV10(fposneut,fnegneut);   
     fprintf('Training SVM..\n');
     T4 = cell2mat(SV4(2,:));
    tP = SV4(3,:);
     P4 = cell2mat(tP); 
   [model4] = svmtrain(P4,T4');         
    save model4 model4;
end

if exist('model5.mat','file')
    load model5;
else
      [fposall, fnegall] = featurescoin50(pathPosall, pathNegall); 
SV5 = loadingV50(fposall,fnegall);   
     fprintf('Training SVM..\n');
     T5 = cell2mat(SV5(2,:));
    tP = SV5(3,:);
     P5 = cell2mat(tP); 
   [model5] = svmtrain(P5,T5');         
    save model5 model5;
end
    
        img=imresize(Img,[250 250]);
      img=rgb2gray(img);
   
     x = extractHOGFeatures(img,'CellSize',[50 50]);
  C1 = svmclassify(model1,x);
  C2 = svmclassify(model2,x);
  C5 = svmclassify(model3,x); 
  C10 = svmclassify(model4,x); 
  C50 = svmclassify(model5,x);
end
   
  
 

       
