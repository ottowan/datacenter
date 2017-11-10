/**
 * AccusedController
 *
 * @description :: Server-side logic for managing accuseds
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    case: function (req, res) {
        //console.dir(req.param('case'))
        var findcase = { case: req.param('case') }
        Accused.find(findcase).exec(function (err, data) {
            //console.dir(users);
            return res.send(data)
        })
    },
};

