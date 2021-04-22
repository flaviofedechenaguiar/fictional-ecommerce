const express = require('express');
const router = express.Router();
const adminAuth = require('../../middlewares/adminAuthenticate');
const Provider = require('../../models/provider');
const { Op } = require("sequelize");
const validaCpfCnpj = require('../../plugins/cpf-cnpj');

// analizar a forma de envio de informacao para o usuario que criara o provider

let states = require('../../models/states.model');
const Product = require('../../models/product');

let dataReturn = {
    fantasyName: '', socialReason: '',
    cnpj_cpf: '', exampleRadios: '',
    phoneNumber: '', email: '',
    zipCode: '', city: '',
    state: '', address: '',
    addressNumber: '', neighborhood: '',
    complement: '',
    id: 0
}

router.get('/provider', adminAuth, async (req, res) => {
    let { error } = req.query;
    let { message } = req.query;
    let { name } = req.session.user;
    try {
        let data = await Provider.findAll({ raw: true });
        res.render('provider/index', { data, message, error, name });
    } catch (err) {
        res.render('errors/databaseError')
    };
});

router.get('/provider/create', adminAuth, async (req, res) => {
    let { error } = req.query;
    dataReturn = req.query;
    let { name } = req.session.user;

    res.render('provider/create', { dataReturn, states, error, name });
});

router.post('/provider/create', async (req, res) => {
    let { fantasyName, socialReason, cnpj_cpf, exampleRadios, phoneNumber, email,
        zipCode, city, state, address, addressNumber, neighborhood, complement } = req.body;
    if (!validaCpfCnpj(cnpj_cpf)) {
        let error = 'CNPJ/CPF Inválido;';
        dataReturn = `?error=${error}&fantasyName=${fantasyName}&socialReason=${socialReason}&cnpj_cpf=${cnpj_cpf}&exampleRadios=${exampleRadios}
            &phoneNumber=${phoneNumber}&email=${email}&zipCode=${zipCode}&city=${city}&state=${state}&address=${address}
            &addressNumber=${addressNumber}&neighborhood=${neighborhood}&complement=${complement}`;
        res.redirect('/admin/provider/create' + dataReturn);
    } else {
        try {
            let databaseData = await Provider.findOne({
                where: { [Op.or]: [{ cnpj_cpf }, { email }, { socialReason }] } // editei o social reason
            });
            if (databaseData == undefined) {
                await Provider.create({
                    fantasyName, socialReason, cnpj_cpf, phoneNumber, email, zipCode,
                    city, state, address, addressNumber, neighborhood, complement
                });
                let message = '?message=Fornededor cadastrado com Sucesso!';
                res.redirect('/admin/provider' + message);
            } else {
                let error = 'CNPJ/CPF/, RAZÃO SOCIAL, Email já esta presente no Sistema!'; // EDITEI O TEXTO
                dataReturn = `?error=${error}&fantasyName=${fantasyName}&socialReason=${socialReason}&cnpj_cpf=${cnpj_cpf}&exampleRadios=${exampleRadios}
            &phoneNumber=${phoneNumber}&email=${email}&zipCode=${zipCode}&city=${city}&state=${state}&address=${address}
            &addressNumber=${addressNumber}&neighborhood=${neighborhood}&complement=${complement}`;
                res.redirect('/admin/provider/create' + dataReturn);
            }
        } catch (err) {
            res.render('errors/databaseError');
        }
    }
});

router.get('/provider/edit/:id', adminAuth, async (req, res) => {
    let { id } = req.params;
    dataReturn = req.query;
    dataReturn.id = id;
    let { name } = req.session.user;
    try {
        let data = await Provider.findOne({ where: { id } });
        if (data != undefined) {
            let { error } = req.query;
            if (dataReturn.cnpj_cpf !== undefined) {
                res.render('provider/edit', { dataReturn, states, error, name });
            } else {
                res.render('provider/edit', { dataReturn: data, states, error, name });
            }
        } else {
            let error = '?error=Fornecedor não encontrado!'
            res.redirect('/admin/provider' + error);
        }
    } catch (err) {
        res.render('errors/databaseError');
    }
});

