# ============================================================
# 03 - Clustering K-Means
# Gobiernos Locales de Lima Metropolitana (2025)
# Autor: José Miguel Ríos Mallasca — UNMSM
# ============================================================

# Cargar librerías
library(tidyverse)
library(cluster)
library(factoextra)

# Cargar datos
setwd("C:/Users/Admin/Desktop/lima metropolitana")
df <- read_csv("lima_metropolitana_final.csv")

# Filtrar 2025
df_2025 <- df %>%
  filter(año == 2025) %>%
  select(distrito_limpio, PIM, pct_ejecucion)

# Escalar
df_escalado <- scale(df_2025[, c("PIM", "pct_ejecucion")])

# K-Means
set.seed(123)
modelo_kmeans <- kmeans(df_escalado, centers = 4, nstart = 25)
df_2025$Grupo <- modelo_kmeans$cluster

# Ver resultados
df_2025 %>%
  arrange(Grupo, desc(pct_ejecucion)) %>%
  print(n = 43)

# Gráfico
fviz_cluster(modelo_kmeans,
             data = df_escalado,
             labelsize = 7,
             main = "Clustering K-Means — Lima Metropolitana 2025")

# Exportar
write_csv(df_2025, "distritos_clusterizados_2025.csv")
cat("??? Exportado correctamente\n")