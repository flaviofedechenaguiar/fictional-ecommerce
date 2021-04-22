const express = require('express');
const app = express();
const { Op } = require('sequelize');
const session = require('express-session');
const bodyParser = require('body-parser');
const connection = require('./database/database');
const slugify = require('slugify');

const AdminController = require('./controllers/adminController/adminController');
const CategoryController = require('./controllers/categoryController/categoryController');
const ProviderController = require('./controllers/providerController/providerController');
const UserController = require('./controllers/userController/userController');
const ProductController = require('./controllers/productController/productController');
const CartController = require('./controllers/cartController/cartController');
const OrderController = require('./controllers/orderController/orderController');
const Product = require('./models/product');
const ProductImage = require('./models/productImages');
const Category = require('./models/category');
const BannerController = require('./controllers/bannerController/bannerController');
const Banner = require('./models/banner');


connection.authenticate()
    .then(() => console.log(console.log('connected to database')))
    .catch(err => console.log('Database err: ' + err))

app.use(session({
    secret: 'SNtVeLB$RKs#',
    cookie: { maxAge: 2592000000 }
}));

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static('public'));
app.set('view engine', 'ejs');

app.use('/', AdminController);
app.use('/admin', CategoryController);
app.use('/admin', ProviderController);
app.use('/', UserController);
app.use('/', ProductController);
app.use('/', CartController);
app.use('/', OrderController);
app.use('/', BannerController);

//view sessions

app.use((req, res, next) => {
    console.log(req.session.user, '=============');
    next();
});

app.get('/', async (req, res) => {
    // TESTE PARA UTILIZAR O CARRINHO

    if (!req.session.user) {
        req.session.user = {
            type: 'guest',
            id: new Date(),
            name: undefined,
            email: undefined,
            cart: []
        }
        res.redirect('/');
    }

    // // Fim Teste Carrinho

    // Rendenizar o carrinho
    let navbar = 'partials/navbarUser.ejs';
    let user = '';
    if (req.session.user && req.session.user.type == 'user') {
        navbar = 'partials/navbarUserLogged.ejs'
        user = req.session.user;
    }


    let { search } = req.query;
    if (search) {
        search = {
            [Op.and]: [
                {
                    namePlusSmallDescription: {
                        [Op.substring]: `${search}`
                    }
                }, {
                    status: {
                        [Op.eq]: 1
                    }
                }]
        }
    }

    let { category } = req.query;
    if (category && !search) {
        search = {
            [Op.and]: [{
                CategoryId: {
                    [Op.eq]: category
                }
            }, {
                status: {
                    [Op.eq]: 1
                }
            }]
        };
    }

    if (!search) {
        search = {
            [Op.and]: [
                {
                    namePlusSmallDescription: {
                        [Op.substring]: ''
                    }
                }, {
                    status: {
                        [Op.eq]: 1
                    }
                }]
        }
    }

    let { order } = req.query;

    if (!order) {
        order = [
            ['id', 'ASC']
        ];
    } else {
        if (order == 'desc') {
            order = [
                ['saleValue', 'DESC']
            ];
        } else {
            order = [
                ['saleValue', 'ASC']
            ];
        }
    }

    console.log(order);
    console.log(search);

    let banner = await Banner.findAll();

    let { page } = req.query;
    let limit = 8;
    let offset = 0;

    if (isNaN(page) || page == 1) {
        offset = 0;
        page = 1;
    } else {
        offset = (page - 1) * limit;
    }

    console.log(order);
    console.log(search);

    let products = await Product.findAndCountAll({
        order: order,
        where: search,
        limit,
        offset
    });

    //let products = await Product.findAll(order, { where:  search });
    // ORIGINAL  let products = await Product.findAll({
    //     order: order,
    //     where: search
    // });

    products.rows.forEach((product, index) => {
        products.rows[index]['slug'] = slugify(product.namePlusSmallDescription);
    });

    let categories = await Category.findAll({ where: { status: 1 } });

    let next = true;
    if (offset + limit >= products.count) {
        next = false
    };

    let result = {
        page: parseInt(page),
        next,
        products,
    }

    res.render('index', { result, navbar, user, categories, banner: banner[0] });

    // ERRO DA RESPONSE QUANDO RECARREGA PAGINA DO CARRINHO E POR CONTA DE FALTAR UM ELSE
    // NO IF DA SESSAO

});

