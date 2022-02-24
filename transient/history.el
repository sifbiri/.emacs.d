((magit-branch nil)
 (magit-cherry-pick nil)
 (magit-commit nil)
 (magit-diff
  ("--no-ext-diff" "--stat"))
 (magit-dispatch nil)
 (magit-log
  ("-n256" "--graph" "--decorate")
  (("--" "src/css/custom.css"))
  (("--" "src/js/project/PlotStep.js"))
  (("--" "src/clj/collect_earth_online/db/users.clj"))
  (("--" "config.edn"))
  (("--" "config.default.edn"))
  (("--" "deps.edn"))
  (("--" "src/js/project/ReviewForm.js"))
  (("--" "src/js/login.js"))
  (("--" "document-root/about/contributing.gmi")))
 (magit-merge
  ("--ff-only"))
 (magit-pull nil
             ("--rebase"))
 (magit-push nil
             ("--force-with-lease")
             ("--force"))
 (magit-rebase
  ("--autostash")
  nil
  ("--autostash" "--interactive"))
 (magit-remote\.<remote>\.*url "git@github.com:openforis/collect-earth-online.git" "https://github.com/openforis/collect-earth-online.git")
 (magit-reset nil)
 (magit-stash nil))
