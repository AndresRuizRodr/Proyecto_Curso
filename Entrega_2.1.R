# Definición del modelo Brinson-Fachler

# Es un modelo de atribución de rendimiento que permite analizar 
# y descomponer la diferencia entre el rendimiento de un portafolio 
# y un benchmark (índice de referencia), identificando las fuentes 
# de valor agregado por un tomador de decisiones.


# ¿Qué efectos calcula?
# 1. Asignación (Allocation Effect): 
#    Mide si se asignó más (o menos) peso relativo a sectores que 
#    tuvieron mejor rendimiento en el benchmark. Es un efecto 
#    "estratégico" de distribución de pesos.

# 2. Selección (Selection Effect): 
#    Mide si se eligieron activos financieros que rindieron más (o menos) 
#    que el promedio del sector en el benchmark. Es un efecto 
#    "táctico" de elección de activos.

# 3. Interacción (Interaction Effect): 
#    Mide el efecto combinado entre una buena (o mala) asignación 
#    y una buena (o mala) selección en el mismo sector.

# 4. Total: 
#    Es la suma de los tres efectos anteriores y representa la 
#    diferencia de rendimiento entre el portafolio y el benchmark.

# ¿Para qué sirve el modelo?
# - Identificar si se genera valor por elegir mejores activos (selección) o por
#   asignar mejor los recursos entre sectores (asignación).
# - Apoyar decisiones de mejora en la gestión de portafolios.

# ¿Cómo interpretar los valores?
# - Valores positivos indican valor agregado (contribución positiva).
# - Valores negativos indican decisiones que restaron valor.
# - El efecto dominante (el de mayor magnitud absoluta) indica 
#   la principal fuente de ventaja o desventaja respecto al benchmark.

# Ahora bien, para aplicar los contenidos del modelo Brinson-Fachler, se utilizará
# el paquete "pa" del documento de los autores Lu, Y., y Kane, D. (2023).
# Performance Attribution for Equity Portfolios, donde se presentan dos métodos utilizados
# para analizar el rendimiento de un portafolio. Para este proyecto, nos centraremos
# claramente en el Brinson-Fachler.

# El documento presenta el modelo para un período o multi período, utilizando métodos
# de enlace aritmético, geométrico y optimizado.




# ======================
# Instalar y cargar librerías
# ======================

# Primero se instala la librería "remotes", para instalar la librería "pa", ya que
# esta última no está en CRAN, por lo que se debe instalar desde GitHub.
install.packages("remotes")

# Instalar la librería "pa"
install.packages("pa")

# Se importan las librerías anteriormente instaladas
library(pa)
library(ggplot2)

# ======================
# Cargar datos de ejemplo
# ======================

data(year)

# ======================
# Análisis Modelo Brinson de un solo período
# ======================

# Se utilizan datos simulados que vienen incluidos en la librería "pa"
# Los datos corresponden al año 2010

mayo_2010 <- year[year$date==as.Date("2010-05-01"),]

# Se aplicará el ejemplo utilizando el período de enero de 2010
br_single <- brinson(
  x = mayo_2010,
  date.var = "date",
  cat.var = "sector",
  bench.weight = "benchmark",
  portfolio.weight = "portfolio",
  ret.var = "return"
)

# Para mostrar el resumen numerico del análisis
summary(br_single)

# Para visualizar la gráfica de rentabilidades por sector
plot(br_single, var = "sector", type = "return")


