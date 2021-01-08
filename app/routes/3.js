module.exports = function (app) {

  // Code supplied by Gary for dealing with query strings

  app.use(function(req, res, next){
    Object.assign(res.locals,{
      postData: (req.body ? req.body : false)
    });

    Object.assign(res.locals,{
      getData: (req.query ? req.query : false)
    });

    next();
  });

  // CONDITION POST

  app.post('/3/condition', function (req, res) {

    const { name, day, month, year, index } = req.body;

    if (!req.session.conditions) {
      req.session.conditions = []
    }

    if (index) {
      req.session.conditions[index] = {
        name,
        day,
        month,
        year
      } 
    } else {
      req.session.conditions.push({
        name,
        day,
        month,
        year
      })
    }

    req.session.save(() => {
      res.redirect('/3/other-conditions');
    })

  })

  // CONDITION GET

  app.get('/3/condition', function (req, res) {

    const { index } = req.query;

    res.render('3/condition', {'condition': index && req.session.conditions && req.session.conditions[index], conditionIndex: index})

  })

  // OTHER CONDITONS GET

  app.get('/3/other-conditions', function (req, res) {

    res.render('3/other-conditions', {'conditions': req.session.conditions})
    
  })

  // OTHER CONDITIONS POST

  app.post('/3/other-conditions', function (req, res) {

    let question = req.session.data['question']

    if (question === 'yes') {
      req.session.save(() => {
        res.redirect(`condition`)
      })
      
    } else if (question === 'no') {
      delete req.session.conditions;
      req.session.save(() => {
        res.redirect(`done`)
      })
      
    } else {
      res.redirect('error')
    }

  })

  app.post('/3/delete-condition', function (req, res) {

    const { index } = req.body;

    req.session.conditions.splice(index,1);
    req.session.save(() => {
      res.redirect('/3/other-conditions');
    })

  })

}