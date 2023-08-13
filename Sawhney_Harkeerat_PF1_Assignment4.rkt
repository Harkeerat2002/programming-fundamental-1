;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Sawhney_Harkeerat_PF1_Assignment4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

;--------------------------
;Design Recipe for the Line
;--------------------------
;Data Type Deffination
;     Line- It is a structure which consists the start of the line and the end of the line (structure, image)
;           Start and end are the coordinates of the line (posn= (start end))

;Input = start (coordinates, integers) end (coordinates, integers)
;Output = - A line in the canvas from the point (start) to point (end)
;         - No line exists 
;header (define-struct Line [start end])

;Code
(define-struct Line [start end])

;-------------------------------
;Design Recipe for the AppState
;-------------------------------
;Data Type Deffination:
;      Canvas = Image
;      currLine = Line
;      hasquit = boolean

;Input = Canvas (image) currLine (Line) hasquit (boolean)
;Output = repersents the state of the appstate at the momment
;Purpose: AppState consists of information of the drawing app's state at the momment of the app.
;Header: (define-struct AppState [canvas currLine hasquit]) 


;Code
(define-struct AppState [canvas currLine hasquit])

;---------------------------------
;Design Recipe for making the line
;---------------------------------
;Data Type Deffination
;      Rectangle = Image

;Input = draw->AppState(image)
;Output = image
;Purpose: returns an image to appstate which consists of the drawn line
;Header: (define (draw app-state) (rectangle 500 500 "solid" "black"))

