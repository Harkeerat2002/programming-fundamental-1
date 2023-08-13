;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Assignment_3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Data type for median    --> Numbers
; Data type for numbers   --> Numbers

; Input  = 3 numbers in random order
; Output = Median of those numbers
; Purpose Statement: To find the median of 3 numbers in random order. To have multiple conditions in which they are ordered differently and to have there median.
;(define (MEDIAN MEDIAN_NUMBER_1 MEDIAN_NUMBER_2 MEDIAN_NUMBER_3)

;MEDIAN should be 4
(check-expect (MEDIAN 4 2 8 ) 4)
;MEDIAN should be 4
(check-expect (MEDIAN 4 8 2 ) 4)
;MEDIAN should be 4
(check-expect (MEDIAN 2 4 8 ) 4)
;MEDIAN should be 4
(check-expect (MEDIAN 2 8 4 ) 4)
;MEDIAN should be 4
(check-expect (MEDIAN 8 4 2 ) 4)
;MEDIAN should be 4
(check-expect (MEDIAN 8 3 4 ) 4)


;Template
;(define (MEDIAN MEDIAN_NUMBER_1 MEDIAN_NUMBER_2 MEDIAN_NUMBER_3)
;  (cond
;   [..........]                                    Need 6 different conditions for each different scenario

   
;Code
(define (MEDIAN MEDIAN_NUMBER_1 MEDIAN_NUMBER_2 MEDIAN_NUMBER_3)
  (cond
   [(and (<= MEDIAN_NUMBER_1 MEDIAN_NUMBER_2) (<= MEDIAN_NUMBER_2 MEDIAN_NUMBER_3)) MEDIAN_NUMBER_2]
   [(and (<= MEDIAN_NUMBER_3 MEDIAN_NUMBER_2) (<= MEDIAN_NUMBER_2 MEDIAN_NUMBER_1)) MEDIAN_NUMBER_2]
   [(and (<= MEDIAN_NUMBER_3 MEDIAN_NUMBER_1) (<= MEDIAN_NUMBER_1 MEDIAN_NUMBER_2)) MEDIAN_NUMBER_1]
   [(and (<= MEDIAN_NUMBER_2 MEDIAN_NUMBER_1) (<= MEDIAN_NUMBER_1 MEDIAN_NUMBER_3)) MEDIAN_NUMBER_1]
   [(and (<= MEDIAN_NUMBER_2 MEDIAN_NUMBER_3) (<= MEDIAN_NUMBER_3 MEDIAN_NUMBER_1)) MEDIAN_NUMBER_3]
   [(and (<= MEDIAN_NUMBER_1 MEDIAN_NUMBER_3) (<= MEDIAN_NUMBER_3 MEDIAN_NUMBER_2)) MEDIAN_NUMBER_3]))
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Data type for MAXIMUM    --> Numbers
; Data type for numbers   --> Numbers

; Input  = 3 numbers in random order
; Output = Maximum of those numbers
; Purpose Statement: To find the maximum of 3 numbers given in random order.
;(define (3-max MAX_NUMBER_1 MAX_NUMBER_2 MAX_NUMBER_3)

(check-expect (3-max 5 7 9 ) 9)
(check-expect (3-max 3 8 2 ) 8)
(check-expect (3-max 9 7 3 ) 9)

;Template
;(define (3-max MAX_NUMBER_1 MAX_NUMBER_2 MAX_NUMBER_3)
;  (cond
;   [..........]                                    Need 3 different conditions for each different scenario


;Code
(define (3-max MAX_NUMBER_1 MAX_NUMBER_2 MAX_NUMBER_3)
        (cond
          [(and (<= MAX_NUMBER_1 MAX_NUMBER_3) (<= MAX_NUMBER_2 MAX_NUMBER_3)) MAX_NUMBER_3]
          [(and (<= MAX_NUMBER_1 MAX_NUMBER_2) (<= MAX_NUMBER_3 MAX_NUMBER_2)) MAX_NUMBER_2]
          [(and (<= MAX_NUMBER_2 MAX_NUMBER_1) (<= MAX_NUMBER_3 MAX_NUMBER_1)) MAX_NUMBER_1]))
;-------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Data type for C0ORDINATES    --> Numbers
; Data type for boolean       --> boolean opperation

; Input  = 2 point's cordinates
; Output = puts out
; Purpose Statement: To find the maximum of 3 numbers given in random order. 
;(define (left-of X1 Y1 X2 Y2))


;this should be true as the its towards right
(check-expect (left-of 3 3 4 4) #t)
;this should be false as the its towards left
(check-expect (left-of 4 4 3 3) #f)

;Template
;(define (left-of X1 Y1 X2 Y2)
  ;(cond           a condition in which if the x1 coordinate is smaller that x2 coordinate then it should return true otherwise it would be false

;Code
(define (left-of X1 Y1 X2 Y2)
  (cond
    [(< X1 X2) #true]
    [(> X1 X2) #false]))
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------
; Data type for CO0RDINATES              --> Numbers
; Data type for MIRROR COORDINATES       --> Numbers

; Input  = A point's cordinates
; Output = Prints out a point which mirrors the input point, therefore the x coordinate should be multiplied by a negative 1.
; Purpose Statement: To find the mirror point of the point which is inputed
;(define (mirror-vertical X1 Y1)

;the opposite of 3 (x coordinate) should be -3 to find the mirror point
(check-expect (mirror-vertical 3 7) (make-posn -3 7))
;the opposite of 3.8 (x coordinate) should be -3.8 to find the mirror point
(check-expect (mirror-vertical 3.8 10) (make-posn -3.8 10))
;the opposite of 10 (x coordinate) should be -10 to find the mirror point
(check-expect (mirror-vertical 10 7) (make-posn -10 7))
;the opposite of -10 (x coordinate) should be 10 to find the mirror point
(check-expect (mirror-vertical -10 7) (make-posn 10 7))

;Template
;(define (mirror-vertical X1 Y1)
; (make-posn ..... converting the x coordinate to its opposite .....

;Code

(define (mirror-vertical X1 Y1)
  (make-posn(- X1 (* 2 X1)) Y1))
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------

; Data type for NUMBERS OF THE MONTHS  --> Numbers
; Data type for MONTHS                 --> String
; Data type for ERROR OUTPUT           --> String

; Input  = A months numbers which is between 1 and 12
; Output = Either print out the month corresponding to the number or asks the users to input a valid date.
; Purpose Statement: To find the month correspoind to the number inputed
;(define (number->month x)

; 1 should correspond to January
(check-expect (number->month 1) "January")
; 2 should correspond to Febuary
(check-expect (number->month 2) "Febuary")
; 3 should correspond to March
(check-expect (number->month 3) "March")
; 4 should correspond to April
(check-expect (number->month 4) "April")
; 5 should correspond to May
(check-expect (number->month 5) "May")
; 6 should correspond to June
(check-expect (number->month 6) "June")
; 7 should correspond to July
(check-expect (number->month 7) "July")
; 8 should correspond to Agust
(check-expect (number->month 8) "Agust")
; 9 should correspond to September
(check-expect (number->month 9) "September")
; 10 should correspond to October
(check-expect (number->month 10) "October")
; 11 should correspond to November
(check-expect (number->month 11) "November")
; 12 should correspond to December
(check-expect (number->month 12) "December")

; The number is bigger than 12 it should output a error message
(check-expect (number->month 13) "please put a valid month number")
; The number is smaller than 1 it should output a error message
(check-expect (number->month 0)  "please put a valid month number")

;Template
;(define (number->month x)
;  (cond ... should have condition for each month and its corresponding number ...
;        ... should also have error message if the month number is not between 1 and 12 ...

;Code
(define (number->month x)
  (cond
    [(= x 1) "January"]
    [(= x 2) "Febuary"]
    [(= x 3) "March"]
    [(= x 4) "April"]
    [(= x 5) "May"]
    [(= x 6) "June"]
    [(= x 7) "July"]
    [(= x 8) "Agust"]
    [(= x 9) "September"]
    [(= x 10) "October"]
    [(= x 11) "November"]
    [(= x 12) "December"]
    [else "please put a valid month number"]))
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------

; Data type for YEAR NUMBER               --> Numbers, could be negative as well but should be an integer
; Data type for CONDITION (TRUE/FALSE)    --> Boolean

; Input  = A year number (only integer)
; Output = Boolean saying if its leap year "true" else "false"
; Purpose Statement: To find if a year is a leap year or not
;(define (leap-year x)

;1868 is a leap year so should output true
(check-expect (leap-year 1868) "true")
;2000 is a leap year so should output true
(check-expect (leap-year 2000) "true")
;2020 is a leap year so should output true
(check-expect (leap-year 2020) "true")

;2017 is not a leap year so should out put false
(check-expect (leap-year 2017) "false")
;2017 is not a leap year so should out put false
(check-expect (leap-year 1900) "false")
;2017 is not a leap year so should out put false
(check-expect (leap-year 2019) "false")
; 20.19 is not a integer so should output false
(check-expect (leap-year 20.19) "false")

;Template
; the formula for leap year is that if the (x modulo 4) = 0 then its a leap year. If (x modulo 100) = 0 and also (x modulo 400) = 0 then that year is a leap year

;(define (leap-year x)
; (cond ... checking the year is a integer or not ...
;          (cond ... if (x mod 4) = 0 and (x mod 100) doesnt = 0 then it should return true ...
;                ... if (x mod 100) = 0 and also (x mod 400) then it should return true ...
; otherwise if they done satisfy any of the condtions it should return false

;Code
(define (leap-year x)
  (cond
    [(integer? x) (cond ;checking the integer conditions
                    [(and (= (modulo x 4) 0) (not (equal? (modulo x 100) 0))) "true"]
                    [else                                             ;conditions from the template but used nest loops to make it simpler to excute and understand the logic
                     (if (and (= (modulo x 100) 0) (= (modulo x 400) 0))
                         "true" "false")])] ;else statements
    [else "false"]))
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------

; Data type for DATE INPUT            --> Numbers (but integers and between 1 and 31)
; Data type for MONTH INPUT           --> Numbers (but integers and between 1 and 12)
; Data type for YEAR INPUT            --> Numbers (but integers only)

; Data type for DATE OUTPUT           --> Numbers (but integers and between 1 and 31)
; Data type for MONTH OUTPUT          --> String
; Data type for YEAR OUTPUT           --> Numbers (but integers and between 1 and 12)
; Data type for BCE                   --> String

; Input  = A date month year (only in integers)
; Output = a string out put with date (number) month (string) year(number) BCE(if required)
; Purpose Statement: To converted the inputed date into a different format
;(define (date->string d m y)

;Correct situations in which the input is written correctly
(check-expect (date->string 30 3 1204) "30 March 1204")
(check-expect (date->string 30 3 -1204) "30 March 1204 BCE")

;Different situations in which the input is wrong (doesnt satisfy the conditions)
(check-expect (date->string 30 3 0) "please put a valid date")
(check-expect (date->string 30 0 2000) "please put a valid date")
(check-expect (date->string 30 13 0) "please put a valid date")
(check-expect (date->string 33 3 2000) "please put a valid date")
(check-expect (date->string 0 3 0) "please put a valid date")
(check-expect (date->string 1.3 3 2000) "please put a valid date")
(check-expect (date->string 1 3.3 2000) "please put a valid date")
(check-expect (date->string 1 3 20.01) "please put a valid date")

;Template
;there must be multiple conditions which are being used in order to print out the required version of the date.
;Conditions
;    - inputs must be integers
;    - year should not be equal to 0
;    - the days should be between 1 and 31
;    - the months should be between 1 and 12
;    - if none of the above conditions are met then it should return an error


;(define (date->string d m y)
;    (cond ... checks if all the inputs are integers or not ...
;                          (cond ... checks if year is not equal to 0 ...
;                                      (cond ... the days should be between 1 and 31
;                                             (cond .. the months should be beween 1 and 12 ...
;                                                   (... prints out (date) [month (calls the number->string in order to obtain the string version)]
;                                                                                                              (year) [BCE (if year is less than 0) ...
; if none of the conditions are satisfied return error


;Code
(define (date->string d m y)
  (cond
    [(and (integer? d) (integer? m) (integer? y)) (if (not (equal? y 0))
                                                      (cond
                                                        [(and (<= 1 d 31) (<= 1 m 12))
                                                         (cond
                                                           [(< y 0) (string-append (number->string d) " " (number->month m) " " (number->string (* -1 y)) " BCE")]
                                                           [(> y 0) (string-append (number->string d) " " (number->month m) " " (number->string y))])]
                                                        [else "please put a valid date"])
                                                      "please put a valid date")]
    [else "please put a valid date"]))
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------

; Data type for Month  --> Number (only integer and between 1 and 12) 

;;Data type for Question 11
;Data type for YEAR  --> Number (only integer and doesnt equal to 0)


; Input  = Month [question 11 (year)
; Output = return number of days in a month "including leap months in leap years" (done to make the question 11 easier to execute)
; Purpose Statement: To find number of days in each month. Also included Leap Year so that it can be easier for question 11
;(define (days-in-months m y)

;Possible Combinations which are true
(check-expect (days-in-months 1 2000) 31)
(check-expect (days-in-months 2 2001) 28)
(check-expect (days-in-months 7 2001) 31)
(check-expect (days-in-months 8 2001) 31)
(check-expect (days-in-months 9 2001) 30)
(check-expect (days-in-months 4 2000) 30)
(check-expect (days-in-months 2 2020) 29)

;Possible Combination what is not true
(check-expect (days-in-months 0 2001) "please put a valid date")
(check-expect (days-in-months 13 2001) "please put a valid date")
(check-expect (days-in-months 1.3 2001) "please put a valid date")
(check-expect (days-in-months 13 20.01) "please put a valid date")

;Template
;(define (days-in-months m y)
;    (cond ... both the (month) and (year) should be a integer ...
;       (cond ... (month) should be a way in which first goes from month is between 1 and 7 and then month is between 8 and 12 ...
;          (cond ... if the leap year is true then should return 29 ...
;                ... if the leap year is false then should return 28 ...
;                ... if it is even then return 30 and after 7th month is is even return 31 ...
;                ... if it is odd then return 31 and after 7th month is is even return 30 ...
;   else it should return error

;Code
(define (days-in-months m y)
  (cond
    [(and (integer? m) (integer? y)) (cond
                                       [(<= 1 m 7) (cond
                                                     [(and (equal? (leap-year y) "true") (= m 2)) 29]
                                                     [(and (equal? (leap-year y) "false") (= m 2)) 28]
                                                     [(and (even? m) (not (equal? m 2))) 30]
                                                     [(odd? m) 31])]
                                       [(<= 8 m 12) (cond
                                                      [(even? m) 31]
                                                      [(odd? m) 30])]
                                       [else "please put a valid date"])]
    [else "please put a valid date"]))
;---------------------------------------------------------------------------------------------------------------------------------------------------------------------

; Data type for Date          --> Number (only integer and between 1 and 31)
; Data type for Month         --> Number (only integer and between 1 and 12)
; Data type for Year          --> Number (integer should not equal to 0)
; Data type for true or false --> Boolean

; Input  = Date Month Year
; Output = if the date is valid or not and also for the leap years (solved in the previouse question). It should return either true or false hence boolean
; Purpose Statement: To find if the inputed date would be a valid date or not. if it 
;(define (date-valid d m y)

;for an even month
(check-expect (date-valid 31 1 2000) "valid")
;for an even month with a date bellow 31
(check-expect (date-valid 28 1 2001) "valid")
;for an odd month 
(check-expect (date-valid 30 4 2000) "valid")
;for an odd month with a date bellow 30
(check-expect (date-valid 28 4 2020) "valid")
;for february when its a leap year
(check-expect (date-valid 29 2 2020) "valid")
;for february when its a leap year but with a date bellow 29
(check-expect (date-valid 24 2 2020) "valid")
;for february when its not a leap year
(check-expect (date-valid 28 2 2019) "valid")
;for february when its not a leap year but with a date bellow 28
(check-expect (date-valid 24 2 2019) "valid")
;a year with a negative year
(check-expect (date-valid 29 2 -2020) "valid")


;when the date is more than normal
(check-expect (date-valid 31 2 2001) "invalid")
;when the date is less than normal
(check-expect (date-valid -1 2 2001) "invalid")
;when the year is 0
(check-expect (date-valid 31 2 0) "invalid")
;when the month is less than normal
(check-expect (date-valid 31 0 2001) "invalid")
;when the month is more than normal
(check-expect (date-valid 31 13 2001) "invalid")
;when the date is more than normal when its not a leap year
(check-expect (date-valid 29 2 2001) "invalid")
;when the the date is not a integer
(check-expect (date-valid 2.9 2 2001) "invalid")
;when the the month is not a integer
(check-expect (date-valid 29 2.3 2001) "invalid")
;when the the year is not a integer
(check-expect (date-valid 29 2 20.01) "invalid")


;since the factor for leap year has been already solved in the previouse question the final template would be much more simplet.
; All the conditions:
;       - Year should be equal to 0
;       - Month, Date and Year should be an integer
;       - Month should be in between 1 and 12
;       - Days should be in between 1 and 31
; if all the conditions are met it should return valid otherwise invalid

;Template
;(define (date-valid d m y)
;  (cond ... year should not be equal to 0 ...
;    (cond ... date , month and year should be all integer ...
;      (cond ... month should be inbetween 1 and 12 ...
;        (cond ... if days-in-month equals to 30 and day is between 1 and 30 returns valid ...
;              ... if days-in-month equals to 31 and day is between 1 and 31 returns valid ...
;              ... if days-in-month equals to 28 and day is between 1 and 28 returns valid ...
;              ... if days-in-month equals to 29 and day is between 1 and 29 returns valid ...
; else it should return error

;Code
(define (date-valid d m y)
  (cond
    [(and (not (equal? y 0)) (integer? d) (integer? m) (integer? y)) (cond
                                                                       [(<= 1 m 12) (cond
                                                                                      [(and (= (days-in-months m y) 30) (<= 1 d 30)) "valid"]
                                                                                      [(and (= (days-in-months m y) 31) (<= 1 d 31)) "valid"]
                                                                                      [(and (= (days-in-months m y) 28) (<= 1 d 28)) "valid"]
                                                                                      [(and (= (days-in-months m y) 29) (<= 1 d 29)) "valid"]
                                                                                      [else "invalid"])] 
                                                                       [else "invalid"])]
    [else "invalid"])) 




       

  

 








































