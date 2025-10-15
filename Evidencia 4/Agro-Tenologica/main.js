// main.js — Versión sencilla para AgroTech Dashboard
// Simulación básica de métricas y sensores

function $(id) { return document.getElementById(id); }

// Simulación de datos iniciales
let sensores = [];
let insumos = [];
let usuarios = [];
let alertas = [];

// Panel de métricas (manual)
function actualizarPanelManual() {
  const humedad = $('input-humedad').value;
  const temp = $('input-temp').value;
  const ph = $('input-ph').value;
  if ($('humedad-value')) $('humedad-value').textContent = humedad ? humedad + ' %' : '-- %';
  if ($('temp-value')) $('temp-value').textContent = temp ? temp + ' °C' : '-- °C';
  if ($('ph-value')) $('ph-value').textContent = ph ? ph : '--';
  if ($('last-update')) $('last-update').textContent = new Date().toLocaleTimeString();
}
document.addEventListener('DOMContentLoaded', function() {
  if ($('btn-actualizar-panel')) {
    $('btn-actualizar-panel').addEventListener('click', actualizarPanelManual);
  }
});

// Sensores CRUD (muy básico)
function renderSensores() {
  const list = $('sensor-list');
  list.innerHTML = '';
  sensores.forEach(s => {
    const li = document.createElement('li');
    li.textContent = `${s.id} — ${s.tipo}`;
    list.appendChild(li);
  });
}
$('sensor-form').onsubmit = function(e) {
  e.preventDefault();
  const id = $('sensor-id').value.trim();
  const tipo = $('sensor-type').value;
  if (!id) return;
  const idx = sensores.findIndex(s => s.id === id);
  if (idx >= 0) sensores[idx].tipo = tipo;
  else sensores.push({ id, tipo });
  localStorage.setItem('sensores', JSON.stringify(sensores));
  renderSensores();
  $('sensor-id').value = '';
};
document.addEventListener('DOMContentLoaded', renderSensores);

// Insumos CRUD
function renderInsumos() {
  const list = $('supply-list');
  list.innerHTML = '';
  insumos.forEach(i => {
    const li = document.createElement('li');
    li.textContent = `${i.nombre} — ${i.cantidad}`;
    list.appendChild(li);
  });
}
$('supply-form').onsubmit = function(e) {
  e.preventDefault();
  const nombre = $('supply-name').value.trim();
  const cantidad = parseInt($('supply-qty').value, 10) || 0;
  if (!nombre) return;
  const idx = insumos.findIndex(i => i.nombre === nombre);
  if (idx >= 0) insumos[idx].cantidad = cantidad;
  else insumos.push({ nombre, cantidad });
  localStorage.setItem('insumos', JSON.stringify(insumos));
  renderInsumos();
  $('supply-name').value = '';
  $('supply-qty').value = '';
};
document.addEventListener('DOMContentLoaded', renderInsumos);

// Usuarios CRUD (registro y login simulado)
function renderUsuarios() {
  const list = $('user-list');
  list.innerHTML = '';
  usuarios.forEach(u => {
    const li = document.createElement('li');
    li.textContent = `${u.nombre} — ${u.email} — ${u.rol}`;
    list.appendChild(li);
  });
}
document.addEventListener('DOMContentLoaded', renderUsuarios);

$('register-form').onsubmit = function(e) {
  e.preventDefault();
  const nombre = $('reg-name').value.trim();
  const email = $('reg-email').value.trim();
  const pass = $('reg-pass').value;
  const farm = $('reg-farm').value.trim();
  const rol = $('reg-role').value;
  if (!nombre || !email || !pass) {
    showToast('Completa todos los campos');
    return;
  }
  if (usuarios.find(u => u.email === email)) {
    showToast('Ya existe ese usuario');
    return;
  }
  usuarios.push({ nombre, email, pass, farm, rol });
  localStorage.setItem('usuarios', JSON.stringify(usuarios));
  renderUsuarios();
  // Limpiar campos automáticamente
  $('reg-name').value = '';
  $('reg-email').value = '';
  $('reg-pass').value = '';
  $('reg-farm').value = '';
  $('reg-role').selectedIndex = 0;
  showToast('Usuario registrado correctamente');
};

