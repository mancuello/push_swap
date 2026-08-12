*This project has been created as part of the 42 curriculum by mcuello.*
# Push_swap

A sorting algorithm project that sorts a stack of integers using a limited
set of operations and two stacks, aiming to do it in as few moves as
possible. Includes a bonus **checker** to validate that a given sequence of
instructions correctly sorts the input.

## How it works

The program takes a list of integers and sorts them using only two stacks
(`a` and `b`) and a small set of allowed operations — no direct access to
array indices, no extra data structures beyond the stacks themselves. It
prints the sequence of operations needed to sort stack `a`.

Depending on the size of the input, a different sorting strategy is used
for efficiency:

| Input size | Algorithm used |
|------------|-----------------|
| 2 elements | Direct swap |
| 3–10 elements | Custom sort (minimal move calculation between two stacks) |
| 11–899 elements | Quick sort (chunk-based partitioning) |
| 900+ elements | Radix sort (bit by bit, based on binary representation) |

## Allowed operations

| Operation | Description |
|-----------|--------------|
| `sa` / `sb` / `ss` | Swap the first 2 elements of stack a / b / both |
| `pa` / `pb` | Push the top of one stack to the top of the other |
| `ra` / `rb` / `rr` | Rotate: shift all elements up, first becomes last |
| `rra` / `rrb` / `rrr` | Reverse rotate: shift all elements down, last becomes first |

## Compilation

This project links against a personal C library (`libft`), which is
compiled automatically as part of the build — you don't need to build it
separately, the Makefile handles it as a dependency before compiling
push_swap itself.

```bash
make        # builds libft first, then push_swap
```

For the bonus checker:

```bash
make bonus  # builds the checker executable
```

## Usage

The program accepts integers either as separate arguments or as a single
quoted string:

```bash
./push_swap 3 4 6 2 1
./push_swap "3 4 6 2 1"
```

Both are equivalent.

### Error handling

If the input is invalid, the program prints `Error` and exits without
sorting anything. This happens when:

- Any argument is not a valid integer (letters, symbols, etc.)
- A number is out of the `int` range
- The same number appears more than once in the input
- No arguments are passed *(prints nothing and exits successfully — an
  empty list is trivially sorted)*

Example of invalid input (duplicate `3` and `4`):

```bash
./push_swap 3 4 6 4 3
Error
```

## Checker (bonus)

The checker validates whether a given sequence of operations correctly
sorts a list. It reads the initial numbers as arguments, then reads
operations from standard input (one per line, e.g. `sa`, `pb`, `ra`...)
until EOF, applies them, and prints whether the result is sorted:

```bash
./push_swap "3 4 6 2 1" | ./checker "3 4 6 2 1"
```

Output is `OK` if the operations correctly sort the stack, `KO` otherwise.

## What I learned

- Designing and comparing sorting algorithms under operational constraints
  (no arrays, only stack operations)
- Minimizing the number of moves by combining simultaneous rotations
  (`rr`/`rrr`) instead of doing them one stack at a time
- Choosing an algorithm based on input size for better time complexity
- Implementing a checker to validate a solution independently of how it
  was generated
