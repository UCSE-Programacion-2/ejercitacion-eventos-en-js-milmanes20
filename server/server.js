const express = require('express');
const cors = require('cors');
const path = require('path');
const felinosData = require('./data/felinos.json');

const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(cors());
app.use(express.json());

// Ruta home
app.get('/', (req, res) => {
  res.send('Servidor Express corriendo. Accede a data de felinos en /api/felinos');
});

// Endpoint /api/felinos
app.get('/api/felinos', (req, res) => {
  res.json(felinosData);
});

// Iniciar el servidor
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
  console.log(`Datos de Felinos en: http://localhost:${PORT}/api/felinos`);
});
