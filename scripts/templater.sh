#!/bin/bash

read -p "Enter the name of your project directory: " dir_name

mkdir "$dir_name" &&
cd "$dir_name" &&

mkdir includes/ src/  &&
touch Makefile README.md

# gitignore

cat > .gitignore << EOF

*.o
*.a
*.so
*.exe
*.out
a.out

EOF

# Makefile

cat > Makefile << EOF

SRCDIR = src/
SRCS   = src/*.c
CC 	   = gcc
TARGET =

CFLAGS = -Wall -Wextra -O3 
LDFLAGS = -lX11

# Default target
all: $(TARGET)

# Rule to build the target executable
$(TARGET): $(SRCS)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRCS) $(LDFLAGS)

run:
	./$(TARGET)

# Clean target to remove the compiled binary
clean:
	rm -f $(TARGET)

EOF

git init
git add .
git commit -m "first commit"

echo "project "$dir_name" created and initialized"
