# Introduction to the Project
This is where I store all workflows configs on my linux and wsl. It comes with NeoVim, tmux and kitty set up.

# Developer Environment Usage Guide

## Neovim Setup
**Leader Key:** `Space`

### 📂 File & Buffer Management
| Keybinding | Action |
| :--- | :--- |
| `<leader>e` / `<leader>fe` | Toggle **Neo-tree** file explorer |
| `<leader>ff` | Find files (**Telescope**) |
| `<leader>fg` | Live grep (search text) |
| `<leader>fb` | List buffers |
| `<S-h>` / `<S-l>` | Previous / Next buffer |
| `<leader>1-9` | Jump to buffer 1-9 |
| `<leader>x` | Close current buffer (keeps window) |

### 🧠 LSP & Coding
| Keybinding | Action |
| :--- | :--- |
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>f` | **Format** buffer |
| `<leader>fm` | Find symbols/methods in file |
| `J` / `K` (Visual) | Move selected lines down/up |
| `<leader>p` (Visual) | Paste without overwriting register |

### 🐛 Debugging (DAP)
| Keybinding | Action |
| :--- | :--- |
| `<F5>` | Start / Continue |
| `<F1>` / `<F2>` / `<F3>` | Step Into / Over / Out |
| `<leader>db` | Toggle Breakpoint |
| `<leader>du` | Toggle Debug UI |

### 🖥️ Interface
| Keybinding | Action |
| :--- | :--- |
| `<C-t>` | Toggle vertical terminal |
| `<C-h/j/k/l>` | Navigate splits (works with Tmux) |

---

## Tmux Setup
**Prefix Key:** `Ctrl + a`

### 🪟 Panes & Windows
| Keybinding | Action |
| :--- | :--- |
| `|` | Split horizontal (current path) |
| `-` | Split vertical (current path) |
| `<prefix> h/j/k/l` | Resize pane |
| `<prefix> m` | Maximize/Restore pane |
| `<C-h/j/k/l>` | Navigate panes (Vim-aware) |
| `v` | Enter Copy Mode (Vi style) |

### 🚀 Session Management
| Keybinding | Action |
| :--- | :--- |
| `<prefix> o` | **SessionX** (Fuzzy find sessions) |
| `<prefix> f` | Run `tmux-sessionizer` |
| `<prefix> n` | New session prompt |
| `<prefix> d` | Config quick menu (dotfiles) |
| `<prefix> r` | Reload Tmux config |

### 🛠️ Floating Tools (Popups)
| Keybinding | Action |
| :--- | :--- |
| `Ctrl + g` | **LazyGit** |
| `Ctrl + y` | **Yazi** file manager |
| `Ctrl + t` | Zsh terminal |
| `Ctrl + m` | RMPC (Music) |

### 💾 Persistence
*   **Resurrect/Continuum:** Sessions are automatically saved every 15 mins and restored on restart.