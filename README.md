# Rcode - The Ultimate IDE for LC-lang

Rcode is a powerful Integrated Development Environment built with **LuaJIT** and the **Lemon Code Language (LC-lang)** infrastructure. It provides a complete development environment for creating, editing, validating, and running LC-lang programs.

## Features

- **Full LC-lang Support**: Parse, validate, and execute LC-lang code
- **Interactive Editor**: Edit files with syntax highlighting and line numbers
- **REPL Mode**: Interactive Read-Eval-Print Loop for quick testing
- **AST Visualization**: View the Abstract Syntax Tree of your code
- **Manifest Generation**: Generate Lemon Studio app manifests
- **Syntax Validation**: Real-time validation of LC-lang code
- **Modular Architecture**: Clean, modular codebase built on lc_lang infrastructure

## Requirements

- **LuaJIT** or **Lua 5.1+**
- **lc_lang** repository (included as a submodule or sibling directory)

## Installation

1. Clone the Rcode repository:
   ```bash
   git clone https://github.com/Lemon-Enterprise/Rcode.git
   cd Rcode
   ```

2. Clone the lc_lang repository as a sibling directory:
   ```bash
   git clone https://github.com/Lemon-Enterprise/lc_lang.git
   ```

3. Ensure LuaJIT is installed and available in your PATH

## Usage

### Basic Commands

```bash
# Show help
luajit src/rcode.lua help

# Edit a file interactively
luajit src/rcode.lua edit examples/hello_world.lc

# Parse and show AST
luajit src/rcode.lua parse examples/hello_world.lc

# Validate a file
luajit src/rcode.lua check examples/hello_world.lc

# Run an LC-lang program
luajit src/rcode.lua run examples/hello_world.lc

# Generate manifest from Lemon Studio app
luajit src/rcode.lua manifest examples/lemon_app.lc

# Start interactive REPL
luajit src/rcode.lua repl

# Show version
luajit src/rcode.lua version
```

### Editor Commands

When editing a file, use these commands:

- `:q` - Quit editor
- `:w` - Save file
- `:validate` or `:check` - Validate syntax
- `:parse` - Show AST
- `:<line>` - Go to line number
- `:<line>,<col>` - Go to line and column
- `:help` - Show editor help

### REPL Commands

In the REPL mode:

- `exit` or `quit` - Exit REPL
- `help` - Show REPL help
- `clear` - Clear screen
- Any valid LC-lang expression or statement

## Project Structure

```
Rcode/
├── src/
│   └── rcode/
│       ├── init.lua          # Main initialization
│       ├── rcode.lua          # Entry point
│       ├── cli/               # CLI modules
│       │   ├── init.lua
│       │   └── main.lua
│       ├── editor/            # Editor modules
│       │   ├── init.lua
│       │   └── core.lua
│       ├── parser/            # Parser integration
│       │   ├── init.lua
│       │   └── lc_parser.lua
│       ├── runner/            # Code execution
│       │   ├── init.lua
│       │   └── executor.lua
│       ├── ui/                # User interface
│       │   ├── init.lua
│       │   ├── tui.lua
│       │   └── repl.lua
│       ├── config/            # Configuration
│       │   ├── init.lua
│       │   └── settings.lua
│       └── utils/             # Utilities
│           ├── init.lua
│           └── helpers.lua
├── examples/                  # Example LC-lang files
│   ├── hello_world.lc
│   ├── basics.lc
│   └── calculator.lc
├── tests/                     # Test suite
│   └── test_rcode.lua
├── README.md
└── LICENSE
```

## Architecture

Rcode is built on top of the **lc_lang** infrastructure:

- **Parser**: Uses `lc.compiler.compiler` for parsing LC-lang code
- **Validator**: Uses `lc.compiler.compiler` analysis for validation
- **Executor**: Uses `lc.runtime.evaluator` for code execution
- **Manifest**: Uses `lc.studio.manifest` for Lemon Studio app manifests

## Examples

### Hello World

```lc
@import <LemonStudioFramework>
@import <Color::Hex>

pub fn app<LSApp>(
  name = @[LSString]"Hello World App"
  version = @[[LSDouble || LSTriple] -> format = f"v{LSDouble || LSTriple}"]v1.0
  identifier = @[[LSString] -> path = String::isPath(True)]"com.example.helloworld"
) -> Result(LSPlatform::Mobile("Android")) {
  pub fn widget<LSWidget>(let el) {
    LSWidget(|el| -> {
      let text = @new text(
        text = "Hello, World!"
        header = "h1"
        color = Hex::new("#007DFF")
      )
    })
  }
}
```

### Basic Program

```lc
pub fn main() -> Result() {
  let x = 10
  let y = 20
  let sum = x + y
  return Ok(sum)
}
```

## Running Tests

```bash
luajit tests/test_rcode.lua
```

## Configuration

Rcode can be configured by creating a `rcode_config.lua` file. See the `Config` module for available options.

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Built with **LuaJIT** for performance
- Uses **LC-lang** infrastructure from Lemon-Enterprise
- Inspired by modern IDE concepts

---

**Rcode - The Ultimate IDE for LC-lang**

*Powered by LuaJIT and Lemon Code Language*
