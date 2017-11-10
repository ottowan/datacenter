/**
 * PlaintiffController
 *
 * @description :: Server-side logic for managing plaintiffs
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    case: function (req, res) {
        //console.dir(req.param('case'))
        var findcase = { case: req.param('case') }
        Prosecutor.find(findcase).exec(function (err, data) {
            //console.dir(users);
            return res.send(data)
        })
    },

}


