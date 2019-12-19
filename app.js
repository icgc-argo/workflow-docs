const express = require('express');
const app = express();
const port = 3000;
const swaggerUi = require('swagger-ui-express');
const swaggerDocument = require('./merged.json');
const router = require('express').Router();

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.use('/api/v1', router);

app.get('/', (req, res) => res.send('Hello World!'))

app.listen(port, function () {
  console.log('app listening on port 3000!');  
})
