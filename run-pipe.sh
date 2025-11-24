#!/bin/bash
# run-pipe.sh

echo "Starting PIPE application..."
echo "Current directory: $(pwd)"

# Check if Maven is installed
if ! command -v mvn &> /dev/null; then
    echo "Error: Maven is not installed or not in PATH"
    exit 1
fi

# Run with debug output
set -x
mvn exec:exec -pl pipe-gui \
    -Dexec.executable=java \
    -Dexec.args="-classpath %classpath \
    -Djava.util.logging.config.file=logging.properties \
    -Djavax.xml.bind.JAXBContext=com.sun.xml.bind.v2.ContextFactory \
    -Dcom.sun.xml.bind.v2.runtime.JAXBContextImpl.fastBoot=true \
    Pipe"