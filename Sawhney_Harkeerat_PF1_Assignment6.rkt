;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname Sawhney_Harkeerat_PF1_Assignment6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/batch-io)
(require racket/string)

;-------------------------------------------------------------------------------------Excercise 1-----------------------------------------------------------------------------------
;Data Deffination:
; Field: It is a structure.
;        A field could be as following:
;                 - (make-field header content)
(define-struct Field [Header Content])

;Data Examples:
(define Field-1 (make-Field "Name" "Harkeerat"))
(define Field-2 (make-Field "Middle-Name" "Singh"))
(define Field-3 (make-Field "Surname" "Sawhney"))
(define Field-4 (make-Field "Class" 1))                          ; Data Examples for Field Structure which includes Name, Middle-Name, Surname, Class, Grade and Nationality
(define Field-5 (make-Field "Grade" 8))                          ; these, data examples would be used through out the Assignment
(define Field-6 (make-Field "Nationality" '()))

;Data Deffination:
; Record: A record is a list which countaines field inside it.
;         There could be two types of Record:
;               -Empty Record (list)     -->    '()
;               -Non-Empty Record (list) -->    (cons Field '())

;Data Examples:
(define Record-1 (cons Field-1 (cons Field-2 (cons Field-3 (cons Field-4 (cons Field-5 '() ))))))   ; Contains all the field, expect the field 6 for more diversity in the examples
(define Record-2 '())  ; Conatins a empty-list
(define Record-3 (cons Field-1 (cons Field-2 (cons Field-3 (cons Field-4 (cons Field-5 (cons Field-6 '() ))))))) ;Contains all the fields

;-------------------------------------------------------------------------------------Excercise 2-----------------------------------------------------------------------------------
;Input/Output:
; get-field:
;     -Header (string)
;     -Content (any)
;     -record: A Random String .

;Purpose Statement:
; Takes a Record and a the field name then returns the contents of the field. If it does not exist or there is an empty set, then it returns false.

;Header:
; (define (get-field Record Field) Content)

;Examples:
(check-expect (get-field Record-1 "Name") "Harkeerat")
(check-expect (get-field Record-1 "Middle-Name") "Singh")
(check-expect (get-field Record-1 "Surname") "Sawhney")          ;Examples for a non-empty list
(check-expect (get-field Record-1 "Class") 1)
(check-expect (get-field Record-1 "Grade") 8)

(check-expect (get-field Record-2 "field") #false) ;Example for an empty list

;Template:
;(define (get-field Record Field)
;  (cond
;    [(empty? Record) ...]
;    [(cons? Record) (if (... (fied-header (first Record)) .... Field...)
;                        (... (Field-Content (first Record...)...)
;                             (... (get-field (rest record) ....Field...))))]))

;Code:  
(define (get-field Record Field)
  (cond
    [(empty? Record) #false]
    [(not (Field? (first Record))) #false]
    [(cons? Record) (if (equal? (Field-Header (first Record)) Field)
                        (Field-Content (first Record))
                        (get-field (rest Record) Field))]
    [else #false]))

;-------------------------------------------------------------------------------------Excercise 3-----------------------------------------------------------------------------------
;Input/Output:
;  Signature:
;     - list->record: header (string) content (any) --> Record (any)

;Purpose Statement:
; list->record takes a list which has an header and content, which is repersenting field contents, and then return the record. The record pairs the headers and the content,
; if the list empty or if the header's and the content's length is not the same then it returns #false.

;Header:
;(define (list->record Header Content) Record-1)

;Examples
(check-expect (list->record (list "Name" "Middle-Name" "Surname" "Class" "Grade")
                            (list "Harkeerat" "Singh" "Sawhney" 1 8))
              Record-1)

(check-expect (list->record (list "Name" "Middle-Name" "Surname" "Class" "Grade" "Nationality")
                            (list "Harkeerat" "Singh" "Sawhney" 1 8 '() ))
              Record-3)

(check-expect (list->record (list "Name" "Middle-Name" "Surname" "Class" "Grade")
                            (list "Harkeerat" "Singh" "Sawhney" 1 ))
              #false)

(check-expect (list->record (list "Name" "Middle-Name" "Surname" "Class")
                            (list "Harkeerat" "Singh" "Sawhney" 1 8)) 
              #false)


;Template:
;(define (list->record Header Content)
;  (cond
;    [... (length Header) ... (length Content) ... #false...]
;    [else
;     (local
;       ((define (list->record1 Header Content)
;          (cond
;            [(...empty...Header)...]
;            [(cons? Header) (cons (... make-field (first Header)...(first Content).....
;                                       (....list->record (rest header) (rest Content)....)))]))))]))

;Code:
(define (list->record Header Content)
  (cond
    [(not (= (length Header) (length Content))) #false]
    [else
    (local
      ((define (list->record1 Header Content)
         (cond
           [(empty? Header) '()]
           [(cons? Header) (cons (make-Field (first Header) (first Content))
                                 (list->record (rest Header) (rest Content)))]
           [else #false])))
      (list->record1 Header Content))]))

;-------------------------------------------------------------------------------------Excercise 4-----------------------------------------------------------------------------------
;Input/Output:
; Signature:
;    - read-csv: String --> Record

;Purpose Statement:
; read-csv takes an input of a csv file and then it reads it and lates outputs the list<records> which contains the CSV file's records.

;Header:
;(define (read-csv CSV-File-Name) Records)

;Example:
(check-expect (length (read-csv "flights.csv")) 1000) ; counts the numbers of "contents" in the flights.csv

;Template:
;(define (read-csv CSV-File-Name)
;  (local
;    (...(read-csv-file CSV-File-Name)...)
;
;    (define (CSV_Data Data)
;      (cond
;        [(...empty? Data) ...]
;        [(not (= ... (header) (first Content)) ...#false...)]
;        [(cons? Data) (cons (CSV-Data .... first ...))
;                      (CSV-Data ....rest...)]))))

;Code:
(define (read-csv CSV-File-Name)
  (local
    ((define CSV (read-csv-file CSV-File-Name))
     (define Header (first CSV))
     (define Content (rest CSV))
     
     (define (CSV-Data Data)
       (cond
         [(empty? Data) '()]
         [(not (= (length Header) (length (first Content)))) #false]
         [(cons? Data) (cons (CSV-Data (first Data))
                             (CSV-Data (rest Data)))]
         [else #false])))
    (CSV-Data Content)))