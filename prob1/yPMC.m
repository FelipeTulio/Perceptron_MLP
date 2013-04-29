function [ YAuxiliar numPadroes erro media desvioPadrao ] = yPMC( XValidacao, W1, W2, YValidacao )
%YPERCEPTRON Summary of this function goes here
%   Detailed explanation goes here

    numPadroes = size(XValidacao,2);
    [x,y] = size(YValidacao);
    
    %Polariza��o da matriz X (inser��o do bias)
    pol = ones(1,numPadroes);
    XValidacao = [pol; XValidacao];
    YAuxiliar = zeros(x,y);
    
    %media = 0;
    %desvioPadrao = 0;
   
    for i = 1 : numPadroes
       
        %% PASSO FORWARD
        
        Icamada1 = W1*XValidacao(:,i);
        
        Y1 = sigmf(Icamada1, [5 0]);
        
        polarizacao = 1;
        Y1 = [polarizacao; Y1];
        
        Icamada2 = W2*Y1;
        
        Y2 = sigmf(Icamada2, [5 0]);
        
        YAuxiliar(1,i) = Y2;
        
    end
        plotarSaidas(YValidacao, YAuxiliar)
        erro = YValidacao - YAuxiliar;
        media = mean(erro);
        desvioPadrao = std(erro);
        
end

