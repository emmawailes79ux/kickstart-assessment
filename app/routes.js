const express = require('express')
const router = express.Router()

// Add your routes here - above the module.exports line

module.exports = router

////// mvp //////////////////////////////////

router.post('/employer/mvp/job-add-3a', function (req, res) {
  const editChoice = req.session.data['remote-role']

  if (editChoice === 'yes') {
    res.redirect('/employer/mvp/job-add-3c')
  } else if (editChoice === 'part') {
    res.redirect('/employer/mvp/job-add-3c')
  } else if (editChoice === 'not') {
    res.redirect('/employer/mvp/job-add-3b')
  }
});

router.post('/employer/mvp/job-add-3b', function (req, res) {
  const editChoice = req.session.data['multiple-locations']

  if (editChoice === 'multiple') {
    res.redirect('/employer/mvp/job-add-3d')
  } else if (editChoice === 'one-location') {
    res.redirect('/employer/mvp/job-add-3c')
  }
});

router.post('/employer/mvp/job-add-3b-locally', function (req, res) {
  const editChoice = req.session.data['multiple-locations']

  if (editChoice === 'multiple') {
    res.redirect('/employer/mvp/job-add-3d')
  } else if (editChoice === 'one-location') {
    res.redirect('/employer/mvp/job-add-3c')
  }
});

////// mvp //////////////////////////////////



