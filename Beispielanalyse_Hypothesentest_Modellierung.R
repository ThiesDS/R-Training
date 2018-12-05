# Beispielanalyse Hypothesentest & Modellierung

# Fragestellung: Untersuchen Sie den Zusammenhang der Variablen Rechnungshöhe, Trinkgeld und Geschlecht des tips-Datensatzes. 

# Laden der Umgebung
library(mosaic)

# Workingdirektory setzen
setwd("~/OneDrive - Traum-Ferienwohnungen GmbH/Privat/Sven/FOM/R-Training")

# 1. Datensatz downloaden
download.file("https://goo.gl/whKjnl", destfile = "tips.csv")

# 2. Datensatz einlesen
tips <- read.csv2("tips.csv")

# 3. Manipulation von Daten
# -> Nur interessierende Variablen
tips <- tips %>%
  select(total_bill, tip, sex)


















# 4. Deskription des Datensatzes

# 4.1 Kennzahlen
inspect(tips)






# 4.2 Visualisierungen
# Verteilung der Gesamtrechnungshöhe
histogram(~ total_bill, data = tips)






# Verteilung der Trinkgeldhöhe 
histogram(~ tip, data = tips)






# Zusammenhang von Total Bill und Trinkgeldhöhe
xyplot(tip ~ total_bill, data = tips)






# Anteil der Geschlechter
bargraph(~ sex, data = tips)






# Verteilung der Gesamtrechnungshöhe nach Geschlecht
histogram(~ total_bill | sex, data = tips)






# Verteilung der Trinkgeldhöhe nach Geschlecht
histogram(~ tip | sex, data = tips)







# Alternative bzw. komprimierte Darstellung der beiden Verteilungen nur auf Basis der Quantile
bwplot(tip ~ sex, data = tips)











# 5. Inferenzstatistik
# H0_A: Es gibt keinen Unterschied bei der mittleren Rechnungshöhe zwischen männlich und weiblich.
t.test(~ total_bill | sex, data = tips)

# ============================================================
# Alternative über simulationsbasierte Inferenz
nullvtlg <- do(10000) * diffmean(~total_bill | shuffle(sex), data = tips)
histogram(~diffmean, data = nullvtlg)
emp_beob <- diffmean(~total_bill | sex, data = tips)
histogram(~diffmean, data = nullvtlg,v = emp_beob)
p_value <- prop(abs(nullvtlg$diffmean)>abs(emp_beob))
# ============================================================


# H0_B: Es gibt keinen Unterschied bei der mittleren Trinkgeldhöhe zwischen männlich und weiblich.
t.test(~ tip | sex, data = tips)






# H0_C: Es gibt keinen Zusammenhang zwischen der Rechnungshöhe und der Trinkgeldhöhe.
cor.test(tip ~ total_bill, data = tips)






# Alternative über Modellierung via lineare Regression (Zwei Variablen)
reg_res <- lm(tip ~ total_bill, data = tips)
summary(reg_res)
plotModel(reg_res)










# 6. Modellierung der Trinkgeldhöhe (Multivariat, mehr als zwei Variablen)
reg_res2 <- lm(tip ~ total_bill + sex, data = tips)
summary(reg_res2)
plotModel(reg_res2)

# Zusätzlich ein Interaktionsterm zwischen Rechnungshöhe und Geschlecht
reg_res3 <- lm(tip ~ total_bill + sex + total_bill:sex, data = tips)
summary(reg_res3)
plotModel(reg_res3)

