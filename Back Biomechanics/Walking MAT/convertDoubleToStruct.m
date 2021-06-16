%not used
structData = uiimport('arrangedData.mat');
datapoints = fieldnames(structData);
structDataPoints = structData.(datapoints{:,:,:});
%totalData = [zeros(1,size(structDataPoints,3));structDataPoints];

%convert doubles to cell
cellData = num2cell(arrangedData);


%value = cell(101,60,68);
field = 'y';
testStructData = struct(field,cellData);
structDataTest = cell2struct(cellData, field, 2);

display(arrangedData(1,1,:));

%
datasetLLPelvisLeftX = cell2struct(num2cell(LLPelvisLeftX, 1), compose('Var%d', 1:size(LLPelvisLeftX, 2)), 2);
