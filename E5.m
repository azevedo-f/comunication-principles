%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%    E5-Exercícios de Programação Matlab/Octave %%%%%%%%%%%%%%%      
%%%%%%%%%%%%      Professor: Luis Carlos Mathias           %%%%%%%%%%%%%%%
%%%%%%%%%%%%      Alunos: Fernanda Azevedo                 %%%%%%%%%%%%%%%
%%%%%%%%%%%%              Leonardo Simon                   %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; close all; clc;


%% Carrega sinal AM-DSB na memória
 
[s,Fs] = audioread(['fernanda_leonardo_fc_6kHz.wav']); 

% Fs - freq.  de amostragem [Hz]
% s - matrix de duas colunas (coluna 1 sinal esquerdo, coluna 2 direito)

Ts = 1/Fs;                    % Período de amostragem [s]
t = 0:Ts:Ts*(length(s)-1);    % Gera um vetor de tempo
s = s(:,1)';                  % Considera somente um canal (mono)
n = 2^12;
tp = .1;                      % duração do plot
subplot(3,1,1);
figure_1=plot(t(1:tp*Fs),s(1:tp*Fs));  % Plota 1 seg. no tempo
title('Sinal modulado');
grid on
xlabel('t  [s]'); ylabel('s_{AM-DSB}(t)'); ylim([-1.1 1.1])

%soundsc(s,Fs); % Toca o sinal modulado

% Faz a análise espectral
fft_sinal = fft(s(1:n));        % Transformada rápida de fourier
mag_sinal = abs(fft_sinal);     % Extrai as magnitudes
mag = 2*mag_sinal(1:n/2)/n;     % Considera somente o semiplano positivo de freqs                               
f = Fs.*(0:(n/2)-1)./n;         % Gera escala de freqs.           
subplot(3,1,2);
figure_2=plot( f*1e-3, 20*log10(mag));   % Plota a magnitude espectral do sinal AM-DSB
title('Magnitude espectral do sinal');
grid on
xlabel('f  [kHz]'); ylabel('|S_{AM-DSB}(f)|'); 

%% Sinal da portadora
fc = 6e3; 
Ac=10;
c=Ac*cos(2*pi*fc*t);

%% Demodulador
s_dem=s.*c;
s=lowpass(s_dem,150,Fs);
subplot(3,1,3);
figure_3=plot(t,s);
title('Sinal demodulado');
grid on
xlabel('t  [s]'); ylabel('s_{AM-DSB}(t)');
soundsc(s,Fs);     %Toca o sinal demodulado

% Podemos concluir que a música é Porco Aranha-Simpson

