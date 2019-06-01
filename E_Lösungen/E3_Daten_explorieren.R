# =========================================================
# Lösungen zu den Aufgaben B3_Daten_explorieren.pdf
# =========================================================

# Lösung Aufgabe a) 
library(mosaic)
tips <- read.csv2("tips.csv")
inspect(tips)


# Lösung Aufgabe b)
bargraph( ~ sex, data = tips) 

# -> Männlich > Weiblich


# Lösung Aufgabe c)
bargraph( ~ sex | time, data = tips) 

# -> Abends deutlich häufiger Männer, Mittags ungefähr gleich häufig.


# Lösung Aufgabe d)
histogram( ~ total_bill, data = tips) 

# -> 15-20 Dollar


# Lösung Aufgabe e)
histogram( ~ total_bill | sex, data = tips) 

# -> Männer zeigen häufiger hohe Rechnungen, d.h. >= 50 Dollar, Frauen häufiger 'normale' Rechnungen, d.h. 15-20 Dollar.


# Lösung Aufgabe f)
xyplot( tip ~ total_bill, data = tips) 

# -> Ja, je höher die Rechnungshöhe, desto höher die Trinkgeldhöhe

