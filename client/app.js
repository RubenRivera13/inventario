import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js/+esm'

const supabaseUrl = 'https://rdlkqjbekhptaequskdv.supabase.co/rest/v1/'
const supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJkbGtxamJla2hwdGFlcXVza2R2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzg4NjEyMzIsImV4cCI6MjA5NDQzNzIzMn0.othHLwSnCLGHg3hsPdska_Wcobi3fGF6dn_f7LW3_Yg'

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