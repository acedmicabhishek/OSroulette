#!/bin/bash
show_menu() {
    clear
    echo "****************************************************"
    echo "*                                                  *"
    echo "*                Welcome to OSroulette             *"
    echo "*                                                  *"
    echo "*      The most dangerous game for your system.    *"
    echo "*                                                  *"
    echo "****************************************************"
    echo ""
    echo "Please select your game:"
    echo "1. Game 1 (The Classic) - Pure, simple, destructive."
    echo "2. Game 2 (The Electric Boogaloo) - Unpredictable, chaotic fun."
    echo "3. Exit - (Wise choice fuckass)"
    echo ""
}

while true; do
    show_menu
    read -p "Enter your choice [1-3]: " choice

    case $choice in
        1)
            echo "Launching Game 1... Good luck."
            sleep 2
            ./OSroulette/Game.bash
            read -p "Press [Enter] to return to the main menu..."
            ;;
        2)
            echo "Launching Game 2... May chaos be on your side."
            sleep 2
            ./OSroulette/Game2.bash
            read -p "Press [Enter] to return to the main menu..."
            ;;
        3)
            echo "You've made a wise decision. Your OS thanks you."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            sleep 2
            ;;
    esac
done