function plotarGrafico( VetordeErros )
%PLOTARGRAFICO Summary of this function goes here
%   Detailed explanation goes here

% Evolu��o do erro quadr�tico/por �poca
figure
plot(VetordeErros, '^-')
grid on
xlabel('�poca')
ylabel('Erro Quadr�tico')
title('Erro Quadr�tico Acumulado por �poca de Treinamento')

end

