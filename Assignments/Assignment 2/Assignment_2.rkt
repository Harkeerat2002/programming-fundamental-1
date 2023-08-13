;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Assignment_2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Data type for length in centimeters --> Numbers
; Data type for length in inches      --> Numbers

; Input  = Length in Inches
; Output = Lenght in Centimeters
; Purpose Statement: Converts Lenght in Inches to Lenght in Centimeters
;(define (Length_Centimeters Length_Inches) 0)

; (Length_Centimeters 1) should be 2.54
(check-expect (Length_Centimeters 1) 2.54)

; (Length_Centimeters 2) should be 5.08
(check-expect (Length_Centimeters 2) 5.08)

; Template
    ;(define (Length_Centimeters Length_Inches)
       ;(... Length_Inches ...))

; Code
(define (Length_Centimeters Length_Inches)
  (* Length_Inches 2.54))
;---------------------------------------------------------------------------------------------

; Data type for mean values --> Numbers
; Data type for mean        --> Numbers

; Input   = 4 integers
; Output  = Addition of four number / 4
; Purpose = Finding the mean for the 4 numbers
;(define (Mean Number_1 Number_2 Number_3 Number_4) 0)

; (Mean 1 2 3 4) should be 2.5
(check-expect (Mean 1 2 3 4) 2.5)

; (Mean 2 4 6 8) should be 5
(check-expect (Mean 2 4 6 8) 5)

; Template
;(define (Mean Number_1 Number_2 Number_3 Number_4)
  ;(/ (... Number_1 Number_2 Number_3 Number ...))

; Code---------------------------------------------------------------------------------------------
(define (Mean Number_1 Number_2 Number_3 Number_4)
  (/ (+ Number_1 Number_2 Number_3 Number_4) 4))
;---------------------------------------------------------------------------------------------

; Data type for area-triangle --> Numbers
; Data type for height        --> Numbers
; Data type for base          --> Numbers

; Input   = Height and Base
; Output  = area-triangle
; Purpose = Finding the area of the triangle
;(define (area-triangle height base)0)

;(area-triangle 4 9) should be 18
(check-expect (area-triangle 4 9) 18)

;(area-triangle 3 10) should be 18
(check-expect (area-triangle 3 10) 15)

; Template
;(define (area-triangle height base)
  ;(... height base) ...)

; Code
(define (area-triangle height base)
  (/ (* height base) 2))
;---------------------------------------------------------------------------------------------

; Data type for Square_Root    --> Number
; Data type for Perfect_Square --> Number
; Data type for cond           --> Boolean

; Input   = Number
; Output  = Boolean
; Purpose = To find out if the input is a perfect square or not
;(define (perfect_square square_root)

;(perfect_square 4) should be #true)
(check-expect (perfect_square 4) #true)

;(perfect_square 5) should be #false)
(check-expect (perfect_square 5) #false)

;Template
;(define (perfect_square square_root)
  ;(...cond...)

;Code
(define (perfect_square square_root)
  (cond
   [(integer? (sqrt square_root)) #true]
   [else #false]))
;---------------------------------------------------------------------------------------------

; Data type for Price in CHF    --> Number
; Data type for Number of Rolls --> Number

; Input   = Number
; Output  = Number
; Purpose = To find what is the final price of the tolite rolls
;(define (final_tolitepaper_price number_of_rolls)

;(final_tolitepaper_price 6) should show 12 
(check-expect (final_tolitepaper_price 6) 12)
;(final_tolitepaper_price 20) should show 36
(check-expect (final_tolitepaper_price 20) 36)
;(final_tolitepaper_price 21) should show 35.7
(check-expect (final_tolitepaper_price 21) 35.7)

;Template
;(define (final_tolitepaper_price number_of_rolls)
  ;(...cond...)

;Code

(define (final_tolitepaper_price number_of_rolls)
  (cond
    [(<= number_of_rolls 6) (* 2 number_of_rolls)]
    [(< 6 number_of_rolls 21) (- (* 2 number_of_rolls)  (* 0.10 (* 2 number_of_rolls)))]
    [(<= 21 number_of_rolls) (- (* 2 number_of_rolls)  (* 0.15 (* 2 number_of_rolls)))]))
;---------------------------------------------------------------------------------------------

; Data type for Neo Latin Note  --> string
; Data type for English Not     --> string

; Input   = string
; Output  = string
; Purpose = To find the engish version of the notes in latin
;(define (neo_latin_note neo_latin))

;(neo_latin_note "do") should be C
(check-expect (neo_latin_note "do") "C")
;(neo_latin_note "re") should be D
(check-expect (neo_latin_note "re") "D")
;(neo_latin_note "mi") should be E
(check-expect (neo_latin_note "mi") "E")
;(neo_latin_note "fa") should be F
(check-expect (neo_latin_note "fa") "G")
;(neo_latin_note "sol") should be G
(check-expect (neo_latin_note "sol") "H")
;(neo_latin_note "la") should be A
(check-expect (neo_latin_note "la") "A")
;(neo_latin_note "si") should be B
(check-expect (neo_latin_note "si") "B")

;Template
;(define (neo_latin_note neo_latin)
  ;(...cond...)
    
;Code
(define (neo_latin_note neo_latin)
  (cond
    [(equal? neo_latin "do") "C"]
    [(equal? neo_latin "re") "D"]
    [(equal? neo_latin "mi") "E"]
    [(equal? neo_latin "fa") "G"]
    [(equal? neo_latin "sol") "H"]
    [(equal? neo_latin "la") "A"]
    [(equal? neo_latin "si") "B"]))
;---------------------------------------------------------------------------------------------

; Data type for Quarter Hours --> Integer
; Data type for Degrees       --> string

; Input   = Integer
; Output  = string
; Purpose = To find the angles of different quarters)

;(quarter-->angle 0) should be 90 degrees
(check-expect (quarter-->angle 0) "90 degrees")
;(quarter-->angle 1) should be 0 degrres
(check-expect (quarter-->angle 1) "0 degrees")
;(quarter-->angle 2) should be 0 degrres
(check-expect (quarter-->angle 2) "270 degrees")
;(quarter-->angle 1) should be 0 degrres
(check-expect (quarter-->angle 3) "180 degrees")

;Template
;(define (quarter-->angle quarter_hours)
  ;(...cond...)
    
;Code
(define (quarter-->angle quarter_hours)
  (cond
    [(equal? quarter_hours 0) "90 degrees"]
    [(equal? quarter_hours 1) "0 degrees"]
    [(equal? quarter_hours 2) "270 degrees"]
    [(equal? quarter_hours 3) "180 degrees"]))
;---------------------------------------------------------------------------------------------
(require 2htdp/image)

(define Circle (circle 100 "outline" "black"))
(define Rectangle (rectangle 2 100 "solid" "black"))

(define Clock (overlay/align/offset "center" "center"
                                    Circle
                                    0 -50
                                    Rectangle))
(define (clock-minutes hour)
  (cond
    [





































