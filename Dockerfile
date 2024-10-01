# Use the official Haskell image
FROM haskell:latest

# Set the working directory
WORKDIR /app

# Copy the cabal file and the source files
COPY kotalive.cabal .
COPY app/ ./app/
COPY src/ ./src/
COPY static/ ./static/
COPY CHANGELOG.md .
COPY LICENSE .

# Install dependencies
RUN cabal update && cabal install --only-dependencies

# Build the application
RUN cabal build

# Expose the port the app runs on
EXPOSE 8080

# Command to run the application
CMD ["cabal", "run", "kotalive"]

