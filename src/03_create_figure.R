# src/03_create_figure.R
# Create the plots

# 1. Gender distribution (Bar plot)
plot_gender <- ggplot(data, aes(x = Gender, fill = Gender)) +
  geom_bar() +
  labs(title = "Figure 1: Gender Distribution", 
       x = "Gender", 
       y = "Count") +
  theme_minimal()

# 2. Age distribution (Histogram)
plot_age <- ggplot(data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "steelblue", color = "white", alpha = 0.7) +
  labs(title = "Figure 2: Age Distribution", 
       x = "Age", 
       y = "Frequency") +
  theme_minimal()

# 3. Diet type distribution (Bar plot)
plot_diet <- ggplot(data, aes(x = Diet_Type)) +
  geom_bar(fill = "skyblue", alpha = 0.8) +
  labs(title = "Figure 3: Diet Type Distribution", 
       x = "Diet Type", 
       y = "Count") +
  theme_minimal()