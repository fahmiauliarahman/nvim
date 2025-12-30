# Debugging Golang with Neovim (LazyVim)

This guide explains how to debug Go applications using the enabled `lazyvim.plugins.extras.lang.go` extra, which leverages `nvim-dap-go` and `delve`.

## Prerequisites

1.  **Delve (`dlv`)**: The Go debugger.
    *   LazyVim's Mason configuration usually installs this automatically.
    *   You can verify it by running `:Mason` and checking for `delve`.
    *   Alternatively, install it via your system package manager or `go install github.com/go-delve/delve/cmd/dlv@latest`.

2.  **Go Tools**: Ensure `gopls` is installed and working (usually handled by Mason/LSP).

## Starting the Debugger

1.  **Open a Go file** (`.go`) in your project.
    *   *Critical*: You must be inside a code file to start debugging.
2.  Press `<leader>d` (usually `Space` + `d`) to open the debug menu.
3.  Common commands:
    *   `<leader>dc`: **Continue** (Start debugging or move to next breakpoint)
    *   `<leader>db`: Toggle **Breakpoint**
    *   `<leader>do`: Step **Over**
    *   `<leader>di`: Step **Into**
    *   `<leader>dO`: Step **Out**
    *   `<leader>dt`: **Terminate** debug session

## Configurations

When you start debugging (`<leader>dc`), `nvim-dap-go` automatically discovers tests and main packages. You will typically see options like:

### 1. Debug
Runs the `main` package in the current directory or project root.
*   It looks for a `main` function.
*   Arguments can be passed by configuring `.vscode/launch.json` if needed, but the default configuration works for simple apps.

### 2. Debug Test
Runs the test under the cursor or the tests in the current file.
*   This is extremely useful for TDD. Position your cursor inside a `func TestXxx` and press `<leader>dc`.

### 3. Debug Package (go.mod)
Debugs the entire package context defined by `go.mod`.

## Understanding the Options Menu

If you see many options (e.g., 10+ items), it is because `nvim-dap` combines **built-in dynamic configurations** with your **`launch.json`** entries.

### 1. Built-in Options (Dynamic)
These are generated automatically by `nvim-dap-go`:
*   **Debug**: Runs the `main` package in the current directory.
*   **Debug Test**: Runs the test function under your cursor.
*   **Debug test (go.mod)**: Runs all tests in the package.
*   **Attach**: Connects to an already running process.

### 2. "Delve Debug" vs "Debug"
If you see both **Debug** and **Delve Debug**, it usually means:
*   **Debug**: Is the configuration provided by `nvim-dap-go` (Recommended). It is smart and handles path mapping/modules automatically.
*   **Delve Debug**: Is often a raw adapter configuration coming from Mason or a manual setup. It might just run `dlv debug` without the extra conveniences of the plugin.
*   **Recommendation**: Always prefer **Debug** (the shorter one) or your named `launch.json` entries.

### 3. Custom Options (from `.vscode/launch.json`)
If you see names like **"Launch app"**, **"Launch worker"**, or **"Debug with Args"**, these come directly from your `.vscode/launch.json` file.
*   These are manually configured for specific entry points, arguments, or environment variables.
*   *Example*: "Launch worker" likely runs a specific `cmd/worker/main.go` file defined in your JSON.

### Summary: Which one to pick?
*   **For quick debugging**: Use **Debug** (for `main.go`) or **Debug Test** (for unit tests).
*   **For specific apps/microservices**: Use your custom named configs like **"Launch app"**.
*   **For running containers/servers**: Use **Attach** if you are connecting to a remote debugger.

## Debugging Tests Directly
You can also debug a specific test by using the "Debug Test" mapping provided by `nvim-dap-go`:
*   **<leader>dGt**: Debug the test under the cursor.
*   **<leader>dGl**: Debug the last run test.

## Troubleshooting

*   **"No configuration found"**: Ensure you are in a `.go` file.
*   **Delve version**: If you encounter weird errors, ensure your `dlv` version is up to date and compatible with your Go version.
*   **Build Tags**: If your code uses build tags (e.g., `//go:build integration`), the default debugger config might not pick them up. You may need to add a custom configuration in `.vscode/launch.json` or configure `dap-go` settings in `lua/plugins/`.

## Custom Configuration (launch.json)

For complex arguments or environment variables, you can create a `.vscode/launch.json` in your project root:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Launch Package",
      "type": "go",
      "request": "launch",
      "mode": "auto",
      "program": "${workspaceFolder}",
      "args": ["--some-flag", "value"]
    }
  ]
}
```
