;;; chend-dark-theme.el --- My dark theme, for night use.

;;; Commentary:
;;
;; My dark theme, for night use.
;;

;;; Installation:
;;
;; Put chend-dark-theme.el to your load-path.
;; The load-path is usually ~/elisp/.
;; It's set in your ~/.emacs like this:
;; (add-to-list 'load-path (expand-file-name "~/elisp"))
;;
;; And the following to your ~/.emacs startup file.
;;
;; (require 'chend-dark-theme)
;;
;; No need more.

;;; Customize:
;;
;;
;;
;; All of the above can customize by:
;;      M-x customize-group RET chend-dark-theme RET
;;

;;; Change log:
;;
;; 2020/03/21
;;      * First released.
;;

;;; Acknowledgements:
;;
;;
;;

;;; TODO
;;
;;
;;

;;; Require


;;; Code:

(require 'chend-theme)

(defgroup chend-dark-theme nil
  "Options for chend-themes"
  :group 'chend-themes)

(defcustom chend-dark-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'chend-dark-theme
  :type 'boolean)

(defcustom chend-dark-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'chend-dark-theme
  :type 'boolean)

(defcustom chend-dark-comment-bg chend-dark-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'chend-dark-theme
  :type 'boolean)

(defcustom chend-dark-padded-modeline chend-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'chend-dark-theme
  :type '(choice integer boolean))

;;
(def-chend-theme chend-dark
  "A dark theme inspired by Atom One Dark"

  ;; name        default   256       16
  (;; (bg         '("#242525" nil       nil            ))
   (bg         '("#1b2b34" nil       nil            ))
   (bg-alt     '("#333333" nil       nil            ))
   (base0      '("#1B2229" "black"   "black"        ))
   (base1      '("#1c1f24" "#1e1e1e" "brightblack"  ))
   (base2      '("#202328" "#2e2e2e" "brightblack"  ))
   (base3      '("#23272e" "#262626" "brightblack"  ))
   (base4      '("#3f444a" "#3f3f3f" "brightblack"  ))
   (base5      '("#5B6268" "#525252" "brightblack"  ))
   (base6      '("#73797e" "#6b6b6b" "brightblack"  ))
   (base7      '("#9ca0a4" "#979797" "brightblack"  ))
   (base8      '("#DFDFDF" "#dfdfdf" "white"        ))
   ;; (fg         '("#00CE00" "#bfbfbf" "brightwhite"  ))
   (fg         '("#d8dee9" "#bfbfbf" "brightwhite"  ))
   (fg-alt     '("green4" "#2d2d2d" "white"        ))

   (grey       base4)
   (red        '("#ff6c6b" "#ff6655" "red"          ))
   (orange     '("#da8548" "#dd8844" "brightred"    ))
   (green      '("#98be65" "#99bb66" "green"        ))
   (teal       '("#4db5bd" "#44b9b1" "brightgreen"  ))
   (yellow     '("#ECBE7B" "#ECBE7B" "yellow"       ))
   (blue       '("#51afef" "#51afef" "brightblue"   ))
   (dark-blue  '("#2257A0" "#2257A0" "blue"         ))
   (magenta    '("#c678dd" "#c678dd" "brightmagenta"))
   (violet     '("#a9a1e1" "#a9a1e1" "magenta"      ))
   (cyan       '("#46D9FF" "#46D9FF" "brightcyan"   ))
   (dark-cyan  '("#5699AF" "#5699AF" "cyan"         ))

   ;; face categories -- required for all themes
   (highlight      "green")
   (vertical-bar   (chend-darken base1 0.1))
   (selection      dark-blue)
   (builtin        "#00b8ff")
   (comments       "#a7a7a7")
   (doc-comments   "#aaaaaa")
   (constants      "#bd00ff")
   (functions      "gold2")
   (keywords       "#004FFF")
   (methods        cyan)
   (operators      "cyan3")
   (type           "#00b8ff")
   (strings        "#DFD67A")
   (variables      "gold2")
   (numbers        orange)
   (region         "#3F90F7")
   (region-fg      "#FFF")
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright chend-dark-brighter-modeline)
   (-modeline-pad
    (when chend-dark-padded-modeline
      (if (integerp chend-dark-padded-modeline) chend-dark-padded-modeline 4)))

   (modeline-fg     fg)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        (chend-darken blue 0.475)
      `(,(chend-darken (car bg-alt) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        (chend-darken blue 0.45)
      `(,(chend-darken (car bg-alt) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   `(,(chend-darken (car bg-alt) 0.1) ,@(cdr bg-alt)))
   (modeline-bg-inactive-l `(,(car bg-alt) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (evil-goggles-default-face :inherit 'region :background (chend-blend region bg 0.5))

   ((line-number &override) :foreground fg-alt :background bg)
   ((line-number-current-line &override) :foreground fg :background bg)

   (font-lock-comment-face
    :foreground comments
    :background (if chend-dark-comment-bg (chend-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)

   (mode-line
    :background highlight :foreground highlight     :height 0.1
    :box nil)
   (mode-line-inactive
    :background bg :foreground bg    :height 0.1
    :box nil)
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight)
    :height 0.1)

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   ;; Chend modeline
   (chend-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (chend-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (chend-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (chend-modeline-buffer-project-root :foreground green :weight 'bold)

   ;; ivy-mode
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (chend-lighten base3 0.05))

   ;; org-mode
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden)

   ;; secondary region.
   (secondary-selection :background grey)
   )


  ;; --- extra variables ---------------------
  ())

(provide 'chend-dark-theme)

;;; chend-dark-theme.el ends here
