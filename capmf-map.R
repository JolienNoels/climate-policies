
# 0 Packages --------------------------------------------------------------

library(tidyverse)
library(fs)
library(janitor)
library(stringr)
library(readxl)
library(scales)

# 1 Global ----------------------------------------------------------------

source("paths.R")
source("helpers.R")

# 2 Data ------------------------------------------------------------------

worldtilegrid <- read_excel(path(dir_dataraw, "world_jn.xlsx")) %>% 
  select(iso3, alpha.2, name, x, y)

capmf <- read.csv(path(dir_dataraw, "capmf.csv")) %>%
  clean_names() %>% 
  filter(
    measure == "POL_STRINGENCY",
    str_starts(clim_act_pol, "LEV4_"),
    time_period == "2023"
  ) %>% 
  rename(iso3 = ref_area)

capmf_aver <- capmf %>% 
  group_by(iso3) %>% 
  mutate(str_av = mean(obs_value, na.rm = TRUE)) %>% 
  distinct(iso3, str_av)

world_pol <- worldtilegrid %>% 
  left_join(., capmf_aver, by = "iso3") 


# 3 Maps ------------------------------------------------------------------

world_pol %>% 
  ggplot(
    aes(
      xmin = x, ymin = y, xmax = x + 1, ymax = y + 1, 
      fill = str_av
    )
  ) + 
  geom_rect(color = "#ADADAD") +
  geom_text(
    aes(
      x = x, y = y, label = alpha.2,
      color = ifelse(is.na(str_av), "#ADADAD", "#ffffff")
    ), 
    fontface = "bold", size = 3,
    nudge_x = 0.5, nudge_y = -0.5
  ) + 
  scale_y_reverse() +
  map_theme +
  theme(
    legend.position = "top", 
    legend.key.width = unit(1, "cm"), 
    legend.key.height = unit(0.2, "cm")
  ) + 
  labs(fill = "Policy stringency of real-economy climate policies \n") +
  coord_equal() + 
  scale_fill_gradientn(
    colors = c("#E0EAF5", "#7FA8D9", "#17304F"),  
    values = rescale(c(0, 4, 8)),   
    na.value = "#ffffff",  
    limits = c(0, 8),  
    breaks = seq(0, 8, 2),  
    labels = seq(0, 8, 2),
  ) +
  scale_color_identity()

ggsave(
  path(dir_fig, "map_repolstringency_2023.png"), 
  units = "cm",  dpi = 400,
  width = 20, height = 18.5
)
