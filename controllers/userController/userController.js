const express = require('express');
const router = express.Router();
const adminAuth = require('../../middlewares/adminAuthenticate');
const states = require('../../models/states.model');
const User = require('../../models/user');
const { Op } = require("sequelize");
const bcrypt = require('bcrypt');
const bcryptSalt = 10;
const userAuth = require('../../middlewares/userAuthenticate');
const Order = require('../../models/order');
const validaCpfCnpj = require('../../plugins/cpf-cnpj');


router.get('/user/login', async (req, res) => {
    let { message, error } = req.query;
    res.render('user/login', { states, message, error });
});

router.post('/user/authenticate', async (req, res) => {
    let { email, password } = req.body;
    try {
        let data = await User.findOne({
            where: {
                [Op.and]: [{ email: email }] // Alterado
            }
        });
        if (data != undefined) {
            let result = await bcrypt.compare(password, data.password);
            if (result) {

                if (data.status == 0) {
                    let error = `?error=Não foi possivel prosseguir com o login pois a conta esta desativada.
                        Para efetuar o login entre em contato com o email no rodapé e peça a ativação da conta.`;
                    res.redirect(`/user/login${error}`);
                } else {
                    let oldCart = [];
                    if (req.session.user && req.session.user.type == 'guest') {
                        oldCart = req.session.user.cart;
                    }
                    req.session.user = {
                        type: 'user',
                        id: data.id,
                        name: data.completeName,
                        email: data.email,
                        cart: oldCart
                    }

                    res.redirect('/');
                }

            } else {
                res.redirect('/user/login?error=Usuário ou Senha Incorreta');
            }

        } else {
            res.redirect('/user/login?error=Usuário ou Senha Incorreta');
        }
    } catch (err) {
        res.render('errors/databaseError');
    }

});

router.get('/user/logout', (req, res) => {
    req.session.user = undefined;
    if (req.query.message) {
        res.redirect(`/user/login?message=${req.query.message}`);
    } else {
        res.redirect('/user/login');
    }
});

router.get('/user/create', async (req, res) => {
    res.render('user/home');
});


router.post('/user/create', async (req, res) => {

    let { completeName, birth, cpf, phoneNumber, email, password, zipCode,
        address, addressNumber, neighborhood, city, state, complement } = req.body;

    if (!validaCpfCnpj(cpf)) {
        let error = '?error=CPF inválido';
        res.redirect(`/user/login${error}`);
    } else {
        try {
            let data = await User.findOne({ where: { [Op.or]: [{ cpf }, { email }] } });
            if (data == undefined) {
                bcrypt.hash(password, bcryptSalt, async (err, passwordHash) => {
                    if (!err) {
                        await User.create({
                            completeName, birth: birth + ' 01:00:00', cpf, phoneNumber, email, password: passwordHash, zipCode,
                            address, addressNumber, neighborhood, city, state, complement
                        });
                        let message = '?message=Cadastro efetuado com Sucesso!'
                        res.redirect(`/user/login${message}`);
                    } else {
                        res.render('errors/databaseError');
                    }
                });

            } else {
                let error = '?error=CPF/EMAIL já presente no Sistema!';
                res.redirect(`/user/login${error}`);
            }
        } catch (err) {
            res.render('errors/databaseError');
        };
    }
});


// deve ser excluido
// DEVE SER CRIADO DE ALGUMA FORMA PARA SEGURANCA *******
// Verificar se esta logado para fazer o post
router.post('/user/edit', userAuth, async (req, res) => {
    let { completeName, birth, cpf, phoneNumber, email, password, zipCode,
        address, addressNumber, neighborhood, city, state, complement, id } = req.body;
    try {
        let data = await User.findOne({
            where: {
                [Op.or]: [
                    { cpf },
                    { email }
                ],
                id: { [Op.ne]: id, }
            }
        });

        if (!data) {
            if (password) {
                bcrypt.hash(password, bcryptSalt, async (err, passwordHash) => {
                    if (!err) {
                        await User.update({
                            completeName, birth, cpf, phoneNumber, email, password: passwordHash, zipCode,
                            address, addressNumber, neighborhood, city, state, complement
                        }, { where: { id } });
                        let message = '?message=Atualização efetuada com Sucesso. Faça o Login novamente!'
                        res.redirect(`/user/logout${message}`);
                    } else {
                        res.render('errors/databaseError');
                    }
                });
            } else {
                await User.update({
                    completeName, birth, cpf, phoneNumber, email, zipCode,
                    address, addressNumber, neighborhood, city, state, complement
                }, { where: { id } });
                let message = '?message=Atualização efetuada com Sucesso. Faça o Login novamente!'
                res.redirect(`/user/logout${message}`);
            }
        } else {
            let error = '?error=CPF/EMAIL já presente no Sistema!'
            res.redirect(`/user/profile/${id}${error}`);
        }

    } catch (err) {
        res.render('errors/databaseError');
    }

    //res.send('deve ser criado a edicao de usuario');
    //let { id } = req.body;
    //let data = User.findOne({ where: { id } });

    //res.render('user/edit', { states });
});


// ======================
// router.post('/delete', async(req, res) => {
//     res.send('deletar o usuario do sistema quando clicar no botao');
// });
// ======================


