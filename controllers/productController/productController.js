const express = require('express');
const adminAuth = require('../../middlewares/adminAuthenticate');
const Category = require('../../models/category');
const Product = require('../../models/product');
const ProductImage = require('../../models/productImages');
const Provider = require('../../models/provider');
const router = express.Router();
const { Op } = require('sequelize');
const OrderItem = require('../../models/orderItem');

router.get('/admin/product', adminAuth, async (req, res) => {
    let { message, error, search } = req.query;
    let { name } = req.session.user;

    localSearch = {};
    if (search) {
        localSearch = {
            [Op.or] : [{
                namePlusSmallDescription: {
                    [Op.substring] : search
                }
            }, {
                refCode: {
                    [Op.substring] : search
                }   
            }]
            
        }

    }

    try {
        let data = await Product.findAll({
            where: localSearch,
            include: [ProductImage],
        }, { order: ['id', 'DESC'] });
        res.render('product/index', { products: data, message, error, name });
    } catch (err) {
        res.render('errors/databaseError');
    };
});


// VERIFICAR CODIGO DE REFERENCIA *****
router.get('/admin/product/create', adminAuth, async (req, res) => {
    let { name } = req.session.user;
    let {
        error, namePlusSmallDescription, brand, refCode, purchasePrice, saleValue,
        stockQuantity, imageLinkPrincipal, description, category, provider,
        imageLink0, imageLink1, imageLink2, imageLink3,
        imageTitle0, imageTitle1, imageTitle2, imageTitle3
    } = req.query;

    try {
        let dataCategory = await Category.findAll({ where: { status: 1 } });
        let dataProvider = await Provider.findAll({ where: { status: 1 } });
        if (!error) {
            res.render('product/create', {
                categories: dataCategory, providers: dataProvider, name,
                data: {
                    namePlusSmallDescription: '', brand: '', purchasePrice: '', saleValue: '',
                    stockQuantity: '', imageLinkPrincipal: '', description: '', category: '', provider: '',
                    imageLink0: '', imageLink1: '', imageLink2: '', imageLink3: '',
                    imageTitle0: '', imageTitle1: '', imageTitle2: '', imageTitle3: ''
                }
            });
        } else {
            res.render('product/create', {
                categories: dataCategory, providers: dataProvider, name,
                data: {
                    error, namePlusSmallDescription, brand, refCode, purchasePrice, saleValue,
                    stockQuantity, imageLinkPrincipal, description, category, provider,
                    imageLink0, imageLink1, imageLink2, imageLink3,
                    imageTitle0, imageTitle1, imageTitle2, imageTitle3
                }
            });
        }
    } catch (err) {
        res.render('errors/databaseError');
    }

});


router.post('/admin/product/create', async (req, res) => {
    let { namePlusSmallDescription, brand, refCode, purchasePrice, saleValue,
        stockQuantity, imageLinkPrincipal, imageTitle, imageLink, description, category, provider } = req.body;
    try {

        let productFind = await Product.findOne({ where: { refCode } });
        if (!productFind) {

            let dataCreateProduct = await Product.create({
                namePlusSmallDescription, brand, refCode, purchasePrice, saleValue,
                stockQuantity, imageLink: imageLinkPrincipal, description,
                CategoryId: category, ProviderId: provider
            });

            let arrayTitleLinkImages = [];
            imageLink.forEach(async (link, index) => {
                if (link != '') {
                    arrayTitleLinkImages.push({ title: imageTitle[index], link });
                }
            });
            if (imageLink.length > 0) {
                arrayTitleLinkImages.forEach(async (objImage) => {
                    await ProductImage.create({ name: objImage.title, imageLink: objImage.link, ProductId: dataCreateProduct.id });
                });
            }
            res.redirect('/admin/product');

        } else {
            let imagesReturned = '';
            imageTitle.forEach((title, index) => {
                imagesReturned += `&imageTitle${index}=${title}&imageLink${index}=${imageLink[index]}`;
            });
            let error = `?error=Codigo de Referencia ja Presente no Sistema, por favor utilize outro!
            &namePlusSmallDescription=${namePlusSmallDescription}&brand=${brand}&purchasePrice=${purchasePrice}&saleValue=${saleValue}&stockQuantity=${stockQuantity}&imageLinkPrincipal=${imageLinkPrincipal}&description=${description}&category=${category}&provider=${provider}${imagesReturned}`;
            res.redirect(`/admin/product/create${error}`);
        }

    } catch (err) {
        res.render('errors/databaseError');
    }
});


