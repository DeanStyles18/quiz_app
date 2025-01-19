# Quiz App

## Project Overview

The Quiz App is a Flutter-based application designed to provide users with an engaging and interactive quiz experience. Users can take quizzes on various topics, answer multiple-choice questions, and receive immediate feedback on their performance. The app features a clean and user-friendly interface, animations, and sound effects to enhance the overall experience.

## Features

- **Multiple Choice Questions**: Users can select answers from multiple options for each question.
- **Real-Time Scoring**: Users receive immediate feedback on their answers, with scores updated in real-time.
- **Sound Effects**: Enjoy sound effects for correct and incorrect answers to make the quiz more engaging.
- **Review Answers**: After completing a quiz, users can review their answers along with explanations for each question.
- **Animated Transitions**: Smooth animations enhance the user experience during question transitions and loading screens.
- **Timer**: Each question has a time limit, adding an element of challenge to the quiz.
- **Lives System**: Users have a limited number of lives, which adds a layer of difficulty to the quiz.

## Setup Instructions

To set up the project locally, follow these steps:

### Prerequisites

- Ensure you have Flutter installed on your machine. You can follow the installation guide [here](https://flutter.dev/docs/get-started/install).
- Make sure you have an IDE set up for Flutter development (e.g., Android Studio, Visual Studio Code).

### Clone the Repository
```bash
git clone https://github.com/yourusername/quiz_app.git
cd quiz_app
```

### Install Dependencies

Run the following command to install the required dependencies:

```bash
flutter pub get
```

### Add Assets

Make sure to add the required assets (images and audio files) to the `assets` directory. The following assets are used in the app:

- `assets/images/pattern.jpg` - Background pattern image.
- `assets/buzz.mp3` - Sound for incorrect answers.
- `assets/buzz2.mp3` - Sound for correct answers.

### Run the App

You can run the app using the following command:

```bash
flutter run
```

### Testing

To run the widget tests, use the following command:

```bash
flutter test
```

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the Flutter community for their support and resources.
- Special thanks to the contributors of the packages used in this project.
