# File Manager Script

A shell script for managing files in a directory, including operations like listing, renaming, and deleting files. The script automatically replaces spaces in filenames with underscores before any operation.

## Features:
- List files with filters: all, substring, or extension.
- Rename files: Replace spaces in filenames with underscores.
- Delete files: Safely delete files after confirmation.

## Usage:

<pre> 
% chmod +x ./main.sh

"""
% ./main.sh
Menu:
1. List files
  1.1. Filter by substring
  1.2. Filter by type
  1.3. List all files
2. Choose files to rename
  2.1. Filter by substring
  2.2. Filter by type
  2.3. No filter
3. Choose files to delete
  3.1. Filter by substring
  3.2. Filter by type
  3.3. No filter
x|X. Exit
Choose an option: 2 

Choose a filter (2.1, 2.2, 2.3): 2.2
Enter file extension (e.g., .txt): .png
1) /Screenshot_2024-09-10_at_12.52.31 PM.png
2) /Screenshot_2024-10-09_at_10.33.32 AM.png
3) /Screenshot_2024-09-21_at_2.55.54 PM.png
4) /Screenshot_2024-09-21_at_3.03.56 PM.png
5) /Screenshot_2024-09-21_at_2.52.43 PM.png
#? 4
Enter new name for /Screenshot_2024-09-21_at_3.03.56 PM.png (or press Enter to skip): ursa.png
Renamed /Screenshot_2024-09-21_at_3.03.56 PM.png to /ursa.png
=======================================================================
=======================================================================
Menu:
1. List files
  1.1. Filter by substring
  1.2. Filter by type
  1.3. List all files
2. Choose files to rename
  2.1. Filter by substring
  2.2. Filter by type
  2.3. No filter
3. Choose files to delete
  3.1. Filter by substring
  3.2. Filter by type
  3.3. No filter
x|X. Exit
Choose an option: x

% ./main.sh
Menu:
1. List files
  1.1. Filter by substring
  1.2. Filter by type
  1.3. List all files
2. Choose files to rename
  2.1. Filter by substring
  2.2. Filter by type
  2.3. No filter
3. Choose files to delete
  3.1. Filter by substring
  3.2. Filter by type
  3.3. No filter
x|X. Exit
Choose an option: 2 

Choose a filter (2.1, 2.2, 2.3): 2.2
Enter file extension (e.g., .txt): .png
1) /Screenshot_2024-09-10_at_12.52.31 PM.png
2) /Screenshot_2024-10-09_at_10.33.32 AM.png
3) /Screenshot_2024-09-21_at_2.55.54 PM.png
4) /Screenshot_2024-09-21_at_2.52.43 PM.png
5) /ursa.png
#? 1
Enter new name for /Screenshot_2024-09-10_at_12.52.31 PM.png (or press Enter to skip): serial
Renamed /Screenshot_2024-09-10_at_12.52.31 PM.png to /serial
=======================================================================
=======================================================================
Menu:
1. List files
  1.1. Filter by substring
  1.2. Filter by type
  1.3. List all files
2. Choose files to rename
  2.1. Filter by substring
  2.2. Filter by type
  2.3. No filter
3. Choose files to delete
  3.1. Filter by substring
  3.2. Filter by type
  3.3. No filter
x|X. Exit
Choose an option: 3

Choose a filter (3.1, 3.2, 3.3): 3.3
1) /Screenshot_2024-10-09_at_10.33.32 AM.png
2) /.DS_Store
3) /Screenshot_2024-09-21_at_2.55.54 PM.png
4) /Screenshot_2024-09-21_at_2.52.43 PM.png
5) /ursa.png
6) /serial
#? 6
Do you want to delete /serial? (y/n): y
Deleted /serial
=======================================================================
=======================================================================
Menu:
1. List files
  1.1. Filter by substring
  1.2. Filter by type
  1.3. List all files
2. Choose files to rename
  2.1. Filter by substring
  2.2. Filter by type
  2.3. No filter
3. Choose files to delete
  3.1. Filter by substring
  3.2. Filter by type
  3.3. No filter
x|X. Exit
Choose an option: x
"""
</pre>
