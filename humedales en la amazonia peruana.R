# Huemedales en la Amazonia Peruana(Base de datos)
library(ggplot2)
library(dplyr)
library(tidyr)

# Creando un conjunto de datos de bibliografia especialida
set.seed(123)  # Para reproducibilidad

departamentos <- c("Loreto", "Ucayali", "Madre de Dios", "Amazonas", "San Martín")
tipos_humedales <- c("Ríos y arroyos", "Lagos y lagunas", "Pantanos", "Cochas y tahuampas", "Aguajales", "Turberas")

datos <- expand.grid(Departamento = departamentos, Tipo_Humedal = tipos_humedales)
datos$Area <- runif(nrow(datos), min = 100, max = 1000)  # Área en km²

# Crear el gráfico
ggplot(datos, aes(x = Departamento, y = Area, fill = Tipo_Humedal)) +
  geom_bar(stat = "identity", position = "stack") +
  scale_fill_brewer(palette = "Set3") +
  labs(title = "Tipos de Humedales en la Amazonía Peruana por Departamento",
       x = "Departamento",
       y = "Área (km²)",
       fill = "Tipo de Humedal") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "bottom") +
  coord_flip()

# Mostrar el gráfico
print(last_plot())
