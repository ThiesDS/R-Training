# Laden der Umgebung
library(mosaic)

# To click or not to click
button_action <- factor(c("click", "no_click"))

# Number of visitors for each variant
var1_num_visits <- 43123
var2_num_visits <- 41627

# Simulate clicks for variant1
set.seed(1234)
clicks_variant1 <- resample(button_action, size=var1_num_visits, prob=c(0.049, 0.951))
tally(clicks_variant1, format = "proportion")

# Simulate clicks for variant2
set.seed(5316)
clicks_variant2 <- resample(button_action, size=var2_num_visits, prob=c(0.051, 0.949))
tally(clicks_variant2, format = "proportion")

# Put all observations in one dataframe
dataset <- data.frame(button_action = clicks_variant1, variant = c("Variant 1")) %>%
  bind_rows(data.frame(button_action = clicks_variant2, variant = c("Variant 2")))

# Shuffle data to simulate random assignment of visitors to variant
dataset_shuffled <- shuffle(dataset)

# Add NA values to simulate missing data
missing_values_id <- sample(dataset_shuffled, 16,orig.ids = TRUE) %>% pull(orig.id)
dataset_shuffled <- dataset_shuffled %>%
  mutate(button_action = ifelse(orig.id %in% missing_values_id,NA,button_action))


# Check proportions of variants
dataset_shuffled %>% 
  group_by(variant) %>% 
  summarise(prop = sum(button_action=="click")/n())

write.csv2(dataset_shuffled, "/Daten/Daten_Klickrate_TFW.csv")


0# Perform classical hypothesis test 
prop.test(~button_action | variant, data = dataset_shuffled)

# Check sampling variation of variant 1 and adjust probabilities so that there is a difference detectable
prop_diff_null <- do(10000)*diffprop(~button_action | shuffle(variant), data = dataset_shuffled)
  
emp_obs <- diffprop(~button_action | variant, data = dataset_shuffled)

histogram(~diffprop, data = prop_diff_null, v = emp_obs)

p_value_sim <- prop(abs(prop_diff_null$diffprop)>=abs(emp_obs))
p_value_sim
