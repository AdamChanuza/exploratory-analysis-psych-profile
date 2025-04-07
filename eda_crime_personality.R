# Exploratory Data Analysis (EDA) – Profil osobowości a używanie ekstazy

# Wczytanie danych
dane <- read.csv("data.csv", sep = ";", dec = ",")

# Przygotowanie zmiennych
dane$ectasy <- as.factor(dane$ectasy)
dane$gender <- factor(dane$gender, levels = c(-1, 1), labels = c("Mężczyzna", "Kobieta"))

# Histogramy cech osobowości
par(mfrow = c(2, 3), mar = c(4, 4, 2, 1))
hist(dane$nscore, main = "Neurotyczność", col = "lightblue", xlab = "nscore")
hist(dane$escore, main = "Ekstrawersja", col = "lightgreen", xlab = "escore")
hist(dane$oscore, main = "Otwartość", col = "lightpink", xlab = "oscore")
hist(dane$ascore, main = "Ugodowość", col = "khaki", xlab = "ascore")
hist(dane$csore, main = "Sumienność", col = "plum", xlab = "csore")
hist(dane$impulsive, main = "Impulsywność", col = "lightgray", xlab = "impulsive")
par(mfrow = c(1, 1))

# Boxploty – cechy osobowości vs ekstaza
par(mfrow = c(1, 3), mar = c(4, 4, 3, 1))
boxplot(nscore ~ ectasy, data = dane, main = "Neurotyczność", col = "lightblue", ylab = "nscore")
boxplot(escore ~ ectasy, data = dane, main = "Ekstrawersja", col = "lightgreen", ylab = "escore")
boxplot(oscore ~ ectasy, data = dane, main = "Otwartość", col = "lightcoral", ylab = "oscore")
par(mfrow = c(1, 1))

# Wykres słupkowy – płeć vs ekstaza
gender_table <- table(dane$gender, dane$ectasy)
barplot(gender_table, beside = TRUE, col = c("steelblue", "tomato"),
        main = "Płeć vs zażywanie ekstazy", legend = rownames(gender_table),
        xlab = "Ectasy (0 = nie, 1 = tak)", ylab = "Liczba osób")

# Heatmapa korelacji cech osobowości
cechy <- dane[, c("nscore", "escore", "oscore", "ascore", "csore")]
cor_matrix <- cor(cechy, use = "complete.obs")
heatmap(cor_matrix, main = "Macierz korelacji – cechy osobowości")

# Wykres liniowy – średnie wartości cech osobowości
srednie_cechy <- colMeans(cechy, na.rm = TRUE)
nazwy_cech <- c("Neurotyczność", "Ekstrawersja", "Otwartość", "Ugodowość", "Sumienność")

plot(srednie_cechy, type = "o", col = "blue", pch = 16, lwd = 2,
     xlab = "Cechy osobowości", ylab = "Średnia wartość",
     main = "Przeciętny profil osobowościowy",
     xaxt = "n")
axis(1, at = 1:5, labels = nazwy_cech)
abline(h = 0, col = "red", lty = 2, lwd = 2)

# Korelacje – osobowość i używki (z pakietem corrplot)
install.packages("corrplot")
library(corrplot)

colnames(dane) <- c(
  "ID", "Wiek", "Płeć", "Wykształcenie", "Kraj", "Etniczność",
  "Neurotyczność", "Ekstrawersja", "Otwartość", "Ugodowość", "Sumienność",
  "Impulsywność", "Skala_szczerości", 
  "Alkohol", "Marihuana", "Kokaina", "Crack", "Ekstaza",
  "Heroina", "Metaamfetamina", "Grzyby", "Nikotyna"
)

correlation_matrix <- cor(dane, use = "complete.obs")
corrplot(correlation_matrix, method = "color", 
         addCoef.col = "black", 
         tl.cex = 0.7,
         number.cex = 0.6,
         tl.col = "black",
         title = "Macierz korelacji – zmienne osobowościowe i używki",
         mar = c(0, 0, 2, 0))





