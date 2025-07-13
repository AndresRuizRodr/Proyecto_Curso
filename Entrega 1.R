install.packages(c("usethis", "renv", "gh"))

renv::init()

renv::snapshot()

usethis::use_git()

usethis::use_github()

usethis::create_github_token()

usethis::edit_r_environ()
usethis::git_sitrep()


#############

#¿Qué problema soluciona?
  
#El modelo Brinson-Fachler es una herramienta para descomponer el rendimiento de un portafolio, pero suele utilizarse en contextos avanzados, con datos reales y sin una interfaz clara para el aprendizaje o la simulación. Esto dificulta que estudiantes, analistas junior o profesionales en formación comprendan intuitivamente cómo se genera valor por asignación o selección.

#¿A quién impacta?
  
#Estudiantes de finanzas de la carrera de Ingeniería Comercial o programas ejecutivos que buscan entender cómo evaluar el desempeño de portafolios.
#Académicos y docentes que necesitan una herramienta pedagógica para enseñar conceptos de atribución de desempeño.


#¿Cómo espera solucionar el problema?

#Desarrollando una aplicación interactiva en R (usando Shiny) que permita al usuario:
#Ingresar los rendimientos y pesos de un portafolio y su benchmark.
#Crear escenarios ficticios y modificarlos dinámicamente.
#Visualizar paso a paso los efectos de asignación, selección e interacción.
#Obtener un reporte gráfico y numérico final con interpretación automática.


#Periodicidad del desarrollo y uso
#El desarrollo del sistema será único, pero la herramienta podrá utilizarse de manera permanente, como recurso educativo o de entrenamiento.
#La ejecución del simulador podrá realizarse en cada clase, módulo o análisis que requiera enseñar o explicar el modelo Brinson-Fachler.


#Alcance del proyecto
#Considera:
#Evaluación de portafolios ficticios con datos ingresados por el usuario.
#Benchmark estático con sectorialización básica.
#Cálculo de efectos de asignación, selección e interacción.
#Visualizaciones en R.

#No considera:
#Conexión con bases de datos externas.
#Benchmark dinámico (cambiante en el tiempo).
#Integración con otros modelos (CAPM, Fama-French).
#Datos históricos reales de mercado (aunque puede ser extensión futura).



