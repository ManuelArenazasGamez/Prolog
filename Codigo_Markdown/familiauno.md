# Script en Prolog: Relaciones familiares

Este script define una base de conocimiento en Prolog que representa relaciones familiares básicas. Se definen personas y sus relaciones directas, como padres, madres, abuelos y abuelas.

## Código Prolog

```prolog
% --- Hechos: Definición de personas ---
persona(luis).  
persona(juan).  
persona(jose).  
persona(maria).  
persona(pedro).  
persona(ana).  
persona(luisa).  

% --- Relaciones de paternidad ---
padre(luis, juan).  % Luis es padre de Juan.
padre(luis, jose).  % Luis es padre de José.

% --- Relaciones de maternidad ---
madre(rosa, juan).  % Rosa es madre de Juan.
madre(rosa, jose).  % Rosa es madre de José.

% --- Relaciones de paternidad y maternidad para María ---
padre(juan, maria).  % Juan es padre de María.
madre(ana, maria).   % Ana es madre de María.

% --- Relaciones de paternidad y maternidad para Pedro ---
padre(jose, pedro).  % José es padre de Pedro.
madre(luisa, pedro). % Luisa es madre de Pedro.

% --- Relaciones de abuelos y abuelas ---
abuelo(luis, maria).  % Luis es abuelo de María.
abuelo(luis, pedro).  % Luis es abuelo de Pedro.
abuela(rosa, maria).  % Rosa es abuela de María.
abuela(rosa, pedro).  % Rosa es abuela de Pedro.