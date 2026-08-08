# ⚡ Mind Spark - Native JavaFX Desktop Quiz Application

**Mind Spark** is a native, modern, high-performance Windows desktop quiz application built with **Java 21 LTS**, **JavaFX**, and **Maven**.

It completely replaces the previous web/Electron stack with a 100% pure Java architecture.

---

## 🚀 Features

- **Native Windows Desktop UI**: Beautiful glassmorphic dark theme (`#0b0f19` slate, `#151d30` glass cards, glowing purple/pink gradients).
- **100 Question Bank (10 Categories)**:
  1. Java Programming
  2. General Science
  3. Computer Technology
  4. Artificial Intelligence & Machine Learning
  5. Kali Linux & Cybersecurity
  6. Mathematics
  7. History
  8. Geography
  9. English Language
  10. Logical Reasoning & General Knowledge
- **Customizable Quiz Sessions**: Choose specific categories or "All Categories", pick difficulty (Easy, Medium, Hard, Mixed).
- **Interactive Quiz View**:
  - Live 30-second countdown timer per question with visual color warnings.
  - Interactive multiple-choice selection cards with option letters (A, B, C, D).
  - Immediate visual feedback on correct vs. incorrect answers.
  - Skip question option.
  - Linear question progress bar and difficulty indicators.
- **Detailed Results & Statistics**:
  - Performance tier banners (EXCELLENT!, GREAT JOB!, GOOD EFFORT!, KEEP PRACTICING!).
  - Score percentage and point accumulation.
  - 4 Stat Cards: Correct, Incorrect, Unattempted, and Total Time taken.
  - Detailed Question Review list detailing user selections, correct answers, and explanations.
- **Persistent High Scores Leaderboard**:
  - Auto-persists scores, accuracy percentages, timing, and date locally (`~/.mindspark/leaderboard.json`).
  - Interactive leaderboard table view.
- **Audio Feedback**: Built-in sound effects for user clicks, correct answers, and wrong choices.

---

## 🛠️ Requirements & System Setup

- **Operating System**: Windows 10 / Windows 11
- **JDK**: Java Development Kit (JDK) 21 LTS or later
- **IDE**: IntelliJ IDEA (Community or Ultimate)
- **Build System**: Maven (or included `mvnw.cmd` wrapper)

---

## 📁 Final Project Architecture

```
MindSpark/
├── pom.xml                                   # Complete Maven configuration (Dependencies & Plugins)
├── mvnw.cmd                                  # Windows Maven Wrapper
├── README.md                                 # Complete documentation & manual
├── .mvn/
│   └── wrapper/
│       └── maven-wrapper.properties
└── src/
    └── main/
        ├── java/
        │   └── com/
        │       └── mindspark/
        │           ├── Main.java             # Entry point launcher (bypasses JavaFX module checks)
        │           ├── App.java              # JavaFX Application
        │           ├── model/                # Data Models & Enums
        │           │   ├── Question.java
        │           │   ├── Category.java
        │           │   ├── Difficulty.java
        │           │   ├── QuizSession.java
        │           │   ├── QuizResult.java
        │           │   ├── UserAnswer.java
        │           │   └── LeaderboardEntry.java
        │           ├── repository/           # Data Loaders & Persistence
        │           │   ├── QuestionRepository.java
        │           │   └── LeaderboardRepository.java
        │           ├── service/              # Core Business Logic & Audio/Timers
        │           │   ├── QuizService.java
        │           │   ├── TimerService.java
        │           │   └── AudioService.java
        │           ├── ui/                   # Navigation & Views
        │           │   ├── NavigationManager.java
        │           │   ├── components/
        │           │   │   ├── HeaderBar.java
        │           │   │   ├── OptionCard.java
        │           │   │   ├── StatCard.java
        │           │   │   └── QuestionReviewCard.java
        │           │   └── views/
        │           │       ├── HomeView.java
        │           │       ├── QuizView.java
        │           │       ├── ResultView.java
        │           │       └── LeaderboardView.java
        │           └── util/                 # Utility Classes
        │               ├── AppConstants.java
        │               ├── JsonUtils.java
        │               └── TimeUtils.java
        └── resources/                        # Assets & Resources
            ├── css/
            │   └── style.css                 # Glassmorphic Theme CSS
            └── questions/
                └── questions.json            # 100-Question JSON Bank
```

