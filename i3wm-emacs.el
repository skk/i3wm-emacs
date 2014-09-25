;;; i3wm-emacs.el --- i3wm emacs mode

;; Copyright (C) 2014 Steven Knight

;; Author: Steven Knight <steven@knight.cx>
;; URL: https://github.com/skk/i3wm-emacs
;; Version: 0.9.0
;; Keywords: i3 config

;; This file is NOT part of GNU Emacs.

;; License

;;; Commentary: 

;; TODO Add commentary

;; Copyright 2014 Steven Knight (steven@knight.cx)

;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at

;;     http://www.apache.org/licenses/LICENSE-2.0

;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

;;; Code


(define-derived-mode i3wm-emacs text-mode
                     "i3wm-emacs" "Major mode for editing configuration files for i3 (http://i3wm.org/)."
                     
  (defvar i3-config-keywords
    '("set" "exec" "exec_alwyas" "bindsym" "bindcode" "font"
      "floating_modifier" "floating_minimum_size" "floating_maximum_size"
      "default_orientation" "workspace_layout" "new_window" "hide_edge_borders"
      "for_window" "assign" "workspace" "colorclass" "ipc-socket" "focus_follows_mouse"
      "popup_during_fullscreen" "force_focus_wrapping" "force_xinerama" "workspace_auto_back_and_forth")
    "i3 Config keywords")
  
  (defvar i3-config-types
  '()
  "i3 Config types.")

  (defvar i3-config-constants
    '()
    "i3 Config constants.")

  (defvar i3-config-events
    '()
    "i3 Config events.")

  (defvar i3-config-functions
    '()
    "i3 Config functions.")

  (defvar i3-config-keywords-regexp (regexp-opt i3-config-keywords 'words))
  (defvar i3-config-type-regexp (regexp-opt i3-config-types 'words))
  (defvar i3-config-constant-regexp (regexp-opt i3-config-constants 'words))
  (defvar i3-config-event-regexp (regexp-opt i3-config-events 'words))
  (defvar i3-config-functions-regexp (regexp-opt i3-config-functions 'words))


  (setq i3-config-font-lock-keywords
  `(
    (,i3-config-type-regexp . font-lock-type-face)
    (,i3-config-constant-regexp . font-lock-constant-face)
    (,i3-config-event-regexp . font-lock-builtin-face)
    (,i3-config-functions-regexp . font-lock-function-name-face)
    (,i3-config-keywords-regexp . font-lock-keyword-face)
    ;; note: order above matters.  
    ))
  
  ;; code for syntax highlighting
  (setq font-lock-defaults '((i3-config-font-lock-keywords)))

  ;; clear memory
  (setq i3-config-keywords nil)
  (setq i3-config-types nil)
  (setq i3-config-constants nil)
  (setq i3-config-events nil)
  (setq i3-config-functions nil))

(provide 'i3wm-emacs)

;;; i3wm-emacs.el ends here
