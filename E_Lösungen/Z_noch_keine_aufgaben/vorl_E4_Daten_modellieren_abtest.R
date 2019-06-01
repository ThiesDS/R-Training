# Übung: A/B-Testing bei Traum-Ferienwohnungen

# Laden der Umgebung
library(mosaic)

# Workingdirektory setzen
setwd("~/OneDrive - Traum-Ferienwohnungen GmbH/Privat/Sven/FOM/R-Training")

# Read data
data <- read.csv2("Daten_Klickrate_TFW.csv")





# Perform classical hypothesis test 
prop.test(~button_action | variant, data = data)







# Check sampling variation of variant 1 and adjust probabilities so that there is a difference detectable
prop_diff_null <- do(10000)*diffprop(~button_action | shuffle(variant), data = dataset_shuffled)

emp_obs <- diffprop(~button_action | variant, data = dataset_shuffled)

histogram(~diffprop, data = prop_diff_null, v = emp_obs)

p_value_sim <- prop(abs(prop_diff_null$diffprop)>=abs(emp_obs))
p_value_sim
