# 🛒 E-commerce SQL Database

Este proyecto contiene el diseño y creación de una base de datos para un sistema de comercio electrónico. Incluye el modelo entidad-relación (ER), scripts para la creación de tablas y carga de datos de prueba.

## 📸 Diagrama Entidad-Relación

A continuación, se muestra el diagrama ER del sistema, generado con MySQL Workbench:

![Diagrama E-commerce](Diagrama.png)

> 💡 Si no puedes ver la imagen, el srchivo `Diagrama.png` se encuentra en la raiz del repositorio para su visualizacion.

## 📂 Estructura del Repositorio

- `Diagrama E-commerce.mwb`: Archivo de MySQL Workbench que contiene el diseño visual del modelo ER.
- `create_tables.sql`: Script SQL para crear todas las tablas del esquema de base de datos.
- `data_set.sql`: Script SQL para insertar datos de ejemplo y poblar las tablas.

## 📌 Requisitos

- MySQL Server (versión 8.0 o superior recomendada)
- MySQL Workbench (para visualizar el archivo `.mwb`)
- Cliente SQL o gestor de base de datos para ejecutar los scripts

## 🚀 Cómo usar

1. Clona este repositorio:

   ```bash
   git clone https://github.com/juangomezn/E-commerce-SQL.git
   cd E-commerce-SQL
   ```

2. Abre el archivo `Diagrama E-commerce.mwb` con **MySQL Workbench** para visualizar o editar el modelo.

3. Ejecuta el script `create_tables.sql` en tu servidor MySQL para crear la base de datos y sus tablas.

4. Ejecuta el script `data_set.sql` para insertar datos de ejemplo en las tablas.

## 📘 Descripción del Modelo

El modelo incluye las siguientes entidades principales:

- `Users`: Clientes registrados en el sistema
- `Products`: Productos disponibles para la venta
- `Orders`: Pedidos realizados por los clientes
- `OrderDetails`: Detalle de los productos en cada pedido
- `Categories`: Clasificación de los productos
- `Payments`: Información de pagos asociados a pedidos

Este modelo permite gestionar usuarios, productos, pedidos y pagos de manera eficiente para un sistema de e-commerce básico.

## 📜 Licencia [![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

<div style="
    background: linear-gradient(90deg, #e8e8e8 100%);
    border-left: 4px solid #3498db;
    padding: 1rem;
    border-radius: 4px;
    margin: 1rem 0;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
">

Este proyecto está licenciado bajo **Apache License 2.0**.  
Para más información, consulta el archivo [LICENSE](LICENSE) o visita [apache.org/licenses](https://www.apache.org/licenses/LICENSE-2.0).
</div>

<h2>
  ✨ Elaborado por
  <img src="https://img.shields.io/badge/Juan%20David%20Gomez-black?style=for-the-badge&logo=dev.to&logoColor=white" alt="Author" style="vertical-align: middle; margin-left: 8px;">
</h2>

[![GitHub](https://img.shields.io/badge/GitHub-JuanDavidGomezN-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/juangomezn)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-JuanDavidGomezN-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](www.linkedin.com/in/juangomezn)

[![Gmail](https://img.shields.io/badge/Gmail-juan.david%40gmail.com-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:gomezninoj681@gmail.com)
