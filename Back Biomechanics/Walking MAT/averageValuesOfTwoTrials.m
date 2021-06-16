function averageValuesOfTwoTrials

    numFiles = 60;
    %test1Column = zeros(1,34);
    test1Column = ["b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "aa", "ab", "ac", "ad", "ae", "af", "ag", "ah", "ai"];
    %test2Column = zeros(1,34);
    test2Column = ["ak", "al", "am", "an", "ao", "ap", "aq", "ar", "as", "at", "au", "av", "aw", "ax", "ay", "az", "ba", "bb", "bc", "bd", "be", "bf", "bg", "bh", "bi", "bj", "bk", "bl", "bm", "bn", "bo", "bp", "bq", "br"];
    test1Var = zeros(101,1,60);
    test2Var = zeros(101,1,60);
    
    for sheet = 8:9
        for i=1:34

            range1 = [test1Column(1,i)+'6:'+test1Column(1,i)+'106'];
            range2 = [test2Column(1,i)+'6:'+test2Column(1,i)+'106'];

            for fileNum = 1:numFiles
                fileName = sprintf('Subject%02d_GaitData.xlsx',fileNum);
                test1Var(:,:,fileNum) = xlsread(fileName,sheet,range1);
                test2Var(:,:,fileNum) = xlsread(fileName,sheet,range2);
            end
            
            testVar1 = (test2Var+test1Var)/2;
            save testVar1
            
        end
    end
end