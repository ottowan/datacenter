
var path = require('path');
var request = require('request');
const express = require('express')
var async = require('async');

//Date convert
var moment = require('moment');

const app = express()
const url = "http://10.1.23.235:1337"
app.set('view engine', 'ejs');

app.use('/img', express.static(path.join(__dirname, 'public/images')));
app.use('/js', express.static(path.join(__dirname, 'public/js')));
app.use('/css', express.static(path.join(__dirname, 'public/css')));
app.use('/datepicker', express.static(path.join(__dirname, 'public/datepicker')));




//passing data
// index page 
app.get('/demo', function (req, res) {
    var drinks = [
        { name: 'Bloody Mary', drunkness: 3 },
        { name: 'Martini', drunkness: 5 },
        { name: 'Scotch', drunkness: 10 }
    ];
    var tagline = "Any code of your own that you haven't looked at for six or more months might as well have been written by someone else.";

    res.render('pages/demo', {
        drinks: drinks,
        tagline: tagline
    });
});

app.get('/', function (req, res) {

    request.get(url + "/case?sort=id", (error, response, body) => {
        let cases = JSON.parse(body);
        console.log(cases[0])
        res.render('pages/index', {
            cases: cases,
            moment: moment
        });
    });
})

app.get('/add', function (req, res) {

    //Get list type
    async.parallel({
        //ประเภท : ยกฟ้อง
        dismissalType: function (parallelCb) {
            request(url + "/dismissaltype", function (error, response, body) {
                parallelCb(null, { error: error, response: response, body: body });
            });
        },
        //ประเภท : ประกัน
        bailType: function (parallelCb) {
            request(url + "/bailtype", function (error, response, body) {
                parallelCb(null, { error: error, response: response, body: body });
            });
        },
        //ประเภท : การตัดสินศาลสูง
        highJudgementType: function (parallelCb) {
            request(url + "/highjudgementtype", function (error, response, body) {
                parallelCb(null, { error: error, response: response, body: body });
            });
        },
        //ประเภท : เลื่อนคดี
        changeAppointType: function (parallelCb) {
            request(url + "/changeappointtype", function (error, response, body) {
                parallelCb(null, { error: error, response: response, body: body });
            });
        },
        //ประเภท : ชั้นศาล
        courtType: function (parallelCb) {
            request(url + "/courttype", function (error, response, body) {
                parallelCb(null, { error: error, response: response, body: body });
            });
        },
        //ประเภท : สถานะคดี
        caseStatusType: function (parallelCb) {
            request(url + "/casestatustype", function (error, response, body) {
                parallelCb(null, { error: error, response: response, body: body });
            });
        },
        //ประเภท : คดีเสร็จ
        judgementType: function (parallelCb) {
            request(url + "/judgementtype", function (error, response, body) {
                parallelCb(null, { error: error, response: response, body: body });
            });
        }
    }, function (err, results) {
        //Convert list type
        let dismissalType = JSON.parse(results.dismissalType.body);
        let bailType = JSON.parse(results.bailType.body);
        let highJudgementType = JSON.parse(results.highJudgementType.body);
        let changeAppointType = JSON.parse(results.changeAppointType.body);
        let courtType = JSON.parse(results.courtType.body);
        let caseStatusType = JSON.parse(results.caseStatusType.body);
        let judgementType = JSON.parse(results.judgementType.body);

        //Render type to page : index
        res.render('pages/index', {
            dismissalType: dismissalType,
            bailType: bailType,
            highJudgementType: highJudgementType,
            changeAppointType: changeAppointType,
            courtType: courtType,
            caseStatusType: caseStatusType,
            judgementType: judgementType
        });
    });
})

app.post('/', function (req, res) {
    request.post()
})

app.get('/index6', function (req, res) {
    //res.sendFile(path.join(__dirname + '/public/index.html'));

    request.get(url + "/dismissaltype", (error, response, body) => {
        let json = JSON.parse(body);
        console.log(json)

        res.render('pages/index6', {
            dismissalType: json
        });
    });
})

app.get('/index7', function (req, res) {
    //res.sendFile(path.join(__dirname + '/public/index.html'));

    request.get(url + "/bailtype", (error, response, body) => {
        let json = JSON.parse(body);
        console.log(json)

        res.render('pages/index7', {
            bailType: json
        });
    });
})


app.get('/login', function (req, res) {
    //res.sendFile(path.join(__dirname + '/public/index.html'));
    res.render('pages/login')
})

app.get('/about', function (req, res) {
    res.render('pages/about')
})
app.listen(80, function () {
    console.log('Server listening on port 80!')
}) 