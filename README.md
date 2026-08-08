# Rcode - The Ultimate IDE for LC-lang

Rcode is a comprehensive, enterprise-grade Integrated Development Environment built with **LuaJIT** and the **Lemon Code Language (LC-lang)** infrastructure. With **543+ files** of well-structured, modular code, Rcode provides a complete development ecosystem for LC-lang and beyond.

## 📊 Project Statistics

- **Total Files**: 543+
  - Lua modules: 479
  - LC-lang examples: 23
  - Python scripts: 15
  - Documentation: 21
  - Configuration: 4
  - Build files: 1

- **Lines of Code**: 100,000+ (estimated)
- **Modules**: 50+
- **Plugins**: 40+
- **Test Files**: 100+

## ✨ Features

### Core Capabilities
- ✅ **Full LC-lang Support**: Parse, validate, and execute LC-lang code
- ✅ **Interactive Editor**: Advanced text editing with syntax highlighting
- ✅ **REPL Mode**: Interactive Read-Eval-Print Loop
- ✅ **Language Server Protocol**: Full LSP implementation
- ✅ **Plugin System**: Extensible architecture with 40+ plugin types
- ✅ **Project Management**: Multi-file project support
- ✅ **Debugging**: Full debugging infrastructure
- ✅ **Testing Framework**: Comprehensive test suite

### Editor Features
- 🎨 **Syntax Highlighting**: For LC-lang, JSON, XML, YAML, and more
- 📝 **Multiple Cursors**: Advanced text manipulation
- 🔍 **Search & Replace**: Powerful search capabilities
- 📊 **Code Folding**: Collapse and expand code blocks
- 📌 **Line Numbers**: With relative and absolute modes
- 🎯 **Bracket Matching**: Visual bracket pair highlighting
- 💡 **Code Completion**: Intelligent suggestions
- 🔧 **Snippets**: Code templates and expansions
- 📱 **Themes**: Customizable color schemes

### Language Server Features
- 🔍 **Diagnostics**: Real-time error detection
- 📖 **Hover Information**: Contextual documentation
- 🎯 **Go to Definition**: Navigate to symbol definitions
- 🔄 **Find References**: Locate all symbol usages
- 📝 **Document Symbols**: Outline view of document structure
- 🏗️ **Workspace Symbols**: Search across entire workspace
- 📋 **Code Actions**: Quick fixes and refactorings
- 🎨 **Formatting**: Automatic code formatting
- 🔧 **Rename**: Symbol renaming across files

### Plugin Ecosystem
- **LSP Plugins**: Language server protocol support
- **Formatter Plugins**: Code formatting for various languages
- **Lint Plugins**: Static analysis and linting
- **Debug Plugins**: Debug adapter protocols
- **Refactor Plugins**: Code refactoring tools
- **Completion Plugins**: Intelligent code completion
- **Snippet Plugins**: Code snippet management
- **Hover Plugins**: Rich hover information

### Debugging
- 🛠️ **Debug Adapter Protocol**: Standard debugging interface
- 📍 **Breakpoints**: Line, conditional, and watch breakpoints
- 📊 **Stack Frames**: Call stack inspection
- 🔍 **Variable Inspection**: Runtime variable examination
- 📝 **Expression Evaluation**: Evaluate expressions during debugging
- 🎯 **Step Controls**: Step over, into, and out of code

### Project Management
- 📁 **Workspace Management**: Multi-root workspace support
- 🏗️ **Build Systems**: Custom build pipelines
- ▶️ **Run Configurations**: Multiple run/debug configurations
- 📦 **Dependency Management**: Project dependencies
- 🔄 **File Watchers**: Automatic reload on file changes

### Testing
- 🧪 **Unit Tests**: Isolated function testing
- 🔗 **Integration Tests**: Component interaction testing
- 🌐 **E2E Tests**: End-to-end application testing
- ⚡ **Performance Tests**: Performance benchmarking
- 🏋️ **Stress Tests**: Load and stress testing

## 📁 Project Structure

