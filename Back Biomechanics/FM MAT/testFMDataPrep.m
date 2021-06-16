function testFMDataPrep
    
    % 101 timeframes, 59 subjects, 48 variables
    % test1 B6:AW106, test2 AX:CS106
    numFiles = 60;
    sheet = 1;
    %test1Column = zeros(1,48);
    test1Column = [ "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",...
        "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y",...
        "z", "aa", "ab", "ac", "ad", "ae", "af", "ag", "ah", "ai", "aj",...
        "ak", "al", "am", "an", "ao", "ap", "aq", "ar", "as", "at", "au", "av", "aw"];
    test2Column = [ "ax", "ay", "az","ba", "bb", "bc", "bd", "be", "bf", "bg", "bh", "bi", "bj", "bk", "bl",...
    "bm", "bn", "bo", "bp", "bq", "br", "bs", "bt", "bu", "bv", "bw", "bx", "by",...
    "bz", "ca", "cb", "cc", "cd", "ce", "cf", "cg", "ch", "ci", "cj",...
    "ck", "cl", "cm", "cn", "co", "cp", "cq", "cr", "cs"];
    test1Var = zeros(101,59);
    test2Var = zeros(101,59);
    
%     %NEW or load file
%     arrangedArabLData = zeros(101,59,48);
%     %load('arrangedSitRotateRVariableData.mat', 'arrangedSitRotateRVariableData');     
%     varBar = waitbar(0,'Variable Data Process:');
%     timeBar = waitbar(0,'Time Data Process:');
% 
%     tic
%     %i = 48 variables (Acr2Pel_Frontal, ... , UT-UL Angle)
%     for i = 1:48
% 
%         range1 = test1Column(1,i)+'6:'+test1Column(1,i)+'106';
%         range2 = test2Column(1,i)+'6:'+test2Column(1,i)+'106';
%         
%         %sub 53 skip
%         %single test for 6, 40, 41
%         %By subject, by column: upload column 
%         
%         for fileNum = 1:52 
%             fileName = sprintf('Subject%02d_Arabesque_Passe_FMS.cmz_Normalized Angles_ARAB_L.xlsx',fileNum);
%             if fileNum == 6
%                 test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
%                 test2Var(:,fileNum) = xlsread(fileName,sheet,range1);
%             elseif fileNum == 40
%                 test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
%                 test2Var(:,fileNum) = xlsread(fileName,sheet,range1);
%             elseif fileNum == 41
%                 test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
%                 test2Var(:,fileNum) = xlsread(fileName,sheet,range1);
%             else
%             test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
%             test2Var(:,fileNum) = xlsread(fileName,sheet,range2);
%             waitbar(fileNum / numFiles, timeBar) 
%             end
%         end 
%         for fileNum = 54:numFiles   
%             fileName = sprintf('Subject%02d_Arabesque_Passe_FMS.cmz_Normalized Angles_ARAB_L.xlsx',fileNum);
%             test1Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%             test2Var(:,fileNum-1) = xlsread(fileName,sheet,range2);
%             waitbar(fileNum / numFiles, timeBar) 
%         end
% 
%         %****add column to NEW master file
%         arrangedArabLData(:,:,i) = (test1Var+test2Var)/2;
%         %****save NEW file
%         save arrangedArabLData
%         waitbar(i / 48, varBar) 
%         
%     end      
%     close(timeBar)  
%     close(varBar)       
%     toc 
%     
%     %NEW or load file
%     arrangedArabRData = zeros(101,59,48);
%     %load('arrangedSitRotateRVariableData.mat', 'arrangedSitRotateRVariableData');     
%     varBar = waitbar(0,'Variable Data Process:');
%     timeBar = waitbar(0,'Time Data Process:');
% 
%     tic
%     %i = 48 variables (Acr2Pel_Frontal, ... , UT-UL Angle)
%     for i = 1:48
% 
%         range1 = test1Column(1,i)+'6:'+test1Column(1,i)+'106';
%         range2 = test2Column(1,i)+'6:'+test2Column(1,i)+'106';
%         
%         %sub 53 skip
%         %single test for 9, 55, 56
%         %By subject, by column: upload column 
%         
%         for fileNum = 1:52   
%             fileName = sprintf('Subject%02d_Arabesque_Passe_FMS.cmz_Normalized Angles_ARAB_R.xlsx',fileNum);
%             if fileNum == 9
%                 test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
%                 test2Var(:,fileNum) = xlsread(fileName,sheet,range1);
%             else
%             test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
%             test2Var(:,fileNum) = xlsread(fileName,sheet,range2);
%             waitbar(fileNum / numFiles, timeBar) 
%             end
%         end 
%         for fileNum = 54:numFiles   
%             fileName = sprintf('Subject%02d_Arabesque_Passe_FMS.cmz_Normalized Angles_ARAB_R.xlsx',fileNum);
%             if fileNum == 55
%                 test1Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%                 test2Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%             elseif fileNum == 56
%                 test1Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%                 test2Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%             else
%             test1Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%             test2Var(:,fileNum-1) = xlsread(fileName,sheet,range2);
%             waitbar(fileNum / numFiles, timeBar) 
%             end 
%         end
% 
%         %****add column to NEW master file
%         arrangedArabRData(:,:,i) = (test1Var+test2Var)/2;
%         %****save NEW file
%         save arrangedArabRData
%         waitbar(i / 48, varBar) 
%         
%     end      
%     close(timeBar)  
%     close(varBar)       
%     toc 

