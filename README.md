# OpenRocket + Git (Zero‑Hassle Workflow)

> **TL;DR**  
> 1. Save your design in OpenRocket (`Ctrl+S`). Somewhere inside of the OpenRocket-Simulations folder. 
> 2. Double‑click **win_update.bat**.  
> 3. Type a short description of what you changed and press **Enter**.  
> 4. You’re done – the new version is backed up for the whole team.

---

## Why do we need this?

| Problem | How the wrapper fixes it |
|---------|--------------------------|
| **OpenRocket always saves as a ZIP.** Git can’t show useful diffs and stores each ZIP as a big binary blob. | The script automatically **converts every saved file to plain XML** (still an `.ork` extension) before committing. |
| **People forget which file is the latest.** | Git keeps a complete timeline. You can open any earlier version in OpenRocket. |
| **“Git is scary!”** | You never have to type Git commands. One double‑click does the work. |

---

## One‑time setup

1. **Install Git for Windows**  
   <https://git-scm.com/downloads/win>  
   Accept all defaults.

2. **Clone the repository**  
   *Right‑click → “Git Bash Here”* in the folder where you want the project, then:  
   ```bash
   git clone https://github.com/CURocketEngineering/OpenRocket-Simulations.git
