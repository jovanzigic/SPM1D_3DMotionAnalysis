function statTestSitRotation
    
    % This is for sitting left rotation data

    %Female LBP (27 sub): 4 7 8 9 10 11 18 19 20 21 24 25 28 30 32 34 35 36 37 39 42
    %43 44 46 47 48 50
    %Female NLBP (20 sub): 2 3 6 12 16 22 23 26 31 33 38 40 41 45 51 52 55
    %56 57 58
    %Male LBP (8 sub): 1 13 14 17 27 29 49 54
    %Male NLBP (3 sub): 53 59 60
    %z axial, y sagittal, x frontal
    
    %for SitL, 6 to 14 minus 1, 16 to 60 minus 2.
    %for SitR, 6 to 14 minus 1, 16 to 18 minus 2, 20 to 42 minus 3, 44 to 60 minus 4.
    
    %UTULZ
    
    data = load('datasetUTULZ_SitRotateL.mat','datasetUTULZ_SitRotateL');
    [YP,YNP] = deal([data.datasetUTULZ_SitRotateL.Subject4 data.datasetUTULZ_SitRotateL.Subject6 ...
        data.datasetUTULZ_SitRotateL.Subject7 data.datasetUTULZ_SitRotateL.Subject8 ...
        data.datasetUTULZ_SitRotateL.Subject9 data.datasetUTULZ_SitRotateL.Subject10 ...
        data.datasetUTULZ_SitRotateL.Subject16 data.datasetUTULZ_SitRotateL.Subject17 ...
        data.datasetUTULZ_SitRotateL.Subject18 data.datasetUTULZ_SitRotateL.Subject19 ...
        data.datasetUTULZ_SitRotateL.Subject22 data.datasetUTULZ_SitRotateL.Subject23 ...
        data.datasetUTULZ_SitRotateL.Subject26 data.datasetUTULZ_SitRotateL.Subject28 ...
        data.datasetUTULZ_SitRotateL.Subject30 data.datasetUTULZ_SitRotateL.Subject32 ...
        data.datasetUTULZ_SitRotateL.Subject33 data.datasetUTULZ_SitRotateL.Subject34 ...
        data.datasetUTULZ_SitRotateL.Subject35 data.datasetUTULZ_SitRotateL.Subject37 ...
        data.datasetUTULZ_SitRotateL.Subject40 data.datasetUTULZ_SitRotateL.Subject41 ...
        data.datasetUTULZ_SitRotateL.Subject42 data.datasetUTULZ_SitRotateL.Subject44 ...
        data.datasetUTULZ_SitRotateL.Subject45 data.datasetUTULZ_SitRotateL.Subject46 ...
        data.datasetUTULZ_SitRotateL.Subject48 ], ...
        [data.datasetUTULZ_SitRotateL.Subject2 data.datasetUTULZ_SitRotateL.Subject3 ...
        data.datasetUTULZ_SitRotateL.Subject5 data.datasetUTULZ_SitRotateL.Subject11 ...
        data.datasetUTULZ_SitRotateL.Subject14 ...
        data.datasetUTULZ_SitRotateL.Subject20 data.datasetUTULZ_SitRotateL.Subject21 ...
        data.datasetUTULZ_SitRotateL.Subject24 data.datasetUTULZ_SitRotateL.Subject29 ...
        data.datasetUTULZ_SitRotateL.Subject31 data.datasetUTULZ_SitRotateL.Subject36 ...
        data.datasetUTULZ_SitRotateL.Subject38 data.datasetUTULZ_SitRotateL.Subject39 ...
        data.datasetUTULZ_SitRotateL.Subject43 data.datasetUTULZ_SitRotateL.Subject49 ...
        data.datasetUTULZ_SitRotateL.Subject50 data.datasetUTULZ_SitRotateL.Subject53 ...
        data.datasetUTULZ_SitRotateL.Subject54 data.datasetUTULZ_SitRotateL.Subject55 ...
        data.datasetUTULZ_SitRotateL.Subject56 ]);
    spm       = spm1d.stats.ttest2(YP', YNP');
    spmi      = spm.inference(0.05, 'two_tailed', true, 'interp',true);
    disp(spmi);

    close all
    subplot(1,2,1);
    spmi.plot();
    title('Two-Sample T-Test');
    xlabel('Time (%)','FontSize',12,'FontWeight','bold');
    ylabel('Variance','FontSize',12,'FontWeight','bold');
    spmi.plot_threshold_label();
    spmi.plot_p_values();
    
    subplot(1,2,2);
    YPmean = mean (YP');
    YPstd = std (YP');
    numYPPts = length (YPmean);
    YNPmean = mean (YNP');
    YNPstd = std (YNP');
    numYNPPts = length (YNPmean);
    p1 = plot (1:numYPPts, YPmean, 'b','LineWidth',2);
    hold on
	plot (1:numYPPts, YPmean + YPstd, 'b--');
	plot (1:numYPPts, YPmean - YPstd, 'b--');
    p2 = plot (1:numYNPPts, YNPmean, 'r','LineWidth',2);
	plot (1:numYNPPts, YNPmean + YNPstd, 'r--');
    plot (1:numYNPPts, YNPmean - YNPstd, 'r--');
    xlim ([1 numYPPts]);
    legend([p1 p2],'Pain','No Pain', 'Location','northwest')
    title('Mean and SD');
    xlabel('Time (%)','FontSize',12,'FontWeight','bold');
    ylabel('Angle','FontSize',12,'FontWeight','bold');
    
    savefig('UTULZ_SitRotateL_Females');
    saveas(gcf,'UTULZ_SitRotateL_Females.png');
    
end