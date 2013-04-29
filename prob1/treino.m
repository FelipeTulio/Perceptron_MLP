function [W1 W2 VetordeErros epoca] = treino(taxaAprendizado, X, Yd, E )

%Inicializa��o dos dados
neuronios1 = 10;
neuroniossaida = 1;

%numPadroes � uma vari�vel que guarda o n�mero de colunas da matriz de
%entrada. Neste caso, cada coluna representa um padr�o.
numPadroes = size(X,2);

%dimensao � uma vari�vel que armazena a quantidade de linhas neste caso.
%Ela representa o valor de dimens�es que os padr�es possuem.
dimensao = size(X,1);


%Polariza��o da matriz X (inser��o do bias)
pol = 1 * ones(1,numPadroes);
X = [pol; X ];

%Declara��o rand�mica da matriz de pesos (W1) e inser��o do bias
Wlimite = 0.5;
W1 = 2*Wlimite*rand(neuronios1, dimensao)-Wlimite;
bias = randn(neuronios1,1); %% matriz de uma coluna e 15 linhas
W1 = [bias W1];

%Declara��o rand�mica da matriz de pesos (W2) e inser��o do bias
W2 = 2*Wlimite*rand(neuroniossaida, neuronios1)-Wlimite;
bias = randn(neuroniossaida,1); %% matriz de uma coluna e 3 linhas
W2 = [bias W2];

%Declara��o de vari�veis de controle
epoca = 0;
vetorGradientes = zeros(neuroniossaida,1);
erroEpoca = 1;
erroEpocaAnterior = 0;


%la�o de treino
while(abs(erroEpoca-erroEpocaAnterior) > E)
    
    erroEpocaAnterior = erroEpoca;
    erroEpoca = 0;
       
    %A vari�vel indice � um vetor gerado randomicamente de tamanho igual a quantidade de
    %padr�es de entrada, usado para apresentar � rede os padr�es de forma
    %aleat�ria.
    indice = randperm(numPadroes);
    
    %la�o que faz o treinamento supervisionado
    for i = 1 : numPadroes
       
        %% PASSO FORWARD
        
        Icamada1 = W1*X(:,i);
        
        Y1 = sigmf(Icamada1, [5 0]);
        
        polarizacao = 1;
        Y1 = [polarizacao; Y1];
        
        Icamada2 = W2*Y1;
        
        Y2 = sigmf(Icamada2, [5 0]);
        
        
        %% PASSO BACKWARD
       
        %calcula o erro da camada de saida (gadriente da camada de sa�da)
        erro = Yd(:,i) - Y2;
      
        %calcula a derivada das entradas na camada e depois calcula o 
        %gradiente local dos neur�nios (camada de sa�da)
        derivada = DerivaSigmoide(Icamada2);
        gradLocalsaida = erro .* derivada; %retorna um vetor coluna com tr�s posi��es
        
        Waux = zeros(neuroniossaida, neuronios1+1);
        for idc = 1: neuroniossaida
            Waux(idc,:) = (taxaAprendizado .* gradLocalsaida(idc,1) .* Y1);
            W2(idc,:) = W2(idc,:) + Waux(idc, :);
        end
        
        %gradiente local da camada 1 (10 neuronios)
        derivadaCamada1 = DerivaSigmoide(Icamada1);
        gradLocalcamada1 = (gradLocalsaida(:,:)' * W2(:,2:11))' .* derivadaCamada1;
        
        %ajuste dos valores de pesos da camada 1
        Waux = zeros(neuronios1, dimensao+1);
        for idc = 1: neuronios1
            Waux(idc,:) = (taxaAprendizado .* gradLocalcamada1(idc,1) .* X(:,i));
            W1(idc,:) = W1(idc,:) + Waux(idc, :);
        end
        %------------------------------------------------------------------
        
        %Atualizar o erro da �poca vigente
        erroEpoca = erroEpoca + (sum(erro.^2))/2;
        
    end
    
    %guarda o erro da �poca no vetor de erros
    VetordeErros(:,epoca+1) = erroEpoca ./ numPadroes;
    epoca = epoca + 1;   
end

end

