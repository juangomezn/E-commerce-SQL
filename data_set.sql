INSERT INTO categories (code, name, active) VALUES
('ELEC', 'Electrónica', TRUE),
('HOME', 'Hogar', TRUE),
('TOYS', 'Juguetes', TRUE),
('BOOK', 'Libros', TRUE),
('FASH', 'Moda', FALSE);

INSERT INTO payment_methods (code, name, active) VALUES
('CASH', 'Efectivo', TRUE),
('CRDT', 'Crédito', TRUE),
('DBIT', 'Débito', TRUE),
('TRNS', 'Transfer', FALSE);

INSERT INTO countries (code_country, country) VALUES
('COL', 'Colombia'),
('USA', 'Estados Unidos'),
('MEX', 'México');

INSERT INTO cities (city, zip_code, countries_id) VALUES
('Bogotá', 110111, 1),
('Medellín', 050001, 1),
('New York', 10001, 2),
('Ciudad de México', 01000, 3);

INSERT INTO users (name, email, password, document_type, document_number, phone, cities_id, user_type, register_date, active, address) VALUES
('Juan Pérez', 'juanp@example.com', 'hashedpwd1', 'CC', '123456789', '3001234567', 1, 'client', '2024-01-10', TRUE, 'Cra 1 #23-45'),
('Ana Gómez', 'anag@example.com', 'hashedpwd2', 'CC', '987654321', '3012345678', 2, 'client', '2024-02-20', TRUE, 'Cll 50 #10-20'),
('Carlos Ruiz', 'carlosr@example.com', 'hashedpwd3', 'CC', '456789123', '3023456789', 3, 'seller', '2024-03-15', TRUE, '123 Main St'),
('Laura Díaz', 'laurad@example.com', 'hashedpwd4', 'CC', '321654987', '3034567890', 4, 'seller', '2024-04-05', FALSE, '456 Central Ave');

INSERT INTO products (code, name, description, price, stock, category_id, brand, product_Condition, vat, active) VALUES
('P001', 'Smartphone X', 'Teléfono inteligente de gama alta', 1200.00, 15, 1, 'TechBrand', 'Nuevo', 19.0, TRUE),
('P002', 'Aspiradora 3000', 'Aspiradora con filtro HEPA', 350.50, 8, 2, 'CleanCo', 'Nuevo', 19.0, TRUE),
('P003', 'Muñeca Clara', 'Muñeca de colección', 45.99, 20, 3, 'ToyWorld', 'Nuevo', 5.0, TRUE),
('P004', 'Libro de Fantasía', 'Novela de fantasía épica', 19.99, 50, 4, 'BookHouse', 'Nuevo', 0.0, TRUE),
('P005', 'Camisa Azul', 'Camisa casual de algodón', 29.99, 30, 5, 'ModaZ', 'Nuevo', 19.0, FALSE);

INSERT INTO sales (reference, date, payment_method_id, client_id, seller_id) VALUES
(1001, '2025-05-01', 1, 1, 3),
(1002, '2025-05-05', 2, 2, 4);

INSERT INTO sale_details (product_id, quantity, price, sale_id) VALUES
(1, 1, 1200.00, 1),
(4, 2, 19.99, 1),
(2, 1, 350.50, 2),
(5, 3, 29.99, 2);

-- Busqueda por Email
CREATE INDEX idx_users_email ON users(email);

-- Busqueda de Ciudad por Usuario
CREATE INDEX idx_users_city ON users(cities_id);

-- Filtra Productos por Categoriaa o Marca
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_products_brand ON products(brand);

-- Busqueda de Ciudades por Pais
CREATE INDEX idx_cities_country ON cities(countries_id);

-- Busqueda en Ventas por:Cliente, Vendedor, o Metodo de pago
CREATE INDEX idx_sales_client ON sales(client_id);

CREATE INDEX idx_sales_seller ON sales(seller_id);

CREATE INDEX idx_sales_payment ON sales(payment_method_id);

-- Busqueda de Detalles de Productos en Ventas         
CREATE INDEX idx_sale_details_product ON sale_details(product_id);

-------------------------------------------

-- VISTAS

-- Vista #1 (Inicio de Sesion)
/* Muestra: Rol o Roles del User, Tipo y Numero de Identificacion,
Nombre y Apellidos, Email, Direccion y Ciudad*/
CREATE VIEW login_user_view AS
SELECT
    u.name AS full_name,
    u.email username,
    u.document_type,
    u.document_number,
    u.phone,
    c.city,
    u.address,
    u.user_type AS role
FROM
    users u
JOIN
    cities c ON u.cities_id = c.id;

-- Vista #2(Ordenes de Pedidos del User)

CREATE VIEW users_sales_view AS
SELECT
    u.name AS full_name,
    u.document_number,
    s.reference,
    s.date,
    pa.name AS payment_method,
    GROUP_CONCAT(po.name SEPARATOR ', ') AS products,
    SUM(sd.price) AS total
FROM 
    sales s 
LEFT JOIN users u ON s.client_id = u.id
LEFT JOIN payment_methods pa ON s.payment_method_id = pa.id
LEFT JOIN sale_details sd ON sd.sale_id = s.id
LEFT JOIN products po ON sd.product_id = po.id
GROUP BY s.id;
