;;;;Calculates the value of pi to an arbitrary number of digets
;;;;Takes the number of decimals (after the "3.") from the first command line argument
;;;;Using Machin's formula (pi/4 = 4 arccot(5) - arccot(293))
;;;;To calculate arccot: arccot(x)= 1/x - 1/3x^3 + 1/5x^5 - 1/7x^7 ...

(defun arccot (x unity)
  "returns arccot of x, with precision defined by unity"
  (let ((xpower (floor (/ unity x))))
    (arccot-plus-helper (* x x) 1 xpower)))

(defun arccot-plus-helper (xsq n xpower)
  "I think this adds every other time"
  (let ((term (floor (/ xpower n))))
    (if (= term 0)
	0
	(+ (arccot-minus-helper xsq (+ n 2) (floor (/ xpower xsq)))
	   term))))

(defun arccot-minus-helper (xsq n xpower)
  "I think this subtracts every other time"
  (let ((term (floor (/ xpower n))))
    (if (= term 0)
	0
	(- (arccot-plus-helper xsq (+ n 2) (floor (/ xpower xsq)))
	   term))))


(defun pidigits (digits)
  "Calculates pi to digits (+10 to avoid rounding errors)"
  (let* ((unity (expt 10 (+ digits 10)))
	 (betterpi (* 4 (- (* 4 (arccot 5 unity)) (arccot 239 unity)))))
    (floor (/ betterpi (expt 10 10)))))

(defun piformat (how-many input)
  "Formats a number (like 31415) to pi (3.14159) and add a newline"
  (concatenate 'string (subseq input 0 1) "." (subseq input 1 (+ 1 how-many))))

(defvar *number* (parse-integer (second *posix-argv*)))
(when (equal (second *posix-argv*) NIL)
  (print "Please leave a command line value for the number of digits you want")
  (quit))

(print (piformat *number* (write-to-string (pidigits *number*))))

