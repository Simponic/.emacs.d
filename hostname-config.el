(setq *hostname-regexs*
      '(
        (".*BasedBook"  basedbook) ;; Mac Air m1
        (  ".*neptune"  neptune)   ;; Desktop ubuntu
        (   ".*saturn"  saturn)    ;; Thinkpad arch
        (   ".*europa"  europa)    ;; Desktop artix
        ))

(setq *machine-configs*
      '(
        ((basedbook europa)
         (
          (font "PT Mono-14")
          (theme gruvbox-light-medium)
          ))
        ((saturn neptune)
         (
          (font "Scientifica-14")
          (theme gruvbox-light-medium)
          ))
        ((default)
         (
          (font "Menlo 16")
          (theme gruvbox-dark-soft)
          ))
        ))

(defun find-machine-symbol (hostname names-alist)
  (cond
   ((eq nil names-alist) 'default)
   (t (let* ((curr (car names-alist))
             (hostname-regex (car curr))
             (hostname-symbol (cadr curr)))
        (if (string-match hostname-regex hostname)
            hostname-symbol
          (find-machine-symbol hostname (cdr names-alist)))))))

(defun find-machine-config (machine-symbol configs)
  (cond
   ((eq nil configs) nil)
   (t (let* ((curr (car configs))
             (machines (car curr))
             (config (cadr curr)))
        (if (member machine-symbol machines)
            config
          (find-machine-config machine-symbol (cdr configs)))))))

(setq *machine* (find-machine-symbol (system-name) *hostname-regexs*))
(setq *config* (find-machine-config *machine* *machine-configs*))

(defun get-machine-config (prop)
  (cadr (assoc prop *config*)))
