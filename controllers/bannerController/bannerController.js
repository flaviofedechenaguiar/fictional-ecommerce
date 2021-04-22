const express = require('express');
const adminAuth = require('../../middlewares/adminAuthenticate');
const router = express.Router();
const Banner = require('../../models/banner.js');

router.get('/admin/banner/update', adminAuth, async (req, res) => {
    let { name } = req.session.user;
    let banner = await Banner.findAll();
    if (banner.length == 0) {
        await Banner.create({ linkOne: '', linkTwo: '', linkThree: '' });
        banner = await Banner.findAll();
    }
    res.render('banner/banner', { banner: banner[0], name });
});

router.post('/admin/banner/update', async (req, res) => {
    let { linkOne, linkTwo, linkThree, id } = req.body;
    await Banner.update({ linkOne, linkTwo, linkThree }, { where: { id } });
    res.redirect('/admin/banner/update');
});


module.exports = router;