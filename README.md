# Eksploracyjna analiza danych – cechy osobowości a używanie substancji

Projekt przedstawia eksploracyjną analizę zależności między cechami osobowości a zażywaniem ekstazy. Dane pochodzą z publicznego zbioru, który zawiera profile psychologiczne oraz deklaracje dotyczące używania substancji psychoaktywnych przez 1885 respondentów.

## Cel analizy

Celem analizy jest zbadanie, czy wybrane cechy osobowości (zgodnie z modelem NEO-FFI-R) mają związek z prawdopodobieństwem zażywania ekstazy. W projekcie zastosowano różne metody wizualizacji i analizy wielowymiarowej.

## Zbiór danych

- Nazwa: **Drug Consumption (Quantified)**
- Źródło: [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/373/drug+consumption+quantified)
- Rozmiar: 1885 obserwacji, 12 zmiennych cech i demograficznych, 18 zmiennych dot. substancji

## Wykorzystane zmienne

- Cechy osobowości: neurotyczność, ekstrawersja, otwartość, ugodowość, sumienność
- Dodatkowe: impulsywność, poszukiwanie wrażeń, wiek, płeć
- Używanie substancji (wybrane): ekstaza

## Struktura repozytorium

- `eda_crime_personality.R` – analiza eksploracyjna:
  - histogramy cech osobowości,
  - boxploty w zależności od użycia ekstazy,
  - macierz korelacji i heatmapa,
  - profil przeciętnego użytkownika.

- `factor_analysis.R` – analiza czynnikowa:
  - ekstrakcja trzech czynników metodą głównych osi z rotacją varimax,
  - wizualizacja ładunków czynnikowych (diagram + wykres bąbelkowy).

- `pca_analysis.R` – analiza głównych składowych (PCA):
  - redukcja wymiaru dla cech osobowości,
  - wykres scree plot z udziałem wariancji.

- `data/data.csv` – przetworzony zbiór danych wejściowych.

## Uwagi

- Dane wykorzystywane w projekcie są dostępne publicznie i objęte licencją **Creative Commons Attribution 4.0 International**.
- Projekt ma charakter edukacyjny i został przygotowany w ramach ćwiczeń z analizy danych.

