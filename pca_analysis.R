# Principal Component Analysis (PCA) – Personality Traits

dane <- read.csv(file = "data/data.csv", sep = ";", stringsAsFactors = FALSE)
names(dane) <- trimws(names(dane))
cechy <- dane[, c("nscore", "escore", "oscore", "ascore", "csore")]
cechy <- data.frame(lapply(cechy, function(x) as.numeric(as.character(x))))
cechy <- cechy[complete.cases(cechy), ]
pca_result <- prcomp(cechy, scale. = TRUE)
summary(pca_result)
plot(pca_result$sdev^2 / sum(pca_result$sdev^2),
     type = "b", pch = 19,
     xlab = "Składowa główna",
     ylab = "Proporcja wyjaśnionej wariancji",
     main = "Scree plot – PCA")

