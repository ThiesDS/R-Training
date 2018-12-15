
# Pakete laden
library(mosaic)

# Workingdirektory setzen
setwd("~/OneDrive - Traum-Ferienwohnungen GmbH/Privat/Sven/FOM/R-Training")

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

# Alle NA Werte rausschmeißen
data_subset_filtered <- data_subset %>%
  filter(!is.na(yborn),
         !is.na(age),
         !is.na(ep03),
         !is.na(ep04))

# Datensatzüberblick
inspect(data_subset_filtered)

