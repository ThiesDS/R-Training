# =========================================================
# Lösungen zu den Aufgaben B1_Daten_einlesen.pdf
# =========================================================

# Lösung Aufgabe a) 
help(read.csv)

# - Was ist der Unterschied zwischen den Funktionen `read.csv` und `read.csv2`? 
# -> "read.csv" hat die Default einstellung sep = "," und dec = "." für englische formattierte .csv-Files
# -> "read.csv2" hat die Default einstellung sep = ";" und dec = "," für deutsche formattierte .csv-Files

# Lösung Aufgabe b)
tipsdata <- read.csv2("D_Daten/tips.csv")

# Lösung Aufgabe c)
setwd("D_Daten/")
tipsdata_direct <- read.csv2("tips.csv")

# Lösung Aufgabe d)
tipsdata_csv2 <- read.csv("tips.csv")

# -> Es gibt einen Fehler 