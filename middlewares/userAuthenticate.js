let userAuthenticate = function userAuthenticate(req, res, next) {

    if (req.session.user != undefined) {
        if (req.session.user.type == 'user') {
            next();
        } else {
            res.redirect('/user/login');
        }
    } else {
        res.redirect('/user/login');
    }
    //  next();
}

module.exports = userAuthenticate;