let adminAuthenticate = function adminAuthenticate(req, res, next) {

    if (req.session.user != undefined) {
        if (req.session.user.type == 'admin') {
            next();
        } else {
            res.redirect('/admin/login');
        }
    } else {
        res.redirect('/admin/login');
    }
  
    //  req.session.user = { name: 'AdminTest', type: 'admin' };
    //  next();
}


module.exports = adminAuthenticate;