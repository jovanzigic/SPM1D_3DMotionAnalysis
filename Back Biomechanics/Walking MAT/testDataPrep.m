function testDataPrep
    tic
    %60 subjects
    numFiles = 60;
    %test1Column = zeros(1,34);
    test1Column = ["b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "aa", "ab", "ac", "ad", "ae", "af", "ag", "ah", "ai"];
    %test2Column = zeros(1,34);
    test2Column = ["ak", "al", "am", "an", "ao", "ap", "aq", "ar", "as", "at", "au", "av", "aw", "ax", "ay", "az", "ba", "bb", "bc", "bd", "be", "bf", "bg", "bh", "bi", "bj", "bk", "bl", "bm", "bn", "bo", "bp", "bq", "br"];
    test1Var = zeros(101,60);
    test2Var = zeros(101,60);
    arrangedGaitVariableData = zeros(101,60,68);
    
    %sheet 8 = Left Stance Norm'd, sheet 9 = Right Stance Norm'd
    for sheet = 9
        
        varBar = waitbar(0,'Variable Data Process:');
        
        %i = 34 variables (Acr2Pel_Frontal, ... , UT-UL Angle)
        for i = 1:34
            
            timeBar = waitbar(0,'Time Data Process:');
            range1 = test1Column(1,i)+'6:'+test1Column(1,i)+'106';
            range2 = test2Column(1,i)+'6:'+test2Column(1,i)+'106';

            for fileNum = 1:numFiles         
                fileName = sprintf('Subject%02d_GaitData.xlsx',fileNum);
                test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
                test2Var(:,fileNum) = xlsread(fileName,sheet,range2);
                waitbar(fileNum / numFiles, timeBar)          
            end 
            %j for sheet 9 (35 to 64)
            j = i+34;
            arrangedGaitVariableData(:,:,j) = (test2Var+test1Var)/2;
            save arrangedGaitVariableData
            waitbar(i / 34, varBar)
            close(timeBar)           
        end      
        close(varBar)       
    end 
    toc   
end