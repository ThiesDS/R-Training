# Allbus Datensatz

# Laden der Umgebung
library(mosaic)

# 2. Einlesen in R
data <- read.csv("/Users/sventhies/OneDrive - Traum-Ferienwohnungen GmbH/Privat/Sven/FOM/R-Training/Daten_Allbus/allbus.csv")
data <- read.csv2("/Users/sventhies/OneDrive - Traum-Ferienwohnungen GmbH/Privat/Sven/FOM/R-Training/Daten_Allbus/allbus.csv")

setwd("/Users/sventhies/OneDrive - Traum-Ferienwohnungen GmbH/Privat/Sven/FOM/R-Training")
data <- read.csv2("Daten_Allbus/allbus.csv")


# 3. Manipulieren, untersuchen, bereinigen der Daten
# Interesse nur an den Variablen:
#   - respid (Identifikationsvariable)
#   - yborn  (Geboren am)
#   - age    (Alter)
#   - ep03 (Und Ihre eigene wirtschaftliche Lage heute?)
#   - ep04 (A Eine berufstätige Mutter kann ein genauso herzliches und vertrauensvolles Verhältnis zu ihren Kindern finden wie eine Mutter, die nicht berufstätig ist.)

# Auswählen relevanter Variablen
data_subset <- data %>% 
  select(respid,
         yborn,
         age,
         ep03,
         ep04)

# Untersuchung des Subdatensatzes
inspect(data_subset)

# Rausschmeißen der Variablen mit fehlenden Werten
data_subset_clean <- data_subset %>% 
  filter(!is.na(yborn),
         !is.na(age),
         !is.na(ep03),
         !is.na(ep04))

# Nochmal untersuchen
inspect(data_subset_clean)
