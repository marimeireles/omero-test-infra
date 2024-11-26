#!/bin/bash
# set -e

# echo "Waiting for OMERO service to be available..."

# Loop until the OMERO service is reachable
# until curl -f http://localhost:4064; do
#     echo "OMERO service is not ready. Retrying in 5 seconds..."
#     sleep 5
# done

# echo "OMERO service is available. Running scripts..."

echo "🦊 Testing localhost:4064..."
curl -v http://localhost:4064 || echo "❌ localhost:4064 is not reachable"

echo "🌸 Testing localhost:8080..."
curl -v http://localhost:8080 || echo "❌ localhost:8080 is not reachable"

echo "🌻 Testing omero:4064..."
curl -v http://omero:4064 || echo "❌ omero:4064 is not reachable"

echo "🦀 Testing ontop:8080..."
curl -v http://ontop:8080 || echo "❌ ontop:8080 is not reachable"



# Run the scripts
/opt/project/insert_data.sh && python /opt/project/test_endpoint.py
