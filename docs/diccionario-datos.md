# Diccionario de Datos

## Tabla: categorias

| Campo | Tipo | Descripción |
|---|---|---|
| id | uuid | Identificador único |
| nombre | varchar(100) | Nombre de la categoría |
| descripcion | text | Descripción de la categoría |

---

## Tabla: proveedores

| Campo | Tipo | Descripción |
|---|---|---|
| id | uuid | Identificador único |
| nombre | varchar(150) | Nombre del proveedor |
| contacto | varchar(150) | Persona de contacto |
| correo | varchar(150) | Correo electrónico |
| telefono | varchar(50) | Número telefónico |

---

## Tabla: productos

| Campo | Tipo | Descripción |
|---|---|---|
| id | uuid | Identificador único |
| sku | varchar(50) | Código SKU |
| nombre | varchar(150) | Nombre del producto |
| descripcion | text | Descripción |
| categoria_id | uuid | Relación con categorias |
| proveedor_id | uuid | Relación con proveedores |
| precio | numeric(10,2) | Precio del producto |
| stock_actual | integer | Inventario actual |
| stock_minimo | integer | Stock mínimo permitido |
| creado_por | uuid | Usuario creador |
| created_at | timestamptz | Fecha de creación |

---

## Tabla: movimientos

| Campo | Tipo | Descripción |
|---|---|---|
| id | uuid | Identificador único |
| producto_id | uuid | Producto relacionado |
| tipo | tipo_movimiento | ENTRADA o SALIDA |
| cantidad | integer | Cantidad movida |
| motivo | text | Motivo del movimiento |
| fecha | timestamptz | Fecha del movimiento |
| usuario_id | uuid | Usuario que realizó la acción |