router.post('/employer/v05/manage/vacancies', function (req, res) {
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




////// v05 //////////////////////////////////


router.post('/employer/v05/manage/vacancies', function (req, res) {
  const editChoice = req.session.data['manage-application']

  if (editChoice === 'application-cancel') {
    res.redirect('/employer/v05/manage/cancel-application-check')
  } else if (editChoice === 'application-pause') {
    res.redirect('/employer/v05/manage/pause-application-check')
  }
});


router.post('/employer/v05/manage/cancel-application-check', function (req, res) {
  const editChoice = req.session.data['cancel-application']

  if (editChoice === 'yes') {
    res.redirect('/employer/v05/manage/cancel-application-confirm')
  } else if (editChoice === 'no') {
    res.redirect('/employer/v05/manage/pause-application-no-go-back')
  }
});


router.post('/employer/v05/manage/pause-application-check', function (req, res) {
  const editChoice = req.session.data['pause-application']

  if (editChoice === 'yes') {
    res.redirect('/employer/v05/manage/pause-application-confirm')
  } else if (editChoice === 'no') {
    res.redirect('/employer/v05/manage/pause-application-no-go-back')
  }
});


router.post('/employer/v05/manage/job-detail', function (req, res) {
  const editChoice = req.session.data['manage-role']

  if (editChoice === 'edit-role') {
    res.redirect('/employer/v05/manage/edit-job-detail')
  } else if (editChoice === 'pause-role') {
    res.redirect('/employer/v05/manage/pause-role-check')
  } else if (editChoice === 'cancel-role') {
    res.redirect('/employer/v05/manage/cancel-role-check')
  } else if (editChoice === 'place-referral') {
    res.redirect('/employer/v05/manage/referrals-place-in-role')
  } else if (editChoice === 'closing-date') {
    res.redirect('/employer/v05/manage/closing-date')
  } else if (editChoice === 'referral-limit') {
    res.redirect('/employer/v05/manage/referral-limit')
  } else if (editChoice === 'change-vacancies') {
    res.redirect('/employer/v05/manage/vacancies')
  }
});


router.post('/employer/v05/manage/cancel-role-check', function (req, res) {
  const editChoice = req.session.data['cancel-role']

  if (editChoice === 'yes') {
    res.redirect('/employer/v05/manage/cancel-role-confirm')
  } else if (editChoice === 'no') {
    res.redirect('/employer/v05/manage/job-detail')
  }
});


router.post('/employer/v05/manage/pause-role-check', function (req, res) {
  const editChoice = req.session.data['pause-role']

  if (editChoice === 'yes') {
    res.redirect('/employer/v05/manage/pause-role-confirm')
  } else if (editChoice === 'no') {
    res.redirect('/employer/v05/manage/job-detail')
  }
});

router.post('/employer/v05/job-add-3a', function (req, res) {
  const editChoice = req.session.data['remote-role']

  if (editChoice === 'yes') {
    res.redirect('/employer/v05/job-add-4')
  } else if (editChoice === 'part') {
    res.redirect('/employer/v05/job-add-3b-locally')
  } else if (editChoice === 'not') {
    res.redirect('/employer/v05/job-add-3b')
  }
});

router.post('/employer/v05/job-add-3b', function (req, res) {
  const editChoice = req.session.data['multiple-locations']

  if (editChoice === 'multiple') {
    res.redirect('/employer/v05/job-add-3d')
  } else if (editChoice === 'one-location') {
    res.redirect('/employer/v05/job-add-3c')
  }
});

router.post('/employer/v05/job-add-3b-locally', function (req, res) {
  const editChoice = req.session.data['multiple-locations']

  if (editChoice === 'multiple') {
    res.redirect('/employer/v05/job-add-3d')
  } else if (editChoice === 'one-location') {
    res.redirect('/employer/v05/job-add-3c')
  }
});



////// v05 //////////////////////////////////


router.post('/employer/v06/manage/vacancies', function (req, res) {
  const editChoice = req.session.data['manage-application']

  if (editChoice === 'application-cancel') {
    res.redirect('/employer/v06/manage/cancel-application-check')
  } else if (editChoice === 'application-pause') {
    res.redirect('/employer/v06/manage/pause-application-check')
  }
});


router.post('/employer/v06/manage/cancel-application-check', function (req, res) {
  const editChoice = req.session.data['cancel-application']

  if (editChoice === 'yes') {
    res.redirect('/employer/v06/manage/cancel-application-confirm')
  } else if (editChoice === 'no') {
    res.redirect('/employer/v06/manage/pause-application-no-go-back')
  }
});


router.post('/employer/v06/manage/pause-application-check', function (req, res) {
  const editChoice = req.session.data['pause-application']

  if (editChoice === 'yes') {
    res.redirect('/employer/v06/manage/pause-application-confirm')
  } else if (editChoice === 'no') {
    res.redirect('/employer/v06/manage/pause-application-no-go-back')
  }
});


router.post('/employer/v06/manage/job-detail', function (req, res) {
  const editChoice = req.session.data['manage-role']

  if (editChoice === 'edit-role') {
    res.redirect('/employer/v06/manage/edit-job-detail-tables')
  } else if (editChoice === 'pause-role') {
    res.redirect('/employer/v06/manage/pause-role-check')
  } else if (editChoice === 'cancel-role') {
    res.redirect('/employer/v06/manage/cancel-role-check')
  } else if (editChoice === 'place-referral') {
    res.redirect('/employer/v06/manage/referrals-place-in-role')
  } else if (editChoice === 'closing-date') {
    res.redirect('/employer/v06/manage/closing-date')
  } else if (editChoice === 'referral-limit') {
    res.redirect('/employer/v06/manage/referral-limit')
  } else if (editChoice === 'change-vacancies') {
    res.redirect('/employer/v06/manage/vacancies')
  } else if (editChoice === 'manage-placements') {
    res.redirect('/employer/v06/manage/placements')
  }
});


router.post('/employer/v06/manage/job-detail-bl', function (req, res) {
  const editChoice = req.session.data['manage-role-filled']

  if (editChoice === 'manage-placements') {
    res.redirect('/employer/v06/manage/placements-barista')
  } else if (editChoice === 'pause-role') {
    res.redirect('/employer/v06/manage/pause-role-check')
  } else if (editChoice === 'cancel-role') {
    res.redirect('/employer/v06/manage/cancel-role-check')
  }
});


router.post('/employer/v06/manage/cancel-role-check', function (req, res) {
  const editChoice = req.session.data['cancel-role']

  if (editChoice === 'yes') {
    res.redirect('/employer/v06/manage/cancel-role-confirm')
  } else if (editChoice === 'no') {
    res.redirect('/employer/v06/manage/job-detail')
  }
});


router.post('/employer/v06/manage/pause-role-check', function (req, res) {
  const editChoice = req.session.data['pause-role']

  if (editChoice === 'yes') {
    res.redirect('/employer/v06/manage/vacancies-pause-confirmed')
  } else if (editChoice === 'no') {
    res.redirect('/employer/v06/manage/job-detail')
  }
});

router.post('/employer/v06/job-add-3a', function (req, res) {
  const editChoice = req.session.data['remote-role']

  if (editChoice === 'yes') {
    res.redirect('/employer/v06/job-add-4')
  } else if (editChoice === 'part') {
    res.redirect('/employer/v06/job-add-3b-locally')
  } else if (editChoice === 'not') {
    res.redirect('/employer/v06/job-add-3b')
  }
});

router.post('/employer/v06/job-add-3b', function (req, res) {
  const editChoice = req.session.data['multiple-locations']

  if (editChoice === 'multiple') {
    res.redirect('/employer/v06/job-add-3d')
  } else if (editChoice === 'one-location') {
    res.redirect('/employer/v06/job-add-3c')
  }
});

router.post('/employer/v06/job-add-3b-locally', function (req, res) {
  const editChoice = req.session.data['multiple-locations']

  if (editChoice === 'multiple') {
    res.redirect('/employer/v06/job-add-3d')
  } else if (editChoice === 'one-location') {
    res.redirect('/employer/v06/job-add-3c')
  }
});



router.post('/employer/v06/manage/placement-detail-paused', function (req, res) {
  const editChoice = req.session.data['manage-placement-paused']

  if (editChoice === 'unpause-placement') {
    res.redirect('/employer/v06/manage/unpause-placement')
  } else if (editChoice === 'cancel') {
    res.redirect('/employer/v06/manage/job-detail')
  }
});


router.post('/employer/v06/manage/placement-detail-mq', function (req, res) {
  const editChoice = req.session.data['manage-placement']

  if (editChoice === 'pause-placement') {
    res.redirect('/employer/v06/manage/pause-placement-check')
  } else if (editChoice === 'cancel-placement') {
    res.redirect('/employer/v06/manage/cancel-placement-check')
  }
});

router.post('/employer/v06/manage/cancel-placement-check', function (req, res) {
  const editChoice = req.session.data['cancel-placement']

  if (editChoice === 'yes') {
    res.redirect('/employer/v06/manage/placements-chef-wakefield-updated')
  } else if (editChoice === 'no') {
    res.redirect('/employer/v06/manage/placement-detail-mq')
  }
});



router.post('/employer/v06/manage/job-detail-cd', function (req, res) {
  const editChoice = req.session.data['manage-role']

  if (editChoice === 'edit-role') {
    res.redirect('/employer/v06/manage/edit-job-detail-tables')
  } else if (editChoice === 'pause-role') {
    res.redirect('/employer/v06/manage/pause-role-check')
  } else if (editChoice === 'cancel-role') {
    res.redirect('/employer/v06/manage/cancel-role-check')
  } else if (editChoice === 'place-referral') {
    res.redirect('/employer/v06/manage/referrals-place-in-role')
  } else if (editChoice === 'closing-date') {
    res.redirect('/employer/v06/manage/closing-date')
  } else if (editChoice === 'referral-limit') {
    res.redirect('/employer/v06/manage/referral-limit')
  } else if (editChoice === 'change-vacancies') {
    res.redirect('/employer/v06/manage/vacancies')
  } else if (editChoice === 'manage-placements') {
    res.redirect('/employer/v06/manage/placements-chef-wakefield')
  }
});
