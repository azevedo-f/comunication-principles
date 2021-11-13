%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%    E4-Exerc�cios de Programa��o Matlab/Octave %%%%%%%%%%%%%%%      
%%%%%%%%%%%%      Professor: Luis Carlos Mathias           %%%%%%%%%%%%%%%
%%%%%%%%%%%%      Alunos: Fernanda Azevedo                 %%%%%%%%%%%%%%%
%%%%%%%%%%%%              Leonardo Simon                   %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Fecha gr�ficos, limpa mem�ria e jan. de comandos
close all; clear all; clc;

Fs = 44100;     % Freq. de amostragem em Hz
inicio = 9*Fs;  % inicia em 8 s (primeira amostra)
fim = 14*Fs;    % termina em 13 s
[s,Fs] = audioread('venom.mp4',[inicio fim]); % o Octave n�o toca mp3, mp4
s = s(:,1);     % Como o som � estereo, considera somente um canal para simplificar
%soundsc(s,Fs);  % toca o �udio

nfft=length(s); % Tamanho do vetor s
Ts = 1/Fs;      % Per�odo de amostragem [s]
t = 0:Ts:Ts*(length(s)-1); % Vetor de tempo
x = cos(2*pi*4000*t)+sin(2*pi*6000*t)+randn(size(t)); % Gera o PSD com freq. entre 4 e 6kHz

%% Plotagem dos gr�ficos
subplot(3,1,1);
figure_1=plot(psd(spectrum.periodogram,x,'Fs',Fs,'NFFT',nfft)); % plota o PSD com a freq. entre 4 e 6kHz
set(figure_1,'Color','Red');
title('PSD com freq. entre 4 e 6kHz');
grid on 

subplot(3,1,2);
figure_2=plot(psd(spectrum.periodogram,s,'Fs',Fs,'NFFT',nfft)); % plota o PSD do a�dio do filme Venom
set(figure_2,'Color','Blue');
title('PSD som filme Venom');
grid on

subplot(3,1,3);
hold on
figure_1=plot(psd(spectrum.periodogram,x,'Fs',Fs,'NFFT',nfft)); % plota o PSD com a freq. entre 4 e 6kHz;
set(figure_1,'Color','Red');
figure_2=plot(psd(spectrum.periodogram,s,'Fs',Fs,'NFFT',nfft)); % plota o PSD do a�dio
set(figure_2,'Color','Blue');
title('Compara��o de PSDs');
grid on
hold off

% Podemos observar nos gr�ficos ao realizar uma compara��o entre os PSDs 
% que o som que afeta o venom no filme possui entre 4 e 6kHz 

