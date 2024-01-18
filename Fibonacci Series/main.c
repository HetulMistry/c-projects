#include <stdio.h>
#include <conio.h>

/**
 * @brief Calculates the Fibonacci number for a given index using recursion.
 *
 * This function uses recursion to compute the Fibonacci number for a given index.
 * The Fibonacci series is a sequence of numbers in which each number is the sum
 * of the two preceding ones, usually starting with 0 and 1.
 *
 * @param n The index of the Fibonacci number to be calculated.
 * @return The Fibonacci number at the specified index.
 */
// Function to calculate Fibonacci number using recursion
int fibonacci(int n)
{
  // Base case: if the index is 0 or 1, return the index itself
  if (n <= 1)
  {
    return n;
  }
  else
  {
    // Recursive case: calculate Fibonacci number by summing
    // the two preceding Fibonacci numbers
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
}

/**
 * @brief The main function to demonstrate the Fibonacci series using recursion.
 *
 * This program takes user input for the number of terms in the Fibonacci series,
 * and then prints the Fibonacci series using the `fibonacci` function.
 *
 * @param argc The number of command-line arguments (unused in this program).
 * @param argv An array of command-line arguments (unused in this program).
 * @return 0 on successful execution.
 */
int main(int argc, char const *argv[])
{
  // Declare variables
  int n, i;

  // Prompt the user to enter the number of terms in the Fibonacci series
  printf("Enter the number of terms in the Fibonacci series: ");
  scanf("%d", &n);

  // Display the Fibonacci Series using a loop
  printf("Fibonacci Series: ");
  for (i = 0; i < n; i++)
  {
    // Call the `fibonacci` function to calculate and print each term
    printf("%d ", fibonacci(i));
  }

  // Wait for a key press (specific to some environments, e.g., Turbo C)
  getch();
  // Indicate successful execution by returning 0
  return 0;
}
