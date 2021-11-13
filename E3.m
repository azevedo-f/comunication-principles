%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%    E3-Exerc�cios de Programa��o Matlab/Octave %%%%%%%%%%%%%%%      
%%%%%%%%%%%%      Professor: Luis Carlos Mathias           %%%%%%%%%%%%%%%
%%%%%%%%%%%%      Alunos: Fernanda Azevedo                 %%%%%%%%%%%%%%%
%%%%%%%%%%%%              Leonardo Simon                   %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gera o efeito reverb utilizando a convolu��o discreta no tempo

close all; clear all; clc
nBits = 24;                         % N�mero de bits
NumChannels = 1;                    % N�mero de canais
Fs = 44100;                         % Frequ�ncia
%% Grava��o do som 
disp('Start speaking.')             % Mostra mensagem de in�cio da grava��o
recObj=audiorecorder(Fs,nBits,NumChannels);  % Grava o a�dio utilizando o microfone
recordblocking(recObj,5);
x=getaudiodata(recObj);             % Armazena a grava��o na vari�vel x
subplot(3,1,1);
plot(x);                            % Plotagem da voz original
disp('End of Recording.');          % Mostra mensagem de fim da grava��o
%% Reverbera��o
s=x(:,1);
d=75000;                            % Delay
xlen=length(x);
t=zeros(xlen,1);                    % Fun��o impulso
t(5)=0.6;                           % Impulso na magnitude 05

c=0.6                               % Vari�vel de controle
passo=0.08

for n=1:50
t(Fs*passo*n)=2^-(n*c);             % Impulso com delay
end

subplot(3,1,2);
plot(t);                            % Plotagem do impulso
z=conv(s,t);                        % Realiza a convolu��o
subplot(3,1,3);
plot(z);                            % Plotagem do eco
soundsc(z,Fs);                      % Fun��o para tocar o som com eco