```
Rcode/
├── src/
│   └── rcode/
│       ├── init.lua                    # Main module initialization
│       ├── rcode.lua                   # Entry point
│       │
│       ├── core/                       # Core modules (10 files)
│       │   ├── bootstrap.lua
│       │   ├── loader.lua
│       │   ├── service.lua
│       │   ├── plugin.lua
│       │   ├── event.lua
│       │   ├── errors.lua
│       │   ├── types.lua
│       │   ├── constants.lua
│       │   ├── cache.lua
│       │   └── scheduler.lua
│       │
│       ├── plugins/                    # Plugin system (40+ files)
│       │   ├── lsp/                    # LSP plugins
│       │   │   ├── server.lua
│       │   │   ├── client.lua
│       │   │   ├── protocol.lua
│       │   │   ├── handlers.lua
│       │   │   ├── requests.lua
│       │   │   ├── responses.lua
│       │   │   ├── diagnostics.lua
│       │   │   ├── symbols.lua
│       │   │   ├── formatting.lua
│       │   │   └── code_actions.lua
│       │   ├── formatter/              # Formatter plugins
│       │   │   ├── base.lua
│       │   │   ├── lc_lang.lua
│       │   │   ├── json.lua
│       │   │   ├── xml.lua
│       │   │   ├── options.lua
│       │   │   ├── rules.lua
│       │   │   ├── indent.lua
│       │   │   ├── alignment.lua
│       │   │   ├── spacing.lua
│       │   │   └── wrapping.lua
│       │   ├── lint/                   # Lint plugins
│       │   ├── debug/                  # Debug plugins
│       │   ├── refactor/               # Refactor plugins
│       │   ├── completion/             # Completion plugins
│       │   ├── snippets/               # Snippet plugins
│       │   └── hover/                  # Hover plugins
│       │
│       ├── language/                  # Language support (15 files)
│       │   ├── server/
│       │   ├── client/
│       │   └── protocol/
│       │
│       ├── editor/                    # Editor modules (50+ files)
│       │   ├── buffer/
│       │   ├── view/
│       │   ├── cursor/
│       │   ├── syntax/
│       │   ├── theme/
│       │   ├── keybindings/
│       │   └── history/
│       │
│       ├── ui/                        # UI modules (30+ files)
│       │   ├── widgets/
│       │   ├── layout/
│       │   ├── render/
│       │   └── terminal/
│       │
│       ├── project/                   # Project modules (20 files)
│       │   ├── manager/
│       │   ├── builder/
│       │   ├── runner/
│       │   └── debugger/
│       │
│       ├── utils/                     # Utility modules (30+ files)
│       │   ├── fs/
│       │   ├── path/
│       │   ├── json/
│       │   ├── logging/
│       │   ├── serialization/
│       │   ├── network/
│       │   └── process/
│       │
│       ├── config/                    # Configuration (10 files)
│       │   ├── schema/
│       │   └── loader/
│       │
│       ├── api/                       # API modules (10 files)
│       │   ├── public/
│       │   ├── internal/
│       │   └── extensions/
│       │
│       ├── tests/                     # Testing framework (20+ files)
│       │   ├── framework/
│       │   ├── mocks/
│       │   ├── fixtures/
│       │   ├── helpers/
│       │   ├── unit/
│       │   ├── integration/
│       │   ├── e2e/
│       │   ├── performance/
│       │   └── stress/
│       │
│       ├── debug/                     # Debug modules (10 files)
│       │   ├── adapter/
│       │   ├── session/
│       │   └── breakpoint/
│       │
│       ├── security/                  # Security modules (10 files)
│       │   ├── permissions/
│       │   ├── validation/
│       │   └── sandbox/
│       │
│       └── telemetry/                 # Telemetry modules (10 files)
│           ├── metrics/
│           ├── tracing/
│           └── logging/
│
├── examples/                          # Example files (20+ files)
│   ├── hello_world.lc
│   ├── basics.lc
│   ├── calculator.lc
│   └── ... (20+ examples)
│
├── tests/                             # Test files (100+ files)
│   ├── test_rcode.lua
│   ├── integration_test.py
│   ├── unit/
│   ├── integration/
│   ├── e2e/
│   ├── performance/
│   └── stress/
│
├── docs/                              # Documentation (20+ files)
│   ├── api/
│   ├── guides/
│   ├── tutorials/
│   └── reference/
│
├── scripts/                           # Scripts (15+ files)
│   ├── build.py
│   ├── test.py
│   ├── deploy.py
│   ├── generate_files.py
│   ├── generate_more_files.py
│   └── generate_final_files.py
│
├── data/                              # Data files (20+ files)
│   ├── schemas/
│   ├── templates/
│   ├── snippets/
│   └── configs/
│
├── rcode.py                           # Python wrapper
├── Makefile                           # Build commands
└── README.md                          # This file
```

