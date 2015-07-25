outputPath = 'C:\Users\Simone\Google Drive\Magistrale_IntelligenzaComputazionale\IntelligenzaComputazionale\progetto\progetto neuroscienze\progetto_SimoneRomano_AlessioPetrozziello\matlab_code\extracted_data_Inference_AZ_GV_JE\';
set(gcf, 'PaperPositionMode', 'auto'); %Position plot at left hand corner with width 5 and height 5.
set(gcf, 'PaperSize', [20 20]); %Set the paper to have width 5 and height 5.
set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperType', 'A4');

tmpMatrix = zeros(3,5); 
tmpMatrix(1,:) = timeVector_linkage_spearman_FS_JE(:,1);
tmpMatrix(2,:) = timeVector_linkage_spearman_FS_GV(:,1);
tmpMatrix(3,:) = timeVector_linkage_spearman_FS_AZ(:,1);

figure(1);
bar(tmpMatrix,'DisplayName','tmpMatrix')
legend('10','20','30', '40', '50')
axis([0 4 0 1]);
legend('10 cluster','20 cluster','30 cluster', '40 cluster', '50 cluster');
set(gca,'XTickLabel',{'JE','GV','AZ'});
title('Multiple individual observations');
saveas(gcf, strcat(outputPath, 'Multiple_individual_observations'), 'pdf'); %Save figure

%Inference FFx - RFx
%mean is the same
N = 3; %subject_s number
M = 5; %observation_s number
observation_sMean_for_subject = mean(tmpMatrix,2);
observation_sMean = mean(observation_sMean_for_subject);
observation_sVar = var(tmpMatrix');
figure(2);
h = barwitherr(observation_sVar, observation_sMean_for_subject','FaceColor',[0 .5 .5]);
axis([0 4 0 0.6]);
set(gca,'XTickLabel',{'JE mean','GV mean','AZ mean'});
saveas(gcf, strcat(outputPath, 'ObservationMeanForIndividual'), 'pdf'); %Save figure

%FFx - Fixed Effects
figure(3);
SE_FFx = sqrt((mean(observation_sVar)/(N*M))); %variance FFx
h = barwitherr(SE_FFx, observation_sMean, 'FaceColor',[0 .5 .5],'EdgeColor','black');
axis([0 2 0 0.6]);
set(gca,'XTickLabel',{'Mean - FFx'});
title('FFx Standard Error');
saveas(gcf, strcat(outputPath, 'FFx_result'), 'pdf'); %Save figure
%RFx - Random Effects
figure(4);
SE_RFx = sqrt((mean(observation_sVar)/(N))); %variance FFx
h = barwitherr(SE_RFx, observation_sMean, 'FaceColor',[0 .5 .5],'EdgeColor','black');
axis([0 2 0 0.6]);
set(gca,'XTickLabel',{'Mean - RFx'});
title('RFx Standard Error');
saveas(gcf, strcat(outputPath, 'RFx_result'), 'pdf'); %Save figure