[a, b, c] = generatenoisysamples('N_Targets', 1, 'N_Uncorr', 2, 'Duration', 0.05, 'N_Jitter',3, 'ShowSNR', 1, 'NoiseSNR', 15);
% test_spikes = toolGetSpikes(a, 0.3, 0);
writematrix(a, 'C:\Users\nickb\Desktop\a.csv');
target1_times = b(1).targettimes;
%target2_times = b(2).targettimes;
figure(1)
subplot(2, 1, 1)
plotData=plot((1:length(a))/24000,- a, 'k-');
x_data=plotData.XData;
%y_data=plotData.YData;
y_data=a;
xy_data=cat(1,x_data,y_data);
writematrix(xy_data,'C:\Users\nickb\Desktop\MATLAB_SpikeGenerator_Data\xy_data.csv') 
%hold on
 %plot(target1_times + 0.002 , 0.8 * ones(size(target1_times)), 'rx')
  %plotData=plot(target1_times + 0.002 , 0.8 * ones(size(target1_times)), 'rx');
%plot(target2_times, 0.9 * ones(size(target2_times)), 'bx')
% plot(test_spikes/24000, 0.6 * ones(size(test_spikes)), 'gx')
%hold off
%subplot(2, 1, 2)
% hold on
% hold off
%ylim([0, 3])

filename= 'C:\Users\nickb\Desktop\MATLAB_SpikeGenerator_Data\test.wav';
audiowrite(filename,a,24000);
clear y Fs
[y,~] = audioread(filename);
%sound(y,Fs);

% Read standard sample tune that ships with MATLAB.
%%[dataIn, Fs] = audioread(filename);
% Filter the signal
%%fc = 1200; % Make higher to hear higher frequencies.
% Design a Butterworth filter.
%%[b, a] = butter(6,fc/(Fs/2));
%%freqz(b,a)
% Apply the Butterworth filter.
%%filteredSignal = filter(b, a, dataIn);
%%filename2= 'C:\Users\nickb\Desktop\MATLAB_SpikeGenerator_Data\test2.wav';
%%audiowrite(filename2, filteredSignal,24000);
% Play the sound.
%player = audioplayer(filteredSignal, Fs);
%play(player);

[dataIn, Fs] = audioread(filename);
lowpassedsignal  = lowpass(dataIn,350,Fs);

filename3= 'C:\Users\nickb\Desktop\MATLAB_SpikeGenerator_Data\test3.wav';
audiowrite(filename3, lowpassedsignal,24000);