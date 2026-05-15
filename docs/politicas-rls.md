# Políticas Row Level Security (RLS)

## Categorías

### SELECT

Los usuarios autenticados pueden consultar categorías.

```sql
create policy "categorias_select_auth"
on categorias
for select
using (auth.role() = 'authenticated');