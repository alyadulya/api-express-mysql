const router = require('express').Router();
const Product = require('./model');
const multer = require('multer');
const path = require('path');
const fs = require('fs');
const upload = multer({ dest: 'uploads' });

router.get('/product', async (req, res) => {
    try {
        await Product.findAll()
            .then((result) => {
                res.send(result);
            })
    } catch (e) {
        res.send(e);
    }
});

router.get('/product/:id', async (req, res) => {
    try {
        await Product.findOne({
            where: {
                id: req.params.id
            }
        })
            .then((result) => {
                res.send(result);
            })
    } catch (e) {
        res.send(e);
    }
});

router.post('/product', upload.single('image_url'), async (req, res) => {
    const {user_id, name, price, stock, status} = req.body;
    const image_url = req.file;
    if (image_url) {
        const target = path.join(__dirname, '../../uploads', image_url.originalname);
        fs.renameSync(image_url.path, target);
        try {
            await Product.sync();
            const result = await Product.create({user_id, name, price, stock, status, image_url: `http://localhost:3000/public/${image_url.originalname}`});
            res.send(result);
        } catch (e) {
            res.send(e);
        }
    }
});

router.put('/product/:id', upload.single('image_url'), async (req, res) => {
    const {user_id, name, price, stock, status} = req.body;
    const image_url = req.file;
    if (image_url) {
        const target = path.join(__dirname, '../../uploads', image_url.originalname);
        fs.renameSync(image_url.path, target);
        try {
            await Product.sync();
            const result = Product.update({user_id, name, price, stock, status, image_url: `http://localhost:3000/public/${image_url.originalname}`}, {
                where: {
                    id: req.params.id
                }
            });
            res.send(result);
        } catch (e) {
            res.send(e);
        }
    } else {
        try {
            await Product.sync();
            const result = Product.update({user_id, name, price, stock, status}, {
                where: {
                    id: req.params.id
                }
            });
            res.send(result);
        } catch (e) {
            res.send(e);
        }
    }
});

router.delete('/product/:id', async (req, res) => {
    try {
        await Product.destroy({
            where: {
                id: req.params.id
            }
        })
            .then((result) => {
                res.sendStatus(result);
            })
    } catch (e) {
        res.status(404).send(e);
    }
});

module.exports = router;