#include <stdio.h>
#include <conio.h>
#include <string.h>

/**
 * @brief Reverses a given string in-place.
 *
 * This function takes a pointer to a character array (string) and reverses
 * its content in-place.
 *
 * @param str Pointer to the null-terminated string to be reversed.
 */

// Function to reverse a string
void reverseString(char *str)
{
  // Stores the length of the string
  int length = strlen(str);

  // Loop through the first half of the string and swap characters
  for (int i = 0; i < length / 2; ++i)
  {
    // Swap characters at positions i and length - i - 1
    char temp = str[i];
    str[i] = str[length - i - 1];
    str[length - i - 1] = temp;
  }
}

/**
 * @brief Checks if a given string is a palindrome.
 *
 * This function determines whether a given null-terminated string is a
 * palindrome or not. A palindrome is a string that reads the same
 * backward as forward.
 *
 * @param str Pointer to the null-terminated string to be checked.
 * @return 1 if the string is a palindrome, 0 otherwise.
 */

// Function to check if a string is a palindrome
int isPalindrome(const char *str)
{
  // Stores the length of the string
  int length = strlen(str);

  // Loop through the first half of the string and compare characters
  for (int i = 0; i < length / 2; ++i)
  {
    // Compare characters at positions i and length - i - 1
    if (str[i] != str[length - i - 1])
    {
      return 0; // Not a palindrome
    }
  }
  // If the loop completes without returning, the string is a palindrome
  return 1; // Palindrome
}

/**
 * @brief The main function to demonstrate string reversal and palindrome check.
 *
 * This program takes user input, reverses the entered string, and checks if
 * it is a palindrome. The original and reversed strings, along with the
 * palindrome check result, are displayed to the user.
 *
 * @return 0 indicating successful execution.
 */

int main(int argc, char const *argv[])
{
  // Buffer to store user output
  char inputString[100];

  // Input
  printf("Enter a string: ");
  fgets(inputString, sizeof(inputString), stdin);
  inputString[strcspn(inputString, "\n")] = '\0'; // Remove newline character

  // Display original string
  printf("Original String: %s\n", inputString);

  // Reverse the string
  reverseString(inputString);
  printf("Reversed String: %s\n", inputString);

  // Check if it's a palindrome
  if (isPalindrome(inputString))
  {
    printf("The string is a palindrome.\n");
  }
  else
  {
    printf("The string is not a palindrome.\n");
  }

  // Wait for key press before exiting
  getch();
  return 0;
}