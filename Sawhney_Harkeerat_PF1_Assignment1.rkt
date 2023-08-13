;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Assigment1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
;Excercise 2.1.1
(define HOURS-WEEK-1 5)
(define HOURS-WEEK-2 8)
(define HOURS-WEEK-3 12)
(define HOURS-WEEK-4 10)

(define TOTAL-HOURS (+ HOURS-WEEK-1 HOURS-WEEK-2 HOURS-WEEK-3 HOURS-WEEK-4))
(string-append "The total hours are "(number->string TOTAL-HOURS))
;Excercise 2.1.2
(define NUMBER-OF-WEEKS 4)
(define AVERAGE-WEEKS (/ TOTAL-HOURS NUMBER-OF-WEEKS))

(string-append "The total average hours is "(number->string AVERAGE-WEEKS))    ;does not show the result in decimals as the AVERAGE-WEEKS is a string.

;Excercise 2.1.3
(define TIME-1 (/ 22 60 ))
(define TIME-2 (/ 60 60 ))
(define TIME-3 (/ 80 60 ))

(define DISTANCE-TRAVELED (+ (* TIME-1 80) (* TIME-2 120) (* TIME-3 90)))
(string-append "The total distance traveled "(number->string DISTANCE-TRAVELED))    ;does not show the result in decimals as the DISTANCE-TRAVELED is a string.

;Excercise 2.1.4
(define (SQUARE x y)           ;try to understand the function calling technique
  (* x y))
  
(define BABY-PIZZA-AREA (* 0.25 pi (SQUARE 18 18)))
(define STANDARD-PIZZA-AREA (* 0.25 pi (SQUARE 33 33)))

(define BABY-PIZZA-VALUE (/ BABY-PIZZA-AREA 9))
(define STANDARD-PIZZA-VALUE (/ STANDARD-PIZZA-AREA 12))

(< BABY-PIZZA-VALUE STANDARD-PIZZA-VALUE)

;Excercise 2.1.5
(define (SENTENCE-BUILD NAME) (string-append "Hello " NAME " welcome to PF1!"))
(define HI-TO-ME (SENTENCE-BUILD "Harkeerat"))

;Excercise 2.1.6
(define (greet name) (string-append "Hello " name " welcome to PF1!"))

(greet "Sawhney")
;---------------------------
;Sign 1
(define SIGN-1-1-1 (overlay (triangle 95 "solid" "white")
                            (triangle 95 "solid" "white")))

(define SIGN-1-1-2-1 (overlay (triangle/aas -60 -60 120 "solid" "red")
                              (triangle/aas -60 -60 160 "outline" "white")))


(define SIGN-1-1-2-2 (overlay (triangle/aas -61 -61 121 "outline" (pen "red" 5 "solid" "round" "bevel"))
                              SIGN-1-1-2-1))

(define SIGN-1-1-2-3 (overlay/align/offset "center" "center"
                                        SIGN-1-1-1
                                        0 -2
                                        SIGN-1-1-2-2))

(define SIGN-1-1-3-1 (circle 3.8 "solid" "red"))
(define SIGN-1-1-3-2 (circle 2.8 "solid" "red"))
(define SIGN-1-1-3-3 (circle 2.8 "solid" "red"))

(define SIGN-1-1-3 (overlay/align/offset "center" "center"
                                         SIGN-1-1-3-1
                                         0 51.9 
                                         SIGN-1-1-2-3))

(define SIGN-1-1-4 (overlay/align/offset "center" "center"
                                         SIGN-1-1-3-2
                                         59.7 -53.96
                                         SIGN-1-1-3))

(define SIGN-1-TRIANGLE (overlay/align/offset "center" "center"
                                              SIGN-1-1-3-3
                                              -59.7 -53.96
                                              SIGN-1-1-4))

(define SIGN-1-RECTANGLE (rectangle 7 27 "solid" "black"))
(define SIGN-1-RECTANGLE-1 (rectangle 54 5 "solid" "black"))
(define SIGN-1-TRIANGLE-1 (triangle 7.5 "solid" "black"))


(define SIGN-1-SHAPE-1 (overlay/align/offset "center" "center"
                                          SIGN-1-RECTANGLE
                                          0 -14
                                          SIGN-1-TRIANGLE-1))
(define SIGN-1-SHAPE-2 (overlay/align/offset "center" "center"
                                             SIGN-1-SHAPE-1
                                             10 0
                                             SIGN-1-SHAPE-1))
(define SIGN-1-SHAPE-3 (overlay/align/offset "center" "center"
                                             SIGN-1-SHAPE-2
                                             20 0
                                             SIGN-1-SHAPE-2))
(define SIGN-1-SHAPE-FINAL-1 (overlay/align/offset "center" "center"
                                                   SIGN-1-SHAPE-3
                                                   25 0
                                                   SIGN-1-SHAPE-1))                  ;SORRY WASTED TOO MUCH TIME HERE AND COULD HAVE DONE IT IN A MORE EFFICIENT WAY.
                                                                                     ;HOPEFULLY YOU COULD UNDERSTAND
(define SIGN-1-SHAPE-FINAL-2 (overlay/align/offset "center" "center"
                                                   SIGN-1-SHAPE-FINAL-1
                                                   0 -5
                                                   SIGN-1-RECTANGLE-1))
(define SIGN-1-SHAPE-FINAL (overlay/align/offset "center" "center"
                                           SIGN-1-SHAPE-FINAL-2
                                           0 8
                                           SIGN-1-RECTANGLE-1))
(define SIGN-1-FINAL (overlay/align/offset "center" "center"
                                           SIGN-1-SHAPE-FINAL
                                           0 -20
                                           SIGN-1-TRIANGLE))
SIGN-1-FINAL

(string-append "Level crossing  " " with barrier or gate, (please do notice the corners, spent way too much time in it)")

                           
(define SIGN-1 (overlay (circle 34 "solid" "white")
                        (circle 50 "solid" "red")))
SIGN-1
(string-append "Generall prohibition " " of vehicular traffic in both directions")
;Sign 2
(define SIGN-2 (overlay (rectangle 85 20 "solid" "white")
                        (circle 50 "solid" "red")))
SIGN-2
(string-append "No entry for vehicular traffic " " (one-way street; possible exceptions for bicycles and mopeds must be indicated)")
;Sign 3
(define SIGN-3-1-1 (overlay (rectangle 40 12 "solid" "red")
                          (rectangle 42 14 "solid" "white")))

(define SIGN-3-1-2 (overlay (rectangle 12 40 "solid" "white")
                          (rectangle 12 40 "solid" "white")))

(define SIGN-3-1 (overlay/align/offset "center" "center"
                                       SIGN-3-1-1
                                       0 20
                                       SIGN-3-1-2))
                                       
(define SIGN-3-2 (overlay (square 66 "solid" "blue")
                        (square 68 "solid" "white")
                        (square 70 "outline" "black")))

(define SIGN-3 (overlay/align/offset "center" "center"
                                     SIGN-3-1
                                     0 -10
                                     SIGN-3-2)) 
SIGN-3
                                     







