# Introducción

El federador de pacientes permite que los dominios participantes registren y consulten la información demográfica de pacientes, aportando únicamente los datos básicos, y que se realicen búsquedas de candidatos para identificación, basadas en la información mínima aportada (nombres, género, fecha de nacimiento).

La guía de implementación FHIR para el servicio federador de pacientes está inspirada en IHE PIXm, agregando algunas operaciones de IHE PIX que todavía no están especificadas en IHE PIXm por haber sido declarados temporalmente como fuera de alcance.

# Definiciones

## Red de interoperabilidad

Es una red que tiene como objetivo conectar los Sistemas de Información en Salud de todos los efectores de la Argentina
Posibilita el intercambio de información clínica preciso, seguro, a tiempo y de calidad, con fines asistenciales, epidemiológicos, estadísticos y de gestión

## Nodos

Todos los sistemas que participan de la red de Interoperabilidad son un Nodo
Los nodos que generan y almacenan información clínica se denominan Dominios
Los nodos que representan una red de interoperabilidad jurisdiccional o regional son un Dominio Agrupador
Los nodos que reciben y procesan información, pero no generan información, se denominan Nodos de Servicio

## Dominios

Dominio Representa un componente discreto del sistema de salud Puede ser una Provincia, Municipio, Prestador, Financiador, Universidad, Programa Sanitario, etc. Tiene autonomía Tecnológica, para elegir soluciones informáticas De registro, con padrones de pacientes y repositorios clínicos propios e independientes No envían toda la información que registran a un repositorio centralizado, la tienen en guarda y la comparten solo cuando el paciente lo necesita Envían los mismos reportes que hoy para estadísticas, epidemiología y gestión

### ¿Quién puede ser un Dominio?

Cualquier organización / sistema de salud independiente Provincias, Municipios en algunas provincias, Obras Sociales, Hospitales Privados, Hospitales Universitarios, Programas Nacionales

### ¿Que condiciones debe cumplir un Dominio?

Administrar un padrón de pacientes con criterios mínimos de calidad en contenido y procesos Contar con un repositorio de información clínica Utilizar los estándares de intercambio de información requeridos por el Plan de Interoperabilidad

### ¿Como se crea un Dominio?

El Ministerio de Salud de Nación es el único organismo que puede dar de alta un dominio en el Bus de Interoperabilidad Se firma un acta de adhesión al plan Las provincias deben definir que rol quieren tener sobre los dominios en su territorio, como por ejemplo: Usar un Bus provincial y participar con un único dominio Supervisar y aprobar la creación de dominios Recibir información de los dominios

## Proceso de Identidad Federada

Cada Dominio identifica a los pacientes con sus propios procesos y sistemas Si cumple con las recomendaciones mínimas para asegurar la calidad, puede ”federar” a los pacientes en el Bus de Interoperabilidad El Bus de Interoperabilidad, basándose en el conjunto de datos mínimos, identifica al mismo paciente a través de diferentes dominios, asignándole un identificador nacional, que vincula los registros médicos en todos los dominios
