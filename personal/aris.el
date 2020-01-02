(defvar hugo-content-dir-mousikobostani "~/Music/mousikobostani.gitlab.io/content/post/"
  "Path to Mousiko Bostani Hugo's content directory")

(defun hugom ()
  (interactive)
  (unless (hugo-ensure-properties)
    (let* ((title    (concat "title = \"" (org-entry-get nil "TITLE") "\"\n"))
           (date     (concat "date = \"" (format-time-string "%Y-%m-%d" (apply 'encode-time (org-parse-time-string (org-entry-get nil "HUGO_DATE"))) t) "\"\n"))
           (topics   (concat "topics = [ \"" (mapconcat 'identity (split-string (org-entry-get nil "HUGO_TOPICS") "\\( *, *\\)" t) "\", \"") "\" ]\n"))
           (tags     (concat "tags = [ \"" (mapconcat 'identity (split-string (org-entry-get nil "HUGO_TAGS") "\\( *, *\\)" t) "\", \"") "\" ]\n"))
           (fm (concat "+++\n"
                       title
                       date
                       tags
                       topics
                       "+++\n\n"))
           (file     (org-entry-get nil "HUGO_FILE"))
           (coding-system-for-write buffer-file-coding-system)
           (backend  'md)
           (blog))
      ;; try to load org-mode/contrib/lisp/ox-gfm.el and use it as backend
      (if (require 'ox-gfm nil t)
          (setq backend 'gfm)
        (require 'ox-md))
      (setq blog (org-export-as backend t))
      ;; Normalize save file path
      (unless (string-match "^[/~]" file)
        (setq file (concat hugo-content-dir-mousikobostani file))
      (unless (string-match "\\.md$" file)
        (setq file (concat file ".md")))
      ;; save markdown
      (with-temp-buffer
        (insert fm)
        (insert blog)
        (untabify (point-min) (point-max))
        (write-file file)
        (message "Exported to %s" file))
      ))))

;;(bind-key "M-g h" #'hugo)

(defvar hugo-content-dir-xoriopalio "~/Sites/xoriopalio/content/post/"
  "Path to Xorio Palio Hugo's content directory")

(defun hugox ()
  (interactive)
  (unless (hugo-ensure-properties)
    (let* ((title    (concat "title = \"" (org-entry-get nil "TITLE") "\"\n"))
           (date     (concat "date = \"" (format-time-string "%Y-%m-%d" (apply 'encode-time (org-parse-time-string (org-entry-get nil "HUGO_DATE"))) t) "\"\n"))
           (topics   (concat "topics = [ \"" (mapconcat 'identity (split-string (org-entry-get nil "HUGO_TOPICS") "\\( *, *\\)" t) "\", \"") "\" ]\n"))
           (tags     (concat "tags = [ \"" (mapconcat 'identity (split-string (org-entry-get nil "HUGO_TAGS") "\\( *, *\\)" t) "\", \"") "\" ]\n"))
           (fm (concat "+++\n"
                       title
                       date
                       tags
                       topics
                       "+++\n\n"))
           (file     (org-entry-get nil "HUGO_FILE"))
           (coding-system-for-write buffer-file-coding-system)
           (backend  'md)
           (blog))
      ;; try to load org-mode/contrib/lisp/ox-gfm.el and use it as backend
      (if (require 'ox-gfm nil t)
          (setq backend 'gfm)
        (require 'ox-md))
      (setq blog (org-export-as backend t))
      ;; Normalize save file path
      (unless (string-match "^[/~]" file)
        (setq file (concat hugo-content-dir-xoriopalio file))
      (unless (string-match "\\.md$" file)
        (setq file (concat file ".md")))
      ;; save markdown
      (with-temp-buffer
        (insert fm)
        (insert blog)
        (untabify (point-min) (point-max))
        (write-file file)
        (message "Exported to %s" file))
      ))))

;;(bind-key "M-g h" #'hugo)

(defvar hugo-content-dir-sunson "~/Sites/sunson/content/post/"
  "Path to sunson Hugo's content directory")

(defun hugos ()
  (interactive)
  (unless (hugo-ensure-properties)
    (let* ((title    (concat "title = \"" (org-entry-get nil "TITLE") "\"\n"))
           (date     (concat "date = \"" (format-time-string "%Y-%m-%d" (apply 'encode-time (org-parse-time-string (org-entry-get nil "HUGO_DATE"))) t) "\"\n"))
           (topics   (concat "topics = [ \"" (mapconcat 'identity (split-string (org-entry-get nil "HUGO_TOPICS") "\\( *, *\\)" t) "\", \"") "\" ]\n"))
           (tags     (concat "tags = [ \"" (mapconcat 'identity (split-string (org-entry-get nil "HUGO_TAGS") "\\( *, *\\)" t) "\", \"") "\" ]\n"))
           (fm (concat "+++\n"
                       title
                       date
                       tags
                       topics
                       "+++\n\n"))
           (file     (org-entry-get nil "HUGO_FILE"))
           (coding-system-for-write buffer-file-coding-system)
           (backend  'md)
           (blog))
      ;; try to load org-mode/contrib/lisp/ox-gfm.el and use it as backend
      (if (require 'ox-gfm nil t)
          (setq backend 'gfm)
        (require 'ox-md))
      (setq blog (org-export-as backend t))
      ;; Normalize save file path
      (unless (string-match "^[/~]" file)
        (setq file (concat hugo-content-dir-sunson file))
      (unless (string-match "\\.md$" file)
        (setq file (concat file ".md")))
      ;; save markdown
      (with-temp-buffer
        (insert fm)
        (insert blog)
        (untabify (point-min) (point-max))
        (write-file file)
        (message "Exported to %s" file))
      ))))

;;(bind-key "M-g h" #'hugo)

(setq org-export-with-sub-superscripts "{}")
(setq org-use-sub-superscripts '{})

;; http://www.holgerschurig.de/en/emacs-blog-from-org-to-hugo/


(defvar hugo-content-dir "~/hugo/content/post/"
  "Path to Hugo's content directory")

;;The next two functions care that all needed property drawers exist:

;; This is GPLv2. If you still don't know the details, read
;; http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html

(defun hugo-ensure-property (property)
  "Make sure that a property exists. If not, it will be created.
Returns the property name if the property has been created,
otherwise nil."
  (if (org-entry-get nil property)
      nil
    (progn (org-entry-put nil property "")
           property)))

(defun hugo-ensure-properties ()
  "This ensures that several properties exists. If not, these
properties will be created in an empty form. In this case, the
drawer will also be opened and the cursor will be positioned
at the first element that needs to be filled.

Returns list of properties that still must be filled in"
  (require 'dash)
  (let ((current-time (format-time-string (org-time-stamp-format t t) (org-current-time)))
        first)
    (save-excursion
      (unless (org-entry-get nil "TITLE")
        (org-entry-put nil "TITLE" (nth 4 (org-heading-components))))
      (setq first (--first it (mapcar #'hugo-ensure-property '("HUGO_TAGS" "HUGO_TOPICS" "HUGO_FILE"))))
      (unless (org-entry-get nil "HUGO_DATE")
        (org-entry-put nil "HUGO_DATE" current-time)))
    (when first
      (goto-char (org-entry-beginning-position))
      ;; The following opens the drawer
      (forward-line 1)
      (beginning-of-line 1)
      (when (looking-at org-drawer-regexp)
        (org-flag-drawer nil))
      ;; And now move to the drawer property
      (search-forward (concat ":" first ":"))
      (end-of-line))
    first))


;; This is GPLv2. If you still don't know the details, read
;; http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html

(defun hugo ()
  (interactive)
  (unless (hugo-ensure-properties)
    (let* ((title    (concat "title = \"" (org-entry-get nil "TITLE") "\"\n"))
           (date     (concat "date = \"" (format-time-string "%Y-%m-%d" (apply 'encode-time (org-parse-time-string (org-entry-get nil "HUGO_DATE"))) t) "\"\n"))
           (topics   (concat "topics = [ \"" (mapconcat 'identity (split-string (org-entry-get nil "HUGO_TOPICS") "\\( *, *\\)" t) "\", \"") "\" ]\n"))
           (tags     (concat "tags = [ \"" (mapconcat 'identity (split-string (org-entry-get nil "HUGO_TAGS") "\\( *, *\\)" t) "\", \"") "\" ]\n"))
           (fm (concat "+++\n"
                       title
                       date
                       tags
                       topics
                       "+++\n\n"))
           (file     (org-entry-get nil "HUGO_FILE"))
           (coding-system-for-write buffer-file-coding-system)
           (backend  'md)
           (blog))
      ;; try to load org-mode/contrib/lisp/ox-gfm.el and use it as backend
      (if (require 'ox-gfm nil t)
          (setq backend 'gfm)
        (require 'ox-md))
      (setq blog (org-export-as backend t))
      ;; Normalize save file path
      (unless (string-match "^[/~]" file)
        (setq file (concat hugo-content-dir file))
      (unless (string-match "\\.md$" file)
        (setq file (concat file ".md")))
      ;; save markdown
      (with-temp-buffer
        (insert fm)
        (insert blog)
        (untabify (point-min) (point-max))
        (write-file file)
        (message "Exported to %s" file))
      ))))

;;(bind-key "M-g h" #'hugo)

(defvar hugo-content-dir-igoumeninja "~/Sites/igoumeninja.github.io/content/post/"
  "Path to Xorio Palio Hugo's content directory")

(defun hugoi ()
  (interactive)
  (unless (hugo-ensure-properties)
    (let* ((title    (concat "title = \"" (org-entry-get nil "TITLE") "\"\n"))
           (date     (concat "date = \"" (format-time-string "%Y-%m-%d" (apply 'encode-time (org-parse-time-string (org-entry-get nil "HUGO_DATE"))) t) "\"\n"))
           (topics   (concat "topics = [ \"" (mapconcat 'identity (split-string (org-entry-get nil "HUGO_TOPICS") "\\( *, *\\)" t) "\", \"") "\" ]\n"))
           (tags     (concat "tags = [ \"" (mapconcat 'identity (split-string (org-entry-get nil "HUGO_TAGS") "\\( *, *\\)" t) "\", \"") "\" ]\n"))
           (fm (concat "+++\n"
                       title
                       date
                       tags
                       topics
                       "+++\n\n"))
           (file     (org-entry-get nil "HUGO_FILE"))
           (coding-system-for-write buffer-file-coding-system)
           (backend  'md)
           (blog))
      ;; try to load org-mode/contrib/lisp/ox-gfm.el and use it as backend
      (if (require 'ox-gfm nil t)
          (setq backend 'gfm)
        (require 'ox-md))
      (setq blog (org-export-as backend t))
      ;; Normalize save file path
      (unless (string-match "^[/~]" file)
        (setq file (concat hugo-content-dir-igoumeninja file))
      (unless (string-match "\\.md$" file)
        (setq file (concat file ".md")))
      ;; save markdown
      (with-temp-buffer
        (insert fm)
        (insert blog)
        (untabify (point-min) (point-max))
        (write-file file)
        (message "Exported to %s" file))
      ))))

;; ox-hugo

(with-eval-after-load 'ox
  (require 'ox-hugo))



;; easy-hugo

(setq easy-hugo-basedir "~/hugo/")
(setq easy-hugo-url "https://igoumeninja.gitlab.io/hugo/")
(setq easy-hugo-sshdomain "blogdomain")
(setq easy-hugo-root "/home/blog/")
(setq easy-hugo-previewtime "300")
(define-key global-map (kbd "C-c C-e") 'easy-hugo)

;; Hugo (A carefully crafted Org exporter back-end that enables writing Hugo posts in Org)

 (with-eval-after-load 'ox
   (require 'ox-hugo))

(add-to-list 'custom-theme-load-path "path/to/badger-theme-directory")
(load-theme 'badger t)

(setq org-agenda-files (list "~/Documents/02.GetIn/org-files/chipis.org" "~/Documents/02.GetIn/org-files/mb.org" "~/Documents/02.GetIn/org-files/xp.org" "~/Documents/02.GetIn/org-files/notes.org" "~/Documents/02.GetIn/org-files/engineering.org" "~/.emacs.d/personal/aris.org"))


(global-set-key (kbd "C-x a") 'org-agenda)

(defun open-mousiko-bostani () (interactive) (find-file "~/Documents/02.GetIn/org-files/mb.org"))  (global-set-key (kbd "C-0") 'open-mousiko-bostani)
(defun open-xorio-palio () (interactive) (find-file "~/Documents/02.GetIn/org-files/xp.org"))  (global-set-key (kbd "C-1") 'open-xorio-palio)
(defun open-sunson () (interactive) (find-file "~/Documents/02.GetIn/org-files/sunson.org"))  (global-set-key (kbd "C-2") 'open-sunson)
(defun open-notes () (interactive) (find-file "~/Documents/02.GetIn/org-files/notes.org"))  (global-set-key (kbd "C-3") 'open-notes)
(defun open-arisearch () (interactive) (find-file "~/Documents/02.GetIn/org-files/arisearch.org"))  (global-set-key (kbd "C-4") 'open-arisearch)
(defun open-engineering () (interactive) (find-file "~/Documents/02.GetIn/org-files/engineering.org"))  (global-set-key (kbd "C-5") 'open-engineering)
(defun open-bash-aliases () (interactive) (find-file "~/.bash_aliases"))  (global-set-key (kbd "C-6") 'open-bash-aliases)
(defun open-sc-file () (interactive) (find-file "~/Documents/02.GetIn/org-files/sc.org"))  (global-set-key (kbd "C-7") 'open-sc-file)
(defun open-chipis () (interactive) (find-file "~/Documents/02.GetIn/org-files/chipis.org"))  (global-set-key (kbd "C-8") 'open-chipis)
(defun open-ari-config () (interactive) (find-file "~/.emacs.d/personal/aris.org"))  (global-set-key (kbd "C-9") 'open-ari-config)

(defun mousiko () (interactive) (find-file "~/Music/mousikobostani.gitlab.io/config.toml"))
(defun xorio () (interactive) (find-file "~/Sites/xoriopalio/config.toml"))
(defun sunson () (interactive) (find-file "~/Sites/sunson/config.toml"))
(defun bashrc () (interactive) (find-file "~/.bashrc"))

(defun ofdir () (interactive) (dired "~/Code/oF_apps/"))
(defun addons () (interactive) (dired "~/Software/oF/of_v0.11.0_linux64gcc6_release/addons/"))
(defun sc () (interactive) (dired "~/.local/share/SuperCollider/Extensions/"))

(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(define-key global-map (kbd "C-M-s-<up>") 'kill-other-buffers)

(define-key global-map (kbd "C-M-s-<down>") 'kill-this-buffer)

(define-key global-map (kbd "C-M-s-<right>") 'next-buffer)
(define-key global-map (kbd "C-M-s-<left>") 'previous-buffer)

(global-set-key (kbd "M-3") 'kill-buffer)
(global-set-key (kbd "M-2") 'org-search-view)
(global-set-key (kbd "M-1") 'visual-line-mode)

(windmove-default-keybindings 'control)

(show-paren-mode 1)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(defun hsm () (interactive) (hs-minor-mode))
(defun ha () (interactive) (hs-hide-all))
(defun sa () (interactive) (hs-show-all))
(defun hb () (interactive) (hs-hide-block))
(defun sb () (interactive) (hs-show-block))
;;(hs-minor-mode)
;;(global-set-key (kbd "C-S-s") 'hs-show-block)
;;(global-set-key (kbd "C-S-h") 'hs-hide-block)
;;(global-set-key (kbd "C-S-a") 'hs-show-all)
;;(global-set-key (kbd "C-S-g") 'hs-hide-all)

(show-paren-mode 1)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
(with-current-buffer
(url-retrieve-synchronously
"https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
(goto-char (point-max))
(eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(require 'use-package-el-get)
(setq use-package-always-ensure nil)
(use-package-el-get-setup)

;;  then

;;(use-package cool-fancy-package
;;  :el-get t)

(require 'req-package)

(req-package use-package-el-get ;; prepare el-get support for use-package (optional)
  :force t ;; load package immediately, no dependency resolution
  :config
  (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
  (el-get 'sync)
  (use-package-el-get-setup))

(req-package company
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
    (setq company-idle-delay 0)))

(req-package flycheck
  :config
  (progn
    (global-flycheck-mode)))

(defun my:flymake-google-init ()
 (require 'flymake-google-cpplint)
 (custom-set-variables
  '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
 (flymake-google-cpplint-load)
)

(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

(define-key global-map (kbd "C-c ;") 'iedit-mode)

(add-to-list 'load-path
              "~/Documents/02.GetIn/yasnippets/")
(require 'yasnippet)
(yas-global-mode 1)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; Helm makes searching for anything nicer.
;; It works on top of many other commands / packages and gives them nice, flexible UI.
(req-package helm
  :config
  (progn
    (require 'helm-config)

    ;; Use C-c h instead of default C-x c, it makes more sense.
    (global-set-key (kbd "C-c h") 'helm-command-prefix)
    (global-unset-key (kbd "C-x c"))

    (setq
     ;; move to end or beginning of source when reaching top or bottom of source.
     helm-move-to-line-cycle-in-source t
     ;; search for library in `require' and `declare-function' sexp.
     helm-ff-search-library-in-sexp t
     ;; scroll 8 lines other window using M-<next>/M-<prior>
     helm-scroll-amount 8
     helm-ff-file-name-history-use-recentf t
     helm-echo-input-in-header-line t)

    (global-set-key (kbd "M-x") 'helm-M-x)
    (setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

    (global-set-key (kbd "C-x C-f") 'helm-find-files)

    (global-set-key (kbd "M-y") 'helm-show-kill-ring)

    (global-set-key (kbd "C-x b") 'helm-mini)
    (setq helm-buffers-fuzzy-matching t
          helm-recentf-fuzzy-match t)

    ;; TOOD: helm-semantic has not syntax coloring! How can I fix that?
    (setq helm-semantic-fuzzy-match t
          helm-imenu-fuzzy-match t)

    ;; Lists all occurences of a pattern in buffer.
    (global-set-key (kbd "C-c h o") 'helm-occur)

    (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)

    ;; open helm buffer inside current window, not occupy whole other window
    (setq helm-split-window-in-side-p t)
    (setq helm-autoresize-max-height 50)
    (setq helm-autoresize-min-height 30)
    (helm-autoresize-mode 1)

    (helm-mode 1)
    ))

;; Use Helm in Projectile.
(req-package helm-projectile
  :require helm projectile
  :config
  (progn
    (setq projectile-completion-system 'helm)
    (helm-projectile-on)
    ))

(req-package projectile
  :config
  (progn
    (projectile-global-mode)
    ))

(req-package rtags
  :config
  (progn
    (unless (rtags-executable-find "rc") (error "Binary rc is not installed!"))
    (unless (rtags-executable-find "rdm") (error "Binary rdm is not installed!"))

    (define-key c-mode-base-map (kbd "M-.") 'rtags-find-symbol-at-point)
    (define-key c-mode-base-map (kbd "M-,") 'rtags-find-references-at-point)
    (define-key c-mode-base-map (kbd "M-?") 'rtags-display-summary)
    (rtags-enable-standard-keybindings)

    (setq rtags-use-helm t)

    ;; Shutdown rdm when leaving emacs.
    (add-hook 'kill-emacs-hook 'rtags-quit-rdm)
    ))

;; TODO: Has no coloring! How can I get coloring?
(req-package helm-rtags
  :require helm rtags
  :config
  (progn
    (setq rtags-display-result-backend 'helm)
    ))

;; Use rtags for auto-completion.
(req-package company-rtags
  :require company rtags
  :config
  (progn
    (setq rtags-autostart-diagnostics t)
    (rtags-diagnostics)
    (setq rtags-completions-enabled t)
    (push 'company-rtags company-backends)
    ))

;; Live code checking.
(req-package flycheck-rtags
  :require flycheck rtags
  :config
  (progn
    ;; ensure that we use only rtags checking
    ;; https://github.com/Andersbakken/rtags#optional-1
    (defun setup-flycheck-rtags ()
      (flycheck-select-checker 'rtags)
      (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
      (setq-local flycheck-check-syntax-automatically nil)
      (rtags-set-periodic-reparse-timeout 2.0)  ;; Run flycheck 2 seconds after being idle.
      )
    (add-hook 'c-mode-hook #'setup-flycheck-rtags)
    (add-hook 'c++-mode-hook #'setup-flycheck-rtags)
    ))