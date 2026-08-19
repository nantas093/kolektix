#!/bin/bash
# Vercel build script - just validate build/web exists
if [ -d "build/web" ]; then
  echo "✓ Flutter web build artifacts found"
  exit 0
else
  echo "✗ build/web directory not found"
  exit 1
fi
