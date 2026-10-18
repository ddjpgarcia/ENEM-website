# Sitio web del ENEM (Estudio Nacional Electoral de México)

Sitio estático hecho con [Quarto](https://quarto.org/) y publicado en GitHub Pages. Los datos se alojan en Harvard Dataverse.

## Estructura

```
index.qmd                     Inicio
sobre/                        Sobre el ENEM · Proyecto CIDE-CSES · Equipo · FAQ
datos/                        Descargar datos (Dataverse) · Términos de uso
estudios/                     Tabla de olas + una página por ola (datos, cita, R)
variables/                    Buscador del panel armonizado
explorar/                     Dashboard (Shinylive)
investigacion/                Artículos que usan el ENEM, por ola
analisis/                     Blog
citar/                        Cita general y por año
en/                           Versión en inglés (proyecto Quarto propio → _site/en)
data/olas.csv                 Datos de cada ola
data/citas.csv                Citas por año (ES/EN)
data/dataverse.csv            DOI por ola  ← se edita al publicar en Dataverse
data/dataverse-coleccion.txt  URL de la colección en Dataverse
assets/dataverse.html         Script que muestra botones y archivos de Dataverse
docs/dataverse-requisitos.md  Qué pedir a Harvard Dataverse
```

## Conectar Harvard Dataverse

Cuando cada ola esté publicada, pegar su DOI en `data/dataverse.csv` y hacer commit. No hace falta volver a renderizar.

```
anio,doi
2024,doi:10.7910/DVN/XXXXXX
```

## Uso local

```bash
quarto preview                        # español
quarto render && quarto render en     # build completo en _site/
```

## Publicar

1. Settings → Pages → Source: **GitHub Actions**.
2. Cada push a `main` renderiza y publica (`.github/workflows/publish.yml`).
3. Sitio publicado en https://ddjpgarcia.github.io/ENEM-website/

## Pendientes

- [ ] DOIs de Dataverse (ver `docs/dataverse-requisitos.md`)

- [ ] Actualizar la lista de Investigación (la fuente indica que es una lista vieja)
- [ ] Enlace del artículo de 2021 ("You have to hug…")
- [ ] Imagen de portada con licencia
- [ ] Textos de términos de uso, iguales a los de Dataverse
- [ ] Generar `data/variables.csv` desde `rENEM::enem_codebook()`
- [ ] Correr `scripts/agregados.R` y `shinylive::export()` para el dashboard
