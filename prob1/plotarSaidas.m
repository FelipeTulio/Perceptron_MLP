function plotarSaidas( YValidacao, YAuxiliar )
%PLOTARSAIDAS Summary of this function goes here
%   Detailed explanation goes here
    
figure
plot(YValidacao, 'b-')
legend('Sa�das da valida��o')
hold on
grid on
plot(YAuxiliar, 'r-')
legend('Sa�das desejadas')
title('Gr�ficos das sa�das desejadas e obtidas')

end

