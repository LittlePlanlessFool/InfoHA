clc
clear
close all

function [Ergebnis, AnzahlIterationen] = WurzelHeron(Radikand, Genauigkeit)
    A = Radikand;
    x0 = 1;
    y0 = A/x0;

    i = 0;

    abbruch = abs(A - x0^2);
    while abbruch > Genauigkeit & i < 1000
        x1 = (x0 + y0)/2;
        y1 = A/x1;

        x0 = x1;
        y0 = y1;

        i = i + 1;
    end

    Ergebnis = x0;
    AnzahlIterationen = i;
end
