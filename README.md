# ASM-project
introduction to assembly language
# Assembly Project README

This project includes assembly routines to implement various operations and algorithms. Each function is written in x86 assembly and handles a specific task, including string manipulation, sorting structures, and modifying board configurations.

## Files

- `io.mac`: This file is included to provide standard I/O macros and utilities used in the code.

## Sections

### 1. `simple` Function

#### Purpose
The `simple` function encrypts a string by shifting each character by a given number of steps within the ASCII range of uppercase letters (A-Z). The function ensures that if the ASCII value exceeds 'Z', it wraps around to 'A'.

#### Parameters
- **`len`** - Length of the input string.
- **`plain`** - Pointer to the input string.
- **`enc_string`** - Pointer to the output (encrypted) string.
- **`step`** - Number of steps to shift each character in the input string.

#### Logic
1. Check if the length is zero; if so, jump to the end.
2. Extract each character, add the shift step, and check if it exceeds 'Z'.
3. If it exceeds, wrap the character back within 'A'-'Z' bounds.
4. Place the encrypted character in `enc_string`, repeat for all characters.
5. Null-terminate `enc_string`.

### 2. `sort_procs` Function

#### Purpose
The `sort_procs` function sorts an array of process structures based on priority (`prio`). If priorities are equal, it sorts by time (`time`), and if those are also equal, it finally sorts by process ID (`pid`).

#### Parameters
- **`processes`** - Pointer to an array of process structures.
- **`length`** - Number of processes.

#### Structure of Each Process
The process structure contains:
- `pid` (Process ID)
- `prio` (Priority)
- `time` (Execution Time)

#### Logic
1. For each element, compare it with the next based on priority.
2. If priorities are equal, compare based on `time`.
3. If both priority and time are equal, compare by `pid`.
4. If necessary, swap two processes to maintain the correct order.
5. Repeat until the entire list is sorted.

### 3. `checkers` Function

#### Purpose
The `checkers` function modifies a given 8x8 checkerboard array to mark positions that are diagonally adjacent to a specific cell (`x`, `y`).

#### Parameters
- **`x`** - Row index of the cell.
- **`y`** - Column index of the cell.
- **`table`** - Pointer to an 8x8 board (2D array).

#### Logic
1. Calculate the position in the 1D representation of the board.
2. For each diagonal position:
   - Check if it’s within board bounds (i.e., not on edges).
   - If within bounds, mark the cell with `1`.
3. Diagonal cells are marked as follows:
   - Top-left
   - Top-right
   - Bottom-left
   - Bottom-right