---

## 💻 Running Mind Spark in IntelliJ IDEA

1. **Open Project**: Launch IntelliJ IDEA, click **Open**, and navigate to the project directory: `c:\Users\ksbha\Downloads\new project`.
2. **Project SDK Setup**:
   - Go to `File` ➔ `Project Structure` ➔ `Project`.
   - Set **SDK** to **Java 21**.
   - Set **Language level** to **21 - Preview / SDK default**.
3. **Maven Import**:
   - IntelliJ IDEA automatically detects `pom.xml`. If prompted, click **Load Maven Changes** or open the Maven Tool Window on the right and click the refresh icon to download dependencies.
4. **Run Application**:
   - Locate `src/main/java/com/mindspark/Main.java`.
   - Right-click `Main.java` and select **Run 'Main.main()'**.
   - Mind Spark starts natively.

---

## ⚙️ Running via Command Line (Maven)

Open PowerShell or Command Prompt in the project root directory:

```powershell
# Using installed Maven:
mvn clean javafx:run

# Or using the included Maven wrapper:
.\mvnw clean javafx:run
```

---

## 📦 Building Executable JAR (Uber-JAR)

To create a self-contained executable JAR containing all JavaFX components and Jackson dependencies:

```powershell
mvn clean package
```

The output JAR will be generated at:
`target/MindSpark-1.0.0.jar`

### Running the Executable JAR:
```powershell
java -jar target/MindSpark-1.0.0.jar
```

---

## 🖥️ Creating Windows Application (.EXE) via `jpackage`

JDK 21 includes the native `jpackage` tool to bundle Java applications into standalone Windows `.exe` installers or executable directories that run without pre-installing Java on the target PC.

### Step 1: Package Uber-JAR
```powershell
mvn clean package
```

### Step 2: Run `jpackage` Command
```powershell
jpackage `
  --type app-image `
  --name "MindSpark" `
  --input target/ `
  --main-jar MindSpark-1.0.0.jar `
  --main-class com.mindspark.Main `
  --dest dist/ `
  --win-shortcut `
  --win-menu
```

The output native executable directory will be generated at:
`dist/MindSpark/MindSpark.exe`

Double-clicking **`MindSpark.exe`** launches the application directly!

---

## ❓ Troubleshooting & FAQs

### 1. JavaFX runtime components are missing
- **Cause**: Launching `App.java` directly instead of `Main.java` when running from an IDE or unconfigured module path.
- **Solution**: Always run `Main.java`. `Main.java` delegates to `App.main(args)` without triggering strict JVM module-path checks.

### 2. Maven dependencies fail to download
- **Cause**: Network timeout or proxy restrictions.
- **Solution**: Run `mvn clean install -U` or click **Reimport All Maven Projects** in IntelliJ IDEA.

### 3. Java release version 21 not supported by javac
- **Cause**: IntelliJ IDEA or system environment is pointing to an older JDK (e.g. Java 8, 11, or 17).
- **Solution**: In IntelliJ IDEA, open `File` ➔ `Project Structure` ➔ `Project` and ensure Project SDK is explicitly set to Java 21.

### 4. Question bank fails to load
- **Cause**: Classpath resource resolution issue.
- **Solution**: Verify `src/main/resources/questions/questions.json` exists and that `target/classes/questions/questions.json` is generated upon running `mvn compile`.

---

## 🏆 Summary of Conversion

- **Old Application**: Node.js, Electron, HTML, CSS, JavaScript, `MindSpark.jar` wrapper.
- **New Mind Spark**: 100% Native Java 21 desktop application, JavaFX UI, Jackson JSON parser, Maven build system, multi-category 100 question bank, persistent leaderboard, and `jpackage` Windows EXE packaging.
