;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Examples06-errors_) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; CHECKED TEMPERATURE CONVERSION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Data types
; a Temperature is a Number
; interpretation: it represents a temperature in degrees

;; Input/output
; fahrenheit->celsius : Temperature -> Temperature
; convert Fahrenheit temperature `fahr-temp` to the Celsius scale
(define (fahrenheit->celsius fahr-temp)
  (* 5/9 (- fahr-temp 32)))

;; Examples
(check-expect (fahrenheit->celsius 32) 0)
(check-expect (fahrenheit->celsius 212) 100)
(check-expect (fahrenheit->celsius 50) 10)

;; For error handling: input validity predicate
; temperature? : Any -> Boolean
; does `v` represent a valid Temperature?
(define (temperature? v)
  (number? v))

(check-expect (temperature? 12.3) #true)
(check-expect (temperature? -20) #true)
(check-expect (temperature? "cold") #false)

;; Checked version of fahrenheit->celsius
; fahrenheit->celsius-checked : Any -> Temperature
; require: (temperature? fahr-temp)
; convert Fahrenheit temperature `fahr-temp` to the Celsius scale
(define (fahrenheit->celsius-checked fahr-temp)
  (cond
    [(temperature? fahr-temp)         ; input is valid
     (fahrenheit->celsius fahr-temp)]
    [else                             ; input is invalid
     (error 'fahrenheit->celsius-checked "temperature expected")]))


;;; CHECKED STRING MANIPULATION
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; remove-first : String -> String
; remove first character of `s`
(define (remove-first s)
  (substring s 1 (string-length s)))

;; For error handling: input validity predicate
; nonempty-string? : Any -> Boolean
; does `v` represent a valid Temperature?
(define (nonempty-string? s)
  (and (string? s)
       (> (string-length s) 0)))

(check-expect (nonempty-string? "abc") #true)
(check-expect (nonempty-string? "") #false)
(check-expect (nonempty-string? 42) #false)

;; Checked version of remove-first
; remove-first-checked : Any -> String
; require: (nonempty-string? s)
; remove first character of `s`
(define (remove-first-checked s)
  (cond
    [(nonempty-string? s)  ; input is valid
     (remove-first s)]
    [else                  ; input is invalid
     (error 'remove-first-checked "nonempty string expected")]))

;; Robust version of remove-first
; remove-first-robust : Any -> Maybe<String>
; remove first character of `s` if (nonempty-string? s)
; otherwise, return #false
(define (remove-first-robust s)
  (cond
    [(nonempty-string? s) (remove-first s)] ; input is valid
    [else #false]))                         ; input is invalid
