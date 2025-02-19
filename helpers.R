colors <- c("#EAEAEA", "#7FA8D9")
colors_bar <- c("#CCCCCC", "#264D7E", "#7FA8D9")
colors2 <- c("#CCCCCC", "#7FA8D9")
blue_colours <- c("#7FA8D9", "#5289CB", "#346AAD", "#264D7E", "#17304F")

map_theme <- theme_minimal() + 
  theme(
    panel.grid = element_blank(), 
    axis.text = element_blank(), 
    axis.title = element_blank()
  )

pol_theme <- function() {
  theme(
    legend.position = "top",
    legend.title = element_blank(),
    legend.background = element_blank(),
    legend.key = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_text(hjust = 1, angle = 45),
    axis.title.x = element_blank(),
    panel.background = element_rect(fill = "transparent"),  
    panel.grid.major = element_line(color = "#F0F0F0"), 
    panel.grid.minor = element_blank(),
    strip.background = element_rect(fill = "transparent")
  ) 
}

ets_theme <- function() {
  theme(
    line = element_blank(),
    rect = element_blank(),
    axis.text = element_blank(),
    axis.title = element_blank(),
    legend.position = "top",
    legend.title = element_text(size = 20),
    legend.text = element_text(size = 20)
  )
}


multi_colours <- c("#C1CEFE","#A9BF9B","#F5FDC6", "#FFD151", "#EE9344", "#5A0001")


regions <- tibble::tribble(
  ~continent,    ~iso3,
  "Asia-Pacific",    "AUS",
  "Asia-Pacific",    "JPN",
  "Asia-Pacific",    "KOR",
  "Asia-Pacific",    "NZL",
  "North Amercia",    "CAN",
  "North Amercia",    "USA",
  "Central and South America",    "MEX",
  "Central and South America",    "CHL",
  "Central and South America",    "COL",
  "Central and South America",    "CRI",
  "Europe",    "AUT",
  "Europe",    "BEL",
  "Europe",    "BGR",
  "Europe",    "CHE",
  "Europe",    "CZE",
  "Europe",    "DEU",
  "Europe",    "DNK",
  "Europe",    "ESP",
  "Europe",    "EST",
  "Europe",    "FIN",
  "Europe",    "FRA",
  "Europe",    "GBR",
  "Europe",    "GRC",
  "Europe",    "HUN",
  "Europe",    "IRL",
  "Europe",    "ISL",
  "Europe",    "ITA",
  "Europe",    "LTU",
  "Europe",    "LUX",
  "Europe",    "LVA",
  "Europe",    "NLD",
  "Europe",    "NOR",
  "Europe",    "POL",
  "Europe",    "PRT",
  "Europe",    "ROU",
  "Europe",    "SVK",
  "Europe",    "SVN",
  "Europe",    "SWE",
  "Europe",    "TUR",
  "Other OECD",    "ISR"
)

