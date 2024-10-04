#! /bin/bash

# colors
RED='\033[0;31m'
GREEN='\033[0;32m'
GRAY='\033[0;30m'
NC='\033[0m'

# Check if python is installed
echo -e "${GRAY}Checking if python is installed${NC}"
if ! command -v python &> /dev/null
then
    echo -e "${RED}❗️ Python is not installed${NC}"
else
    echo -e "${GREEN}✅ Python${NC}"
fi

# Set up the environment
echo -e "${GRAY}Setting up .env${NC}"

if [ -f ".env" ]; then
    echo -e "${RED}❗️ .env already exists${NC}"
else
    cp .env.example .env && echo -e "${GREEN}✅ .env${NC}"
fi


# Create a virtual environment
echo -e "${GRAY}Creating .venv${NC}"

if [ -d ".venv" ]; then
    echo -e "${RED}❗️ .venv already exists${NC}"
else
    python -m venv .venv && echo -e "${GREEN}✅ .venv${NC}"
fi

# Determine the OS and activate the virtual environment accordingly
echo -e "${GRAY}Activating the virtual environment${NC}"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    . .venv/bin/activate && echo -e "${GREEN}✅ .venv/bin/activate${NC}"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    . .venv/bin/activate && echo -e "${GREEN}✅ .venv/bin/activate${NC}"
elif [[ "$OSTYPE" == "cygwin" ]]; then
    . .venv/Scripts/activate && echo -e "${GREEN}✅ .venv/Scripts/activate${NC}"
elif [[ "$OSTYPE" == "msys" ]]; then
    . .venv/Scripts/activate && echo -e "${GREEN}✅ .venv/Scripts/activate${NC}"
elif [[ "$OSTYPE" == "win32" ]]; then
    . .venv/Scripts/activate && echo -e "${GREEN}✅ .venv/Scripts/activate${NC}"
else
    echo -e "${RED}❗️ Unsupported OS${NC}"
    exit 1
fi

# Install the required packages
echo -e "${GRAY}Installing the required packages${NC}"
pip install -r requirements.txt && echo -e "${GREEN}✅ requirements.txt${NC}"



echo -e "${GRAY}\n--- --- --- --- ---\n${NC}"
echo -e "${GREEN}✅ Setup complete\n${NC}"