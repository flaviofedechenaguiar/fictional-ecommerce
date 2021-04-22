const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const bcryptSalt = 10;
const Admin = require('../../models/admin');

const adminAuth = require('../../middlewares/adminAuthenticate');
const User = require('../../models/user');
const states = require('../../models/states.model');
const { Op } = require('sequelize');
const validaCpfCnpj = require('../../plugins/cpf-cnpj');

router.get('/admin/login', (req, res) => {
    let message = req.query.message;
    res.render('admin/login', { message });
});

router.post('/admin/authenticate', async (req, res) => {
    let { email, password } = req.body;
    try {
        let data = await Admin.findOne({
            where:
                { [Op.and]: [{ email }, { status: 1 }] }
        });
        if (data != undefined) {
            let result = await bcrypt.compare(password, data.password);
            if (result) {
                req.session.user = {
                    type: 'admin',
                    id: data.id,
                    name: data.name,
                    email: data.email
                }
                res.redirect('/admin/panel');
            } else {
                res.redirect('/admin/login?message=Usuário ou Senha Incorreta');
            }
        } else {
            res.redirect('/admin/login?message=Usuário ou Senha Incorreta');
        }
    } catch (err) {
        res.render('erros/databaseError');
    }


});

router.post('/admin/logout', adminAuth, (req, res) => {
    req.session.user = undefined;
    res.redirect('/admin/login');
});


// CONFIGURAR O PAINEL DE ADMIN COM AS ROTAS PRESENTES
router.get('/admin/panel', adminAuth, (req, res) => {
    let { message } = req.query;
    //let name  = req.session.user.name;

    // Rendenizacao de nome no navbar 
    let name = req.session.user.name;
    res.render('admin/panel', { name, message });

    //res.render('admin/panel');

    // let name = 'adm-in';
    // res.render('admin/exemple.painel.ejs', { name });


});

router.get('/admin/info', adminAuth, async (req, res) => {
    let { message, error } = req.query;
    let { name } = req.session.user;
    try {
        let data = await Admin.findAll({ raw: true });
        console.log(data);
        res.render('admin/index', { data, name, message, error });
    } catch (err) {
        res.render('errors/databaseError.ejs');
    }
});

router.get('/admin/create', adminAuth, (req, res) => {
    let { name } = req.session.user;
    let data = { name: req.query.name, email: req.query.email }
    let { error } = req.query;
    res.render('admin/create', { error, data, name });
});

router.post('/admin/create', async (req, res) => {
    let { name, email, password } = req.body;

    try {

        let databaseData = await Admin.findOne({ where: { email } });
        if (databaseData === null) {
            bcrypt.hash(password, bcryptSalt, async (err, passwordHash) => {
                if (!err) {
                    await Admin.create({ name, email, password: passwordHash });
                    querySend = '?message=Cadastro efetuado com Sucesso!';
                    res.redirect('/admin/info' + querySend);
                } else {
                    res.render('erros/databaseError');
                }
            });
        } else {
            querySend = `?error=Não é possível fazer Cadastro, Email ja presente no Sistema&name=${name}&email=${email}`;
            res.redirect('/admin/create' + querySend);
        }
    } catch (err) {
        res.render('erros/databaseError');
    }
});

router.get('/admin/edit/:id', adminAuth, async (req, res) => {
    let { name } = req.session.user;
    let { id } = req.params;
    let dataQuery = { name: req.query.name, email: req.query.email }
    let { error } = req.query;
    try {
        let data = await Admin.findByPk(id);
        if (data != undefined) {
            //res.render('admin/edit', { data });
            if (dataQuery.name != undefined && dataQuery.email != undefined) {
                dataQuery.id = id;
                res.render('admin/edit', { data: dataQuery, error, name });
            } else {
                res.render('admin/edit', { data, error, name });
            }
        } else {
            let querySend = '?error=Administrador não encontrado no Sistema!'
            res.redirect(`/admin/info${querySend}`);
        }
    } catch (err) {
        res.render('errors/databaseError.ejs');
    }
});

router.post('/admin/edit', async (req, res) => {
    let { id, name, email, password } = req.body;
    try {
        let databaseData = await Admin.findOne({ where: { email } });
        if (databaseData == null || (databaseData.email == email && databaseData.id == id)) {
            if (password == '' || password == undefined) {
                await Admin.update({ name, email }, { where: { id } });
            } else {
                bcrypt.hash(password, bcryptSalt, async (err, passwordHash) => {
                    if (!err) {
                        await Admin.update({ name, email, password: passwordHash }, { where: { id } });
                    } else {
                        res.render('erros/databaseError');
                    }
                });
            }
            querySend = '?message=Edição efetuada com Sucesso!';
            res.redirect('/admin/info' + querySend);
        } else {
            querySend = `?error=Não é possível fazer Edição, Email ja presente no Sistema&name=${name}&email=${email}`;
            res.redirect(`/admin/edit/${id}${querySend}`);
        }


    } catch (err) {
        res.render('errors/databaseError.ejs');
    }

});

