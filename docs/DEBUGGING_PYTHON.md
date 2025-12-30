# Debugging Python with Neovim (LazyVim)

This guide explains how to debug Python applications (including FastAPI and Django) using the configured DAP (Debug Adapter Protocol) setup.

## Prerequisites

1.  **Virtual Environment**: Ensure your project has a virtual environment (e.g., `.venv` or `venv`).
2.  **Debugpy**: This is installed automatically by Neovim (Mason), but it's good practice to have it available in your environment or rely on the Mason-managed one.
3.  **Packages**: Your project must have `django` or `fastapi`/`uvicorn` installed in its virtual environment.

## Starting the Debugger

1.  **Open a Python file** (`.py`) in your project.
    *   *Critical*: Do not try to start the debugger from the dashboard (Empty screen with "No configuration found for `snacks_dashboard`" error) or the file explorer. You must be inside a code file.
2.  Press `<leader>d` (usually `Space` + `d`) to open the debug menu.
3.  Common commands:
    *   `<leader>dc`: **Continue** (Start debugging or move to next breakpoint)
    *   `<leader>db`: Toggle **Breakpoint**
    *   `<leader>do`: Step **Over**
    *   `<leader>di`: Step **Into**
    *   `<leader>dO`: Step **Out**

## Configurations

When you start debugging (`<leader>dc`), you will be prompted to select a configuration if multiple are available.

### 1. Basic Python Script
Select **"Launch file"**. This runs the currently open script.

### 2. Django
Two configurations are provided:
*   **"Django: Run server"**: Runs `manage.py runserver`.
*   **"Django: Run Test"**: Runs `manage.py test`.

**Note**: Ensure you are in the root directory of your Django project (where `manage.py` resides).

### 3. FastAPI
Select **"FastAPI: Run app"**.

**Important Configuration**:
The default configuration assumes your entry point is `main:app`. If your app instance is named differently or in a different file (e.g., `app/main.py` defines `api = FastAPI()`), you need to edit the configuration in `lua/plugins/python-dap.lua` or select "Edit Launch.json" if you prefer per-project settings.

Default args: `["main:app", "--reload", "--port", "8000"]`

## Troubleshooting

*   **Virtual Environment**: The debugger tries to automatically detect `.venv` or `venv` in your project root. If packages are not found, ensure your virtual environment is active or detected.
*   **Breakpoints not hit**: Ensure `justMyCode` is set to `false` if you want to debug library code, though the default is `true` to focus on your code.
