NAME "Program Konversi Nilai Satuan Volume"          ;NAMA PROGRAM
INCLUDE 'emu8086.inc'   ;MENCAKUP PROSEDUR DAN MAKRO emu8086.inc
#MAKE_COM#              ;MEMBUAT BERKAS COM
ORG 100H                ;MULAI DARI 100H
JMP MULAI               ;MELOMPAT MENUJU MULAI
;VARIABEL
PSN1    DB "KONVERSI NILAI SATUAN VOLUME",13,10
        DB "DARI L menjadi kL,hL,daL,dL,cL,mL",13,10
        DB "NILAI JANGKAUAN INPUT satuan volume L antara 1 sampai 100",13,10
        DB "BILA NILAI INPUT DI LUAR ITU PROGRAM AKAN CRASH",13,10
        DB "HASIL KONVERSI MERUPAKAN PEMBULATAN INTEGER",13,10,'$'
PSN2    DB 13,10,13,10,'MASUKKAN Nilai satuan volume dalam L: $'
PSN3    DB "NILAI SATUAN VOLUME DALAM kL  :  $"
PSN4    DB "NILAI SATUAN VOLUME DALAM hL  :  $"
PSN5    DB "NILAI SATUAN VOLUME DALAM daL :  $"
PSN6    DB "NILAI SATUAN VOLUME DALAM dL  :  $"
PSN7    DB "NILAI SATUAN VOLUME DALAM cL  :  $"
PSN8    DB "NILAI SATUAN VOLUME DALAM mL  :  $"

L       DW ?
kL      DW ?
hL      DW ?
daL     DW ?
desiL      DW ?
centiL      DW ?
mL      DW ?

MULAI:
LEA DX,PSN1             ;MEMUAT ALAMAT PSN1 PADA DX
MOV AH,9                ;INTERUPSI MENCETAK STRING PSN1
INT 21H                 ;INT 21H FUNGSI 9

LEA DX,PSN2
MOV AH,9                ;INTERUPSI MENCETAK STRING PSN2
INT 21H

CALL SCAN_NUM           ;MEMANGGIL PROSEDUR SCAN_NUM

MOV L,CX              ;MENYIMPAN NILAI VOLUME LITER
                        ;DALAM L

PUTC 13                 ;BERGANTI BARIS SELANJUTNYA
PUTC 10

LEA DX,PSN3
MOV AH,9                ;INTERUPSI MENCETAK STRING PSN5
INT 21H

MOV AX,L              ;FUNGSI SATUAN VOLUME LITER MENJADI KILO LITER
MOV BX,1
IMUL BX
MOV BX,1000             ;kL=L/1000
IDIV BX

MOV kL,AX              ;MENYIMPAN NILAI SATUAN VOLUME DALAM KILO LITER
                        ;DALAM kL

CALL PRINT_NUM          ;MEMANGGIL PROSEDUR PRINT_NUM
                        ;MENCETAK NILAI AX
                      
PUTC 13                 ;BERGANTI BARIS SELANJUTNYA
PUTC 10

LEA DX,PSN4
MOV AH,9                ;INTERUPSI MENCETAK STRING PSN3
INT 21H

MOV AX,L              	;FUNGSI SATUAN VOLUME LITER MENJADI HEKTO LITER
MOV BX,1
IMUL BX
MOV BX,100              ;hL=L/100
IDIV BX
MOV hL,AX              ;MENYIMPAN NILAI SATUAN VOLUME DALAM HEKTO LITER
                        ;DALAM hL

CALL PRINT_NUM          ;MEMANGGIL PROSEDUR PRINT_NUM
                        ;MENCETAK NILAI AX
                  
PUTC 13                 ;BERGANTI BARIS SELANJUTNYA
PUTC 10

LEA DX,PSN5
MOV AH,9                ;INTERUPSI MENCETAK STRING PSN4
INT 21H

MOV AX,L              	;FUNGSI SATUAN VOLUME DARI LITER MENJADI DEKA LITER
MOV BX,1
IMUL BX
MOV BX,10                ;dL=L/10
IDIV BX

MOV daL,AX              ;MENYIMPAN NILAI SATUAN VOLUME DALAM DEKA LITER
                        ;DALAM dL
                      
CALL PRINT_NUM          ;MEMANGGIL PROSEDUR PRINT_NUM
                        ;MENCETAK NILAI AX 
                        
PUTC 13                 ;BERGANTI BARIS SELANJUTNYA
PUTC 10
                     
LEA DX,PSN6
MOV AH,9                ;INTERUPSI MENCETAK STRING PSN6
INT 21H

MOV AX,L              	;FUNGSI SATUAN VOLUME DARI LITER MENJADI DESI LITER
MOV BX,10                ;dL=L*10
IMUL BX

MOV desiL,AX              ;MENYIMPAN NILAI SATUAN VOLUME DALAM DESI LITER
                        ;DALAM desiL
                      
CALL PRINT_NUM          ;MEMANGGIL PROSEDUR PRINT_NUM
                        ;MENCETAK NILAI AX 
                         
PUTC 13                 ;BERGANTI BARIS SELANJUTNYA
PUTC 10                        
                        
LEA DX,PSN7
MOV AH,9                ;INTERUPSI MENCETAK STRING PSN7
INT 21H

MOV AX,L              	;FUNGSI SATUAN VOLUME DARI LITER MENJADI CENTI LITER
MOV BX,100              ;dL=L*100
IMUL BX

MOV centiL,AX              ;MENYIMPAN NILAI SATUAN VOLUME DALAM CENTI LITER
                        ;DALAM centiL
                      
CALL PRINT_NUM          ;MEMANGGIL PROSEDUR PRINT_NUM
                        ;MENCETAK NILAI AX
 
PUTC 13                 ;BERGANTI BARIS SELANJUTNYA
PUTC 10  

LEA DX,PSN8
MOV AH,9                ;INTERUPSI MENCETAK STRING PSN6
INT 21H

MOV AX,L              	;FUNGSI SATUAN VOLUME DARI LITER MENJADI MILI LITER
MOV BX,1000             ;mL=L*1000
IMUL BX

MOV mL,AX            	;MENYIMPAN NILAI SATUAN VOLUME DALAM MILI LITER
                        ;DALAM mL
                      
CALL PRINT_NUM          ;MEMANGGIL PROSEDUR PRINT_NUM
                        ;MENCETAK NILAI AX
                        
MOV AH,0                ;INTERUPSI MENUNGGU
INT 16H  

RET                     ;KEMBALI KE SISTEM OPERASI

DEFINE_SCAN_NUM         ;MENDEFINISIKAN PROSEDUR
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
END                     ;AKHIR