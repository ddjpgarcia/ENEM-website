# Requisitos para montar los datos del ENEM en Harvard Dataverse

Lista de lo que necesitamos de Harvard Dataverse para conectar los datos al sitio web del ENEM.

## 1. Una colección del ENEM

- Una colección (dataverse) propia del ENEM dentro de Harvard Dataverse, por ejemplo `https://dataverse.harvard.edu/dataverse/enem`.
  - Puede colgar de una colección institucional (CIDE o UMass Lowell) si así se prefiere.
- Permisos de **Curator** o **Contributor** para quien administre el sitio, para poder actualizar archivos y metadatos.

## 2. Un dataset por ola (10 en total), cada uno con DOI

Las olas son 1997, 2000, 2003, 2006, 2009, 2012, 2015, 2018, 2021 y 2024. Cada ola debe ser un dataset independiente con su propio DOI, para que la citación y las descargas sean por año.

### Metadatos mínimos por dataset (campos obligatorios de Dataverse)

| Campo | Ejemplo para la ola 2024 |
|---|---|
| Título | Estudio Nacional Electoral de México (UMASS-CSES) 2024 |
| Autores | Beltrán, Ulises; Castro Cornejo, Rodrigo; Altamirano, Melina; Singer, Matthew |
| Descripción | Encuesta nacional poselectoral de la elección federal de 2024. Incluye preguntas de los módulos 5 y 6 del CSES. |
| Correo de contacto | (correo institucional del proyecto) |
| Tema (Subject) | Social Sciences |

Los autores de cada ola deben coincidir con la cita de la página **Cómo citar**.

### Metadatos recomendados

- Palabras clave: elecciones, comportamiento electoral, México, CSES, encuesta poselectoral.
- Periodo de tiempo y fechas de levantamiento.
- Cobertura geográfica: México (en 2015, además, los estados con elección de gobernador).
- Tipo de datos: encuesta.
- Publicaciones relacionadas (ver la página **Investigación**).

## 3. Archivos de cada dataset

| Archivo | Formato sugerido |
|---|---|
| Base de datos | `.dta` (Stata); de preferencia también `.sav` (SPSS) y `.csv` |
| Cuestionario | `.pdf` |
| Libro de códigos | `.pdf` |
| Nota metodológica / diseño muestral | `.pdf` |
| Reporte macro de la elección (si existe) | `.pdf` o `.xlsx` |

## 4. Acceso y registro de usuarios

- **Libro de visitas (Guestbook)**: crearlo a nivel de colección, con los campos nombre, correo, institución y uso previsto, y activarlo en cada dataset. Esto sustituye el formulario de registro del sitio.
- **Términos de uso**: elegir una licencia (por ejemplo CC BY 4.0) o redactar términos propios (uso académico y no comercial, obligación de citar, no reidentificar).
- **Archivos públicos, no restringidos**: así cualquier persona descarga después de llenar el libro de visitas. Si se marcan como restringidos, cada descarga requiere aprobación manual.

## 5. Publicación

- Publicar cada dataset; los DOI de borradores no funcionan públicamente.
- Las correcciones posteriores generan una nueva versión (1.1, 2.0…) y el DOI se mantiene.

## Qué necesitamos de vuelta para el sitio

1. El **DOI de cada ola**, que se pega en `data/dataverse.csv`, por ejemplo: `2024,doi:10.7910/DVN/XXXXXX`.
2. La **URL de la colección**, que se pega en `data/dataverse-coleccion.txt`.

Con eso el sitio muestra solo, para cada ola, el botón "Abrir en Harvard Dataverse" y la lista de archivos. No hace falta tocar el diseño ni el código.
