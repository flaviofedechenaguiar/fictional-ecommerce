const express = require('express');
const userAuth = require('../../middlewares/userAuthenticate');
const Order = require('../../models/order');
const OrderItem = require('../../models/orderItem');
const Product = require('../../models/product');
const router = express.Router();
const adminAuth = require('../../middlewares/adminAuthenticate');
const User = require('../../models/user');
const states = require('../../models/states.model');
const slugify = require('slugify');
const { Op } = require('sequelize');


//ADMIN ORDER routes

router.get('/admin/order', adminAuth, async (req, res) => {
    let { status } = req.query;
    let { data } = req.query;


    let option = {};

    if (data != undefined) {
        option = { createdAt: { [Op.substring]: data } }
    }
    if (status != undefined) {
        option = { status: { [Op.eq]: status } }
    }
    if (data != undefined && status != undefined) {
        option = { [Op.and]: [{ createdAt : { [Op.substring]: data }}, { status: status }]}
    }

    let orders = await Order.findAll({ include: [{ model: OrderItem }, { model: User }], where: option });
    let { name } = req.session.user;
    orders.forEach((date, index) => {
        //=== Para conversao de Data ===
        let day = date.createdAt.getDate().toString();
        let month = date.createdAt.getMonth() + 1;

        //Inserir o Digito 0#
        let stringDay = day.toString();
        if (stringDay.length < 2) {
            stringDay = `0${day.toString()}`;
        }
        let stringMonth = month.toString();
        if (stringMonth.length < 2) {
            stringMonth = `0${month.toString()}`
        }
        orders[index].convertDate = `${stringDay}/${stringMonth}/${date.createdAt.getFullYear()}`;
    })

    //res.send(orders);
    //    console.log(orders[0].createdAt, '======================================');
    res.render('order/index', { orders, name });
});

router.get('/admin/order/view/:id', adminAuth, async (req, res) => {
    let { id } = req.params;
    let { name } = req.session.user;
    try {
        let order = await Order.findByPk(id, { include: [{ model: OrderItem, include: [{ model: Product }] }, { model: User }] });

        let day = order.createdAt.getDate().toString();
        let month = order.createdAt.getMonth() + 1;

        // Inserir o Digito 0#
        let stringDay = day.toString();
        if (stringDay.length < 2) {
            stringDay = `0${day.toString()}`;
        }
        let stringMonth = month.toString();
        if (stringMonth.length < 2) {
            stringMonth = `0${month.toString()}`
        }
        order.createdAtAlternated = `${stringDay}/${stringMonth}/${order.createdAt.getFullYear()}`;


        res.render('order/vieworder', { order, states, name });
    } catch (err) {
        res.render('errors/databaseError');
    }

});

router.get('/admin/order/edit-status/:id/:status', adminAuth, async (req, res) => {
    let { id, status } = req.params;
    try {
        await Order.update({ status }, { where: { id } });
        res.redirect(`/admin/order/view/${id}`);
    } catch (err) {
        res.redirect('errors/databaseError');
    }
});


// USER ORDER routes

router.get('/order/create', userAuth, async (req, res) => {
    let { id, cart } = req.session.user;
    let amount = 0;
    let enter = false; // variavel para verificar se entrou no redirecionamento do mycart

    try {

        cart.forEach(async (item, index) => {

            let product = await Product.findByPk(item.id);
            cart[index]['saleValue'] = Number(product.saleValue);
            cart[index]['stockQuantityDefault'] = Number(product.stockQuantity);

            // Verificando se ha produto no estoque para finalizar compra
            if (product.stockQuantity < cart[index].quantity || product.stockQuantity == 0 || product.status == 0) {
                res.redirect('/mycart');
                enter = true;
            }

            amount += cart[index].saleValue * cart[index].quantity;
            // Criacao de Ordem e Item da Ordem
            if (index == cart.length - 1 && !enter) {
                let orderCreated = await Order.create({ amount: amount.toString(), status: 1, UserId: id });
                cart.forEach(async (item, index) => {
                    await OrderItem.create({
                        quantity: item.quantity, value: item.saleValue,
                        ProductId: item.id, OrderId: orderCreated.id
                    });
                    // Diminuindo a Qtd do Estoque
                    await Product.update({ stockQuantity: item.stockQuantityDefault - item.quantity },
                        { where: { id: item.id } });
                });
                res.redirect('/remove-all-cart');
            }

        });


        //let ordemCriadaParaVisualizar = await Order.findAll({ include: [{ model: OrderItem }] });
        //let createdOrder = await Order.create({});
        ///if(enterRouter){
        //    console.log('errors ======================================================================');
        //   res.send('errors');
        // }else{
        //   console.log('remove ======================================================================');
        //res.redirect('/remove-all-cart');
        //res.send(rota);
        // }

        //res.send({ordemCriadaParaVisualizar});
    } catch (err) {
        res.render('errors/databaseError');
    }
});


router.get('/user/myorders/view/:id', userAuth, async (req, res) => {
    let { id } = req.params;
    let user = req.session.user;
    let navbar = '../partials/navbarUserLogged.ejs';
    try {
        let order = await Order.findByPk(id, { include: [{ model: OrderItem, include: [{ model: Product }] }] },
            { where: { UserId: req.session.user.id } });
        if (order.UserId == req.session.user.id) {
            //res.send({ order });
            order.Order_Items.forEach((item, index) => {
                order.Order_Items[index].Product['slug'] = slugify(item.Product.namePlusSmallDescription);
            });
            res.render('user/vieworderproduct', { order, navbar, user });
        } else {
            res.redirect(`/user/profile/${req.session.user.id}`);
        }
        //{ include: [{ model: OrderItem, include: [{ model: Product }] }] }

        //
    } catch (err) {
        res.render('errors/databaseError');
    }

});

module.exports = router;