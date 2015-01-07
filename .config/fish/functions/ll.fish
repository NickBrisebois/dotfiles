
# Show hidden files
function la
	ls -a --group-directories-first --color=auto
end

# More details
function ll
	ls -la"
end

# Better highlighting
function ls
	ls --groupdirectories-first --color=auto
end

# Confirm overwriting
function mkdir
	mkdir -pv
end

# Confirm overwriting
function cp
	cp -i
end
