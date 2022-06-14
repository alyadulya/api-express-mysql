const express = require('express');
const path = require('path');
const app = express();
const productRouter = require('./app/product/routes');
const productRouterV2 = require('./app/product_v2/routes');
const logger = require('morgan');

app.use(logger('dev'));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use('/public', express.static(path.join(__dirname, 'uploads')));
app.use('/api/v1', productRouter);
app.use('/api/v2', productRouterV2);
app.use((req, res, next) => {
    res.status(404);
    res.send({
        status: 'failed',
        message: `Resource ${req.originalUrl} not found`
    });
});
app.use((error, req, res, next) => {
    console.log('This is the rejected field ->', error.field);
  });
app.listen(process.env.PORT || 3000, () => console.log('Server: http://localhost:3000'));