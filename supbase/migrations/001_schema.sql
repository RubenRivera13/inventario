-- EXTENSIONES
create extension if not exists "pgcrypto";

-- ENUM
create type tipo_movimiento as enum ('ENTRADA', 'SALIDA');

-- TABLA CATEGORIAS
create table categorias (
    id uuid primary key default gen_random_uuid(),
    nombre varchar(100) not null unique,
    descripcion text
);

-- TABLA PROVEEDORES
create table proveedores (
    id uuid primary key default gen_random_uuid(),
    nombre varchar(150) not null,
    contacto varchar(150),
    correo varchar(150),
    telefono varchar(50)
);

-- TABLA PRODUCTOS
create table productos (
    id uuid primary key default gen_random_uuid(),
    sku varchar(50) unique not null,
    nombre varchar(150) not null,
    descripcion text,
    categoria_id uuid references categorias(id),
    proveedor_id uuid references proveedores(id),
    precio numeric(10,2) not null check (precio >= 0),
    stock_actual integer default 0 check (stock_actual >= 0),
    stock_minimo integer default 0 check (stock_minimo >= 0),
    creado_por uuid references auth.users(id),
    created_at timestamptz default now()
);

-- TABLA MOVIMIENTOS
create table movimientos (
    id uuid primary key default gen_random_uuid(),
    producto_id uuid not null references productos(id) on delete cascade,
    tipo tipo_movimiento not null,
    cantidad integer not null check (cantidad > 0),
    motivo text,
    fecha timestamptz default now(),
    usuario_id uuid references auth.users(id)
);