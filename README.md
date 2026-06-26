# 📊 Monitor de Eficiencia de la Inversión Pública
### Gobiernos Locales de Lima Metropolitana (2023–2026)

> Análisis espacial, estadístico y de clustering sobre cómo 43 distritos de Lima Metropolitana ejecutan su presupuesto de inversión pública. Datos oficiales del Ministerio de Economía y Finanzas del Perú.

---

## 🧭 ¿Qué es la eficiencia presupuestal y por qué esta fórmula?

### La fórmula
Eficiencia (%) = (Devengado / PIM) × 100

### ¿Qué significa cada término?

| Término | Significado |
|---|---|
| **PIM** | Presupuesto Institucional Modificado — el presupuesto total disponible que tiene el distrito para gastar en inversión pública durante el año |
| **Devengado** | El gasto efectivamente comprometido y ejecutado — obras iniciadas, contratos firmados, servicios prestados |
| **Eficiencia (%)** | Qué porcentaje del presupuesto disponible fue realmente utilizado |

### ¿Por qué usamos esta fórmula?

Esta fórmula es el **estándar oficial del MEF** para medir ejecución presupuestal en el Perú. No es una métrica inventada — es la misma que usa el Estado peruano para evaluar a sus propias entidades.

**1. Es la métrica oficial del sistema presupuestal peruano**
El MEF publica el devengado y el PIM como los dos indicadores centrales del ciclo presupuestal. La Ley N° 28411 — Ley General del Sistema Nacional de Presupuesto — establece el devengado como la fase que acredita la ejecución real del gasto.

**2. El devengado es el mejor indicador de ejecución real**
El ciclo del gasto público tiene 4 fases: compromiso → devengado → girado → pagado. El devengado es el momento en que el Estado reconoce la obligación de pago — es decir, cuando la obra o servicio ya fue recibido. Es más confiable que el compromiso (que puede cancelarse) y más oportuno que el pagado (que puede retrasarse por trámites).

**3. El PIM es la base correcta de comparación**
Se usa el PIM y no el PIA (Presupuesto Inicial de Apertura) porque el PIM incorpora todas las modificaciones presupuestales del año — transferencias, ampliaciones, reducciones. Comparar contra el PIM es más justo y realista que comparar contra el presupuesto inicial.

### ¿Qué limitaciones tiene?

Esta métrica mide **cuánto se gastó**, no necesariamente **qué tan bien se gastó**. Un distrito puede tener 100% de ejecución con obras de mala calidad. Por eso este análisis se complementa con análisis espacial y clustering, que permiten identificar patrones y anomalías más allá del porcentaje simple.

---

## ❓ Preguntas que responde este proyecto

1. ¿Qué distritos ejecutan mejor su presupuesto de inversión?
2. ¿El tamaño del presupuesto determina la eficiencia?
3. ¿Existen patrones espaciales entre distritos?
4. ¿Se pueden agrupar los distritos por comportamiento presupuestal?

---

## 📦 Fuente de datos

| Campo | Detalle |
|---|---|
| **Fuente** | Ministerio de Economía y Finanzas (MEF) |
| **Portal** | Consulta Amigable — apps.mef.gob.pe |
| **Nivel** | Gobierno Local |
| **Cobertura** | 43 distritos de Lima Metropolitana |
| **Periodo** | 2023, 2024, 2025, 2026 (parcial a junio) |
| **Variables** | PIM, Devengado, % Ejecución por distrito y año |
| **Registros** | 172 filas (43 distritos × 4 años) |

Los datos son de acceso público y se descargaron directamente desde el portal oficial del MEF sin ninguna modificación en su origen. La limpieza y estructuración se documentan en `notebooks/01_Limpieza_MEF.ipynb`.

---

## 🔍 Hallazgos principales

### Evolución de la ejecución promedio

| Año | Ejecución promedio | Variación |
|---|---|---|
| 2023 | 81.8% | Línea base |
| 2024 | 86.1% | +4.3 puntos |
| 2025 | 91.4% | +5.3 puntos — mejor año registrado |
| 2026 | 41.1% | Dato parcial a junio 2026 |

### Distritos destacados

| Categoría | Distrito | Detalle |
|---|---|---|
| 🏆 Líder absoluto | Lurigancho | 97.2% promedio, 100% en 2025 |
| ⚠️ Único crítico | Pachacamac | 71.4% promedio, nunca superó 80% |
| 📈 Mayor mejora | Villa María del Triunfo | +38.8 puntos entre 2023 y 2025 |
| ❗ Paradoja | San Isidro | Mayor presupuesto de Lima, solo 75.4% de ejecución |

### 🔑 Hallazgo clave: la eficiencia es institucional, no financiera

La correlación entre tamaño del presupuesto (PIM) y eficiencia es **r ≈ 0**.

Esto significa que **tener más dinero no garantiza gastarlo bien**. San Isidro, con el mayor presupuesto de Lima Metropolitana, ejecutó solo el 75.4%. Lurigancho, con presupuesto mucho menor, alcanzó el 100% en 2025.

