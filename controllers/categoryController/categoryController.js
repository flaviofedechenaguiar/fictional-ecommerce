const express = require('express');
const router = express.Router();
const adminAuth = require('../../middlewares/adminAuthenticate');
const Category = require('../../models/category');
const Product = require('../../models/product');

router.get('/category', adminAuth, async (req, res) => {
    let { message, error } = req.query;
    let { name } = req.session.user;
    try {
        let data = await Category.findAll({ raw: true });
        console.log(data);
        res.render('category/index', { data, message, error, name });
    } catch (err) {
        res.render('errors/database');
    }
});

router.get('/category/create', adminAuth, async (req, res) => {
    let { name } = req.session.user;
    res.render('category/create', { name });
});

router.post('/category/create', adminAuth, async (req, res) => {
    let { name } = req.body
    try {
        await Category.create({ name });
        querySend = '?message=Cadastro efetuado com Sucesso!';
        res.redirect('/admin/category' + querySend);
    } catch (err) {
        res.render('errors/database');
    }
});

router.get('/category/edit/:id', adminAuth, async (req, res) => {
    let { id } = req.params;
    let { name } = req.session.user;
    try {
        let data = await Category.findByPk(id);
        if (data != undefined) {
            res.render('category/edit', { data, name });
        } else {
            res.render('errors/database');
        }
    } catch (err) {
        res.render('errors/database');
    }
});

router.post('/category/edit', adminAuth, async (req, res) => {
    let { id, name } = req.body;
    try {
        await Category.update({ name }, { where: { id } });
        querySend = '?message=Edição efetuada com Sucesso!';
        res.redirect('/admin/category' + querySend);
    } catch (err) {
        res.render('errors/database');
    }
});

router.post('/category/delete', adminAuth, async (req, res) => {
    let { id } = req.body;
    try {
        // await Category.destroy({ where: { id } });
        // res.redirect('/admin/category');

        let count = await Product.count({
            where: { CategoryId: id }
        });
        if (count == 0) {
            await Category.destroy({ where: { id } });
            res.redirect('/admin/category?message=Categoria deletada com sucesso!');
        } else {
            let error = `?error=Não foi possível deletar a categoria pois a mesma esta presente em um produto, caso deseje desativar clique no botão desativar e confirme em seguida.`;
            res.redirect(`/admin/category${error}`);
        }

    } catch (err) {
        res.render('errors/database');
    }
});

router.post('/category/status', adminAuth, async (req, res) => {
    let { id } = req.body;
    try {
        let categoryFind = await Category.findByPk(id);
        if (categoryFind) {
            await categoryFind.update({ status: !categoryFind.status }, { where: { id } });
            res.redirect('/admin/category?message=Status alterado com sucesso!');
        } else {
            res.redirect('/admin/category?error=Categoria não encontrada no sistema!');
        }
    } catch (err) {
        res.render('errors/databaseError');
    }
});

module.exports = router;