# Monitor de Eficiencia de la Inversión Pública
## Gobiernos Locales de Lima Metropolitana (2023–2026)

**Autor:** José Miguel Ríos Mallasca  
**Universidad:** UNMSM — Economía, 8vo ciclo  
**Datos:** Ministerio de Economía y Finanzas (MEF) — Consulta Amigable  
**Actualización:** Junio 2026

---

## ¿De qué trata este proyecto?

Análisis de la ejecución presupuestal de los 43 distritos de Lima Metropolitana entre 2023 y 2026. Se mide qué tan bien gastan su presupuesto de inversión pública y por qué algunos distritos son más eficientes que otros.

---

## Hallazgos principales

| Indicador | Resultado |
|---|---|
| Distritos analizados | 43 |
| Años cubiertos | 2023–2026 |
| Promedio ejecución 2025 | 91.4% |
| Distrito líder | Lurigancho (97.2% promedio) |
| Distrito crítico | Pachacamac (71.4% promedio) |
| Correlación PIM vs ejecución | r ≈ 0 |

**Clasificación final:**
- ✅ 29 distritos eficientes
- 🟡 8 en proceso de mejora
- 🔴 5 irregulares
- ⚠️ 1 crítico (Pachacamac)

## Estructura del repositorio
monitor-eficiencia-lima/

│

├── datos/

│   ├── lima_metropolitana_final.csv

│   ├── clasificacion_distritos.csv

│   └── distritos_clusterizados_2025.csv

│

├── notebooks/

│   ├── 01_Limpieza_MEF.ipynb

│   ├── 02_Analisis_SQL.ipynb

│   └── 03_Clustering_KMeans.R

│

└── figuras/

├── Fig01 — Fig10

└── Fig11_Clustering_KMeans.png
---

## Metodología

- **Fuente:** MEF — Consulta Amigable
- **Limpieza:** Python (pandas) en Google Colab
- **Análisis estadístico:** SQL (SQLite) + Python
- **Análisis espacial:** Mapas coropléticos con GeoPandas
- **Clustering:** K-Means en R (k=4, validado con Elbow Method)

### Clusters K-Means

| Grupo | Distritos | Característica |
|---|---|---|
| 1 | 28 | Eficientes — ejecución > 91% |
| 2 | 3 | Críticos — San Isidro, Punta Hermosa, Pachacamac |
| 3 | 1 | Atípico — Lima Metropolitana (PIM S/3,210M) |
| 4 | 11 | En mejora — entre 85%–90% |

---

## Cómo reproducir el análisis

1. Clonar el repositorio
2. Abrir `01_Limpieza_MEF.ipynb` en Google Colab
3. Ejecutar `02_Analisis_SQL.ipynb`
4. Correr `03_Clustering_KMeans.R` en RStudio

---
