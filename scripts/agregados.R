# Genera los agregados ponderados que alimentan el dashboard (sin microdatos).
# Ejecutar desde la raíz del repo:  Rscript scripts/agregados.R
# Revisa nombres de variables y columnas de salida contra enem_codebook().
library(rENEM)
library(dplyr)
library(purrr)

vars   <- c("aprob_pres", "pid", "ideologia", "satis_dem", "econ_retro")  # ajustar a nombres reales
grupos <- c("sexo", "edad_grupo", "escolaridad")

panel <- enem_load()

total <- map_dfr(vars, \(v) enem_weighted_summary(panel, var = v, by = "anio") |> mutate(variable = v, grupo = "Total", nivel = "Total"))
por_grupo <- map_dfr(vars, \(v) map_dfr(grupos, \(g)
  enem_weighted_summary(panel, var = v, by = c("anio", g)) |>
    rename(nivel = all_of(g)) |> mutate(variable = v, grupo = g, nivel = as.character(nivel))))

bind_rows(total, por_grupo) |>
  readr::write_csv("explorar/app-src/agregados.csv")
