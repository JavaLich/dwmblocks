// Modify this file to change what commands output to your statusbar, and
// recompile using the make command.
static const Block blocks[] = {
    /*Icon*/ /*Command*/ /*Update Interval*/ /*Update Signal*/
    {"", "~/.dwm/./spotify.sh", 5, 0},
    {"", "~/.dwm/./bat.sh", 30, 0},
    {"", "~/.dwm/./cpu.sh", 5, 0},
    {"", "~/.dwm/./mem.sh", 5, 0},
    {"", "~/.dwm/./vol.sh", 1, 0},
    {"", "~/.dwm/./wlan.sh", 5, 0},
    {"", "~/.dwm/./clock.sh", 30, 0},
};

// sets delimeter between status commands. NULL character ('\0') means no
// delimeter.
static char delim[] = "";
static unsigned int delimLen = 5;