// Edicao de dados do Usuario
router.post('/user/edit/user', async (req, res) => {

    let { completeName, birth, cpf, phoneNumber, email, password, id } = req.body;
    if (!validaCpfCnpj(cpf)) {
        let error = '?error=CPF inválido';
        res.redirect(`/user/profile/${id}${error}`);
    } else {
        try {
            let data = await User.findOne({
                where: {
                    [Op.or]: [
                        { cpf },
                        { email }
                    ],
                    id: { [Op.ne]: id, }
                }
            });

            if (!data) {
                if (password) {
                    bcrypt.hash(password, bcryptSalt, async (err, passwordHash) => {
                        if (!err) {
                            let dateArray = birth.split('/');
                            await User.update({
                                completeName, birth: `${dateArray[2]}-${dateArray[1]}-${dateArray[0]} 01:00:00`,
                                cpf, phoneNumber, email, password: passwordHash
                            }, { where: { id } });
                            let message = '?message=Atualização efetuada com Sucesso. Faça o Login novamente!'
                            res.redirect(`/user/logout${message}`);
                        } else {
                            res.render('errors/databaseError');
                        }
                    });
                } else {
                    let dateArray = birth.split('/');
                    await User.update({
                        completeName, birth: `${dateArray[2]}-${dateArray[1]}-${dateArray[0]} 01:00:00`,
                        cpf, phoneNumber, email
                    }, { where: { id } });
                    let message = '?message=Atualização efetuada com Sucesso. Faça o Login novamente!'
                    res.redirect(`/user/logout${message}`);
                }
            } else {
                let error = '?error=CPF/EMAIL já presente no Sistema!'
                res.redirect(`/user/profile/${id}${error}`);
            }

        } catch (err) {
            req.render('errors/databaseError');
        }
    }
});

// Edicao de dados de Endereco do Usuario
router.post('/user/edit/address', async (req, res) => {
    let { zipCode, address, addressNumber, neighborhood, city, state, complement, id } = req.body;
    try {

        await User.update({ zipCode, address, addressNumber, neighborhood, city, state, complement }, { where: { id } });
        let message = '?message=Atualização efetuada com Sucesso. Faça o Login novamente!'
        res.redirect(`/user/logout${message}`);

    } catch (err) {
        res.render('errors/databaseError');
    }

});


// FUTURAMENTE VERIFICAR SE ESTA FUNCIONANDO E SE O METODO E EFICIENTE*****
router.post('/user/delete', async (req, res) => {
    let { id } = req.body;
    if (req.session.user) {
        if (req.session.user.id == id) {
            try {
                await User.destroy({ where: { id } });
                let message = '?message=Usuário apagado com Sucesso!'
                res.redirect(`/user/login${message}`);
            } catch (err) {
                res.render('errors/databaseError');
            }
        }
    } else {
        let error = '?error=Permissão negada para efetuar ação!'
        req.redirect(`/user/login${error}`);
    }
});

router.get('/user/profile/:id', userAuth, async (req, res) => {
    let { error } = req.query;
    let { id } = req.params;



    if (req.session.user) {
        if (req.session.user.id == id) {

            let navbar = '../partials/navbarUserLogged.ejs';
            let user = req.session.user;

            try {
                // Manipular a Data do Usuario
                let data = await User.findOne({ where: { id } });

                // Todas das Ordres do Usuario
                let orders = await Order.findAll({ where: { UserId: id } });
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
                // ========== FIM ============

                // ===Para conversao de Data===
                let day = data.birth.getDate().toString();
                let month = data.birth.getMonth() + 1;

                // Inserir o Digito 0#
                let stringDay = day.toString();
                if (stringDay.length < 2) {
                    stringDay = `0${day.toString()}`;
                }
                let stringMonth = month.toString();
                if (stringMonth.length < 2) {
                    stringMonth = `0${month.toString()}`
                }
                data.birthAlternated = `${stringDay}/${stringMonth}/${data.birth.getFullYear()}`;
                data.birthInput = `${data.birth.getFullYear()}-${stringMonth}-${stringDay}`;
                console.log(data.birthInput, '====================================');
                // res.render('user/edit', { states, dataResult: data, error });
                res.render('user/profile', { states, dataResult: data, error, orders, states, user, navbar });
            } catch (err) {
                res.render('errors/databaseError');
            }
        } else {
            res.redirect('/user/login');
        }
    } else {
        res.redirect('/user/login');
    }
});


// Desativar conta
router.post('/user/disable', async (req, res) => {
    let { id } = req.body;
    if (req.session.user) {
        if (req.session.user.id == id) {
            if (req.session.user.cart.length > 0) {
                let error = `?message=Não foi possível desativar esta conta, pois há produtos presetes no carrinho. 
                Para desativa-la é nessessário que finalize a sua compra ou remova-as do carrinho primeiro.`
                res.redirect(`/mycart${error}`);
            } else {
                try {
                    await User.update({ status: 0 }, { where: { id } });
                    let message = '?message=Usuário desativado com sucesso!';
                    res.redirect(`/user/logout${message}`);
                    //res.redirect(`/user/login${message}`);
                } catch (err) {
                    res.render('errors/databaseError');
                }
            }
        }
    } else {
        let error = '?error=Permissão negada para efetuar ação!'
        req.redirect(`/user/login${error}`);
    }
});

module.exports = router;