insert into categorias(nombre, descripcion) values
('Laptops', 'Equipos portátiles'),
('Monitores', 'Pantallas'),
('Teclados', 'Teclados mecánicos'),
('Mouse', 'Dispositivos apuntadores'),
('Redes', 'Equipos de red');


insert into proveedores(nombre, contacto, correo, telefono) values
('Tech Supply', 'Juan Perez', 'juan@test.com', '5556294620'),
('CompuMarket', 'Ana Lopez', 'ana@test.com', '5523675439'),
('Digital MX', 'Carlos Ruiz', 'carlos@test.com', '5510354678'),
('Global Hardware', 'Maria Torres', 'maria@test.com', '5534286539'),
('Net Solutions', 'Luis Gomez', 'luis@test.com', '5520986534')




insert into movimientos ( producto_id, tipo, cantidad, motivo, usuario_id ) 
values( '0ce98277-b475-4073-a36d-f5d509d85733', 'ENTRADA', 5, 'Compra Inicial', auth.uid() )