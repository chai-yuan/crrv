import argparse
import os

def convert_binary_to_mem(input_file, output_file):
    # 检查输入文件是否存在
    if not os.path.exists(input_file):
        raise FileNotFoundError(f"Input file '{input_file}' not found")
    
    # 读取二进制文件内容
    with open(input_file, 'rb') as f:
        binary_data = f.read()
    
    # 准备输出内容
    output_lines = [
        "memory_initialization_radix = 16;",
        "memory_initialization_vector ="
    ]
    
    # 转换每个字节为16进制格式
    hex_data = []
    for i in range(0, len(binary_data), 4):
        # 读取最多4个字节
        chunk = binary_data[i:i+4]
        # 转换为32位值（小端序）
        value = 0
        for j in range(len(chunk)):
            value += chunk[j] << (8 * j)
        hex_str = f"{value:08X}"
        hex_data.append(hex_str)
    
    # 将16进制数据格式化为每行一个，用逗号分隔
    formatted_data = ",\n".join(hex_data)
    
    # 写入输出文件
    with open(output_file, 'w') as f:
        f.write(output_lines[0] + "\n")
        f.write(output_lines[1] + "\n")
        f.write(formatted_data + ";")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Convert binary file to memory initialization format')
    parser.add_argument('-i', '--input', required=True, help='Input binary file path')
    parser.add_argument('-o', '--output', required=True, help='Output memory file path')
    
    args = parser.parse_args()
    
    try:
        convert_binary_to_mem(args.input, args.output)
        print(f"Successfully converted '{args.input}' to '{args.output}'")
    except Exception as e:
        print(f"Error: {e}")
