-- ACTIVAR RLS

create policy "categorias_select_auth"
on categorias
for select
using (auth.role() = 'authenticated');

-------------------------------------------------
-- PROVEEDORES
-------------------------------------------------

create policy "proveedores_select_auth"
on proveedores
for select
using (auth.role() = 'authenticated');

-------------------------------------------------
-- PRODUCTOS
-------------------------------------------------

create policy "productos_select_auth"
on productos
for select
using (auth.role() = 'authenticated');

create policy "productos_insert_auth"
on productos
for insert
with check (
    auth.uid() = creado_por
);

create policy "productos_update_owner"
on productos
for update
using (
    auth.uid() = creado_por
);

create policy "productos_delete_owner"
on productos
for delete
using (
    auth.uid() = creado_por
);

-------------------------------------------------
-- MOVIMIENTOS
-------------------------------------------------

create policy "movimientos_select_auth"
on movimientos
for select
using (auth.role() = 'authenticated');

create policy "movimientos_insert_auth"
on movimientos
for insert
with check (
    auth.role() = 'authenticated'
    and auth.uid() = usuario_id
);