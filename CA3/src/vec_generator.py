import random

def generate_adder_test_vectors(filename="adder8bit_test.vec", num_samples=1200):
    header = (
        "; 8-bit Adder Test Vectors for RCA and Brent-Kung\n"
        "radix 44 44 1 44 1\n"
        "; define name for each vector\n"
        "vname A[8:1] B[8:1] Cin S[8:1] Cout\n"
        "; define IO\n"
        "IO II II I OO O\n"
        "; define waveform characteristics\n"
        "tunit ps\n"
        "period 2100\n"
        "tdelay 2090.00 00 00 0 FF 1\n"
        "Slope 50\n"
        "VOH '0.8*Vdd'\n"
        "; tabular data\n"
    )
    
    with open(filename, "w") as file:
        file.write(header)

        for _ in range(num_samples):
            a_val = random.randint(0, 255)
            b_val = random.randint(0, 255)
            cin_val = random.randint(0, 1)
            correct_sum = a_val + b_val + cin_val
            s_val = correct_sum & 0xFF
            cout_val = 1 if correct_sum > 255 else 0
            a_hex = f"{a_val:02x}"
            b_hex = f"{b_val:02x}"
            s_hex = f"{s_val:02x}"
            
            file.write(f"{a_hex} {b_hex} {cin_val} {s_hex} {cout_val}\n")
            
        file.write("ff ff 0 00 0\n")
        
    print(f"[OK] File '{filename}' successfully generated with {num_samples} random tests + 1 intentional error.")

NUMBER_OF_SAMPLES = 1500

if __name__ == "__main__":
    generate_adder_test_vectors(filename="adder8bit_test.vec", num_samples=NUMBER_OF_SAMPLES)