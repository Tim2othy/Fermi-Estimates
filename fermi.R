data = Fermi_Data

options(scipen=999)


# Function to calculate Normalized Mean Absolute Error
calculate_nmae <- function(actual, forecast) {
  normalization <- pmax(abs(actual), 1000)
  mean(abs(actual - forecast) / normalization, na.rm = TRUE)
}

# Calculate NMAE for each person
results <- data.frame(
  Person = c("Timothy", "Markus", "Marvin", "Adrian")
)

results$NMAE <- sapply(results$Person, function(person) {
  calculate_nmae(data[["Correct answers"]], data[[paste0(person, " Answer")]])
})

# Rank the results (lower NMAE is better)
results$Rank <- rank(results$NMAE)

# Sort the results by NMAE
results <- results[order(results$NMAE), ]

# Display the results
print(results)









# Function to calculate Normalized Mean Absolute Error
calculate_nmae <- function(actual, forecast) {
  normalization <- pmax(abs(actual), 10)
  return(abs(actual - forecast) / normalization)
}

# Add NMAE columns for each person
data$NMAE_Timothy <- calculate_nmae(data[["Correct answers"]], data[["Timothy Answer"]])
data$NMAE_Markus <- calculate_nmae(data[["Correct answers"]], data[["Markus Answer"]])
data$NMAE_Marvin <- calculate_nmae(data[["Correct answers"]], data[["Marvin Answer"]])
data$NMAE_Adrian <- calculate_nmae(data[["Correct answers"]], data[["Adrian Answer"]])

# Calculate NMAE for each person
results <- data.frame(
  Person = c("Timothy", "Markus", "Marvin", "Adrian")
)

results$NMAE <- sapply(results$Person, function(person) {
  calculate_nmae(data[["Correct answers"]], data[[paste0(person, " Answer")]]) %>% mean(na.rm = TRUE)
})

# Rank the results (lower NMAE is better)
results$Rank <- rank(results$NMAE)

# Sort the results by NMAE
results <- results[order(results$NMAE), ]

# Display the updated data frame with NMAE columns and the results
print(data)
print(results)

