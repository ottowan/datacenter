/**
 * CaseTypeController
 *
 * @description :: Server-side logic for managing types
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {

    findByID: function (req, res) {

        let query = "SELECT case.id, case.black_abb, case.black_no, case.black_year, prosecutor.name as prosecutor_name, accused.name  as accused_name "
        query += "FROM `case`, `prosecutor`, `accused` "
        query += "WHERE case.id = "+req.param('case')+" "
        query += "AND case.id = prosecutor.case  "
        query += "AND case.id = accused.case "

        console.log(query)
        Case.query(query,function(err, data) {
            if(err) res.status(400).json({ error: err.message })
            res.json(data);
          });
    },
};

