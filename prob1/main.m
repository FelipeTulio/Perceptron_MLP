fprintf('+------------------------------------------------------------------------+\n');
fprintf('|                         INTELIG�NCIA COMPUTACIONAL                     |\n');
fprintf('|                     REDE PERCEPTRON M�LTIPLAS CAMADAS                  |\n');
fprintf('|                         (Prof. Renato Dourado Maia)                    |\n');
fprintf('|                     Acad�mico: Felipe T�lio de Castro                  |\n');
fprintf('|                                  FACIT                                 |\n');
fprintf('+------------------------------------------------------------------------+\n');

disp(' ');
disp(' ');
disp('PROBLEMA DE APROXIMA��O DE FUN��ES');
disp(' ');
disp(' ');
disp('O perceptron de m�ltiplas camadas ser� treinado...');
pause

%%Carregamento dos dados de teste e de treino
load DadosTreinamento.txt;
load DadosTeste.txt;

%atribui��o das matrizes iniciais de treino
entradas = DadosTreinamento(:,1:3)';
Yd = DadosTreinamento(:, 4)';
%carregamento dos dados do arquivo de teste
XValidacao = DadosTeste(:,1:3)';
YValidacao = DadosTeste(:, 4)';

[x,y] = size(XValidacao);

%estruturas para armazenar os dados dos treinamentos
ErroQuadMedio = zeros(5,1);
MaxEpocas = zeros(5,1);
Vetorerro = zeros(5,y);
Vetormedia = zeros(5,1);
VetordesvioPadrao = zeros(5,1);
VetorYAuxiliar = zeros(5,y);

for i = 1 : 5

    %chamada da fun��o de treino
    [W1 W2 VetordeErros epoca] = treino(0.1, entradas, Yd, 0.000001);

    %armazena as vari�veis desejadas
    MaxEpocas(i,1) = epoca;
    ErroQuadMedio(i,1) = VetordeErros(1,epoca);
    
    %valida��o do treino
    [ YAuxiliar numPadroes erro media desvioPadrao ] = yPMC(XValidacao, W1, W2, YValidacao);
    
    VetorYAuxiliar(i,:) = YAuxiliar;
    Vetorerro(i,:) = erro;
    Vetormedia(i,1) = media;
    VetordesvioPadrao(i,1) = desvioPadrao;
    
    %plotar gr�fico
    plotarGrafico(VetordeErros)
end