
# Pakete laden
library(mosaic)

# Einlesen der Daten
data <- read.csv2("Daten_Allbus/allbus.csv")

# Datensatz ausdünnen
# Interesse nur an den Variablen:
#   - respid (Identifikationsvariable)
#   - yborn  (Geboren am)
#   - age    (Alter)
#   - ep03 (Und Ihre eigene wirtschaftliche Lage heute?)
#   - ep04 (Eine berufstätige Mutter kann ein genauso herzliches und vertrauensvolles Verhältnis zu ihren Kindern finden wie eine Mutter, die nicht berufstätig ist.)

data_subset <- data %>%
  select(respid,
         yborn,
         age,
         ep03,
         ep04)

# Datensatz Überblick
inspect(data_subset)