router.post('/provider/edit', async (req, res) => {
    dataReturn = req.body;
    let { id } = req.body;
    if (!validaCpfCnpj(dataReturn.cnpj_cpf)) {
        let error = 'CNPJ/CPF Inválido;';
        dataReturn = `?error=${error}&fantasyName=${dataReturn.fantasyName}&socialReason=${dataReturn.socialReason}&cnpj_cpf=${dataReturn.cnpj_cpf}&exampleRadios=${dataReturn.exampleRadios}
            &phoneNumber=${dataReturn.phoneNumber}&email=${dataReturn.email}&zipCode=${dataReturn.zipCode}&city=${dataReturn.city}&state=${dataReturn.state}&address=${dataReturn.address}
            &addressNumber=${dataReturn.addressNumber}&neighborhood=${dataReturn.neighborhood}&complement=${dataReturn.complement}`;
        res.redirect(`/admin/provider/edit/${id}${dataReturn}`);
    } else {

        try {
            let data = await Provider.findOne({
                where: {
                    [Op.or]: [
                        { cnpj_cpf: dataReturn.cnpj_cpf },
                        { email: dataReturn.email },
                        { socialReason: dataReturn.socialReason }
                    ],
                    id: { [Op.ne]: id, }
                }
            });
            if (data == undefined) {
                await Provider.update({
                    fantasyName: dataReturn.fantasyName, socialReason: dataReturn.socialReason,
                    cnpj_cpf: dataReturn.cnpj_cpf, phoneNumber: dataReturn.phoneNumber,
                    email: dataReturn.email, zipCode: dataReturn.zipCode,
                    city: dataReturn.city, state: dataReturn.state,
                    address: dataReturn.address, addressNumber: dataReturn.addressNumber,
                    neighborhood: dataReturn.neighborhood, complement: dataReturn.complement,
                }, { where: { id: dataReturn.id } });
                let message = '?message=Usuario alterado com Sucesso!'
                res.redirect('/admin/provider' + message);
            } else {
                let error = 'CNPJ/CPF/, RAZÃO SOCIAL, Email já esta presente no Sistema!';
                dataReturn = `?error=${error}&fantasyName=${dataReturn.fantasyName}&socialReason=${dataReturn.socialReason}&cnpj_cpf=${dataReturn.cnpj_cpf}&exampleRadios=${dataReturn.exampleRadios}
            &phoneNumber=${dataReturn.phoneNumber}&email=${dataReturn.email}&zipCode=${dataReturn.zipCode}&city=${dataReturn.city}&state=${dataReturn.state}&address=${dataReturn.address}
            &addressNumber=${dataReturn.addressNumber}&neighborhood=${dataReturn.neighborhood}&complement=${dataReturn.complement}`;
                res.redirect(`/admin/provider/edit/${id}${dataReturn}`);
            }
        } catch (err) {
            res.render('errors/databaseError');
        }
    }
});

router.get('/provider/more/:id', adminAuth, async (req, res) => {
    let { id } = req.params;
    let { name } = req.session.user;
    try {
        let data = await Provider.findOne({ where: { id } });
        if (data != undefined) {
            res.render('provider/more', { dataReturn: data, states, name });
        } else {
            let error = '?error=Fornecedor não encontrado!'
            res.redirect('/admin/provider' + error);
        }
    } catch (err) {
        res.render('errors/databaseError');
    }
});

router.post('/provider/delete', async (req, res) => {
    let { id } = req.body;
    try {

        let count = await Product.count({ where: { ProviderId: id } });
        if (count == 0) {
            await Provider.destroy({ where: { id } });
            res.redirect('/admin/provider?message=Fornecedor deletado com sucesso!');
        } else {
            let error = `?error=Não foi possível deletar o fornecedor, 
            pois o mesmo esta presente em um produto. Caso deseje desativa-lo, clique no botão desativar e logo apos confime`;
            res.redirect(`/admin/provider${error}`);
        }
        // await Provider.destroy({ where: { id } });
        // let message = '?message=Forcencedor excluido com Sucesso!';
        // res.redirect('/admin/provider' + message);
    } catch (err) {
        res.render('errors/databaseError');
    }
});

router.post('/provider/status', async (req, res) => {
    let { id } = req.body;
    try {
        let dataProvider = await Provider.findByPk(id);
        if (dataProvider) {
            await Provider.update({ status: !(dataProvider.status) }, { where: { id } });
            res.redirect('/admin/provider?message=Status alterado com sucesso!');
        } else {
            res.redirect('/admin/provider?error=Fornecedor não encontrada no sistema!');
        }
    } catch (err) {
        res.redirect('error/databaseError');
    }

});




module.exports = router;