app.get('/product/view/:slug?/:id?', async (req, res) => {
    let { id } = req.params;

    let navbar = '../partials/navbarUser.ejs';
    let user = '';
    if (req.session.user && req.session.user.type == 'user') {
        navbar = '../partials/navbarUserLogged.ejs'
        user = req.session.user;
    }

    try {
        let product = await Product.findByPk(id, { include: [{ model: ProductImage }] });
        console.log(product);
        // res.send(product);
        res.render('product/viewproduct', { product, user, navbar });
    } catch (err) {
        res.render('errors/databaseError');
    }

});

// app.get('/product/page/:num', async (req, res) => {

//     let page = req.params.num;
//     let offset = 0;

//     if (isNaN(page) || page == 1) {
//         offset = 0;
//     } else {
//         offset = (page - 1) * 4;
//     }

//     let products = await Product.findAndCountAll({
//         limit: 4,
//         offset: offset
//     });

//     products.rows.forEach((product, index) => {
//         products.rows[index]['slug'] = slugify(product.namePlusSmallDescription);
//     });

//     if (offset + 4 >= products.count) {
//         next = false;
//     } else {
//         next = true;
//     }

//     let result = {
//         page: parseInt(page),
//         next: next,
//         products: products
//     }

// // vizualizacao
//     let navbar = 'partials/navbarUser.ejs';
//     let user = '';
//     if (req.session.user && req.session.user.type == 'user') {
//         navbar = 'partials/navbarUserLogged.ejs'
//         user = req.session.user;
//     }

//     let banner = await Banner.findAll();

//     //let products = await Product.findAll(order, { where:  search })


//     let categories = await Category.findAll();

//     res.render('index.page.ejs', { result, navbar, user, categories, banner: banner[0] });


// });


app.get('/page', async (req, res) => {

    let { page } = req.query;
    let limit = 1;
    let offset = 0;

    if (isNaN(page) || page == 1) {
        offset = 0;
        page = 1;
    } else {
        offset = (page - 1) * limit;
    }





    // TESTE PARA UTILIZAR O CARRINHO

    if (!req.session.user) {
        req.session.user = {
            type: 'guest',
            id: new Date(),
            name: undefined,
            email: undefined,
            cart: [
                // No cart deve carregar o id e a quantidade desejada
                //{id: id do produto, quantity: quantidade do produtt}
            ]
        }
        // QUANDO TERMINAR O CARRINHO RETIRAR ESSA LINHA
        res.redirect('/');
    }

    // // Fim Teste Carrinho

    // Rendenizar o carrinho
    let navbar = 'partials/navbarUser.ejs';
    let user = '';
    if (req.session.user && req.session.user.type == 'user') {
        navbar = 'partials/navbarUserLogged.ejs'
        user = req.session.user;
    }

    let { search } = req.query;
    if (search) {
        search = {
            namePlusSmallDescription: {
                [Op.substring]: `${search}`
            }
        }
    }

    let { category } = req.query;
    if (category && !search) {
        search = {
            CategoryId: {
                [Op.eq]: category
            }
        };
    }

    if (!search) {
        search = {
            namePlusSmallDescription: {
                [Op.substring]: ''
            }
        }
    }

    let { order } = req.query;

    if (!order) {
        order = [
            ['id', 'ASC']
        ];
    } else {
        if (order == 'desc') {
            order = [
                ['saleValue', 'DESC']
            ];
        } else {
            order = [
                ['saleValue', 'ASC']
            ];
        }
    }

    console.log(order);
    console.log(search);

    let banner = await Banner.findAll();

    //let products = await Product.findAll(order, { where:  search });
    let products = await Product.findAndCountAll({
        order: order,
        where: search,
        limit,
        offset
    });
    products.rows.forEach((product, index) => {
        products.rows[index]['slug'] = slugify(product.namePlusSmallDescription);
    });

    let categories = await Category.findAll();


    let next = true;
    if (offset + limit >= products.count) {
        next = false
    };

    let result = {
        page: parseInt(page),
        next,
        products,
    }

    //res.send(result);
    res.render('index.page.ejs', { result, navbar, user, categories, banner: banner[0] });

    // ERRO DA RESPONSE QUANDO RECARREGA PAGINA DO CARRINHO E POR CONTA DE FALTAR UM ELSE
    // NO IF DA SESSAO

});

app.get('*', (req, res) => {
    res.render('errors/notfoundError');
})

app.listen(3030, () => {
    console.log('Server On ' + Math.random() * 1000);
});