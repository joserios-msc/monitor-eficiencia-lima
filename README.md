# 📊 Monitor de Eficiencia de la Inversión Pública
## Gobiernos Locales de Lima Metropolitana (2023–2026)

**Autor:** José Miguel Ríos Mallasca  
**Universidad:** UNMSM — Facultad de Ciencias Económicas
**Datos:** Ministerio de Economía y Finanzas — Consulta Amigable  
**Periodo:** 2023–2026 | **Actualización:** Junio 2026

---

## 🎯 ¿Qué resuelve este proyecto?

Los gobiernos locales reciben presupuesto público pero no siempre lo ejecutan bien. Este proyecto responde tres preguntas:

1. ¿Qué distritos de Lima Metropolitana ejecutan mejor su presupuesto de inversión?
2. ¿El tamaño del presupuesto determina la eficiencia? (spoiler: no)
3. ¿Existen patrones espaciales y grupos de comportamiento entre distritos?

---

## 🔍 Hallazgos principales

| Indicador | Resultado |
|---|---|
| Distritos analizados | 43 |
| Años cubiertos | 2023–2026 |
| Ejecución promedio 2023 | 81.8% |
| Ejecución promedio 2024 | 86.1% |
| Ejecución promedio 2025 | 91.4% |
| Distrito líder | Lurigancho (97.2% promedio, 100% en 2025) |
| Distrito crítico | Pachacamac (71.4% — nunca superó 80%) |
| Mayor mejora | Villa María del Triunfo (+38.8 puntos 2023→2025) |
| Correlación PIM vs ejecución | r ≈ 0 |

### 🏆 Clasificación final de distritos

| Categoría | Distritos |
|---|---|
| ✅ Eficientes | 29 |
| 🟡 En mejora | 8 |
| 🔴 Irregulares | 5 |
| ⚠️ Crítico | 1 (Pachacamac) |

### ⚡ Paradoja San Isidro
San Isidro tiene el **mayor presupuesto de Lima** y solo ejecutó el **75.4%**.
Esto confirma que la eficiencia es **institucional**, no financiera.

---

## 🗂️ Estructura del repositorio
monitor-eficiencia-lima/

│

├── 📁 datos/

│   ├── lima_metropolitana_final.csv        # 172 filas · 43 distritos × 4 años

│   ├── clasificacion_distritos.csv         # Clasificación final por distrito

│   └── distritos_clusterizados_2025.csv    # Resultado K-Means (4 grupos)

│

├── 📁 notebooks/

│   ├── 01_Limpieza_MEF.ipynb              # Descarga y limpieza de datos MEF

│   ├── 02_Analisis_SQL.ipynb              # 5 consultas SQLite con análisis

│   └── 03_Clustering_KMeans.R             # Clustering en R (4 grupos)

│

└── 📁 figuras/

├── Fig01_Ranking_Ejecucion.png

├── Fig02 — Fig10                       # Evolución, mapas, boxplot, scatter

└── Fig11_Clustering_KMeans.png         # Mapa de clusters K-Means
---

## 🛠️ Metodología

| Etapa | Herramienta |
|---|---|
| Descarga de datos | MEF — Consulta Amigable |
| Limpieza y procesamiento | Python (pandas) — Google Colab |
| Análisis estadístico | SQL (SQLite) — 5 consultas |
| Análisis espacial | GeoPandas — mapas coropléticos |
| Clustering | K-Means en R (k=4, Elbow Method) |

### 🔵 Clusters K-Means

| Grupo | N° distritos | Perfil |
|---|---|---|
| 1 — Eficientes | 28 | Ejecución > 91% sostenida |
| 2 — Críticos | 3 | San Isidro, Punta Hermosa, Pachacamac |
| 3 — Atípico | 1 | Lima Metropolitana (PIM S/ 3,210M) |
| 4 — En mejora | 11 | Ejecución entre 85%–90% |

---

## ▶️ Cómo reproducir el análisis

```bash
git clone https://github.com/joserios-msc/monitor-eficiencia-lima.git
```

1. Abrir `notebooks/01_Limpieza_MEF.ipynb` en Google Colab
2. Ejecutar `notebooks/02_Analisis_SQL.ipynb`
3. Correr `notebooks/03_Clustering_KMeans.R` en RStudio

---

## 📌 Tecnologías utilizadas

![Python](https://img.shields.io/badge/Python-3.x-blue)
![R](https://img.shields.io/badge/R-4.x-276DC3)
![SQLite](https://img.shields.io/badge/SQLite-3-003B57)
![GeoPandas](https://img.shields.io/badge/GeoPandas-espacial-green)
![Colab](https://img.shields.io/badge/Google_Colab-notebook-orange)

---
