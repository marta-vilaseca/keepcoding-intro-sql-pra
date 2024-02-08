# 👩🏻‍💻 Práctica Modelado de Datos e Introducción a SQL

> 👤 Marta Vilaseca Foradada  
> 💻 XVI Bootcamp Full Stack Web  
> 📅 11 Febrero 2024

## 📼 Base de datos para un videoclub

Durante una comida familiar, tu primo te comenta que **acaba de abrir un videoclub**. Dice que no le está yendo todo lo bien que pensaba y cree que es porque **no tiene un software adecuado para registrar los préstamos y el inventario de películas**.
Le intentas explicar que tal vez la causa sea que existe _Netflix_, pero como le ves ilusionado y estás estudiando un Bootcamp, le vas a echar una mano.

## 📄 Entregables

- [Esquema en formato draw.io](./videoclub.drawio)
- [Script SQL que realiza todas las funciones requeridas:](./script.sql)
  - [x] Crear un nuevo esquema
  - [x] Crear todas las tablas, con sus correspondientes foreign keys y otras constraints necesarias
  - [x] Cargar datos ficticios proporcionados
  - [x] Primera consulta a la BBDD
  - [ ] Segunda consulta OPCIONAL a la BBDD

## ✅ Requisitos funcionales

Necesito **registrar los socios del videoclub**. Al menos necesito su **nombre** y **apellidos**, **fecha de nacimiento**, **teléfono** y su **número de identificación** _(DNI, Pasaporte, o el nombre que reciba en tu país)_ y nosotros le asignaremos un **número de socio** que usaremos para hacer carnets (definitivamente tu primo se quedó en algún momento de los 90’s ).

Necesito **registrar la dirección de correspondencia de los socios** para, eventualmente, hacer campañas de publicidad, pero **no es un requisito obligatorio** que un socio nos de esa información. Con el **código postal**, **calle**, **número** y **piso** es suficiente, sobreentendemos que será de la misma ciudad donde está el videoclub.

Necesito **registrar las películas**. **_Puedo tener más de una copia de cada una_**. De cada película necesito registrar el **título**, **año de publicación**, **género**, **director** y **sinopsis**.

Necesito **saber a qué socio le he prestado cada copia y cuándo**. Es decir, registrar la **fecha en la que se la ha llevado** y la **fecha de la devolución**. _Cuando una película no tiene fecha de devolución, la consideramos prestada_.

### Para ir tirando, necesito consultar a menudo:

- Que películas están disponibles para alquilar en este momento (no están prestadas). **Necesito el título y el número de copias disponibles**
- **(OPCIONAL)** Cual es el género favorito de cada uno de mis socios para poder recomendarle películas cuando venga. **Necesito el número de socio, nombre y género favorito.**

## ✅ Condición de APTO

Para conseguir el apto :

- El script se debe ejecutar **del tirón y sin fallos**.
- Se debe aplicar **normalización** siempre que se pueda.
