%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%    E2-Exercícios de Programação Matlab/Octave %%%%%%%%%%%%%%%      
%%%%%%%%%%%%      Professor: Luis Carlos Mathias           %%%%%%%%%%%%%%%
%%%%%%%%%%%%      Alunos: Fernanda Azevedo                 %%%%%%%%%%%%%%%
%%%%%%%%%%%%              Leonardo Simon                   %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Fecha gráficos, limpa memória e jan. de comandos
close all; clear all; clc;

%% Parâmetros dos sinais 
A1 = 1; f1 = 3e3; % Vpp=1V e f=3kHz
A2 = 2; f2 = 2e3; % Vpp=2V e f=2kHz
 
Fs = 100*f1;  % Frequência de amostragem
Ts = 1/Fs;    % Tempo de amostragem 
t = 0:Ts:(1000-1)*Ts;   % Gera o vetor de tempo

%%  Gera um sinal senoidal e uma onda retangular 
s1 = A1*sin(2*pi*f1*t);
s2 = A2*square(2*pi*f2*t);

%% Soma do sinal senoidal ao sinal retangular 
s = s1 + s2;

tempo = 10; % em segundos
sp = resample(s,44e3,Fs);   % reamostra para 44kHz
sp = repmat(sp,1,48*tempo); % repete o vetor
soundsc(sp,44e3); % Toca na caixa de som

%%  Plotagem do sinal no tempo s(t) 
plot( t*1e3, s); xlim([0 2]);
grid on;              % Ativa grade
ylabel('s(t)  [V]');  % Define rótulos
xlabel('t  [ms]');

%%  Realiza a FFT
L = length(s);  
S = fft(s)/L;       
magS = abs(S);  % Extrai o módulo
% Retira a banda lateral esquerda e compensa multiplicando a magnitude por 2
magS = 2*magS(1:L/2+1); 

%% Plotagem da magnitude espectral |S(f)|  
f = Fs*(0:(L/2))/L;
figure; plot(f/1e3,magS); grid on; 
xlim([0 25]); % Define limites do plot
title('Magnitude Espectral de s_0(t)')
xlabel('f   [kHz]'); ylabel('|S_0(f)|   [V]');

%% Plotagem da magnitude espectral |S(f)| em escala dB 
magSdb = 20*log10(magS);
figure; plot(f/1e3,magSdb); grid on; 
title('Magnitude Espectral de s(t) em dB')
xlabel('f   [kHz]'); ylabel('|S(f)|   [dBV]');
xlim([0 25]); ylim([-30 10]); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Conclusão: As raias de valores ímpares são da onda adicionada e para 
% valores pares as raias são da onda senoidal 
