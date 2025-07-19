# Definición del modelo Brinson-Fachler

# Es un modelo de atribución de rendimiento que permite analizar 
# y descomponer la diferencia entre el rendimiento de un portafolio 
# y un benchmark (índice de referencia), identificando las fuentes 
# de valor agregado por el tomador de decisiones.


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


# ---------------------------------------------------------------
# A continuación comienza la definición de funciones:
# ---------------------------------------------------------------

# Librerías
library(tidyverse)

# ----------------------------
# Función principal del modelo:
# ----------------------------

brinson_bf <- function(w_p, r_p, w_b, r_b) {
  stopifnot(length(w_p) == length(r_p),
            length(w_b) == length(r_b),
            length(w_p) == length(w_b))
  
  allocation  <- sum((w_p - w_b) * r_b)
  selection   <- sum(w_b * (r_p - r_b))
  interaction <- sum((w_p - w_b) * (r_p - r_b))
  total       <- allocation + selection + interaction
  
  return(tibble(
    Efecto = c("Asignación", "Selección", "Interacción", "Total"),
    Valor = c(allocation, selection, interaction, total)*100
  ))
}

# ----------------------------
# Función de interpretación:
# ----------------------------

interpretar_resultado <- function(efectos) {
  efecto_mayor <- efectos %>%
    filter(Efecto != "Total") %>%
    slice_max(abs(Valor), n = 1)
  
  glue::glue("El mayor impacto en el rendimiento proviene del efecto de *{efecto_mayor$Efecto}*, 
con una contribución de {round(efecto_mayor$Valor, 4)}%. 
Esto indica que la ventaja comparativa del portafolio frente al benchmark se debe principalmente a ese componente.")
}

# ----------------------------
# Función del ejemplo simulado:
# ----------------------------

simular_datos <- function() {
  tibble(
    Sector = c("Tecnología", "Salud", "Consumo"),
    Peso_Portafolio = c(0.5, 0.3, 0.2),
    Rend_Portafolio = c(0.1, 0.05, 0.07),
    Peso_Benchmark = c(0.3, 0.4, 0.3),
    Rend_Benchmark = c(0.07, 0.04, 0.05)
  )
}

# ----------------------------
# Función para ejecutar todo:
# ----------------------------

ejecutar_modelo <- function(datos) {
  resultados <- brinson_bf(
    w_p = datos$Peso_Portafolio,
    r_p = datos$Rend_Portafolio,
    w_b = datos$Peso_Benchmark,
    r_b = datos$Rend_Benchmark
  )
  
  interpretacion <- interpretar_resultado(resultados)
  
  list(resultados = resultados, interpretacion = interpretacion)
}

# ----------------------------
# Ejemplo de uso
# ----------------------------

datos <- simular_datos()
res <- ejecutar_modelo(datos)

# Mostrar resultados
print(res$resultados)
cat("\nInterpretación:\n")
cat(res$interpretacion)


# ----------------------------
# Graficar los efectos
# ----------------------------

library(ggplot2)

# Filtramos solo con los tres efectos (sin Total)
efectos_grafico <- res$resultados %>%
  filter(Efecto != "Total")

# Graficamos con ggplot2
ggplot(efectos_grafico, aes(x = Efecto, y = Valor, fill = Efecto)) +
  geom_col(width = 0.5) +
  geom_text(aes(label = round(Valor, 4)), vjust = -0.5, size = 4.5) +
  labs(title = "Descomposición del Rendimiento, por tipo de efecto - Modelo Brinson-Fachler",
       x = "Tipo de efecto",
       y = "Contribución (%)") +
  theme_minimal(base_size = 16) +
  theme(legend.position = "none")
