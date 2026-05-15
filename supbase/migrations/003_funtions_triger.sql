create or replace function f_actualizar_stock()
returns trigger
language plpgsql
as $$
begin

    if new.tipo = 'ENTRADA' then
        update productos
        set stock_actual = stock_actual + new.cantidad
        where id = new.producto_id;

    elsif new.tipo = 'SALIDA' then
        update productos
        set stock_actual = stock_actual - new.cantidad
        where id = new.producto_id;
    end if;

    return new;
end;
$$;


create trigger tr_actualizar_stock
after insert on movimientos
for each row
execute function f_actualizar_stock();


create or replace function f_productos_bajo_stock()
returns table (
    id uuid,
    nombre varchar,
    stock_actual integer,
    stock_minimo integer
)
language sql
as $$
    select
        p.id,
        p.nombre,
        p.stock_actual,
        p.stock_minimo
    from productos p
    where p.stock_actual <= p.stock_minimo;
$$;