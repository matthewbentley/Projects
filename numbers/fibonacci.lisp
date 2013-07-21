(defun should-continue (nth nth-supplied-p stop stop-supplied-p count curr-num)
  "NIL if it should go on until the next loop, T if not"
  (if
   (and
    (or (not nth-supplied-p) (< count nth))
    (or (not stop-supplied-p) (< curr-num stop)))
   NIL
   T))

(defun genfib (&key (nth 0 nth-supplied-p) (stop 0 stop-supplied-p))
  "Generates fibinacci sequence until (should-continue) tells it to stop"
  (do ((x 0 (+ x y))
       (y 1 x)
       (count 1 (1+ count)))
      ((should-continue nth nth-supplied-p stop stop-supplied-p count x))
    (print x)))

(genfib :stop 50 :nth 10)
