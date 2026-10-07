name: Build Android APK

on:
  workflow_dispatch:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Extract project ZIP
        run: |
          rm -rf project
          mkdir project
          unzip -o arch-diagram-37-android.zip -d project

      - name: Find project root
        run: |
          echo "Searching for package.json..."
          PACKAGE_JSON=$(find project -name package.json -not -path "*/node_modules/*" -print -quit)

          if [ -z "$PACKAGE_JSON" ]; then
            echo "ERROR: package.json not found!"
            exit 1
          fi

          PROJECT_DIR=$(dirname "$PACKAGE_JSON")

          echo "Found package.json at:"
          echo "$PACKAGE_JSON"

          echo "Project directory:"
          echo "$PROJECT_DIR"

          echo "PROJECT_DIR=$PROJECT_DIR" >> "$GITHUB_ENV"

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '22'

      - name: Install dependencies
        run: |
          cd "$PROJECT_DIR"
          npm install

      - name: Create Capacitor config
        run: |
          cd "$PROJECT_DIR"

          cat > capacitor.config.json <<'EOF'
          {
            "appId": "com.amirdot.archdiagram",
            "appName": "Arch Diagram",
            "webDir": "www"
          }
          EOF

      - name: Create Android project
        run: |
          cd "$PROJECT_DIR"
          npx cap add android
          npx cap sync android

      - name: Setup Java
        uses: actions/setup-java@v4
        with:
          distribution: temurin
          java-version: '17'

      - name: Build Android APK
        run: |
          cd "$PROJECT_DIR/android"
          chmod +x gradlew
          ./gradlew assembleDebug

      - name: Upload APK
        uses: actions/upload-artifact@v4
        with:
          name: app-apk
          path: ${{ env.PROJECT_DIR }}/android/app/build/outputs/apk/debug/app-debug.apk