router.get('/admin/product/edit/:id', adminAuth, async (req, res) => {
    let { id } = req.params;
    let { name } = req.session.user;
    let { error } = req.query;

    try {
        let dataCategory = await Category.findAll({ where: { status: 1 } });
        let dataProvider = await Provider.findAll({ where: { status: 1 } });
        let data = await Product.findByPk(id, { include: [{ model: ProductImage }] });
        if (data) {
            res.render('product/edit', { product: data, categories: dataCategory, providers: dataProvider, name, error });
        } else {
            let error = '?error=Produto não Encontrado!'
            res.redirect(`/admin/product${error}`);
            //res.send('Nao encontrado');
        }
    } catch (err) {
        res.redirect('errors/databaseError');
    }
});

router.post('/admin/product/edit', async (req, res) => {


    //     namePlusSmallDescription": "Xiaomi Redmi 9A Dual SIM 32 GB cinza 2 GB RAM",
    //   "brand": "Xiaomi",
    //   "refCode": "0064231",
    //   "purchasePrice": "699.00",
    //   "saleValue": "799.00",
    //   "stockQuantity": "23",
    //   "category": "1",
    //   "provider": "3",
    //   "imageLinkPrincipal": "https://http2.mlstatic.com/D_NQ_NP_752276-MLA43824398278_102020-O.webp",
    //   "imageTitle": [
    //     "foto 1",
    //     "foto 2",
    //     "foto 3",
    //     "foto 4"
    //   ],
    //   "imageLink": [
    //     "https://http2.mlstatic.com/D_NQ_NP_741962-MLA43824398279_102020-O.webp",
    //     "https://http2.mlstatic.com/D_NQ_NP_999915-MLA43824398280_102020-O.webp",
    //     "https://http2.mlstatic.com/D_NQ_NP_968563-MLA43824416220_102020-O.webp",
    //     "https://http2.mlstatic.com/D_NQ_NP_720295-MLA43824398282_102020-O.webp"
    //   ],
    //   "description":

    let { namePlusSmallDescription, brand, refCode, purchasePrice,
        saleValue, stockQuantity, category, provider, imageLinkPrincipal,
        description, id, imageTitle, imageLink, ids } = req.body;

    try {

        let localProd = await Product.findOne({
            where: {
                [Op.and]:
                    [{ refCode }, {
                        id: { [Op.ne]: id }
                    }]
            }
        });
        if (!localProd) {

            await Product.update({
                namePlusSmallDescription, brand, refCode, description, purchasePrice, saleValue,
                stockQuantity, imageLink: imageLinkPrincipal, CategoryId: category, ProviderId: provider
            }, { where: { id } });

            let imageUpdate = [];
            let imageCreate = [];

            imageLink.forEach((link, index) => {
                if (ids) {
                    if (ids[index]) {
                        imageUpdate.push({ name: imageTitle[index], imageLink: link, id: ids[index] });
                    } else {
                        if (imageLink[index] != '') {
                            imageCreate.push({ name: imageTitle[index], imageLink: link });
                        }
                    }
                } else {
                    if (imageLink[index] != '') {
                        imageCreate.push({ name: imageTitle[index], imageLink: link });
                    }
                }
            });

            if (imageUpdate.length > 0) {
                imageUpdate.forEach(async (image) => {
                    await ProductImage.update({ name: image.name, imageLink: image.imageLink }, { where: { id: image.id } })
                });
            }
            if (imageCreate.length > 0) {
                imageCreate.forEach(async (image) => {
                    await ProductImage.create({ name: image.name, imageLink: image.imageLink, ProductId: id });
                });
            }

            let message = '?message=Producto Alterado com Sucesso!'
            res.redirect(`/admin/product${message}`);

        } else {
            let error = '?error=Codigo de Referencia ja Presente no Sistema, por favor utilize outro!'
            res.redirect(`/admin/product/edit/${id}${error}`);
        }



    } catch (err) {
        res.render('errors/databaseError');
    }
})



router.post('/admin/product/delete', async (req, res) => {
    let { id } = req.body;
    try {
        let count = await OrderItem.count();
        if (count == 0) {
            await Product.destroy({ where: { id } });
            res.redirect('/admin/product?message=Produto deletado com sucesso!');
        } else {
            let error = `?error=Não foi possível deletar o produto pois o mesmo esta presente em uma ordem, caso deseje desativar clique no botão desativar e confirme em seguida.`;
            res.redirect(`/admin/product${error}`);
        }
    } catch (err) {
        res.render('errors/databaseError');
    }
});

router.post('/admin/product/status', async (req, res) => {
    let { id } = req.body;
    try {
        let dataProduct = await Product.findByPk(id);
        if (dataProduct) {
            await Product.update({ status: !(dataProduct.status) }, { where: { id } });
            let message = '?message=Status alterado com sucesso!'
            res.redirect(`/admin/product${message}`);
        } else {
            res.redirect(`/admin/product?error=Produto não encontrado no sistema!`);
        }

    } catch (err) {
        res.render('errors/databaseError');
    }
});

module.exports = router;