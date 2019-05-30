# =========================================================
# Lösungen zu den Aufgaben B0_Erste_Schritte.pdf
# =========================================================

# Lösung Aufgabe a)
install.packages("mosaic")


# Lösung Aufgabe b)
# - 1. Möglichkeit
library(mosaic)

# - 2. Möglichkeit
require(mosaic)


# Lösung Aufgabe c) 
data(Alcohol)


# Aufgabe d) 
?Alcohol


# Lösung Aufgabe e) 
View(Alcohol)

# - Wie viele Zeilen und Spalten sind in dieser Tabelle enthalten? 
# -> 4 Spalten, 411 Zeilen

# - Wie heißen die Spalten? 
colnames(Alcohol)

# - Stimmen diese mit der Datensatzbeschreibung überein?
# -> Nein, die Spalte "X" ist nicht Teil der Datensatzbeschreibung. 