// Login simulado
$('login-form').onsubmit = function(e) {
  e.preventDefault();
  const email = $('login-email').value.trim();
  const pass = $('login-pass').value;
  const user = usuarios.find(u => u.email === email && u.pass === pass);
  if (!user) return alert('Usuario o contraseña incorrectos');
  $('current-user-display').textContent = user.nombre + ' (' + user.rol + ')';
  $('btn-open-auth').classList.add('hidden');
  $('btn-logout').classList.remove('hidden');
  $('auth-modal').classList.add('hidden');
};
$('btn-logout').onclick = function() {
  $('current-user-display').textContent = '(Sin sesión)';
  $('btn-open-auth').classList.remove('hidden');
  $('btn-logout').classList.add('hidden');
};
$('btn-open-auth').onclick = function() {
  $('auth-modal').classList.remove('hidden');
};
$('auth-close').onclick = function() {
  $('auth-modal').classList.add('hidden');
};

// Alertas simuladas
function renderAlertas() {
  const list = $('alert-history');
  list.innerHTML = '';
  alertas.forEach(a => {
    const li = document.createElement('li');
    li.textContent = `${a.fecha} — pH: ${a.ph} — Email: ${a.email}`;
    list.appendChild(li);
  });
}
document.addEventListener('DOMContentLoaded', renderAlertas);

$('check-alert').onclick = function() {
  const umbral = parseFloat($('umbral-ph').value);
  const email = $('alert-email').value.trim();
  const ph = parseFloat($('ph-value').textContent);
  if (ph < umbral) {
    alertas.push({ fecha: new Date().toLocaleString(), ph, email });
    localStorage.setItem('alertas', JSON.stringify(alertas));
    renderAlertas();
    showToast('¡Alerta enviada!');
  } else {
    showToast('Sin alerta: pH dentro de rango');
  }
};

// Toast simple
function showToast(msg) {
  const area = $('toast-area');
  const div = document.createElement('div');
  div.textContent = msg;
  div.className = 'bg-indigo-700 text-white px-4 py-2 rounded shadow mb-2';
  area.appendChild(div);
  setTimeout(() => div.remove(), 3000);
}

// Checklist de funciones (simulación de verificación)
document.addEventListener('DOMContentLoaded', function() {
  if (usuarios.length) $('rf1-status').textContent = 'Verificado';
  if (sensores.length) $('rf2-status').textContent = 'Verificado';
  $('rf3-status').textContent = 'Verificado';
  if (alertas.length) $('rf4-status').textContent = 'Verificado';
  if (insumos.length) $('rf5-status').textContent = 'Verificado';
  $('rf6-status').textContent = 'Verificado';
});

// Generación de PDF/Excel simulada
$('gen-pdf').onclick = function() {
  const desde = $('fecha-desde').value;
  const hasta = $('fecha-hasta').value;
  const blob = new Blob([`Reporte PDF simulado\nDesde: ${desde}\nHasta: ${hasta}`], { type: 'application/pdf' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = 'reporte.pdf';
  a.click();
  URL.revokeObjectURL(url);
};
$('gen-xlsx').onclick = function() {
  const desde = $('fecha-desde').value;
  const hasta = $('fecha-hasta').value;
  const blob = new Blob([`Reporte Excel simulado\nDesde: ${desde}\nHasta: ${hasta}`], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = 'reporte.xlsx';
  a.click();
  URL.revokeObjectURL(url);
};

// Demo rápido para login
$('btn-fill-demo').onclick = function() {
  $('login-email').value = 'admin@demo.com';
  $('login-pass').value = '1234';
};
