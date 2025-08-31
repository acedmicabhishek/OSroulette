# OSroulette - The Ultimate Game of Chance

Welcome, thrill-seeker, to OSroulette! This isn't your average game. It's a digital dance with destiny, a high-stakes game of Russian Roulette where the prize for losing is... well, let's just say you won't have to worry about your computer problems anymore.

**EXTREME WARNING:** This is not a joke. These scripts are designed to be destructive. Running them on a real machine **WILL IRREVERSIBLY DELETE YOUR OPERATING SYSTEM AND ALL YOUR FILES.** Please, for the love of all your data, only run this in a disposable virtual machine that you are fully prepared to destroy. You have been warned.

**If you have balls, run it on your main system dickhead.**

---

## How to Play

The best way to start is by using the main launcher. First, make all the scripts executable:

```bash
chmod +x OSroulette/*.bash
```

Then, run the main launcher:

```bash
./OSroulette/Play.bash
```

Now, you're ready to choose your fate.

---

### Game 1: The Classic (`OSroulette/Game.bash`)

This is the original, the classic, the purest form of OSroulette.

**How it works:**
1.  Select the game from main menu.
2.  The game loads a virtual six-chamber revolver and places a single, deadly "bullet" in one of them.
3.  The chamber is spun, and a suspenseful countdown begins.
4.  The trigger is pulled.
5.  If the chamber is empty, you hear a "Click." You've survived... for now.
6.  If the chamber has the bullet? **BANG.** The script will immediately attempt to run `sudo rm -rf / --no-preserve-root`, the command that wipes your entire system clean. No take-backs.

It's simple, elegant, and utterly terrifying.

---

### Game 2: Electric Boogaloo (`OSroulette/Game2.bash`)

Feeling like the classic is too predictable? Welcome to the next level of digital danger.

**How it works:**
1.  Select the game from main menu.
2.  This game also spins a six-chamber revolver, but the "bullet" is far more creative.
3.  The script cleverly detects what kind of Linux distribution you're running (Debian, Ubuntu, Arch, Fedora, etc.).
4.  If you lose, it doesn't just delete your files. It picks a random, "spicy" command from a list tailored to your system. This could be anything from a fork bomb that freezes your machine, to reformatting your hard drive, to uninstalling every single package, to just shutting it down.
5.  A suspenseful countdown gives you three seconds to contemplate your choices before the script executes the randomly chosen command.

It's a chaotic, unpredictable, and frankly, a much more interesting way to digitally self-destruct.

---

**Disclaimer:** Seriously, don't run this on any machine you care about. This is a programming exercise in "what not to do" and a bit of dark humor. I am not responsible for any lost data, bricked machines, or existential dread that may result from playing this game. Play safe, and may the odds be ever in your favor.
