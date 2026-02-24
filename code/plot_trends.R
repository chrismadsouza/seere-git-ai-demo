library(ggplot2)
pdf(NULL)

df <- read.csv("data/descriptive_data.csv")

# Plot Sweden vs. OECD average CO2 transport emissions
ggplot(df, aes(x = year)) +
  geom_line(aes(y = CO2_Sweden, color = "Sweden")) +
  geom_line(aes(y = CO2_OECD, color = "OECD average")) +
  geom_vline(xintercept = 1991, linetype = "dashed", color = "gray40") +
  annotate("text", x = 1992, y = max(df$CO2_OECD), label = "Carbon tax", hjust = 0) +
  labs(
    title = "Transport CO2 emissions per capita",
    x = "Year",
    y = "CO2 (tons per capita)",
    color = NULL
  ) +
  theme_minimal()

ggsave("output/figures/co2_trends.png", width = 7, height = 4)
