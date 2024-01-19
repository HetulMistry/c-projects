#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <string.h>

/**
 * @struct Book
 * @brief Represents a book with its title, author, and borrowing status.
 */
// Structure to represent a book
struct Book
{
  char title[100]; // Title of the book, with a maximum length of 100 characters
  char author[50]; // Author of the book, with a maximum length of 50 characters
  int is_borrowed; // Flag indicating whether the book is currently borrowed (1) or not (0)
};

/**
 * @brief Adds a new book to the library.
 *
 * @param library An array of Book structures representing the library.
 * @param numBooks A pointer to the number of books in the library.
 *
 * This function prompts the user to enter the title and author of a new book
 * and adds it to the library. The book is initially marked as not borrowed.
 */
// Function to add a book to the library
void addBook(struct Book library[], int *numBooks)
{
  // Prompt the user to enter the title of the new book
  printf("Enter book title: ");
  // Read the title and store it in the title member of the new book
  scanf("%s", library[*numBooks].title);

  // Prompt the user to enter the author of the new book
  printf("Enter author name: ");
  // Read the author and store it in the author member of the new book
  scanf("%s", library[*numBooks].author);

  // Initially, mark the book as not borrowed
  library[*numBooks].is_borrowed = 0;

  // Increment the count of books in the library
  (*numBooks)++;
}

/**
 * @brief Searches for a book in the library by its title.
 *
 * @param library An array of Book structures representing the library.
 * @param numBooks The number of books in the library.
 *
 * This function prompts the user to enter a title for searching and
 * then looks for a book with the specified title in the library.
 * If found, it prints the book details; otherwise, it indicates
 * that the book is not found.
 */
// Function to search for a book by title
void searchBook(struct Book library[], int numBooks)
{
  char searchTitle[100]; // Buffer to store the title for searching

  // Prompt the user to enter the title for searching
  printf("Enter the title to search: ");
  // Read the title to search and store it in searchTitle
  scanf("%s", searchTitle);

  int found = 0; // Flag to track whether the book is found or not

  // Iterate through the library to find the book with the specified title
  for (int i = 0; i < numBooks; i++)
  {
    // Compare the title of the current book with the searchTitle
    if (strcmp(library[i].title, searchTitle) == 0)
    {
      // If a matching book is found, print its details
      printf("Book found:\nTitle: %s\nAuthor: %s\nBorrowed: %s\n", library[i].title, library[i].author, library[i].is_borrowed ? "Yes" : "No");
      found = 1; // Set the found flag to true
      break;     // Exit the loop since the book is found
    }
  }

  // If the book is not found, print a message indicating so
  if (!found)
  {
    printf("Book not found.\n");
  }
}

/**
 * @brief Displays the catalog of books in the library.
 *
 * @param library An array of Book structures representing the library.
 * @param numBooks The number of books in the library.
 *
 * This function prints the catalog of books in the library, including
 * each book's title, author, and borrowing status (borrowed or not).
 */
// Function to display all books in the library
void displayBooks(struct Book library[], int numBooks)
{
  // Print a header for the library catalog
  printf("Library Catalog:\n");

  // Iterate through the library and print details for each book
  for (int i = 0; i < numBooks; i++)
  {
    // Print book details, including title, author, and borrowing status
    printf("%d. Title: %s\n   Author: %s\n   Borrowed: %s\n", i + 1, library[i].title, library[i].author, library[i].is_borrowed ? "Yes" : "No");
  }
}

/**
 * @brief Sorts the library catalog of books by title in ascending order.
 *
 * @param library An array of Book structures representing the library.
 * @param numBooks The number of books in the library.
 *
 * This function uses a simple bubble sort algorithm to sort the books in the library
 * based on their titles in ascending order. After the sorting process, the library array
 * will be modified, and books will be arranged alphabetically by title.
 */
