# Directory to start from (change this as needed)
dir_start='/Users/[user]/Desktop/screen_shots'

# Function to replace spaces in filenames with underscores
function replace_spaces_with_underscores() {
    for file in "$dir_start"/*; do
        if [[ -f "$file" ]]; then  # Check if it's a file, not a directory
            new_name=$(echo "$file" | tr ' ' '_')  # Replace spaces with underscores
            if [[ "$file" != "$new_name" ]]; then
                mv "$file" "$new_name"
                echo "Renamed '$file' to '$new_name'"
            fi
        fi
    done
}

# Function to list files
function list_files() {
    replace_spaces_with_underscores  # Call the space-replacement function

    files=()
    if [[ $1 == "all" ]]; then
        for file in $(find "$dir_start" -maxdepth 1 -type f); do
            files+=("$file")
        done
    elif [[ $1 == "substr" ]]; then
        read -p "Enter substring to filter by: " substr
        for file in $(find "$dir_start" -maxdepth 1 -type f -name "*$substr*"); do
            files+=("$file")
        done
    elif [[ $1 == "type" ]]; then
        read -p "Enter file extension (e.g., .txt): " type
        for file in $(find "$dir_start" -maxdepth 1 -type f -name "*$type"); do
            files+=("$file")
        done
    fi

    # Display the files with a numbered list
    for i in "${!files[@]}"; do
        echo "$((i+1))) ${files[$i]}"
    done
}

# Function to rename files
function rename_files() {
    replace_spaces_with_underscores  # Call the space-replacement function

    files=()
    if [[ $1 == "substr" ]]; then
        read -p "Enter substring to filter by: " substr
        for file in $(find "$dir_start" -maxdepth 1 -type f -name "*$substr*"); do
            files+=("$file")
        done
    elif [[ $1 == "type" ]]; then
        read -p "Enter file extension (e.g., .txt): " type
        for file in $(find "$dir_start" -maxdepth 1 -type f -name "*$type"); do
            files+=("$file")
        done
    elif [[ $1 == "none" ]]; then
        for file in $(find "$dir_start" -maxdepth 1 -type f); do
            files+=("$file")
        done
    fi

    # Display files and prompt for selection
    select file in "${files[@]}"; do
        if [[ -n $file ]]; then
            read -p "Enter new name for $file (or press Enter to skip): " newname
            if [[ -n $newname ]]; then
                mv "$file" "$(dirname "$file")/$newname"
                echo "Renamed $file to $(dirname "$file")/$newname"
            fi
        else
            echo "Invalid selection."
        fi
        break
    done
}

# Function to delete files
function delete_files() {
    replace_spaces_with_underscores  # Call the space-replacement function

    files=()
    if [[ $1 == "substr" ]]; then
        read -p "Enter substring to filter by: " substr
        for file in $(find "$dir_start" -maxdepth 1 -type f -name "*$substr*"); do
            files+=("$file")
        done
    elif [[ $1 == "type" ]]; then
        read -p "Enter file extension (e.g., .txt): " type
        for file in $(find "$dir_start" -maxdepth 1 -type f -name "*$type"); do
            files+=("$file")
        done
    elif [[ $1 == "none" ]]; then
        for file in $(find "$dir_start" -maxdepth 1 -type f); do
            files+=("$file")
        done
    fi

    # Display files and prompt for selection
    select file in "${files[@]}"; do
        if [[ -n $file ]]; then
            read -p "Do you want to delete $file? (y/n): " confirm
            if [[ $confirm == "y" ]]; then
                rm "$file"
                echo "Deleted $file"
            fi
        else
            echo "Invalid selection."
        fi
        break
    done
}


# Function to print demarcator for separation
function print_demarcator(){
    echo "======================================================================="
    echo "======================================================================="
}

# Default action for invalid menu selection
function default_action_for_menu() {
    echo "You have entered an invalid selection!"
    echo "
        ___           ___           ___           ___           ___     
       /\__\         /\  \         /\  \         /\  \         /\  \    
      /:/ _/_       /::\  \       /::\  \       /::\  \       /::\  \   
     /:/ /\__\     /:/\:\__\     /:/\:\__\     /:/\:\  \     /:/\:\__\  
    /:/ /:/ _/_   /:/ /:/  /    /:/ /:/  /    /:/  \:\  \   /:/ /:/  /  
   /:/_/:/ /\__\ /:/_/:/__/___ /:/_/:/__/___ /:/__/ \:\__\ /:/_/:/__/___
   \:\/:/ /:/  / \:\/:::::/  / \:\/:::::/  / \:\  \ /:/  / \:\/:::::/  /
    \::/_/:/  /   \::/~~/~~~~   \::/~~/~~~~   \:\  /:/  /   \::/~~/~~~~ 
     \:\/:/  /     \:\~~\        \:\~~\        \:\/:/  /     \:\~~\     
      \::/  /       \:\__\        \:\__\        \::/  /       \:\__\    
       \/__/         \/__/         \/__/         \/__/         \/__/    
    
    "
    echo "Please try again!"
    echo ""
    echo "Press any key to continue..."
    read -n 1
    clear
    set -u # force it to treat unset variables as an error 
    unset main_menu_input
    unset filter_option
    echo ""
    main
}