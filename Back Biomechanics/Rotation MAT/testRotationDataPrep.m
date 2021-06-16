function testRotationDataPrep
    tic
    % 101 timeframes, 60 subjects, 51 variables
    % Motions tested:
    % RotateL1 B6:AZ106, RotateL2 BA:CY106, RotateR1 CZ6:EX106, RotateR2 EY6:GW106
    % SitRotateL1 GX6:IV106, SitRotateL2 IW6:KU106, SitRotateR1 KV6:MT106, SitRotateR2 MU6:OS106
    % WBRotateL1 OT6:QR106, WBRotateL2 QS6:SQ106, WBRotateR1 SR6:UP106, WBRotateR2 UQ6:WO106, WBRotateR1-SS WP6:YN106
    numFiles = 60;
    sheet = 1;
    %test1Column = zeros(1,51);
    test1Column = [ "kv", "kw", "kx", "ky", "kz",...
        "la", "lb", "lc", "ld", "le", "lf", "lg", "lh", "li", "lj", "lk", "ll",...
        "lm", "ln", "lo", "lp", "lq", "lr", "ls", "lt", "lu", "lv", "lw", "lx", "ly",...
        "lz", "ma", "mb", "mc", "md", "me", "mf", "mg", "mh", "mi", "mj",...
        "mk", "ml", "mm", "mn", "mo", "mp", "mq", "mr", "ms", "mt"];
    test2Column = [ "mu", "mv", "mw", "mx", "my", "mz",...
    "na", "nb", "nc", "nd", "ne", "nf", "ng", "nh", "ni", "nj", "nk", "nl",...
    "nm", "nn", "no", "np", "nq", "nr", "ns", "nt", "nu", "nv", "nw", "nx", "ny",...
    "nz", "oa", "ob", "oc", "od", "oe", "of", "og", "oh", "oi", "oj",...
    "ok", "ol", "om", "on", "oo", "op", "oq", "or", "os"];
    test1Var = zeros(101,56);
    test2Var = zeros(101,56);
    %NEW file
    load('arrangedSitRotateRVariableData.mat', 'arrangedSitRotateRVariableData');
    %= zeros(101,56,51);      
    varBar = waitbar(0,'Variable Data Process:');
    timeBar = waitbar(0,'Time Data Process:');

    %i = 51 variables (Acr2Pel_Frontal, ... , UT-UL Angle)
    for i = 33:51

        range1 = test1Column(1,i)+'6:'+test1Column(1,i)+'106';
        range2 = test2Column(1,i)+'6:'+test2Column(1,i)+'106';
        
        %sub 5, 15 only have standing data
        %sub 19, 43 up to MT
            %WB Data:
                %sub 7, 10-26, 28-60 [\(15,19,43)] only have standing/sitting data
                %sub 27 up to QR
                %sub 2 up to UP
                %sub 1,3,8,9 up to WO
                %sub 4 up to YN
        %By subject, by column: upload column 
        for fileNum = 1:4   
            fileName = sprintf('Subject%02d_SideBend-Rotate.xlsx',fileNum);
            test1Var(:,fileNum) = xlsread(fileName,sheet,range1);
            test2Var(:,fileNum) = xlsread(fileName,sheet,range2);
            waitbar(fileNum / numFiles, timeBar) 
        end 
        for fileNum = 6:14   
            fileName = sprintf('Subject%02d_SideBend-Rotate.xlsx',fileNum);
            test1Var(:,fileNum-1) = xlsread(fileName,sheet,range1);
            test2Var(:,fileNum-1) = xlsread(fileName,sheet,range2);
            waitbar(fileNum / numFiles, timeBar) 
        end 
        for fileNum = 16:18   
            fileName = sprintf('Subject%02d_SideBend-Rotate.xlsx',fileNum);
            test1Var(:,fileNum-2) = xlsread(fileName,sheet,range1);
            test2Var(:,fileNum-2) = xlsread(fileName,sheet,range2);
            waitbar(fileNum / numFiles, timeBar) 
        end
        for fileNum = 20:42   
            fileName = sprintf('Subject%02d_SideBend-Rotate.xlsx',fileNum);
            test1Var(:,fileNum-3) = xlsread(fileName,sheet,range1);
            test2Var(:,fileNum-3) = xlsread(fileName,sheet,range2);
            waitbar(fileNum / numFiles, timeBar) 
        end 
        for fileNum = 44:numFiles   
            fileName = sprintf('Subject%02d_SideBend-Rotate.xlsx',fileNum);
            test1Var(:,fileNum-4) = xlsread(fileName,sheet,range1);
            test2Var(:,fileNum-4) = xlsread(fileName,sheet,range2);
            waitbar(fileNum / numFiles, timeBar) 
        end 

        %****add column to NEW master file
        arrangedSitRotateRVariableData(:,:,i) = (test1Var+test2Var)/2;
        %****save NEW file
        save arrangedSitRotateRVariableData
        waitbar(i / 51, varBar) 
        
    end      
    close(timeBar)  
    close(varBar)       
    toc   
end