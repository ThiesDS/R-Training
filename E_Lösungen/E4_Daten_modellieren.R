# =========================================================
# Lösungen zu den Aufgaben B4_Daten_modellieren.pdf
# =========================================================

# Lösung Aufgabe a) 
library(mosaic)
tips <- read.csv2("tips.csv")

t.test( ~ total_bill, data=tips, mu=15,  alternative="greater")

# -> Die Hypothese H0: "Die mittlere Rechnungshöhe ist nicht größer als 15$" kann zum Niveau alpha = 0.05 abgelehnt werden. Die mittlere Rechnungshöhe ist größer als 15$.

t.test( tip ~ smoker, data=tips)

# -> Die Hypothese H0: "Es gibt keinen unterschied in der Trinkgeldhöhe zwischen Rauchern und Nichtrauchern" kann zum Niveau alpha = 0.05 NICHT abgelehnt werden. Es kann kein statistisch signifikanter Unterschied festegstellt werden.


# Lösung Aufgabe b) 
reg_fit <- lm(tip ~ total_bill, data = tips)
summary(reg_fit)

# Wie hoch ist das R^2?
# -> 45%

# Zusatz: Visualisierung der Regression
plotModel(reg_fit)