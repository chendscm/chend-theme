;;; zen-theme.el

;;; Commentary:
;;
;; This theme assumes light background.  To load it, use:
;;
;;     (require 'zen-theme)

;;; Code:

(deftheme zen
    "Color theme.")

(let ((class '((class color) (min-colors 88) (background light)))
      (zen-bg "#ffffff")
      ;; (zen-bg "#1b2b34")
      ;; (zen-bg "#000000")
      (zen-fg "#000000")
      ;; (zen-fg "#FAC863")
      (zen-const "#110099")
      (zen-comment "#3F7F5F")
      (zen-error "#FF0000")
      (zen-builtin "#7F0055")
      (zen-string "#2A00FF")
      (zen-blue-3 "#758BC6")
      (zen-region "#f9b593")
      (zen-shadow "grey50"))
  (apply 'custom-theme-set-faces 'zen
         (mapcar
          (lambda (x) `(,(car x) ((,class ,(cdr x)))))
          `((default :foreground ,zen-fg :background ,zen-bg)
            (cursor :background ,zen-fg)
            (shadow :foreground ,zen-shadow)
            (success :foreground ,zen-error)
            (error :foreground ,zen-error :weight bold)
            (warning :foreground "DarkOrange" :weight bold)
            (compilation-warning :underline t :inherit warning)
            (compilation-error :underline t :inherit error)
            (compilation-info :underline t :foreground ,zen-const)
            (highlight :background "darkseagreen2")
            (fringe :background ,zen-bg)
            (region :background ,zen-region :foreground ,zen-bg :extend t)
            (secondary-selection :background "#333366" :foreground "#f6f3e8")
            (whitespace-indentation :background "LightYellow" :foreground "lightgray")
            (term)
            ;; (font-lock-negation-char-face :foreground "#e8e2b7")
            (font-lock-builtin-face :foreground ,zen-builtin :bold t)
            (font-lock-comment-face :foreground ,zen-comment :slant normal)
            (font-lock-comment-delimiter-face :foreground ,zen-comment :slant normal)
            (font-lock-constant-face :foreground ,zen-const)
            (font-lock-doc-face :foreground ,zen-string)
            (font-lock-doc-string-face :foreground ,zen-string)
            (font-lock-function-name-face :foreground ,zen-fg :bold t)
            (font-lock-keyword-face :foreground ,zen-builtin :weight bold)
            (font-lock-preprocessor-face :foreground ,zen-builtin :bold t)
            (font-lock-regexp-grouping-backslash :foreground ,zen-builtin)
            (font-lock-regexp-grouping-construct :foreground ,zen-builtin)
            (font-lock-string-face :foreground ,zen-string)
            (font-lock-type-face :foreground ,zen-fg :underline t :slant italic)
            (font-lock-variable-name-face :foreground ,zen-fg)
            (font-lock-warning-face :foreground ,zen-error)
            (font-lock-doxygen-face :foreground "SaddleBrown" :background "#f7f7f7")
            (org-code :foreground ,zen-builtin :weight bold)
            (org-verbatim :foreground ,zen-const)
            (org-level-1 :weight bold :foreground "black")
            (org-level-2 :foreground ,zen-builtin)
            (org-level-3 :foreground "#123555")
            (org-level-4 :slant normal :foreground "#E3258D")
            (org-level-5 :slant normal :foreground "#0077CC")
            (org-level-6 :slant italic :foreground "#EA6300")
            (org-level-7 :slant italic :foreground "#2EAE2C")
            (org-level-8 :slant italic :foreground "#FD8008")
            (org-block-begin-line :foreground ,zen-const)
            (org-block-end-line :foreground ,zen-const)
            (org-scheduled-previously :foreground ,zen-comment)
            (ido-subdir :weight bold)
            (mode-line :foreground "black" :background "#f9b593" :box nil)
            (mode-line-inactive :foreground "grey20" :background "grey90" :box nil)
            (minibuffer-prompt :foreground "medium blue")
            (hl-line :background "#e5e4e2" :extend t)
            ;; defaults
            (mode-line-buffer-id)
            (show-paren-match :background "turquoise")
            (isearch :background "magenta3" :foreground "lightskyblue1")
            (link :foreground "RoyalBlue3" :underline t)
            ;; other packages
            (helm-locate-finish :foreground ,zen-const)
            (aw-mode-line-face :foreground ,zen-string)
            (swiper-match-face-1 :background "#FEEA89")
            (swiper-match-face-2 :background "#fb7905")
            (swiper-match-face-3 :background "#F9A35A")
            (swiper-match-face-4 :background "#F15C79")
            (swiper-line-face :background "#f3d3d3")
            (hydra-face-red :foreground "#cc0000" :bold t)
            (hydra-face-blue :foreground "RoyalBlue3" :bold t)
            (powerline-active1 :background "grey22" :foreground "white" :inherit mode-line)
            (powerline-active2 :background "grey40" :foreground "white" :inherit mode-line)
            (powerline-inactive1 :background "grey22" :foreground "white" :inherit mode-line-inactive)
            (powerline-inactive2 :background "grey40" :foreground "white" :inherit mode-line-inactive)
            (diff-added :background "#ddffdd")
            (diff-removed :background "#ffdddd")
            (magit-tag :background "LemonChiffon1" :foreground "goldenrod4")
            (magit-section-heading :inherit header-line)
            (magit-section-highlight :weight bold)
            (magit-diff-context :foreground "grey20" :extend t)
            (magit-diff-context-highlight :weight bold :foreground "grey20" :extend t)
            (magit-diff-added :inherit diff-added :extend t)
            (magit-diff-added-highlight :inherit diff-added :weight bold :extend t)
            (magit-diff-removed :inherit diff-removed :extend t)
            (magit-diff-removed-highlight :inherit diff-removed :weight bold :extend t)
            (magit-diff-file-heading)
            (magit-diff-file-heading-highlight :weight bold)
            (magit-diff-file-heading-selection :foreground "red")
            (magit-diff-hunk-heading :inherit diff-hunk-header :extend t)
            (magit-diff-hunk-heading-highlight :inherit diff-hunk-header :weight bold :extend t)
            (magit-hash :foreground "firebrick")
            (magit-branch-remote :background "Grey85" :foreground "OliveDrab4" :box t)
            (magit-branch-local :background "Grey85" :foreground "LightSkyBlue4" :box t)
            (mu4e-modeline-face :foreground "white")
            (ivy-highlight-face)
            (ivy-posframe :background "#eeeeee" :foreground "#000000")
            (wgrep-face :foreground ,zen-comment)
            (cider-instrumented-face)))))

(custom-theme-set-variables
 'zen
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682"
                            "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"]))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide 'zen-theme)

;;; zen-theme.el ends here
