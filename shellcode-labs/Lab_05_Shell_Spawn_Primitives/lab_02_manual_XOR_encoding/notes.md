# Lab 02 Manual XOR encoding

## Purpose 

Encode a `"/bin//sh"` manually using xor encryption

## Methode

1. String convert to binary

| String | Hex | Binary |
|----|------|------------|
|`/` | 0x2f | 0b00101111 |
|`b` | 0x62 | 0b01100010 |
|`i` | 0x69 | 0b01101001 |
|`n` | 0x6e | 0b01101110 |
|`/` | 0x2f | 0b00101111 |
|`/` | 0x2f | 0b00101111 |
|`s` | 0x73 | 0b01110011 |
|`h` | 0x68 | 0b01101000 |
|----|------|------------|

2. Manually XOR each binary
- formula = `encode_value = binary_value ^ key`
- We can select our own key for this. but this lab I'm using 0x1 for encoding.

| String | Hex | Binary | key | encode value |
|----|------|------------|------------|------------|
|`/` | 0x2f | 0b00101111 | 0b00000001 | 0b00101110 |
|`b` | 0x62 | 0b01100010 | 0b00000001 | 0b01100011 |
|`i` | 0x69 | 0b01101001 | 0b00000001 | 0b01101000 | 
|`n` | 0x6e | 0b01101110 | 0b00000001 | 0b01101111 |
|`/` | 0x2f | 0b00101111 | 0b00000001 | 0b00101110 |
|`/` | 0x2f | 0b00101111 | 0b00000001 | 0b00101110 |
|`s` | 0x73 | 0b01110011 | 0b00000001 | 0b01110010 |
|`h` | 0x68 | 0b01101000 | 0b00000001 | 0b01101001 |
|----|------|------------|------------|------------|

3. Convert encode value to hex

| String | original Hex | encode value | encooded hex |
|----|------|------------|------|
|`/` | 0x2f | 0b00101110 | 0x2e |
|`b` | 0x62 | 0b01100011 | 0x63 |
|`i` | 0x69 | 0b01101000 | 0x68 |
|`n` | 0x6e | 0b01101111 | 0x6f |
|`/` | 0x2f | 0b00101110 | 0x2e |
|`/` | 0x2f | 0b00101110 | 0x2e |
|`s` | 0x73 | 0b01110010 | 0x72 |
|`h` | 0x68 | 0b01101001 | 0x69 |
|----|------|------------|------|

4. Make a little endian order

original hex value in little endian order = `0x68732f2f6e69622f`
encoded hex value in little endian order = `0x69722e2e6f68632e`

