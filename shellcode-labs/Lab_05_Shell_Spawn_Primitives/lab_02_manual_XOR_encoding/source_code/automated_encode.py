#!/usr/bin/env python3
# XOR Encoder for /bin//sh

def encode_string(s, key=0x0101010101010101):
    encoded = []
    for i, byte in enumerate(s.encode()):
        encoded.append(byte ^ (key & 0xFF))
        key >>= 8
    
    # Pack as little-endian QWORD (first 8 bytes)
    qword = 0
    for i in range(8):
        if i < len(encoded):
            qword |= encoded[i] << (i * 8)
    
    print(f"Original: {s!r}")
    print(f"Bytes:    {[hex(b) for b in encoded]}")
    print(f"QWORD:    0x{qword:x}")
    print(f"Assembly: push 0x{qword:x}")
    print(f"Hex:      {' '.join(f'{b:02x}' for b in encoded[:8])}")
    return qword

if __name__ == "__main__":
    encode_string("/bin//sh")

'''
change, if you want custom key
    encode_string("/bin//sh",0xAAAAAAAAAAAAAAAA)
'''