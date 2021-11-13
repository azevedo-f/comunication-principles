%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%    E3-Exercícios de Programação Matlab/Octave %%%%%%%%%%%%%%%      
%%%%%%%%%%%%      Professor: Luis Carlos Mathias           %%%%%%%%%%%%%%%
%%%%%%%%%%%%      Alunos: Fernanda Azevedo                 %%%%%%%%%%%%%%%
%%%%%%%%%%%%              Leonardo Simon                   %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gera o efeito reverb utilizando a convolução discreta no tempo

close all; clear all; clc
nBits = 24;                         % Número de bits
NumChannels = 1;                    % Número de canais
Fs = 44100;                         % Frequência
%% Gravação do som 
disp('Start speaking.')             % Mostra mensagem de início da gravação
recObj=audiorecorder(Fs,nBits,NumChannels);  % Grava o aúdio utilizando o microfone
recordblocking(recObj,5);
x=getaudiodata(recObj);             % Armazena a gravação na variável x
subplot(3,1,1);
plot(x);                            % Plotagem da voz original
disp('End of Recording.');          % Mostra mensagem de fim da gravação
%% Reverberação
s=x(:,1);
d=75000;                            % Delay
xlen=length(x);
t=zeros(xlen,1);                    % Função impulso
t(5)=0.6;                           % Impulso na magnitude 05

c=0.6                               % Variável de controle
passo=0.08

for n=1:50
t(Fs*passo*n)=2^-(n*c);             % Impulso com delay
end

subplot(3,1,2);
plot(t);                            % Plotagem do impulso
z=conv(s,t);                        % Realiza a convolução
subplot(3,1,3);
plot(z);                            % Plotagem do eco
soundsc(z,Fs);                      % Função para tocar o som com eco