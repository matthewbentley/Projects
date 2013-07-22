;;;;Continues to ask user if they want the next prime until user presses ctrl+c
;;;;Takes no command line arguments

(defun check-divisibility (dividend divisor)
  "Checks if a number if dividend is wholey divisable by divisor by using the mod function"
  (equal (mod dividend divisor) 0))

(defun prime-check (to-check)
  "Checks if a number is prime by checking if it is divisible by each number between it and its sqrt"
  (let ((max (sqrt (abs to-check))))
    (do ((d 2 (+ d 1)))
	((or (>= d max) (check-divisibility to-check d)) (not (check-divisibility to-check d))))))

(when (equal (second *posix-argv*) NIL)
  (print "Please enter the number to check as the first argument")
  (quit))

(let ((stop-at (parse-integer (second *posix-argv*))) (count 0))
  (do ((d 3 (+ d 2)))
      ((>= count stop-at))
    (when (prime-check d)
      (setf count (1+ count))
      (if (equal count stop-at)
	  (print d)))))
