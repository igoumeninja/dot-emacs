(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
(with-current-buffer
(url-retrieve-synchronously
"https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
(goto-char (point-max))
(eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(require 'use-package-el-get)
(setq use-package-always-ensure nil)
(use-package-el-get-setup)

(require 'req-package)

(req-package use-package-el-get ;; prepare el-get support for use-package (optional)
  :force t ;; load package immediately, no dependency resolution
  :config
  (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
  (el-get 'sync)
  (use-package-el-get-setup))

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

(use-package nlinum
  :config
  (global-nlinum-mode))

;(add-to-list 'custom-theme-load-path "path/to/badger-theme-directory")
 ;(load-theme 'badger t)
;(load-theme 'darkokai t)
 (load-theme 'dracula t)
;;(require 'color-theme-sanityinc-tomorrow)
;;(load-theme 'color-theme-sanityinc-tomorrow t)

(setq org-agenda-files (list "~/Documents/02.GetIn/org-files/chipis.org" "~/Documents/02.GetIn/org-files/mb.org" "~/Documents/02.GetIn/org-files/xp.org" "~/Documents/02.GetIn/org-files/notes.org" "~/Documents/02.GetIn/org-files/engineering.org" "~/.emacs.d/personal/aris.org"))


(global-set-key (kbd "C-x a") 'org-agenda)

(defun open-mousiko-bostani () (interactive) (find-file "~/Documents/02.GetIn/org-files/mb.org"))       (global-set-key (kbd "C-0") 'open-mousiko-bostani)
 (defun open-xorio-palio () (interactive) (find-file "~/Documents/02.GetIn/org-files/xp.org"))           (global-set-key (kbd "C-1") 'open-xorio-palio)
 (defun open-sunson () (interactive) (find-file "~/Documents/02.GetIn/org-files/sunson.org"))            (global-set-key (kbd "C-2") 'open-sunson)
 (defun open-notes () (interactive) (find-file "~/Documents/02.GetIn/org-files/notes.org"))              (global-set-key (kbd "C-3") 'open-notes)
 (defun open-arisearch () (interactive) (find-file "~/Documents/02.GetIn/org-files/arisearch.org"))      (global-set-key (kbd "C-4") 'open-arisearch)
 (defun open-engineering () (interactive) (find-file "~/Documents/02.GetIn/org-files/engineering.org"))  (global-set-key (kbd "C-5") 'open-engineering)
 (defun open-bash-aliases () (interactive) (find-file "~/Documents/02.GetIn/scripts/bash-alias"))        (global-set-key (kbd "C-6") 'open-bash-aliases)
 (defun open-sc-file () (interactive) (find-file "~/Documents/02.GetIn/org-files/sc.org"))               (global-set-key (kbd "C-7") 'open-sc-file)
 (defun open-chipis () (interactive) (find-file "~/Documents/02.GetIn/org-files/chipis.org"))            (global-set-key (kbd "C-8") 'open-chipis)
 (defun open-ari-config () (interactive) (find-file "~/.emacs.d/personal/aris.org"))                     (global-set-key (kbd "C-9") 'open-ari-config)

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

(fset 'folding
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([1 C-return down] 0 "%d")) arg)))
 ;;(global-set-key (kbd "C-'") 'folding)

(fset 'folding-trick
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([19 47 47 45 C-return] 0 "%d")) arg)))
 (global-set-key (kbd "C-'") 'folding-trick)

(desktop-save-mode 1)

(show-paren-mode 1)

(add-hook 'prog-mode-hook
          (lambda () (yafolding-mode)))
(yafolding-mode 1)
(defvar yafolding-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "<C-S-return>") #'yafolding-hide-parent-element)
    (define-key map (kbd "<C-M-return>") #'yafolding-toggle-all)
    (define-key map (kbd "<C-return>") #'yafolding-toggle-element)
    map))

(add-to-list 'load-path
              "~/Documents/02.GetIn/yasnippets/")
(require 'yasnippet)
(yas-global-mode 1)

(define-key global-map (kbd "C-c ;") 'iedit-mode)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(use-package google-c-style
  :config
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent)
)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile-find-file)
(setq projectile-switch-project-action 'helm-projectile)

(use-package flycheck
  :ensure t
  :pin melpa
  :diminish flycheck-mode
  :init (global-flycheck-mode)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  )

(defun my:flymake-google-init ()
 (require 'flymake-google-cpplint)
 (custom-set-variables
  '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
 (flymake-google-cpplint-load)
)

(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

(require 'helm)
(require 'helm-config)
(require 'helm-projectile)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

(defun spacemacs//helm-hide-minibuffer-maybe ()
  "Hide minibuffer in Helm session if we use the header line as input field."
  (when (with-helm-buffer helm-echo-input-in-header-line)
    (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
      (overlay-put ov 'window (selected-window))
      (overlay-put ov 'face
                   (let ((bg-color (face-background 'default nil)))
                     `(:background ,bg-color :foreground ,bg-color)))
      (setq-local cursor-type nil))))


(add-hook 'helm-minibuffer-set-up-hook
          'spacemacs//helm-hide-minibuffer-maybe)

(setq helm-autoresize-max-height 0)
(setq helm-autoresize-min-height 20)
(helm-autoresize-mode 1)
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

(require 'ac-helm) ;; Not necessary if using ELPA package
(global-set-key (kbd "C-:") 'ac-complete-with-helm)
(define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm)

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

; Can't use use-package here, in case it's not installed yet which it wouldn't the first time this is run
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'company)
(global-company-mode 1)

; use-package bootstrapping
(unless (package-installed-p 'use-package)
(package-refresh-contents)
  (package-install 'use-package)
  )

(eval-when-compile (require 'use-package)) ;; use-package.el not needed at runtime
(use-package diminish :defer t)                ;; if you use :diminish
(use-package bind-key :defer t)                ;; if you use any :bind variant



(use-package company
  :ensure t
  :init (global-company-mode)
  :bind (("<C-tab>" . company-complete))
:diminish company-mode)



;(use-package rtags
;  :pin melpa
;  :after company
;  :config
;  (setq rtags-autostart-diagnostics t
;	 rtags-completions-enabled nil)
;  (push 'company-rtags company-backends)
;  (rtags-diagnostics)

;  (add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
;  )

(use-package modern-cpp-font-lock
  :pin melpa
  :ensure t
  :diminish
  :config
  (modern-c++-font-lock-global-mode t)
)


(use-package irony
  :ensure t
  :pin melpa
  :diminish irony-mode
  :config
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)

  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

  (use-package flycheck-irony :ensure t)

  (use-package company-irony :ensure t
    :config (add-to-list 'company-backends 'company-irony))

  (add-hook 'flycheck-mode 'flycheck-irony-setup)

)
