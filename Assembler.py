
def main():
    # Commands:
    #ADD $Rs $Rt $Rd
    #SUB $Rs $Rt $Rd
    #MULT $Rs $Rt $Rd
    #DIV $Rs $Rt $Rd
    #AND $Rs $Rt $Rd
    #OR $Rs $Rt $Rd
    #XOR $Rs $Rt $Rd
    #'Immediate' versions of all the above (simply add I to the end i.e. ADDI, SUBI, etc)
    #LOAD $Rs Addr
    #SAVE $Rs Addr

    program = [
        'ADD   $6 $2 $3',
        'SUB   $5 $2 $1',
        'MULT  $4 $1 $2',
        'DIV   $5 $5 $6',
        'AND   $5 $4 $1',
        'OR    $4 $6 $4',
        'XOR   $6 $2 $1',
        'ADDI  $5 $5  2',
        'SUBI  $1 $4  2',
        'MULTI $6 $5  2',
        'DIVI  $6 $3  4',
        'ANDI  $5 $6  2',
        'ORI   $6 $5  1',
        'XORI  $4 $1  1',
        'SAVE  $2 50',
        'LOAD  $4 14'
    ]
    for instruction in program:
        # instruction = 'Instruction goes here'

        instruction = instruction.split()

        # Create binary instruction
        binary = []
        for x in range(16):
            binary.append('0')

        # Determine instruction format
        if instruction[0].endswith('I'):
            i_format = 'Immediate'
        elif instruction[0] == 'SAVE':
            i_format = 'SAVE'
        elif instruction[0] == 'LOAD':
            i_format = 'LOAD'
        else:
            i_format = 'Register'

        # Set up ALU opcode. Bits 15:13
        match instruction[0]: # ADD keeps the default 000
            case 'SUB':
                binary[13] = '1'
            case 'SUBI':
                binary[13] = '1'
            case 'MULT':
                binary[14] = '1'
            case 'MULTI':
                binary[14] = '1'
            case 'DIV':
                binary[14] = '1'
                binary[13] = '1'
            case 'DIVI':
                binary[14] = '1'
                binary[13] = '1'
            case 'AND':
                binary[15] = '1'
            case 'ANDI':
                binary[15] = '1'
            case 'OR':
                binary[15] = '1'
                binary[13] = '1'
            case 'ORI':
                binary[15] = '1'
                binary[13] = '1'
            case 'XOR':
                binary[15] = '1'
                binary[14] = '1'
            case 'XORI':
                binary[15] = '1'
                binary[14] = '1'
            case 'SAVE':
                binary[15] = '1'
                binary[14] = '1'
                binary[13] = '1'
            case 'LOAD':
                binary[15] = '1'
                binary[14] = '1'
                binary[13] = '1'
            case _:
                binary[15] = '0'
                binary[14] = '0'
                binary[13] = '0'

        # Set up control bits
        # ALU_src. Bit 12
        if i_format == 'Immediate':
            binary[12] = '1'

        # Reg_write. Bit 11
        if i_format != 'SAVE':
            binary[11] = '1'

        # Mem_write. Bit 10
        if i_format == 'SAVE':
            binary[10] = '1'

        # Reg_src. Bit 9
        if i_format == 'LOAD':
            binary[9] = '1'

        # Set up registers/immediate values

        Rs = instruction[1][1:] # Strip $ prefix
        Rs = bin(int(Rs))
        Rs = Rs[2:] # Remove prefix from bin() method
        while len(Rs) < 3: # Zero pad front of binary number
            Rs = '0' + Rs
        binary[8] = Rs[0]
        binary[7] = Rs[1]
        binary[6] = Rs[2]

        if i_format == 'Register':
            Rt = instruction[2][1:] # Strip $ prefix
            Rd = instruction[3][1:] # Strip $ prefix

            Rt = bin(int(Rt))
            Rt = Rt[2:] # Remove prefix from bin() method
            while len(Rt) < 3: # Zero pad front of binary number
                Rt = '0' + Rt

            Rd = bin(int(Rd))
            Rd = Rd[2:] # Remove prefix from bin() method
            while len(Rd) < 3: # Zero pad front of binary number
                Rd = '0' + Rd
            
            binary[5] = Rt[0]
            binary[4] = Rt[1]
            binary[3] = Rt[2]
            binary[2] = Rd[0]
            binary[1] = Rd[1]
            binary[0] = Rd[2]

        elif i_format == 'Immediate':
            Rt = instruction[2][1:] # Strip $ prefix
            Imm = instruction[3]

            Rt = bin(int(Rt))
            Rt = Rt[2:] # Remove prefix from bin() method
            while len(Rt) < 3: # Zero pad front of binary number
                Rt = '0' + Rt

            Imm = bin(int(Imm))
            Imm = Imm[2:] # Remove prefix from bin() method
            while len(Imm) < 3: # Zero pad front of binary number
                Imm = '0' + Imm
            
            binary[5] = Imm[0]
            binary[4] = Imm[1]
            binary[3] = Imm[2]
            binary[2] = Rt[0]
            binary[1] = Rt[1]
            binary[0] = Rt[2]
        
        else: # SAVE/LOAD
            Addr = instruction[2]
            Addr = bin(int(Addr))
            Addr = Addr[2:] # Remove prefix from bin() method
            while len(Addr) < 6: # Zero pad front of binary number
                Addr = '0' + Addr

            binary[5] = Addr[0]
            binary[4] = Addr[1]
            binary[3] = Addr[2]
            binary[2] = Addr[3]
            binary[1] = Addr[4]
            binary[0] = Addr[5]



        # Format output
        binary.reverse()
        binary = ''.join(binary)
        # print(binary)
        # if i_format != 'SAVE' and i_format != 'LOAD':
            # print(f'{binary[0:3]} {binary[3]} {binary[4]} {binary[5]} {binary[6]} {binary[7:10]} {binary[10:13]} {binary[13:16]}')
        # else:
            # print(f'{binary[0:3]} {binary[3]} {binary[4]} {binary[5]} {binary[6]} {binary[7:10]} {binary[10:16]}')
        # print(f'{binary[0:4]} {binary[4:8]} {binary[8:12]} {binary[12:16]}')

        # Convert to hex
        hex = f'{four_bits_to_hex(binary[0:4])}{four_bits_to_hex(binary[4:8])}{four_bits_to_hex(binary[8:12])}{four_bits_to_hex(binary[12:16])}'
        # print(f'{instruction} = {hex}')
        print(hex)

def four_bits_to_hex(four_bits):
    match four_bits:
        case '0000': hex = '0'
        case '0001': hex = '1'
        case '0010': hex = '2'
        case '0011': hex = '3'
        case '0100': hex = '4'
        case '0101': hex = '5'
        case '0110': hex = '6'
        case '0111': hex = '7'
        case '1000': hex = '8'
        case '1001': hex = '9'
        case '1010': hex = 'A'
        case '1011': hex = 'B'
        case '1100': hex = 'C'
        case '1101': hex = 'D'
        case '1110': hex = 'E'
        case '1111': hex = 'F'

    return hex


if __name__ == '__main__':
    main()