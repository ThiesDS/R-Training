# =========================================================
# Lösungen zu den Aufgaben B2_Daten_aufbereiten.pdf
# =========================================================

# Lösung Aufgabe a) 
library(mosaic)
data(Alcohol)
Alcohol.GER <- Alcohol %>%
  filter(country == 'Germany')


# Lösung Aufgabe b)
Alcohol.2008 <- Alcohol %>%
  filter(year == 2008) %>% # '2008' auch möglich
  select(country, year, alcohol)


# Lösung Aufgabe c)
Alcohol.2008.sort <- Alcohol %>%
  filter(year == 2008) %>%
  select(country, year, alcohol) %>%
  arrange(alcohol)


# Lösung Aufgabe d)
Alcohol.2008.rang <- Alcohol %>%
  filter(year == 2008) %>%
  select(country, year, alcohol) %>%
  mutate(rang = rank(-alcohol)) %>%
  arrange(rang)
