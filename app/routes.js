const express = require('express')
const router = express.Router()

// Add your routes here - above the module.exports line

module.exports = router


router.post('/employer/v04/manage/vacancies', function (req, res) {
  const editChoice = req.session.data['manage-application']

  if (editChoice === 'application-cancel') {
    res.redirect('/employer/v04/manage/cancel-application-check')
  } else if (editChoice === 'application-pause') {
    res.redirect('/employer/v04/manage/pause-application-check')
  }
});


router.post('/employer/v04/manage/cancel-application-check', function (req, res) {
  const editChoice = req.session.data['cancel-application']

  if (editChoice === 'yes') {
    res.redirect('/employer/v04/manage/cancel-application-confirm')
  } else if (editChoice === 'no') {
    res.redirect('/employer/v04/manage/pause-application-no-go-back')
  }
});


router.post('/employer/v04/manage/pause-application-check', function (req, res) {
  const editChoice = req.session.data['pause-application']

  if (editChoice === 'yes') {
    res.redirect('/employer/v04/manage/pause-application-confirm')
  } else if (editChoice === 'no') {
    res.redirect('/employer/v04/manage/pause-application-no-go-back')
  }
});


router.post('/employer/v04/manage/job-detail', function (req, res) {
  const editChoice = req.session.data['manage-role']

  if (editChoice === 'edit-role') {
    res.redirect('/employer/v04/manage/edit-job-detail')
  } else if (editChoice === 'pause-role') {
    res.redirect('/employer/v04/manage/pause-role-check')
  } else if (editChoice === 'cancel-role') {
    res.redirect('/employer/v04/manage/cancel-role-check')
  } else if (editChoice === 'place-referral') {
    res.redirect('/employer/v04/manage/referrals')
  } else if (editChoice === 'closing-date') {
    res.redirect('/employer/v04/manage/closing-date')
  } else if (editChoice === 'referral-limit') {
    res.redirect('/employer/v04/manage/referral-limit')
  }
});


router.post('/employer/v04/manage/cancel-role-check', function (req, res) {
  const editChoice = req.session.data['cancel-role']

  if (editChoice === 'yes') {
    res.redirect('/employer/v04/manage/cancel-role-confirm')
  } else if (editChoice === 'no') {
    res.redirect('/employer/v04/manage/job-detail')
  }
});


router.post('/employer/v04/manage/pause-role-check', function (req, res) {
  const editChoice = req.session.data['pause-role']

  if (editChoice === 'yes') {
    res.redirect('/employer/v04/manage/pause-role-confirm')
  } else if (editChoice === 'no') {
    res.redirect('/employer/v04/manage/job-detail')
  }
});

router.post('/employer/v03/job-add-3a', function (req, res) {
  const editChoice = req.session.data['remote-role']

  if (editChoice === 'yes') {
    res.redirect('/employer/v03/job-add-4')
  } else if (editChoice === 'part') {
    res.redirect('/employer/v03/job-add-3b')
  } else if (editChoice === 'not') {
    res.redirect('/employer/v03/job-add-3b')
  }
});

router.post('/employer/v03/job-add-3b', function (req, res) {
  const editChoice = req.session.data['multiple-locations']

  if (editChoice === 'multiple') {
    res.redirect('/employer/v03/job-add-3d')
  } else if (editChoice === 'one-location') {
    res.redirect('/employer/v03/job-add-3c')
  }
});