%     %NEW or load file
%     %arrangedFMSLData = zeros(101,59,48);
%     load('arrangedFMSLData.mat', 'arrangedFMSLData');     
%     varBar = waitbar(0,'Variable Data Process:');
%     timeBar = waitbar(0,'Time Data Process:');
% 
%     tic
%     %i = 48 variables (Acr2Pel_Frontal, ... , UT-UL Angle)
%     for i = 1:48
% 
%         range1 = test1Column(1,i)+'6:'+test1Column(1,i)+'106';
%         range2 = test2Column(1,i)+'6:'+test2Column(1,i)+'106';
%         
%         %sub 53 skip
%         %single test for 9, 56, 58
%         %By subject, by column: upload column 
%         
%         for fileNum = 1:52   
%             fileName = sprintf('Subject%02d_Arabesque_Passe_FMS.cmz_Normalized Angles_FMS_L.xlsx',fileNum);
%             if fileNum == 9
%                 test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
%                 test2Var(:,fileNum) = xlsread(fileName,sheet,range1);
%             else
%             test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
%             test2Var(:,fileNum) = xlsread(fileName,sheet,range2);
%             waitbar(fileNum / numFiles, timeBar) 
%             end
%         end 
%         for fileNum = 54:numFiles   
%             fileName = sprintf('Subject%02d_Arabesque_Passe_FMS.cmz_Normalized Angles_FMS_L.xlsx',fileNum);
%             if fileNum == 56
%                 test1Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%                 test2Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%             elseif fileNum == 58
%                 test1Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%                 test2Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%             else
%             test1Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%             test2Var(:,fileNum-1) = xlsread(fileName,sheet,range2);
%             waitbar(fileNum / numFiles, timeBar) 
%             end 
%         end
% 
%         %****add column to NEW master file
%         arrangedFMSLData(:,:,i) = (test1Var+test2Var)/2;
%         %****save NEW file
%         save arrangedFMSLData
%         waitbar(i / 48, varBar) 
%         
%     end      
%     close(timeBar)  
%     close(varBar)       
%     toc 

