# 🚀 How to Save OpenRocket Designs

## ✨ Super Quick Summary (TL;DR)

1. **Save your design** in OpenRocket (`Ctrl+S`)  
   ➤ Save it *inside the `OpenRocket-Simulations` folder.*

2. **Run the update script**  
   ➤ Double-click the file named **`win_update.bat`**

3. **Type what you changed**  
   ➤ Like: “Switched motor to L1000 and shortened body tube”

4. ✅ That’s it! Your design is saved, backed up, and shared with the team.

---

## 🧠 Why Are We Doing This?

OpenRocket files are kind of weird:  
When you hit “Save”, OpenRocket actually creates a **ZIP file** that hides your rocket design inside it. This is bad for version control.

| Problem | Our Fix |
|--------|---------|
| Git sees ZIP files as binary garbage. | We automatically unzip and convert your file to readable XML (but keep the same `.ork` name). |
| You end up with “v2_final_FINAL.ork” chaos. | Git stores a history of every save. No renaming needed. |
| You don’t want to touch Git or terminals. | No problem. Just double-click a file like you would a game or app. |

---

## 💻 One-Time Setup

This only has to be done once per computer!

### 1. Install Git for Windows  
Go here: **[https://git-scm.com/downloads/win](https://git-scm.com/downloads/win)**  
Run the installer and click “Next” for everything — the defaults are perfect.

---

### 2. Clone the project folder

You only need to do this once. It creates the folder where you’ll keep all OpenRocket files.

#### How to do it:

1. **Right-click on your Desktop or Documents folder**
2. Click **“Git Bash Here”**  
   (This option shows up after you install Git)
3. In the black window that opens, paste this:
   ```bash
   git clone https://github.com/CURocketEngineering/OpenRocket-Simulations.git
   ```
4. Press **Enter**

✅ A new folder named `OpenRocket-Simulations` will appear.

---

### 3. Open the Folder

Go inside the `OpenRocket-Simulations` folder. You’ll see a file called **`win_update.bat`**  
➡️ This is your magic “update” button.

---

## 📁 Where Should I Save My Rocket?

**Always save inside the `OpenRocket-Simulations` folder.**  
You can keep different rocket files here like:

- `10k_rocket.ork`
- `payload_test.ork`
- `K700_flight.ork`

It doesn’t matter what they’re called — the system will handle the rest.

---

## 🏁 How to Use the System (Every Time You Save)

1. **OpenRocket:** design or modify your rocket  
2. Press `Ctrl+S` (or File → Save)  
   ➤ Make sure you're saving **in the `OpenRocket-Simulations` folder**  
3. **Double-click `win_update.bat`**  
4. When it asks for a commit message, type a short description of what you changed  
   ➤ Example: `Added K700, adjusted fin span`  
5. ✅ You’re done! The file is cleaned up, converted, and backed up.

---

## 💬 What If I Mess Up?

Don’t worry. Git tracks every change.

- If something breaks, we can go back to a previous version.
- You can’t break the system by saving or clicking the script.
- If you’re stuck, message a teammate — they’ll help you out.

---

## ❓ Frequently Asked Questions

### “What is Git? Do I need to know it?”
Nope. Just double-click the `.bat` file. Git handles the backups behind the scenes.

---

### “Do I have to rename my files?”
Nope! Save your file with any name like `TestRocket.ork` or `L1000Flight.ork`. The update script will convert and organize things for you.

---

### “What happens when I run the script?”
- It checks each `.ork` file in the folder
- If it’s a ZIP-style OpenRocket file, it extracts and converts it to a readable format
- It adds it to the project history with the message you typed
- It pushes the file to GitHub so your teammates can see it

---

### “Can I open the file again later?”
Yes! All `.ork` files will still open just fine in OpenRocket.

---

### “I see strange files or folders”
Ignore folders like `.git` — they’re part of how Git tracks versions. Just focus on your `.ork` files.

---

### “I forgot to run the script after saving...”
No worries. Just run it now. It’ll catch everything that hasn’t been uploaded yet.

---

## 🔄 Summary

✅ Save inside `OpenRocket-Simulations`  
✅ Double-click `win_update.bat`  
✅ Type what you changed  
✅ Done — your rocket is backed up forever

---

If you still have questions, ask Ethan Anderson on Slack.