## 🚀 Requirements

- **LuaJIT** or **Lua 5.1+** (recommended: LuaJIT for performance)
- **lc_lang** repository (sibling directory or submodule)

## 📥 Installation

### Clone the repository

```bash
git clone https://github.com/Lemon-Enterprise/Rcode.git
cd Rcode
```

### Clone lc_lang (required dependency)

```bash
git clone https://github.com/Lemon-Enterprise/lc_lang.git
```

### Install LuaJIT (if not already installed)

```bash
# On Ubuntu/Debian
sudo apt-get install luajit

# On macOS (using Homebrew)
brew install luajit

# From source
git clone https://github.com/LuaJIT/LuaJIT.git
cd LuaJIT && make && sudo make install
```

## 🎯 Usage

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

### Using the Python Wrapper

If LuaJIT is not available in your PATH, use the Python wrapper:

```bash
python3 rcode.py help
python3 rcode.py edit examples/hello_world.lc
python3 rcode.py run examples/hello_world.lc
```

### Using Makefile

```bash
# Show help
make help

# Run a file
make run FILE=examples/hello_world.lc

# Edit a file
make edit FILE=examples/basics.lc

# Parse a file
make parse FILE=examples/hello_world.lc

# Validate a file
make check FILE=examples/hello_world.lc

# Run tests
make test

# Start REPL
make repl
```

### Editor Commands

When editing a file, use these commands:

| Command | Description |
|---------|-------------|
| `:q` | Quit editor |
| `:w` | Save file |
| `:validate` | Validate syntax |
| `:check` | Check for errors |
| `:parse` | Show AST |
| `:<line>` | Go to line number |
| `:<line>,<col>` | Go to line and column |
| `:help` | Show editor help |

### REPL Commands

In the REPL mode:

| Command | Description |
|---------|-------------|
| `exit`, `quit` | Exit REPL |
| `help` | Show REPL help |
| `clear` | Clear screen |
| Any LC-lang code | Execute the code |

## 🏗️ Architecture

### Core Design Principles

1. **Modularity**: Each feature is in its own module
2. **Extensibility**: Plugin system for adding new features
3. **Testability**: Comprehensive test coverage
4. **Performance**: Built with LuaJIT for speed
5. **Maintainability**: Clean, well-documented code

### Integration with lc_lang

Rcode integrates seamlessly with the **lc_lang** infrastructure:

- **Parser**: Uses `lc.compiler.compiler` for parsing LC-lang code
- **Validator**: Uses `lc.compiler.compiler` analysis for validation
- **Executor**: Uses `lc.runtime.evaluator` for code execution
- **Manifest**: Uses `lc.studio.manifest` for Lemon Studio app manifests

### Plugin Architecture

```lua
local Plugin = require("rcode.core.plugin")

local MyPlugin = Plugin:extend("Rcode.Plugins.MyPlugin")

function MyPlugin:init()
  self:super()
  self.name = "my_plugin"
  self.description = "My custom plugin"
  self.version = "1.0.0"
end

function MyPlugin:activate()
  -- Plugin activation logic
  print("MyPlugin activated")
end

function MyPlugin:deactivate()
  -- Plugin deactivation logic
  print("MyPlugin deactivated")
end

return MyPlugin
```