router.post('/admin/delete', async (req, res) => {
    let { id } = req.body;
    try {
        await Admin.destroy({ where: { id } });
        res.redirect('/admin/info');
    } catch (err) {
        res.render('errors/databaseError.ejs');
    }
});

router.post('/admin/status', async (req, res) => {
    let { id } = req.body;
    try {
        let dataAdmin = await Admin.findByPk(id);
        if (dataAdmin) {
            await Admin.update({ status: !(dataAdmin.status) }, { where: { id } });
            res.redirect('/admin/info?message=Status alterado com sucesso!');
        } else {
            res.redirect('/admin/info?error=Administrador não encontrada no sistema!');
        }
    } catch (err) {
        res.render('errors/databaseError');
    }
});


// ========================================================
// Edicao do Usuario pelo Admistrador
// ========================================================

router.get('/admin/user', adminAuth, async (req, res) => {
    let { message, error, search } = req.query;
    let { name } = req.session.user;
    let localSearch = {};
    if(search){
        localSearch = { email : { [Op.eq] : search } };
    }
    //data = [{ name: 'flavio fedechen aguiar', email: 'testeteste@teste.google.com', id: 1 }];
    try {
        let data = await User.findAll({ where : localSearch });
        res.render('admin/user/index', { data, message, error, name });
    } catch (err) {
        res.render('errors/databaseError');
    }

});

router.get('/admin/user/edit/:id', adminAuth, async (req, res) => {
    let { id } = req.params;
    let { error } = req.query;
    let { name } = req.session.user;
    try {
        let data = await User.findOne({ where: { id } });
        if (data) {
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
            data.birthInput = `${data.birth.getFullYear()}-${stringMonth}-${stringDay}`

            res.render('admin/user/edit', { states, dataResult: data, error, name });
        } else {
            let error = '?error=Usuário não presente no Sistema!';
            res.redirect(`/admin/user/index${error}`);
        }
    } catch (err) {
        res.render('errors/databaseError');
    }
});

// DEVE SER CRIADO DE ALGUMA FORMA PARA SEGURANCA *******
// Verificar se esta logado para fazer o post
router.post('/admin/user/edit', async (req, res) => {

    let { completeName, birth, cpf, phoneNumber, email, password, zipCode,
        address, addressNumber, neighborhood, city, state, complement, id } = req.body;

    if (!validaCpfCnpj(cpf)) {
        let error = '?error=CPF inválido!';
        res.redirect(`/admin/user/edit/${id}${error}`);
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
                            let dateArray = birth.split('-');
                            console.log(dateArray);
                            await User.update({
                                completeName, birth: `${dateArray[0]}-${dateArray[1]}-${dateArray[2]} 01:00:00`, cpf, phoneNumber, email, password: passwordHash, zipCode,
                                address, addressNumber, neighborhood, city, state, complement
                            }, { where: { id } });
                            let message = '?message=Atualização efetuada com Sucesso!'
                            res.redirect(`/admin/user${message}`);
                        } else {
                            res.render('errors/databaseError');
                        }
                    });
                } else {
                    let dateArray = birth.split('-');
                    console.log(dateArray);
                    await User.update({
                        completeName, birth: `${dateArray[0]}-${dateArray[1]}-${dateArray[2]} 01:00:00`, cpf, phoneNumber, email, zipCode,
                        address, addressNumber, neighborhood, city, state, complement
                    }, { where: { id } });
                    let message = '?message=Atualização efetuada com Sucesso!'
                    res.redirect(`/admin/user${message}`);
                }
            } else {
                let error = '?error=CPF/EMAIL já presente no Sistema!'
                res.redirect(`/admin/user/edit/${id}${error}`);
            }

        } catch (err) {
            res.render('errors/databaseError');
        }
    }

    //res.send('deve ser criado a edicao de usuario');
    //let { id } = req.body;
    //let data = User.findOne({ where: { id } });
    //res.render('user/edit', { states });
});

router.post('/admin/user/status', async (req, res) => {
    let { id } = req.body;
    try {
        await User.update({ status: 1 }, { where: { id } });
        res.redirect('/admin/user?message=Usuario ativado com sucesso!');
    } catch (err) {
        res.render('errors/databaseError');
    }
});


module.exports = router;