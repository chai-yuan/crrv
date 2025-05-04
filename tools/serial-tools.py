import argparse
import serial
import serial.tools.list_ports
from sys import exit

def list_serial_ports():
    """列出所有可用串口"""
    ports = serial.tools.list_ports.comports()
    if not ports:
        print("没有找到可用串口")
        return
    
    print("可用串口列表:")
    print("-" * 40)
    print("{:<15} {:<20} {:<10}".format("端口", "描述", "硬件ID"))
    print("-" * 40)
    for port in ports:
        print("{:<15} {:<20} {:<10}".format(
            port.device, 
            port.description or "N/A", 
            port.hwid or "N/A"
        ))

def open_serial_interaction(port, baudrate):
    """打开串口交互界面(目前只进行打印操作)"""
    try:
        ser = serial.Serial(port, baudrate, timeout=1)
        print(f"已连接到 {port} [波特率: {baudrate}]")
        print("输入 'exit' 退出交互模式")
        print("------------------------------")
    except Exception as e:
        print(f"无法打开串口 {port}: {e}")
        exit(1)

    try:
        # 读取响应
        while True:
            if ser.in_waiting > 0:
                response = ser.readline().decode('utf-8').strip()
                if response:
                    print(f"接收 < {response}")
                    ser.write(("4").encode('utf-8'))
                else:
                    break
            else:
                continue
                    
    except KeyboardInterrupt:
        print("\n用户中断")
    finally:
        ser.close()
        print("串口连接已关闭")

def main():
    parser = argparse.ArgumentParser(description="Python 命令行串口助手")
    parser.add_argument('--list', action='store_true', help='列出所有可用串口')
    parser.add_argument('--port', type=str, help='指定要使用的串口')
    parser.add_argument('--baud', type=int, default=115200, help='指定波特率 (默认: 115200)')
    
    args = parser.parse_args()
    
    if args.list:
        list_serial_ports()
    elif args.port:
        open_serial_interaction(args.port, args.baud)
    else:
        parser.print_help()

if __name__ == "__main__":
    main()