La eficiencia depende de la **capacidad institucional, planificación y gestión** de cada municipio — no del volumen de recursos que recibe.

---

## 🗺️ Análisis espacial

Se construyeron mapas coropléticos para visualizar la distribución geográfica de la eficiencia presupuestal en Lima Metropolitana. Los mapas revelan que:

- Los distritos eficientes no se concentran en una sola zona geográfica
- No existe un patrón norte-sur ni centro-periferia claro
- La eficiencia es heterogénea dentro de Lima
- La paradoja de San Isidro es visible espacialmente — distrito céntrico y rico con baja ejecución

---

## 🤖 Clustering K-Means

Se aplicó K-Means con **k=4 grupos**, validado con el método Elbow. Variables utilizadas: PIM y % de ejecución del año 2025. El algoritmo agrupa distritos con comportamiento presupuestal similar sin usar etiquetas previas — el patrón emerge de los datos.

| Grupo | Distritos | Perfil |
|---|---|---|
| 1 — Eficientes | 28 | Ejecución sostenida > 91% |
| 2 — Críticos | 3 | San Isidro, Punta Hermosa, Pachacamac |
| 3 — Atípico | 1 | Lima Metropolitana (PIM S/ 3,210M — outlier extremo) |
| 4 — En mejora | 11 | Ejecución entre 85%–90%, tendencia positiva |

El distrito de Lima Metropolitana se identifica como atípico no por su ejecución sino por su presupuesto — S/ 3,210 millones, que distorsiona cualquier análisis si no se trata por separado.

---

## 🏷️ Clasificación final de distritos

| Categoría | N° distritos | Criterio |
|---|---|---|
| ✅ Eficientes | 29 | Ejecución > 90% sostenida en el periodo |
| 🟡 En mejora | 8 | Ejecución entre 80%–90% con tendencia positiva |
| 🔴 Irregulares | 5 | Ejecución variable sin tendencia clara |
| ⚠️ Crítico | 1 | Pachacamac — nunca superó 80% en ningún año |

---

## 🛠️ Herramientas utilizadas

| Herramienta | Uso |
|---|---|
| Python (pandas, numpy) | Limpieza y procesamiento de datos |
| SQLite | Análisis con 5 consultas SQL |
| GeoPandas + Matplotlib | Mapas coropléticos y visualizaciones |
| R (tidyverse, cluster, factoextra) | Clustering K-Means |
| Google Colab | Entorno de ejecución Python |
| RStudio | Entorno de ejecución R |
| GitHub | Control de versiones y documentación |

---

## 🗂️ Estructura del repositorio
monitor-eficiencia-lima/

│

├── 📁 datos/

│   ├── lima_metropolitana_final.csv         # Dataset principal: 172 filas, 43 distritos × 4 años

│   ├── clasificacion_distritos.csv          # Clasificación final de cada distrito

│   └── distritos_clusterizados_2025.csv     # Resultado del K-Means con grupo asignado

│

├── 📁 notebooks/

│   ├── 01_Limpieza_MEF.ipynb               # Descarga, limpieza y estructuración de datos MEF

│   ├── 02_Analisis_SQL.ipynb               # 5 consultas SQLite: rankings, evolución, paradojas

│   └── 03_Clustering_KMeans.R              # Script K-Means en R con validación Elbow

│

└── 📁 figuras/

├── Fig01_Eficiencia_Presupuestal.png    # Ranking general de ejecución

├── Fig02_Evolucion_2023_2026.png        # Evolución temporal por distrito

├── Fig03_Mapa_Eficiencia_Distrital.png  # Mapa coroplético principal

├── Fig04_Ranking_2024.png               # Ranking por año

├── Fig05_Ranking_2025.png

├── Fig06_Ranking_2026.png

├── Fig07_Top5_Bottom5.png               # Mejores y peores distritos

├── Fig08_Boxplot_Distribucion.png       # Distribución estadística

├── Fig09_Scatter_PIM_vs_Ejecucion.png   # Correlación PIM vs ejecución (r≈0)

├── Fig10_Clasificacion_Distritos.png    # Mapa de clasificación final

└── Fig11_Clustering_KMeans.png          # Mapa de clusters K-Means

---

## ▶️ Cómo reproducir el análisis

```bash
git clone https://github.com/joserios-msc/monitor-eficiencia-lima.git
```

1. Abrir `notebooks/01_Limpieza_MEF.ipynb` en Google Colab
2. Ejecutar `notebooks/02_Analisis_SQL.ipynb`
3. Correr `notebooks/03_Clustering_KMeans.R` en RStudio

---

## 📌 Stack tecnológico

![Python](https://img.shields.io/badge/Python-3.x-blue)
![R](https://img.shields.io/badge/R-4.x-276DC3)
![SQLite](https://img.shields.io/badge/SQLite-3-003B57)
![GeoPandas](https://img.shields.io/badge/GeoPandas-espacial-green)
![Colab](https://img.shields.io/badge/Google_Colab-notebook-orange)
![RStudio](https://img.shields.io/badge/RStudio-clustering-75AADB)

---

*Análisis de datos públicos — Ministerio de Economía y Finanzas del Perú — 2026*
