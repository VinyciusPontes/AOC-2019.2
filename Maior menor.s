
.data
    array: .word 7, 2, 5, 4, 9 
    ler1: .asciiz"\nMaior elemento do vetor: "
 	ler2: .asciiz"\nMenor elemento do Vetor: "
	ler3: .asciiz"\nElementos do Vetor que foram inseridos direto na memoria:  "
 	pula_linha: .asciiz"  "

.globl main
.text
main:
    la $t0, array
    li $t1, 0
    la $t8,array
	li $t3,10
	lw $t5,0($t0) #maior
	lw $t6,0($t0) #menor
    principal:
	la $a0,ler3
   	li $v0,4
   	syscall
loop:
     beq $t1,$t3,saida
     lw $t4,0($t0)
   
     move $a0, $t4
     li $v0,1
     syscall 
     
     la $a0,pula_linha
     li $v0,4
     syscall
          
     lw $t7,0($t8)
     addi $t1,$t1,1
     addi $t0,$t0,4
     addi $t8,$t8,4
     bgt $t4,$t5,guarda
     blt $t7,$t6,guardaMenor
     j loop     
guarda:
     move $t5,$t4
     j loop     
guardaMenor:
	move $t6,$t7
	j loop         
saida:
  	la $a0,ler1
   	li $v0,4
   	syscall
     
    	move $a0, $t5
    	li $v0,1
    	syscall     
    
     	la $a0,ler2
   	li $v0,4
   	syscall
     
     	move $a0, $t6
     	li $v0,1
     	syscall     
