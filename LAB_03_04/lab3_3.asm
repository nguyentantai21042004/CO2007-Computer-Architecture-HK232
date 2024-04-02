#Chuong trinh 22.3: switch - case 
#----------------------------------- 
#Data segment
 .data 
#Các biến 
int_a: .word 8          # Biến a
int_b: .word 100        # Biến b
int_c: .word 2          # Biến c
int_in: .word 0         # Biến nhập vào
#Thông báo nhập 
Nhap_in: .asciiz "Nhap input: "  # Thông báo nhập
Nhac_kq: .asciiz "a = "          # Thông báo kết quả

 .text 
 .globl main 
#Chương trình chính 
main: 
#Nhập (syscall) 
 #Nhập vào
 la $a0,Nhap_in          # Địa chỉ thông báo nhập
 addi $v0,$zero,4        # System call để in chuỗi
 syscall 
 addi $v0,$zero,5        # System call để đọc số nguyên
 syscall 
 sw $v0,int_in           # Lưu intput

 # t0=a, t1=input, t2=b, t3=c, t4=1/2/3/4 
 lw $t1,int_in           # Load intput vào $t1
 lw $t2,int_b            # Load b vào $t2
 lw $t3,int_c            # Load c vào $t3
 # switch (input) 
 # kiểm tra intput
 addi $t4,$zero,1        # Đặt $t4 bằng 1
 beq $t1,$t4,case1       # Nhảy đến case1 nếu intput bằng 1
 addi $t4,$zero,2        # Đặt $t4 bằng 2
 beq $t1,$t4,case2       # Nhảy đến case2 nếu intput bằng 2
 addi $t4,$zero,3        # Đặt $t4 bằng 3
 beq $t1,$t4,case3       # Nhảy đến case3 nếu intput bằng 3
 addi $t4,$zero,4        # Đặt $t4 bằng 4
 beq $t1,$t4,case4       # Nhảy đến case4 nếu intput bằng 4
 j default               # Nhảy đến default nếu không có trường hợp nào khớp
 # case 1: a=b+c 
case1: add $t0,$t2,$t3   # Tính a = b + c
 sw $t0,int_a            # Lưu kết quả vào a
 j endswitch             # Nhảy đến endswitch
 # case 2: a=b-c 
case2: sub $t0,$t2,$t3   # Tính a = b - c
 sw $t0,int_a            # Lưu kết quả vào a
 j endswitch             # Nhảy đến endswitch
 # case 3: a=b*c 
case3: mul $t0,$t2,$t3   # Tính a = b * c
 sw $t0,int_a            # Lưu kết quả vào a
 j endswitch             # Nhảy đến endswitch
 # case 4: a=b/c 
case4: div $t2,$t3       # Tính a = b / c 
 mflo $t0                # Load thương vào a
 sw $t0,int_a            # Lưu kết quả vào a
 j endswitch             # Nhảy đến endswitch
 # default: a=0 
default: sw $zero,int_a  # Đặt a bằng 0
endswitch: 
#Xuất kết quả (syscall) 
 la $a0,Nhac_kq          # Load địa chỉ thông báo kết quả
 addi $v0,$zero,4        # System call để in chuỗi
 syscall 
 lw $a0,int_a            # Load a để in
 addi $v0,$zero,1        # System call để in số nguyên
 syscall 
#Kết thúc chương trình (syscall) 
Kthuc: addiu $v0,$zero,10 # System call để kết thúc chương trình
 syscall