%     %NEW or load file
%     %arrangedFMSRData = zeros(101,59,48);
%     load('arrangedFMSRData.mat', 'arrangedFMSRData');    
%     varBar = waitbar(0,'Variable Data Process:');
%     timeBar = waitbar(0,'Time Data Process:');
% 
%     tic
%     %i = 48 variables (Acr2Pel_Frontal, ... , UT-UL Angle)
%     for i = 1:48
% 
%         range1 = test1Column(1,i)+'6:'+test1Column(1,i)+'106';
%         range2 = test2Column(1,i)+'6:'+test2Column(1,i)+'106';
%         
%         %sub 53 skip
%         %single test for 11, 16
%         %By subject, by column: upload column 
%         
%         for fileNum = 1:52   
%             fileName = sprintf('Subject%02d_Arabesque_Passe_FMS.cmz_Normalized Angles_FMS_R.xlsx',fileNum);
%             if fileNum == 11
%                 test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
%                 test2Var(:,fileNum) = xlsread(fileName,sheet,range1);
%             elseif fileNum == 16
%                 test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
%                 test2Var(:,fileNum) = xlsread(fileName,sheet,range1);
%             else
%             test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
%             test2Var(:,fileNum) = xlsread(fileName,sheet,range2);
%             waitbar(fileNum / numFiles, timeBar) 
%             end 
%         end 
%         for fileNum = 54:numFiles   
%             fileName = sprintf('Subject%02d_Arabesque_Passe_FMS.cmz_Normalized Angles_FMS_R.xlsx',fileNum);
%             test1Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%             test2Var(:,fileNum-1) = xlsread(fileName,sheet,range2);
%             waitbar(fileNum / numFiles, timeBar) 
%         end
% 
%         %****add column to NEW master file
%         arrangedFMSRData(:,:,i) = (test1Var+test2Var)/2;
%         %****save NEW file
%         save arrangedFMSRData
%         waitbar(i / 48, varBar) 
%         
%     end      
%     close(timeBar)  
%     close(varBar)       
%     toc 
% 
%     %NEW or load file
%     arrangedPasseLData = zeros(101,59,48);
%     %load('arrangedSitRotateRVariableData.mat', 'arrangedSitRotateRVariableData');     
%     varBar = waitbar(0,'Variable Data Process:');
%     timeBar = waitbar(0,'Time Data Process:');
% 
%     tic
%     %i = 48 variables (Acr2Pel_Frontal, ... , UT-UL Angle)
%     for i = 1:48
% 
%         range1 = test1Column(1,i)+'6:'+test1Column(1,i)+'106';
%         range2 = test2Column(1,i)+'6:'+test2Column(1,i)+'106';
%         
%         %sub 53 skip
%         %single test for 47, 56
%         %By subject, by column: upload column 
%         
%         for fileNum = 1:52   
%             fileName = sprintf('Subject%02d_Arabesque_Passe_FMS.cmz_Normalized Angles_Passe_L.xlsx',fileNum);
%             if fileNum == 47
%                 test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
%                 test2Var(:,fileNum) = xlsread(fileName,sheet,range1);
%             else
%             test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
%             test2Var(:,fileNum) = xlsread(fileName,sheet,range2);
%             waitbar(fileNum / numFiles, timeBar) 
%             end
%         end 
%         for fileNum = 54:numFiles   
%             fileName = sprintf('Subject%02d_Arabesque_Passe_FMS.cmz_Normalized Angles_Passe_L.xlsx',fileNum);
%             if fileNum == 56
%                 test1Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%                 test2Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%             else
%             test1Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
%             test2Var(:,fileNum-1) = xlsread(fileName,sheet,range2);
%             waitbar(fileNum / numFiles, timeBar) 
%             end 
%         end
% 
%         %****add column to NEW master file
%         arrangedPasseLData(:,:,i) = (test1Var+test2Var)/2;
%         %****save NEW file
%         save arrangedPasseLData
%         waitbar(i / 48, varBar) 
%         
%     end      
%     close(timeBar)  
%     close(varBar)       
%     toc 
% 
    %NEW or load file
    %arrangedPasseRData = zeros(101,59,48);
    load('arrangedPasseRData.mat', 'arrangedPasseRData');        
    varBar = waitbar(0,'Variable Data Process:');
    timeBar = waitbar(0,'Time Data Process:');

    tic
    %i = 48 variables (Acr2Pel_Frontal, ... , UT-UL Angle)
    for i = 17:48

        range1 = test1Column(1,i)+'6:'+test1Column(1,i)+'106';
        range2 = test2Column(1,i)+'6:'+test2Column(1,i)+'106';
        
        %sub 53 skip
        %single test for 57
        %By subject, by column: upload column 
        
        for fileNum = 1:52   
            fileName = sprintf('Subject%02d_Arabesque_Passe_FMS.cmz_Normalized Angles_Passe_R.xlsx',fileNum);
            test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
            test2Var(:,fileNum) = xlsread(fileName,sheet,range2);
            waitbar(fileNum / numFiles, timeBar) 
        end 
        for fileNum = 54:numFiles   
            fileName = sprintf('Subject%02d_Arabesque_Passe_FMS.cmz_Normalized Angles_Passe_R.xlsx',fileNum);
            if fileNum == 57
                test1Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
                test2Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
            else
            test1Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
            test2Var(:,fileNum-1) = xlsread(fileName,sheet,range2);
            waitbar(fileNum / numFiles, timeBar) 
            end
        end

        %****add column to NEW master file
        arrangedPasseRData(:,:,i) = (test1Var+test2Var)/2;
        %****save NEW file
        save arrangedPasseRData
        waitbar(i / 48, varBar) 
        
    end      
    close(timeBar)  
    close(varBar)       
    toc 

end