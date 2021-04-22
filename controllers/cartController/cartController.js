const express = require('express');
const Product = require('../../models/product');
const slugify = require('slugify');
const { forEach } = require('../../models/states.model');
const e = require('express');
const router = express.Router();

router.get('/mycart', (req, res) => {

    let { message } = req.query;
    let navbar = '../partials/navbarUser.ejs';
    let user = '';
    if (req.session.user && req.session.user.type == 'user') {
        navbar = '../partials/navbarUserLogged.ejs'
        user = req.session.user;
    }
    let errorInProcess = false;
    try {
        if (req.session.user && req.session.user.type != 'admin') {
            let cart = (req.session.user.cart).slice();
            if (cart.length > 0) {
                cart.forEach(async (item, index) => {
                    try {
                        cart[index]['data'] = await Product.findByPk(item.id);
                        cart[index]['slug'] = slugify(cart[index]['data'].namePlusSmallDescription);

                        // Utilizar findIndex pois voce esta alterando a sessao user carrinho e isso nao condiz com cart index

                        if (cart[index].data.stockQuantity < cart[index].quantity && cart[index].data.stockQuantity > 0) {
                            errorInProcess = true;
                            req.session.user.cart[index].quantity = cart[index].data.stockQuantity;
                            cart[index].quantity = cart[index].data.stockQuantity;
                        }

                        if (cart[index].data.stockQuantity == 0 || cart[index].data.status == 0) {
                            errorInProcess = true;
                            req.session.user.cart[index] = '_nullValue';
                            cart[index] = '_nullValue';
                        }

                        if (index == cart.length - 1) {
                            if (!errorInProcess) {
                                res.render('user/cart', { cart, navbar, user, message });
                            } else {
                                let nextItem = true;
                                while (nextItem) {
                                    let indexLocal = cart.indexOf('_nullValue');
                                    if (indexLocal != -1) {
                                        nextItem = true;
                                        cart.splice(indexLocal, 1);
                                        req.session.user.cart.splice(indexLocal, 1);
                                    } else {
                                        nextItem = false;
                                    }
                                }
                                let localMessage = `?message=Desculpe pelo transtorno, mas infelizmente o(s) 
                                produto(s) que deseja não estão mais em estoque. Por motivos de logistica seu carrinho foi alterado.
                                Verifique seu carrinho para continuar a compra!`;
                                res.redirect(`/mycart${localMessage}`);
                            }
                        }
                    } catch (err) {
                        res.render('errors/databaseError');
                    }

                });
            } else {
                res.render('user/cart', { cart, navbar, user, message });
            }
        } else {
            res.redirect('/');
        }
    }
    catch (err) {
        res.render('errors/databaseError');
    }

});

router.post('/add-to-cart', async (req, res) => {
    try {
        if (req.session.user && req.session.user.type != 'admin') {
            let enterCondition = true;
            let { id, quantity } = req.body;
            let product = await Product.findByPk(id);
            req.session.user.cart.forEach((item, index) => {
                if (product.id == item.id) {
                    enterCondition = false;
                    if ((Number(item.quantity) + Number(quantity)) > Number(product.stockQuantity)) {
                        req.session.user.cart[index].quantity = product.stockQuantity;
                    } else {
                        req.session.user.cart[index].quantity = Number(req.session.user.cart[index].quantity) + Number(quantity);
                    }
                }
            });
            if (enterCondition) {
                req.session.user.cart.push({ id, quantity });
                res.redirect('/mycart');
            } else {
                res.redirect('/mycart');
            }

        } else {
            let message = '?message=faça o logout da sua conta administrativa!'
            res.redirect(`/admin/panel${message}`);
        }
    } catch (err) {
        res.render('errors/databaseError');
    }
});

router.post('/remove-from-cart', (req, res) => {
    let { index } = req.body;
    req.session.user.cart.splice(index, 1);
    res.redirect('/mycart');
});

router.post('/change-cart-item-quantity', (req, res) => {
    let { index, input_quantity } = req.body;
    if (input_quantity == '') {
        input_quantity = 1;
    }
    req.session.user.cart[index].quantity = input_quantity;
    res.redirect('/mycart');
});

router.get('/remove-all-cart', (req, res) => {
    if (req.session.user && req.session.user != 'admin') {
        req.session.user.cart = [];
        res.redirect('/mycart');
    } else {
        res.redirect('/');
    }
});

module.exports = router;