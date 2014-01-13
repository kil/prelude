(require 'prelude-programming)

(eval-after-load 'js2-mode
  '(progn
     (defun prelude-js2-mode-defaults ()
       ;; electric-layout-mode doesn't play nice with js-mode
       (electric-layout-mode -1)
       (setq-default js2-global-externs '("module" "require" "jQuery" "$" "_"
                                          "buster" "sinon" "assert" "refute"
                                          "setTimeout" "clearTimeout"
                                          "setInterval" "clearInterval"
                                          "location" "__dirname" "console"
                                          "JSON" "dc" "JST" "Backbone"
                                          "angular"))
       (custom-set-variables
        '(js2-basic-offset 2)
        '(js2-bounce-indent-p t)))

     (setq prelude-js2-mode-hook 'prelude-js2-mode-defaults)

     (add-hook 'js2-mode-hook (lambda () (run-hooks 'prelude-js2-mode-hook)))))

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
