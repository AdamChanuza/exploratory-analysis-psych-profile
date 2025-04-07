# Exploratory Data Analysis – Personality Traits and Drug Use

This project presents an exploratory analysis of the relationship between personality traits and ecstasy use. The data comes from a public dataset that includes psychological profiles and self-reported drug use among 1885 respondents.

## Objective

The goal of this analysis is to investigate whether selected personality traits (based on the NEO-FFI-R model) are related to the likelihood of ecstasy use. The project uses various visualizations to explore potential patterns and correlations.

## Dataset

- Name: **Drug Consumption (Quantified)**
- Source: [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/373/drug+consumption+quantified)
- Size: 1885 observations, 12 personality and demographic features, 18 target variables (various substances)

## Data columns used

- Personality traits: Neuroticism, Extraversion, Openness, Agreeableness, Conscientiousness
- Additional: Impulsiveness, Sensation Seeking, Age, Gender
- Drug use (selected): Ecstasy

## Structure of the repository

- `eda_crime_personality.R` – main R script with visualizations:
  - Histograms of personality traits
  - Boxplots comparing users vs non-users
  - Correlation heatmaps and matrix using `corrplot`
  - Line plots with personality profiles

## Notes

- All data used in this project is open and licensed under **Creative Commons Attribution 4.0 International**.
- This analysis is purely exploratory and intended for educational purposes.