;Template
;(define empty-canvas (overlay/align "center" "center"
;                                          (...rectangle ...)
;                                          (...rectangle ...)))
; 
;(define (get-Line-start app-state)
;  (if (AppState exists output app-state) 
;      (if (Line exists (output currLine))
;          (if there is a start of Line (output currLine))
;          otherwise #false) 
;      otherwise #false)) 
;  
;(define (get-Line-end app-state)
;  (if (AppState exists output app-state)
;      (if (Line exists (AppState-currLine app-state))
;          (if there is a end of line (output currLine))
;          #false)  
;      #false)) 
;
;(define (draw app-state)
;  (...draw app with "start" and "end" coordinates 

;Code
(define empty-canvas (overlay/align "center" "center"
                                          (rectangle 500 500 "solid" "black")
                                          (rectangle 500 500 "solid" "black")))
 
(define (get-Line-start app-state)
  (if (AppState? app-state) 
      (if (Line? (AppState-currLine app-state))
          (Line-start (AppState-currLine app-state))
          #false) 
      #false)) 
  
(define (get-Line-end app-state)
  (if (AppState? app-state)
      (if (Line? (AppState-currLine app-state))
          (Line-end (AppState-currLine app-state))
          #false)  
      #false)) 

(define (draw app-state)
  (if (AppState? app-state)
      (if (posn? (get-Line-start app-state))
          (scene+line (AppState-canvas app-state)
                      (posn-x (get-Line-start app-state)) (posn-y (get-Line-start app-state)) 
                      (posn-x (get-Line-end app-state)) (posn-y (get-Line-end app-state))
                      (make-pen "white" 5 "solid" "round" "round"))    
          (AppState-canvas app-state)) 
      #false)) 

;---------------------------------
;Design Recipe of start of the line
;---------------------------------
;Data Types:
;        X1 = Coordinates, Integers
;        Y1 = Coordinates, Integers
; app-state = State of the App

;Input = X1(coordinates) y1(coordinates) app-state
;Output = line's starting coordinates x1 y1
;Purpose Statement: AppStates takes x1 and y1 and assignts as the "current" lines startig point 
;Header: (define (move-start app-state) (make-AppState (AppState-canvas app-state))))

;Template
;(define (move-start app-state x1 y1)
;  (if (AppState exists output app-state)
;      (if (there is a posn (fetch (get-Line-start) and input the current (app-state)))
;          (make-AppState
;           (AppState-canvas app-state)
;           (make-Line (make-posn x1 y1) (get-Line-end app-state))
;           (AppState-hasquit app-state)) 
;          app-state)
;      #false))

;Code
(define (move-start app-state x1 y1)
  (if (AppState? app-state)
      (if (posn? (get-Line-start app-state))
          (make-AppState
           (AppState-canvas app-state)
           (make-Line (make-posn x1 y1) (get-Line-end app-state))
           (AppState-hasquit app-state)) 
          app-state)
      #false))
;---------------------------------
;Design Recipe of end of the line
;---------------------------------
;Data Types:
;        X1 = Coordinates, Integers
;        Y1 = Coordinates, Integers
; app-state = State of the App

;Input = X1(coordinates) y1(coordinates) app-state
;Output = line's ending coordinates x1 y1
;Purpose Statement: AppStates takes x1 and y1 and assignts as the "current" lines startig point 
;Header: (define (move-start app-state) (make-AppState (AppState-canvas app-state))))

;Template
;(define (move-end app-state x1 y1)
;  (if (AppState exists output app-state)
;      (if (there is a posn (fetch (get-Line-start) and input the current (app-state)))
;          (make-AppState
;           (AppState-canvas app-state)
;           (make-Line (make-posn x1 y1) (get-Line-end app-state))
;           (AppState-hasquit app-state)) 
;          app-state)
;      #false))


;Code
(define (move-end app-state x1 y1)
  (if (AppState? app-state)
      (if (posn? (get-Line-start app-state))
          (make-AppState
           (AppState-canvas app-state)
           (make-Line (get-Line-start app-state) (make-posn x1 y1))
           (AppState-hasquit app-state))
          app-state)
      #false))

;-----------------------------------------
;Design Recipe of adding line to the cavas
;-----------------------------------------
;Data Type
;   True and False = Boolean

; Input: call to this function
; Output: Returns an Appstate from the taken AppState
; Header:(define (line-to-canvas appstate) (make AppState (AppState-canvas app-state) #false))

;Template
;(define (line-to-canvas app-state)
;  (if (AppState exists app-state)
;      (if (posn exists (get-Line-start app-state))
;          (make-AppState (draw app-state) #false (AppState-hasquit app-state))
;          app-state)
;      #false))
;Code
(define (line-to-canvas app-state)
  (if (AppState? app-state)
      (if (posn? (get-Line-start app-state))
          (make-AppState (draw app-state) #false (AppState-hasquit app-state))
          app-state)
      #false))

;----------------------------------
;Design Recipe of deleting the line
;----------------------------------
;Data Type
;   True and False = Boolean

; Input: call to this function
; Output: Returns an Appstate from the taken AppState
; Header:(define (delete-LineState appstate) (make AppState (AppState-canvas app-state) #false))

;Template:
;(define (delete-LineState app-state)
;  (if (AppState exists output app-state)
;      (if (posnexists  (get-Line-start app-state))
;          (make-AppState (AppState-canvas app-state) #false (AppState-hasquit app-state))
;          app-state)
;          #false))
;Code
(define (delete-LineState app-state)
  (if (AppState? app-state)
      (if (posn? (get-Line-start app-state))
          (make-AppState (AppState-canvas app-state) #false (AppState-hasquit app-state))
          app-state)
          #false))

;--------------------------------------
;Design Recipe of quiting the app-state
;--------------------------------------
;Data Type
;   True and False = Boolean

; Input: call to this function
; Output: Returns an Appstate from the taken AppState
; Header:(define (quit appstate) (make AppState (AppState-canvas app-state) #false))

;Template
;(define (quit app-state)
;  (if (AppStateexists app-state)
;      (make-AppState
;       (AppState-canvas app-state)
;       (AppState-currLine app-state)
;       #true)
;      #false))
;Code
(define (quit app-state)
  (if (AppState? app-state)
      (make-AppState
       (AppState-canvas app-state)
       (AppState-currLine app-state)
       #true)
      #false))
;quiting the application
(define (quit? app-state) (AppState-hasquit app-state))
;--------------------------------------
;Design Recipe of mouse binding
;--------------------------------------
;Data Types
; Booleans
; x2 = Coordinates, Integers
; y2 = Coordinate, Integers
; x = Coordinates, Integers
; y = Coordinate, Integers
; e = string

;Input/Output
;Singnature: mouse call the mousevent integer which returns back to the AppState
;Purpose States: The state is changed based on the mouse inputs. There are three events as bellow:
;                                   - button-pressed = starts to draw the line
;                                   - drag = changing the end point of the line
;                                   - button-released = not changing the end point of the line anymore and adding the line to the cavas
;Header: (define (mouse app-state x y e) (make-AppState-canvas app-state) #false #true))

;Template
;(define (mouse app-state x y e)
;  (cond
;    [(e =string "button") (...newline...)] 
;    [(e =string "drag") (...move-end...)]
;    [(e =string "button-up") (...line-to-canvas...)]
;    [else (...newline...)]))
;Code
(define (newline app-state x2 y2)
  (if (AppState? app-state)
      (make-AppState
       (AppState-canvas app-state)
       (make-Line (make-posn x2 y2) (make-posn x2 y2))
       (AppState-hasquit app-state))
      #false)) 
(define (mouse app-state x y e)
  (cond
    [(string=? e "button") (newline app-state x y)] 
    [(string=? e "drag") (move-end app-state x y)]
    [(string=? e "button-up") (line-to-canvas app-state)]
    [else (newline app-state x y)]))

;----------------------------
;Design Recipe of key binding
;----------------------------
;Data Type
;   keys = string

;Input/Output
;Signature: key returns an event based on the key to the AppState
;Purpose: key is a function which on press of of key calls the function as previously deffined
;         q = quit app-state
;         escape = delete the LineState
;         left = move the get-Line-start left by 5 possition
;         right = move the get-Line-start right by 5 possition
;         down = move the get-line-start down (up in racket) by 5 possition
;         up = move the get-line-start up (down in racket) by 5 possition
;Header: (define (key app-state e) (make-AppState (AppState-canvas app-state) #false #true)))) 

;Template
;(define (key app-state keys) 
;  (cond
;    [(key= "q") (quit app-state)]
;    [(key="escape") (delete-LineState app-state)]
;    [(key="left") (move-start app-state by 5 possition left)
;    [(key="right") (move-start app-state by 5 possiont right)
;    [(key="down") (move-start app-state down by 5 possition)
;    [(key="up") (move-start app-state up by 5 possition)
;    [else app-state]))
;Code
(define (key app-state keys) 
  (cond
    [(key=? keys "q") (quit app-state)]
    [(key=? keys "escape") (delete-LineState app-state)]
    [(key=? keys "left") (move-start app-state
                                       (- (posn-x (get-Line-start app-state)) 5)
                                       (posn-y (get-Line-start app-state)))]
    [(key=? keys "right") (move-start app-state
                                       (+ (posn-x (get-Line-start app-state)) 5) 
                                       (posn-y (get-Line-start app-state)))]
    [(key=? keys "down") (move-start app-state
                                       (posn-x (get-Line-start app-state)) (+ (posn-y (get-Line-start app-state)) 5))]
    [(key=? keys "up") (move-start app-state
                                       (posn-x (get-Line-start app-state)) (- (posn-y (get-Line-start app-state)) 5))] 
    [else app-state])) 


    
;--------------------------------------
;Design Recipe of the Big Bang Function
;--------------------------------------
;Data Type:
;   draw=function call
;   mouse=function call
;   key=function call
;   quit=functionc call

;Input/Output
;Signature; Final Drawing app return the bing bang function for all the funcion define above
;Purpose Statement; to render all the functions
;Header (define (final-drawing-app final-state) (big-bang final-state)))

;Code
(define (final-drawing-app final-state)
  (big-bang final-state
    [to-draw draw]
    [on-mouse mouse]
    [on-key key]
    [stop-when quit?]))

(final-drawing-app (make-AppState empty-canvas  #false #false))
  
