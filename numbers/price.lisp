(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun enter-values ()
  (let ((l 0) (w 0) (c 0))
    (setf l (parse-integer (prompt-read "Enter length (in ft)")))
    (setf w (parse-integer (prompt-read "Enter width (in ft)")))
    (setf c (parse-integer (prompt-read "Enter cost per square foot (in $)")))
    (print (concatenate 'string "Total cost: $" (write-to-string (* l w c))))))

(enter-values)
