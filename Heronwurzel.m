clc
clear
close all

function [Ergebnis, AnzahlIterationen] = WurzelHeron(Radikand, Genauigkeit)
    A = Radikand; % Flaecheninhalt des zugehoerigen Rechtecks
    x0 = 1;
    y0 = A/x0;

    i = 0;

    while abs(A - x0^2) > Genauigkeit & i < 1000 % diese und ff. Zeile: aus Dokument, i < 1000 entspricht Endlosschleifenpraevention
        x1 = (x0 + y0)/2;
        y1 = A/x1;

        x0 = x1; % diese und f. Zeile: Verschieben fuer naechste Iteration
        y0 = y1;

        i = i + 1;
    end

    Ergebnis = x0; % Rechteck nun naeherungsweise Quadrat, Seitenlaenge also Wurzel
    AnzahlIterationen = i;
end
