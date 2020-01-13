const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;
const HOST = process.env.HOST || 'localhost';
const swaggerUi = require('swagger-ui-express');
const swaggerDocument = require('./merged.json');

swaggerDocument.host= HOST;

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

app.listen(PORT, function () {
  console.log(`app listening on port ${PORT}!`);
});