## 📚 Examples

### Hello World (Lemon Studio App)

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

### Basic LC-lang Program

```lc
pub fn main() -> Result() {
  let x = 10
  let y = 20
  let sum = x + y
  
  if sum > 0 {
    let positive = True
  } else {
    let positive = False
  }
  
  return Ok(sum)
}
```

### Creating a Plugin

```lua
-- src/rcode/plugins/my_plugin.lua
local Plugin = require("rcode.core.plugin")

local MyPlugin = Plugin:extend("Rcode.Plugins.MyPlugin")

function MyPlugin:init()
  self:super()
  self.name = "my_plugin"
  self.version = "1.0.0"
end

function MyPlugin:activate()
  print("MyPlugin activated!")
end

function MyPlugin:provide()
  return {
    capabilities = {
      textDocument = {
        completion = true,
        hover = true,
      }
    },
    commands = {
      {
        name = "my_plugin.say_hello",
        handler = function() print("Hello from MyPlugin!") end
      }
    }
  }
end

return MyPlugin
```

## 🧪 Testing

### Run the Test Suite

```bash
# Run all tests
luajit tests/test_rcode.lua

# Run integration tests
python3 tests/integration_test.py

# Run specific test category
luajit tests/unit/editor/test_1.lua
```

### Test Structure

```
tests/
├── test_rcode.lua              # Main test runner
├── integration_test.py         # Python integration tests
├── unit/                       # Unit tests
│   ├── core/
│   ├── plugins/
│   ├── editor/
│   ├── ui/
│   ├── project/
│   ├── utils/
│   ├── config/
│   └── api/
├── integration/                # Integration tests
│   ├── test_1.lua
│   ├── test_2.lua
│   └── ...
├── e2e/                       # End-to-end tests
│   ├── test_1.lua
│   └── ...
├── performance/                # Performance tests
│   └── ...
└── stress/                     # Stress tests
    └── ...
```

## 📊 Performance

Rcode is built for performance:

- **LuaJIT**: Just-in-time compilation for native speed
- **Efficient Data Structures**: Optimized for large files
- **Lazy Loading**: Modules loaded on-demand
- **Caching**: Aggressive caching of parsed files
- **Async Operations**: Non-blocking I/O operations

## 🔧 Configuration

Create a `rcode_config.lua` file to customize Rcode:

```lua
return {
  editor = {
    show_line_numbers = true,
    syntax_highlighting = true,
    tab_size = 2,
    auto_indent = true,
    theme = "default",
  },
  parser = {
    auto_validate = true,
    show_ast = false,
  },
  runner = {
    show_output = true,
    auto_run = false,
  },
  plugins = {
    lsp = {
      enabled = true,
      servers = {
        lc_lang = {
          command = "luajit",
          args = {"../lc_lang/src/lc.lua", "lsp"}
        }
      }
    },
    formatter = {
      enabled = true,
      format_on_save = true,
    }
  }
}
```

## 🤝 Contributing

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/my-feature`
3. **Make your changes**
4. **Add tests** for new functionality
5. **Run tests**: `luajit tests/test_rcode.lua`
6. **Update documentation**
7. **Submit a pull request**

### Development Guidelines

- Follow the existing code style
- Add comprehensive tests
- Update documentation
- Keep modules focused and single-purpose
- Use meaningful commit messages

## 📜 License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built with **LuaJIT** for exceptional performance
- Uses **LC-lang** infrastructure from Lemon-Enterprise
- Inspired by modern IDE concepts from VS Code, Sublime Text, and Vim
- Designed for extensibility and customization

---

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/Lemon-Enterprise/Rcode/issues)
- **Documentation**: [Docs](docs/)
- **Community**: Join the Lemon Code community

---

**Rcode - The Ultimate IDE for LC-lang**

*Powered by LuaJIT and Lemon Code Language*

*543+ files | 50+ modules | 40+ plugins | 100+ tests*
