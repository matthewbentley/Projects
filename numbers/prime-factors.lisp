;;;;Returns the prime factors of a number
;;;;Takes one argument, an integer to factor

(defun check-divisibility (dividend divisor)
  "Checks if a number if dividend is wholey divisable by divisor by using the mod function"
  (equal (mod dividend divisor) 0))

(defun prime-check (to-check)
  "Checks if a number is prime by checking if it is divisible by each number between it and its sqrt"
  (let ((max (sqrt (abs to-check))))
    (do ((d 2 (+ d 1)))
	((or (>= d max) (check-divisibility to-check d)) (not (check-divisibility to-check d))))))

(defun gen-factors (number)
  "Generates the prime factors for a number by looping though loop', with each loop' finding the next prime factor"
  (let ((factors '()))
    (when (> 0 number)
      (setf factors (append factors '(-1)))
      (setf number (* -1 number)))
    (do ((should-end nil nil))
	((prime-check number))
      (do ((d 2 (+ d 1)))
	  (should-end)
	(when (check-divisibility number d)
	  (setf factors (append factors (list d)))
	  (setf number (/ number d))
	  (setf should-end T))))
    (setf factors (append factors (list number)))))

(when (equal (second *posix-argv*) NIL)
  (print "Please enter the number to check as the first argument")
  (quit))
(defvar *number* (parse-integer (second *posix-argv*)))

(print (gen-factors *number*))