// Function to sort books by title
void sortBooks(struct Book library[], int numBooks)
{
  // Iterate through the library using a bubble sort algorithm
  for (int i = 0; i < numBooks - 1; i++)
  {
    for (int j = i + 1; j < numBooks; j++)
    {
      // Compare titles and swap books if they are out of order
      if (strcmp(library[i].title, library[j].title) > 0)
      {
        // Swap books using a temporary variable
        struct Book temp = library[i];
        library[i] = library[j];
        library[j] = temp;
      }
    }
  }
}

/**
 * @brief Allows the user to borrow a book from the library.
 *
 * @param library An array of Book structures representing the library.
 * @param numBooks The number of books in the library.
 *
 * This function prompts the user to enter the title of the book they want to borrow.
 * It then checks if the book is available for borrowing and updates its status accordingly.
 * If the book is already borrowed, it notifies the user; otherwise, it marks the book as borrowed.
 */
// Function to track borrowed books
void borrowBook(struct Book library[], int numBooks)
{
  char borrowTitle[100]; // Buffer to store the title of the book to borrow

  // Prompt the user to enter the title of the book to borrow
  printf("Enter the title of the book to borrow: ");
  // Read the title to borrow and store it in borrowTitle
  scanf("%s", borrowTitle);

  int found = 0; // Flag to track whether the book is found or not

  // Iterate through the library to find the book with the specified title
  for (int i = 0; i < numBooks; i++)
  {
    // Compare the title of the current book with the borrowTitle
    if (strcmp(library[i].title, borrowTitle) == 0)
    {
      // If the book is found
      if (library[i].is_borrowed)
      {
        // If the book is already borrowed, notify the user
        printf("Sorry, the book is already borrowed.\n");
      }
      else
      {
        // If the book is not borrowed, mark it as borrowed
        library[i].is_borrowed = 1;
        // Notify the user that the book has been borrowed
        printf("Book '%s' has been borrowed.\n", borrowTitle);
      }
      found = 1; // Set the found flag to true
      break;     // Exit the loop since the book is found
    }
  }

  // If the book is not found, notify the user
  if (!found)
  {
    printf("Book not found.\n");
  }
}

/**
 * @brief Main function for the Library Management System program.
 *
 * @param argc Number of command-line arguments.
 * @param argv Array of command-line arguments.
 * @return 0 on successful execution.
 *
 * This function serves as the entry point for the Library Management System program.
 * It initializes the library, displays a menu, and performs operations based on the user's choice.
 * The program continues to run until the user chooses to exit (option 0).
 */
int main(int argc, char const *argv[])
{
  struct Book library[100]; // Maximum number of books in the library
  int numBooks = 0;         // Number of books currently in the library
  int choice;

  // Display the menu and handle user input in a loop
  do
  {
    // Display the main menu for the Library Management System
    printf("\nLibrary Management System\n");
    printf("1. Add a book\n");
    printf("2. Search for a book\n");
    printf("3. Display all books\n");
    printf("4. Sort books by title\n");
    printf("5. Borrow a book\n");
    printf("0. Exit\n");
    printf("Enter your choice: ");
    // Read the user's choice
    scanf("%d", &choice);

    // Perform actions based on the user's choice using a switch statement
    switch (choice)
    {
    case 1:
      // Call the addBook function to add a new book to the library
      addBook(library, &numBooks);
      break;
    case 2:
      // Call the searchBook function to search for a book in the library
      searchBook(library, numBooks);
      break;
    case 3:
      // Call the displayBooks function to display all books in the library
      displayBooks(library, numBooks);
      break;
    case 4:
      // Call the sortBooks function to sort books in the library by title
      sortBooks(library, numBooks);
      printf("Books sorted by title.\n");
      break;
    case 5:
      // Call the borrowBook function to allow the user to borrow a book
      borrowBook(library, numBooks);
      break;
    case 0:
      // Exit the program
      printf("Exiting the program.\n");
      break;
    default:
      // Notify the user of an invalid choice
      printf("Invalid choice. Please enter a valid option.\n");
    }
  } while (choice != 0); // Continue the loop until the user chooses to exit

  // Wait for a key press before exiting (for console-based programs)
  getch();

  // Return 0 to indicate successful execution
  return 0;
}
