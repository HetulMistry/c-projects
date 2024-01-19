#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <string.h>

// Define maximum number of flashcards and maximum word length
#define MAX_WORDS 100
#define MAX_WORD_LENGTH 50

/**
 * @brief Structure to represent a flashcard with native and foreign words.
 *        This structure is used to store information about a language flashcard,
 *        including the native word and its foreign translation.
 */
// Structure to represent a flashcard with native and foreign words
typedef struct
{
  /**
   * @brief Array to store the native word of the flashcard.
   *        It has a maximum length of MAX_WORD_LENGTH characters.
   */
  char native[MAX_WORD_LENGTH];

  /**
   * @brief Array to store the foreign translation of the flashcard.
   *        It has a maximum length of MAX_WORD_LENGTH characters.
   */
  char foreign[MAX_WORD_LENGTH];
} Flashcard;

// Array to store flashcards and a variable to track the total number of flashcards
Flashcard flashcards[MAX_WORDS];
int totalFlashcards = 0;
// Variable to store the user's score
int score = 0;

/**
 * @brief Prompts the user to add a new flashcard by entering the native word
 *        and its foreign translation. Checks if there is space to add a new
 *        flashcard and copies the input to the flashcard array.
 *
 * @details The function uses the global array flashcards to store the flashcard
 *          information and updates the totalFlashcards variable to keep track
 *          of the total number of flashcards.
 *
 * @param None
 *
 * @return None
 */
// Function to add a flashcard to the array
void addFlashcard()
{
  // Variables to store user input for native and foreign words
  char native[MAX_WORD_LENGTH];
  char foreign[MAX_WORD_LENGTH];

  // Prompt the user to enter the native word
  printf("Enter the native word: ");
  scanf("%s", native);

  // Prompt the user to enter the foreign translation
  printf("Enter the foreign translation: ");
  scanf("%s", foreign);

  // Check if there is space to add a new flashcard
  if (totalFlashcards < MAX_WORDS)
  {
    // Copy the native and foreign words to the flashcard array
    strcpy(flashcards[totalFlashcards].native, native);
    strcpy(flashcards[totalFlashcards].foreign, foreign);
    totalFlashcards++;
  }
  else
  {
    // Display an error message if the maximum number of flashcards is reached
    printf("Maximum number of flashcards reached.\n");
  }
}

/**
 * @brief Displays a flashcard to the user, prompts them to enter a translation,
 *        and checks if the entered translation is correct. Provides feedback
 *        to the user and updates the score accordingly.
 *
 * @details The function uses the global array flashcards to access the native
 *          word and its foreign translation. The user is prompted to enter their
 *          answer, and the function compares it with the correct translation.
 *          The score is updated based on the correctness of the user's answer.
 *
 * @param index Index of the flashcard to be displayed from the flashcards array.
 *
 * @return None
 */
// Function to display a flashcard and prompt the user for an answer
void displayFlashcard(int index)
{
  // Display the native word that needs to be translated
  printf("Translate: %s\n", flashcards[index].native);

  // Variable to store the user's answer
  char userAnswer[MAX_WORD_LENGTH];

  // Prompt the user to enter their answer
  printf("Your answer: ");
  scanf("%s", userAnswer);

  // Check if the user's answer is correct and provide feedback
  if (strcmp(userAnswer, flashcards[index].foreign) == 0)
  {
    printf("Correct!\n");
    score++;
  }
  else
  {
    printf("Incorrect. The correct answer is: %s\n", flashcards[index].foreign);
  }
}

/**
 * @brief Iterates through each flashcard and allows the user to practice by
 *        displaying the flashcard and prompting them to provide a translation.
 *
 * @details The function utilizes the global array flashcards and the
 *          totalFlashcards variable to iterate through each flashcard and
 *          invoke the displayFlashcard function. This provides an interactive
 *          practice session for the user.
 *
 * @param None
 *
 * @return None
 */
// Function to practice with all flashcards in the array
void practice()
{
  // Iterate through each flashcard and display it to the user
  for (int i = 0; i < totalFlashcards; i++)
  {
    // Call displayFlashcard function to present the flashcard to the user
    displayFlashcard(i);
  }
}

/**
 * @brief Main function of the Flashcard Language Learning Tool.
 *        Displays a welcome message and provides a menu for the user to
 *        interact with the language learning tool.
 *
 * @details The function uses an infinite loop to continuously present menu
 *          options to the user. It prompts the user to enter their choice and
 *          uses a switch statement to execute the corresponding functionality.
 *          The program can add flashcards, allow the user to practice with
 *          existing flashcards, view their current score, or exit the program.
 *
 * @param argc Number of command-line arguments.
 * @param argv Array of command-line arguments.
 *
 * @return 0 to indicate successful program termination.
 */
// Main function to run the flashcard language learning tool
int main(int argc, char const *argv[])
{
  // Display a welcome message
  printf("Welcome to the Flashcard Language Learning Tool!\n");

  // Infinite loop to provide menu options to the user
  while (1)
  {
    // Display menu options
    printf("\nOptions:\n");
    printf("1. Add Flashcard\n");
    printf("2. Practice\n");
    printf("3. View Score\n");
    printf("4. Exit\n");

    // Variable to store the user's choice
    int choice;
    // Prompt the user to enter their choice
    printf("Enter your choice: ");
    scanf("%d", &choice);

    // Switch statement to handle different menu choices
    switch (choice)
    {
    case 1:
      // Call the addFlashcard function to add a new flashcard
      addFlashcard();
      break;
    case 2:
      // Call the practice function to practice with flashcards
      practice();
      break;
    case 3:
      // Display the user's current score
      printf("Your current score: %d/%d\n", score, totalFlashcards);
      break;
    case 4:
      // Display an exit message and terminate the program
      printf("Exiting the program. Goodbye!\n");
      exit(0);
    default:
      // Display an error message for an invalid choice
      printf("Invalid choice. Please try again.\n");
    }
  }

  // Wait for keypress before exit
  getch();
  // Return 0 to indicate successful program termination
  return 0;
}