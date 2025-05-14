%%%%%%%%%%%%%%%%%
%
% DATEINAME: Heronwurzel.m
%
% TITEL: Verfahren/Algorithmus von Heron
%
% ERSTELLT: 29.04.2025
%
% AUTOREN: Nicolas Kracht, Yannick Rottke, Simon Wepner, Robert
% Killenberger und Adrian Beier
%
% ZULETZT GEAENDERT: 14.05.2025
%
% KURZBESCHREIBUNG: Ein Programm, das vom Nutzer eine Flaeche erhaelt und
% die Quadratwurzel dieser Flaeche mit der angegebenen Genauigkeit
% berechnet. Dies wird nach dem Heron-Verfahren durchlaufen. Sollte die
% angegebene Genauigkeit nach 1000 Durchlaeufen nicht erreicht sein, wird
% die Schleife fruehzeitig gestoppt. Das Ergebnis und die Anzahl der
% Iterationen werden zurueckgegeben. Zusaetzlich werden der Ausgangszustand
% und letzte die Annaeherung graphisch dargestellt.
% 
%%%%%%%%%%%%%%%%%

clc
clear
close all

function [Ergebnis, AnzahlIterationen] = WurzelHeron(Radikand, Genauigkeit)
    if Radikand < 0
        error("Wurzeln negativer Radikanden sind nicht unterstuetzt")
    end
    
    A = Radikand; % Flaecheninhalt des zugehoerigen Rechtecks
    x0 = 1;
    y0 = A/x0;

    rectangle(Position=[0 0 x0 y0]) % Darst. des Rechtecks vor Anwendung des Alg.

    % graphisches Aufhuebschen und Achsenbeschriftung
    grid on
    axis equal
    axis([0 (sqrt(Radikand)+2) 0 (Radikand+2)]) % unelegantes Padding
    xlabel("x")
    ylabel("y")

    i = 0;

    while abs(A - x0^2) > Genauigkeit & i < 1000 % diese und ff. Zeile: aus Dokument, i < 1000 entspricht Endlosschleifenpraevention
        x1 = (x0 + y0)/2;
        y1 = A/x1;

        x0 = x1; % diese und f. Zeile: Verschieben fuer naechste Iteration
        y0 = y1;

        i = i + 1;
    end

    rectangle(Position=[0 0 x0 y0]) % Darst. des (Beinahe-)Quadrats

    Ergebnis = x0; % Rechteck nun naeherungsweise Quadrat, Seitenlaenge also Wurzel
    AnzahlIterationen = i;
end
