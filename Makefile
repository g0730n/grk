# GRK Interpreter Makefile

CC = gcc
CFLAGS = -Wall -Wextra -O2
LDFLAGS = -lm
TARGET = grk
SOURCE = grk.c

# Default target
all: $(TARGET)

# Build the interpreter
$(TARGET): $(SOURCE)
	$(CC) $(CFLAGS) $(SOURCE) -o $(TARGET) $(LDFLAGS)

# Run unit tests
test: $(TARGET)
	./$(TARGET) --test

# Clean build artifacts
clean:
	rm -f $(TARGET)
	rm -f test*.grk
	rm -f *.o

# Install to /usr/local/bin (requires sudo)
install: $(TARGET)
	install -m 755 $(TARGET) /usr/local/bin/

# Uninstall from /usr/local/bin (requires sudo)
uninstall:
	rm -f /usr/local/bin/$(TARGET)

# Run with debug mode
debug: CFLAGS += -g -DDEBUG
debug: clean $(TARGET)

# Show help
help:
	@echo "GRK Interpreter Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  all        - Build the GRK interpreter (default)"
	@echo "  test       - Build and run unit tests"
	@echo "  clean      - Remove build artifacts and test files"
	@echo "  install    - Install to /usr/local/bin (requires sudo)"
	@echo "  uninstall  - Remove from /usr/local/bin (requires sudo)"
	@echo "  debug      - Build with debug symbols"
	@echo "  help       - Show this help message"
	@echo ""
	@echo "Usage examples:"
	@echo "  make           # Build the interpreter"
	@echo "  make test      # Run unit tests"
	@echo "  make install   # Install system-wide"
	@echo "  ./grk file.grk # Run a GRK program"

.PHONY: all test clean install uninstall debug help
