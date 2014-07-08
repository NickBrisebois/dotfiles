import os

ignored_files = ["stylish-firefox.css", "install.py", "README.md"]
ignored_folders = [".git"]
current_dir = '/home/nick/dotfiles'

for dirs in os.walk(current_dir, topdown=True):
    dirs[:] = [d for d in dirs if d not in ignored_folders]
    print(dirs)
