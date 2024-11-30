# Load helper functions
source "$(dirname "$0")/main_functions.sh"

# Print menu options
function print_menu() {
    echo "Menu:"
    echo "1. List files"
    echo "  1.1. Filter by substring"
    echo "  1.2. Filter by type"
    echo "  1.3. List all files"
    echo "2. Choose files to rename"
    echo "  2.1. Filter by substring"
    echo "  2.2. Filter by type"
    echo "  2.3. No filter"
    echo "3. Choose files to delete"
    echo "  3.1. Filter by substring"
    echo "  3.2. Filter by type"
    echo "  3.3. No filter"
 
    echo "x|X. Exit"
}

# Main function to handle user input
function main() {
    while true; do
        print_menu
        read -p "Choose an option: " main_menu_input
        echo ""

        case $main_menu_input in
            1)
                read -p "Choose a filter (1.1, 1.2, 1.3): " filter_option
                case $filter_option in
                    1.1) list_files "substr" ;;
                    1.2) list_files "type" ;;
                    1.3) list_files "all" ;;
                esac
                ;;
            2)
                read -p "Choose a filter (2.1, 2.2, 2.3): " filter_option
                case $filter_option in
                    2.1) rename_files "substr" ;;
                    2.2) rename_files "type" ;;
                    2.3) rename_files "none" ;;
                esac
                ;;
            3)
                read -p "Choose a filter (3.1, 3.2, 3.3): " filter_option
                case $filter_option in
                    3.1) delete_files "substr" ;;
                    3.2) delete_files "type" ;;
                    3.3) delete_files "none" ;;
                esac
                ;;
            x|X) exit 0 ;;
            *) echo "Invalid option. Please try again." ;;
        esac

        print_demarcator
    done
}


# This builds the main menu and routs the user to the function selected.
main # This executes the main menu function.

echo ""
: <<'COMMENT_SECTION'


COMMENT_SECTION
echo ""