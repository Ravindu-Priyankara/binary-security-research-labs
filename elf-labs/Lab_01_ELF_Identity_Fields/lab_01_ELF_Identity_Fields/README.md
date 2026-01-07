# ELF Header Manual Extraction

## 1. `64bit` ELF header (Manual Extraction)

| Offset(Hex) | Offset(Dec) | Size | Field Name | Description |
|-------------|-------------|------|------------|-------------|
| 0x00 | 0 | 16B | e_ident | The magic & metadata |
| 0x10 | 16 | 2B | e_type | 01 00 = REL, 02 00 = EXEC, 03 00 = DYN |
| 0x12 | 18 | 2B | e_machine | 3e 00 = x86-64, b7 00 = AArch64 |
| 0x14 | 20 | 4B | e_version | Always 01 00 00 00 |
| 0x18 | 24 | 8B | e_entry | Virtual address where execution begins (loader jumps here) |
| 0x20 | 32 | 8B | e_phoff | Offset to Program Header Table |
| 0x28 | 40 | 8B | e_shoff | Offset to Section Header Table |
| 0x30 | 48 | 4B | e_flags | Processor-specific flags |
| 0x34 | 52 | 2B | e_ehsize | Size of this header (usually 40 00(0x40) = 64 bytes) |
| 0x36 | 54 | 2B | e_phentsize | Size of one Program Header entry |
| 0x38 | 56 | 2B | e_phnum | Number of Program Header entries |
| 0x3a | 58 | 2B | e_shentsize | Size of one Section Header entry |
| 0x3c | 60 | 2B | e_shnum | Number of Section Header entries |
| 0x3e | 62 | 2B | e_shstrndx | Index of the section name string table |
|------|----|----|------------|----------------------------------------|

<img src="./assets/64bit_ELF_header.png" width="600">

## 2. `32bit` ELF header (Manual Extraction)

| Offset(Hex) | Offset(Dec) | Size | Field Name | Description |
|-------------|-------------|------|------------|-------------|
| 0x00 | 0 | 16B | e_ident | Same as 64 bit |
| 0x10 | 16 | 2B | e_type | 01 00 = REL, 02 00 = EXEC, 03 00 = DYN |
| 0x12 | 18 | 2B | e_machine | 03 00 = x86(intel 80386) |
| 0x14 | 20 | 4B | e_version | Always 01 00 00 |
| 0x18 | 24 | 4B | e_entry | (Shorter) 4-byte Entry Point address. |
| 0x1c | 28 | 4B | e_phoff | (Shorter) Offset to Program Header Table. |
| 0x20 | 32 | 4B | e_shoff | (Shorter) Offset to Section Header Table. |
| 0x24 | 36 | 4B | e_flags | Processor-specific flags. |
| 0x28 | 40 | 2B | e_ehsize | Size of this header (usually 34 00(0x30) = 52 bytes). |
| 0x2a | 42 | 2B | e_phentsize | Size of one Program Header entry. |
| 0x2c | 44 | 2B | e_phnum | Number of Program Header entries. |
| 0x2E | 46 | 2B | e_shentsize | Size of one Section Header entry. |
| 0x30 | 48 | 2B | e_shnum | Number of Section Header entries. |
| 0x32 | 50 | 2B | e_shstrndx | Index of the section name string table. |
|------|----|----|------------|-----------------------------------------|

<img src="./assets/32bit_ELF_header.png" width="600">


## `e_ident` identification

* First 16 bytes of elf file
* Use for identify elf file

## `e_ident` identification indexes

| Index | Name | Common Value | Meaning |
|-------|------|--------------|---------|
| 0 - 03 | EI_MAG0-3 | 7f 45 4c 46 | The Magic Number |
| 4 | EI_CLASS | 01 - 02 | 01 = 32bit, 02 = 64bit |
| 5 | EI_DATA | 01 - 02 | 01 = Little Endian, 02 = Big Endian |
| 6 | EI_VERSION | 01 | ELF header version (usually 1) |
| 7 | EI_OSABI |  00 - 03 | 00 = SystemV, 03 = Linux |
| 8 | EI_ABIVERSION | 00 | ABI version |
| 9 - 15 | EI_PAD | 00 ... | Unused padding bytes |
|-----|----------|----|------------------|




## Magic Number

Magic number is first 4 bytes of e ident

```
7f 45 4c 46  
|  |  |  |
7f E  L  F

```


## Reference

https://refspecs.linuxfoundation.org/elf/gabi4+/ch4.eheader.html