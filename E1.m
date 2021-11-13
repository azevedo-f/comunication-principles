%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%    E1-Exercícios de Programação Matlab/Octave %%%%%%%%%%%%%%%      
%%%%%%%%%%%%      Professor: Luis Carlos Mathias           %%%%%%%%%%%%%%%
%%%%%%%%%%%%      Alunos: Fernanda Azevedo                 %%%%%%%%%%%%%%%
%%%%%%%%%%%%              Leonardo Simon                   %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCÍCIO 01 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calcula o seno do ângulo a
a=30;
b=sin(a)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCÍCIO 02 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calcula a representação cartesiana de um número complexo
m=20;
a=30;
real=(m*cos(a));
img=(m*(i*sin(a)));
x=real+img

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCÍCIO 03 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calcula a representação cartesiana de um número complexo utilizando uma
% função pronta
z=m*(exp(i*a))    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCÍCIO 04 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Gera um vetor com 10 números inteiros aleatórios uniformemente
% distribuidos na faixa de 1 a 100
vector_4=randi(100,10,1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCÍCIO 05 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Dado um vetor de n elementos obtem o vetor de trás pra frente
vector_5=1:100
inv_vector=flip(vector_5)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCÍCIO 06 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Dado um vetor de n elementos é calculado um vetor de diferenças entre n
% números consecutivos
vector_6=(1:100)
aux_1=vector_6(:,1:99)
aux_2=vector_6(:,2:100)
x=aux_1-aux_2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCÍCIO 07 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calcula a norma 2 de um vetor de n elementos
vector_7=1:50            % Cria um vetor com n elementos
aux=vector_7.*vector_7   % Eleva os n elementos dos vetores ao quadrado
x=sum(aux)               % Realiza a soma dos n elementos 
v=sqrt(x)                % Calcula a raiz quadrada da soma dos elementos

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCÍCIO 08 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calcula uma aproximação para o valor de uma progressão de 100 elementos 
% com razao 1/2
vector_8=linspace(1,-1/2,99) 
sum(vector_8)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCÍCIO 09 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Resolve o sistema linear dado por Ax=b
A=[3 1 3; 1 2 3;0 1 7]     % Cria uma matriz 3x3
b=[ 1 ; 1 ; 1]             % Cria uma matriz 1x1
x=inv(A)*b                 % Calcula o sistema linear Ax=b

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% EXERCÍCIO 10 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Desenha um gráfico da função f(t)=cost(t) no intervalo de 0 a 2pi, dado
% que antes é criado um vetor contendo 1000 pontos igualmente espaçados 
t=linspace(0,2*pi,1000);       % Cria vetor com 1000 pontos
f=cos(t);               
hold on
plot(t,f,'b-s');               % Plota o gráfico
grid
xlabel('eixo x');              % Legenda no eixo horizontal
ylabel('eixo y');              % Legenda no eixo vertical
title('Grafico do cosseno');   % Título do gráfico
legend('cos(x)');              % Legenda
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%