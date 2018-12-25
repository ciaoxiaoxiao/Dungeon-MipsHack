# xiaoxiao liu
# xxliu
# 111342431

#####################################################################
############### DO NOT CREATE A .data SECTION! ######################
############### DO NOT CREATE A .data SECTION! ######################
############### DO NOT CREATE A .data SECTION! ######################
##### ANY LINES BEGINNING .data WILL BE DELETED DURING GRADING! #####
#####################################################################

.text

# Part I
init_game:

addi $sp, $sp, -12
sw $s0, 0($sp)
sw $s1, 4($sp)
sw $s2, 8($sp) 

move $s0, $a0
move $s1, $a1
move $s2, $a2

#open from file
li   $v0, 13       # system call for open file
move $a0, $s0      # output file name
li   $a1, 0        # Open for writing (flags are 0: read, 1: write)
li   $a2, 0        # mode is ignored
syscall            # open a file (file descriptor returned in $v0)
move $s6, $v0


#read from file
li $t2, 10 #for cal digit number
li $t3, 128 # for hidden 

li   $v0, 14       # system call for read from file
move $a0, $s6      # file descriptor 
move $a1, $s1      # put the map address in 
li   $a2, 6        # hardcoded buffer length
syscall            # read from file

lbu $t0, 0($a1) #load byte for 1st digit of row
addi $t0, $t0, -48
addi $a1, $a1, 1
lbu $t1, 0($a1) #load byte for 2nd digit of row
addi $t1, $t1, -48
mul $t0, $t0, $t2 #decimal * 10
add $t4, $t0, $t1 #decimal * 10 + unit

sb $t4, 0($s1) #row should be 7

addi $a1, $a1, 2 #ignore /n
lbu $t0, 0($a1) #load byte for 1st digit of column
addi $t0, $t0, -48
addi $a1, $a1, 1
lbu $t1, 0($a1) #load byte for 2nd digit of column
addi $t1, $t1, -48
mul $t0, $t0, $t2 #decimal * 10
add $t1, $t0, $t1 #decimal * 10 + unit

addi $s1, $s1, 1
sb $t1, 0($s1) #column should be 25

mul $t5, $t4, $t1 #for get out of the loop

addi $t1, $t1, 1 #\n is also a column

mul $t2, $t4, $t1 #the size of the map 
addi $t2, $t2, 1 #the size of the map+1

addi $s1, $s1, 1 #in case of overwrite column

li   $v0, 14       # system call for read from file
move $a0, $s6      # file descriptor 
move $a1, $s1      # put the map address in 
move $a2, $t2      # hardcoded buffer length
syscall            # read from file

cell_map: #didn't ingnore \n
beqz $t5, p1_con
lbu $t0, 0($a1)
blt $t0, 32, ign_nl

cell_map1:
or $t0, $t0, $t3
sb $t0, 0($s1)
addi $a1, $a1, 1
addi $s1, $s1, 1
addi $t5, $t5, -1
j cell_map

ign_nl:
addi $t5, $t5, 1
addi $a1, $a1, 1
j cell_map

p1_con:
#load healthy
li $v0, -200
jr $ra


# Part II
is_valid_cell:
li $v0, -200
li $v1, -200
jr $ra


# Part III
get_cell:
li $v0, -200
li $v1, -200
jr $ra


# Part IV
set_cell:
li $v0, -200
li $v1, -200
jr $ra


# Part V
reveal_area:
li $v0, -200
li $v1, -200
jr $ra

# Part VI
get_attack_target:
li $v0, -200
li $v1, -200
jr $ra


# Part VII
monster_attacks:
li $v0, -200
li $v1, -200
jr $ra


# Part VIII
player_move:
li $v0, -200
li $v1, -200
jr $ra


# Part IX
complete_attack:
li $v0, -200
li $v1, -200
jr $ra


# Part X
player_turn:
li $v0, -200
li $v1, -200
jr $ra


# Part XI
flood_fill_reveal:
li $v0, -200
li $v1, -200
jr $ra

#####################################################################
############### DO NOT CREATE A .data SECTION! ######################
############### DO NOT CREATE A .data SECTION! ######################
############### DO NOT CREATE A .data SECTION! ######################
##### ANY LINES BEGINNING .data WILL BE DELETED DURING GRADING! #####
#####################################################################
