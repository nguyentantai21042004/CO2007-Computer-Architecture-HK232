.data
nhap: .asciiz "Nhap ban kinh: "
pi: .float 3.1415927
zero: .float 0.0
error: .asciiz "\nBan kinh khong the am"
chuvi: .asciiz "\nChu vi hinh tron la: "
dientich: .asciiz "\nDien tich hinh tron la: "


.text
.globl main
main:
    # In ra thông báo nhắc người dùng nhập bán kính
    li $v0, 4
    la $a0, nhap
    syscall

    # Nhập bán kính từ bàn phím
    li $v0, 6
    syscall
    mov.s $f12, $f0
    
    # Khởi tạo thanh ghi $f2 với giá trị pi
    lwc1 $f2, pi

    # Kiểm tra xem bán kính có âm hay không
    l.s $f1, zero   # Khởi tạo thanh ghi $f1 với giá trị 0.0
    c.lt.s $f12, $f1	# Kiểm tra xem bán kính có nhỏ hơn 0 không
    bc1t negative_radius

		
    # Tính chu vi = 2 * pi * r
    add.s $f4, $f12, $f12
    mul.s $f4, $f4, $f2

    # In ra chu vi
    li $v0, 4
    la $a0, chuvi
    syscall
    mov.s $f12, $f4
    li $v0, 2
    syscall

    # Tính diện tích = pi * r * r
    mov.s $f12, $f0
    mul.s $f6, $f12, $f12
    mul.s $f6, $f6, $f2

    # In ra diện tích
    li $v0, 4
    la $a0, dientich
    syscall
    mov.s $f12, $f6
    li $v0, 2
    syscall

    # Kết thúc chương trình
    li $v0, 10
    syscall

negative_radius:
    # In ra thông báo lỗi nếu bán kính âm
    li $v0, 4
    la $a0, error
    syscall

    # Kết thúc chương trình
    li $v0, 10
    syscall
