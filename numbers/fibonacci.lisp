;;;;Generates up to either the nth number in the fibonacci sequence or the last number less than n
;;;;Call with the letter n for nth, or m to stop at a max value, followed by a value

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

(when (not (or (equal (second *posix-argv*) "m") (equal (second *posix-argv*) "n")))
  (print "Please use either n for nth or m for max value as the first argument")
  (quit))

(when (equal (third *posix-argv*) NIL)
  (print "Please enter a number for the second argument")
  (quit))
(cond ((equalp (second *posix-argv*) "m")
       (genfib :stop (parse-integer (third *posix-argv*))))
      ((equalp (second *posix-argv*) "n")
       (genfib :nth (parse-integer (third *posix-argv*))))
      (T (print "Something went wrong :O")))
