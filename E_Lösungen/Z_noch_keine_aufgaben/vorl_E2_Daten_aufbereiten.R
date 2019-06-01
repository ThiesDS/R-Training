
# Pakete laden
library(mosaic)

# Daten einladen
data(Alcohol)

# Nur Alkohol für Deutschland
Alcohol.Germany <- Alcohol %>% 
  filter(country == "Germany") %>% 
  select(country,year,alcohol)


# Welchen Rang hat Deutschland nach Alcoholkonsum in 2005
# 1. Schritt: Filtern nach Jahr
Alcohol.2005 <- Alcohol %>% 
  filter(year == '2005')

# 2. Schritt: Sortieren der Alcoholwerte
Alcohol.2005.sorted <- Alcohol.2005 %>%
  arrange(-alcohol)

# Alternative:
Alcohol.2005.ranked <- Alcohol.2005 %>%
  mutate(rang = rank(-alcohol)) %>%
  arrange(rang) %>%
  filter(country == "Germany")


Alcohol.2008.ranked <- Alcohol %>% 
  filter(year == '2008') %>%
  mutate(rang = rank(-alcohol)) %>%
  arrange(rang) %>%
  filter(country == "Germany")


# Alternative mit Gruppieren
Alcohol.2005.2008 <- Alcohol %>%
  filter(year == '2005' | year == '2008')

Alcohol.2005.2008.grouped <- Alcohol.2005.2008 %>%
  group_by(year) %>%
  mutate(rang = rank(-alcohol)) %>%
  arrange(rang) %>%
  filter(country == "Germany")
