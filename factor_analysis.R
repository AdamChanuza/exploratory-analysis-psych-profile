# Factor Analysis – Personality Traits and Drug Use


dane <- read.csv("data.csv", sep = ";")
names(dane) <- gsub("^\\s+|\\s+$", "", names(dane))  


zmienne <- dane[, c("nscore", "escore", "oscore", "ascore", "cscore", "impulsive", "ss",
                    "alcohol", "cannabis", "coke", "crack", "ecstasy", "heroin", "meth",
                    "mushrooms", "nicotine")]

library(psych)
library(tidyverse)

# Analiza czynnikowa – 3 czynniki, rotacja varimax
fa_result <- fa(zmienne, nfactors = 3, rotate = "varimax", fm = "pa")
print(fa_result)
fa.diagram(fa_result)


library(ggplot2)
library(reshape2)

ladunki <- as.data.frame(fa_result$loadings[1:nrow(fa_result$loadings), 1:3])
ladunki$zmienna <- rownames(ladunki)


tlumaczenia <- c(
  "nscore" = "Neurotyczność",
  "escore" = "Ekstrawersja",
  "oscore" = "Otwartość",
  "ascore" = "Ugodowość",
  "cscore" = "Sumienność",
  "impulsive" = "Impulsywność",
  "ss" = "Poszukiwanie wrażeń",
  "alcohol" = "Alkohol",
  "cannabis" = "Marihuana",
  "coke" = "Kokaina",
  "crack" = "Crack",
  "ecstasy" = "Ekstazy",
  "heroin" = "Heroina",
  "meth" = "Amfetamina",
  "mushrooms" = "Grzyby halucynogenne",
  "nicotine" = "Nikotyna"
)


ladunki <- ladunki[ladunki$zmienna %in% names(tlumaczenia), ]
ladunki$zmienna_pl <- tlumaczenia[ladunki$zmienna]


ladunki_long <- melt(ladunki[, c("zmienna_pl", "PA1", "PA2", "PA3")],
                     id.vars = "zmienna_pl",
                     variable.name = "Czynnik",
                     value.name = "Ładunek")

# Wizualizacja
ggplot(ladunki_long, aes(x = Czynnik, y = zmienna_pl)) +
  geom_point(aes(size = abs(Ładunek), color = Ładunek)) +
  scale_color_gradient2(low = "red", mid = "white", high = "blue", midpoint = 0) +
  scale_size_continuous(range = c(1, 10)) +
  theme_minimal() +
  labs(title = "Bąbelkowy wykres ładunków czynnikowych",
       x = "Czynnik", y = "Zmienne", size = "Siła ładunku", color = "Ładunek") +
  theme(axis.text.y = element_text(size = 10))




