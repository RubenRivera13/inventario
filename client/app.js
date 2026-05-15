import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js/+esm'

const supabaseUrl = 'https://TU-PROYECTO.supabase.co'
const supabaseKey = 'TU-ANON-KEY'

const supabase = createClient(supabaseUrl, supabaseKey)

const lista = document.getElementById('eventos')

supabase
  .channel('movimientos-channel')
  .on(
    'postgres_changes',
    {
      event: 'INSERT',
      schema: 'public',
      table: 'movimientos'
    },
    (payload) => {
      const item = document.createElement('li')
      item.textContent = JSON.stringify(payload.new)
      lista.appendChild(item)
    }
  )
  .subscribe()