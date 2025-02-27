#!/bin/bash
# set -e

# echo "Testing localhost:4064..."
# curl -v http://localhost:4064 || echo "❌ localhost:4064 is not reachable"

# echo "Testing localhost:8080..."
# curl -v http://localhost:8080 || echo "❌ localhost:8080 is not reachable"

# Run the scripts
python ontop-test/test_infra_ontop/test_endpoint.py
