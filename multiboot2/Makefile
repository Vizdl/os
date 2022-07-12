CC			= gcc
LD			= ld

# -g -- 生成符号表以供调试使用
# -m32 -- 编译成32位目标文件
# -Wall -- 打开绝大多数警告
# -Wno-implicit-function-declaration -- 
# -std=c11 -- 遵循C11标准
# -std=gnu11 -- 遵循C11标准并且打开GNU的相关扩展
# -ffreestanding -- 采用独立环境
# -fno-pic -- 解决“对‘_GLOBAL_OFFSET_TABLE_’未定义的引用”问题
# -nostdinc -- 项目中的头文件可能会和开发环境中的系统头文件文件名称发生冲突，采用这个编译选项时不检索系统默认的头文件目录，但之后需要手动添加需检索的提供独立环境头文件的目录。
# -Iinclude -- 指定包含文件目录
# -fomit-frame-pointer -- 函数操作时不保存栈帧到寄存器(%ebp)（如果使用这个编译参数，则在gdb中调试会出错，因为gdb调试依赖栈帧）
CFLAGS		= -g -m32 -Wall -Wno-implicit-function-declaration -std=gnu11 -ffreestanding -fno-pic -nostdinc #-fomit-frame-pointer

# -Ttext -- 设置 .text 节的地址
# -m -- 设置仿真
LDFLAGS		= -Ttext 0x100000 -m elf_i386

%.o: %.S
	$(CC) $(CFLAGS) -c $< -o $@
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@
%: %.o
	$(LD) $^ -o $@ $(LDFLAGS)

KERNEL_NAME			= kernel.bin

all: $(KERNEL_NAME)

boot.o: boot.S

kernel.o: kernel.c

$(KERNEL_NAME): boot.o kernel.o
	$(LD) $^ -o $@ $(LDFLAGS)

clean:
	rm -f *.o $(KERNEL_NAME)