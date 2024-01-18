#include <stdio.h>
#include <conio.h>

// Declare a maximum size for the array
#define maxArraySize 100

/**
 * @brief Swaps the values of two integer variables.
 *
 * This function takes two integer pointers as parameters and swaps the values
 * of the variables they point to. It uses a temporary variable to facilitate the
 * swapping process.
 *
 * @param a Pointer to the first integer variable.
 * @param b Pointer to the second integer variable.
 */
void swap(int *a, int *b)
{
  // Store the value of the first variable in a temporary variable
  int temp = *a;
  // Assign the value of the second variable to the first variable
  *a = *b;
  // Assign the value stored in the temporary variable to the second variable
  *b = temp;
}

/**
 * @brief Sorts an array of integers using the Bubble Sort algorithm.
 *
 * This function implements the Bubble Sort algorithm to sort the given array
 * of integers in ascending order. It repeatedly iterates through the array,
 * compares adjacent elements, and swaps them if they are in the wrong order.
 * The process is repeated until the entire array is sorted.
 *
 * @param arr Pointer to the array of integers to be sorted.
 * @param n   The number of elements in the array.
 */
void bubbleSort(int arr[], int n)
{
  // Outer loop for the number of passes through the array
  for (int i = 0; i < n - 1; i++)
  {
    // Inner loop for comparing and swapping adjacent elements
    for (int j = 0; j < n - i - 1; j++)
    {
      // Compare adjacent elements and swap if necessary
      if (arr[j] > arr[j + 1])
      {
        // Swap if the element found is greater than the next element
        swap(&arr[j], &arr[j + 1]);
      }
    }
  }
}

/**
 * @brief Prints the elements of an integer array.
 *
 * This function takes an integer array and its size as parameters and prints
 * each element of the array separated by a space. After printing all elements,
 * it adds a newline character to the output, creating a new line.
 *
 * @param arr  Pointer to the array of integers to be printed.
 * @param size The number of elements in the array.
 */
void printArray(int arr[], int size)
{
  // Loop through each element of the array
  for (int i = 0; i < size; i++)
  {
    // Print the current element followed by a space
    printf("%d ", arr[i]);
  }

  // Print a newline character to move to the next line
  printf("\n");
}

/**
 * @brief Entry point of the program.
 *
 * This function serves as the entry point for the program. It initializes an
 * integer array, prints the unsorted array, sorts it using the Bubble Sort
 * algorithm, prints the sorted array, and waits for user input before
 * terminating.
 *
 * @param argc Number of command-line arguments.
 * @param argv Array of command-line argument strings.
 * @return Integer indicating the exit status of the program.
 */
int main(int argc, char const *argv[])
{
  // Initialize an integer array
  int arr[maxArraySize];

  // Prompt the user to enter the number of elements in the array
  int n;
  printf("Enter the number of elements in the array: ");
  scanf("%d", &n);

  // Check if the entered number of elements is within the array size limit
  if (n > maxArraySize)
  {
    printf("Error: Number of elements exceeds the maximum array size.\n");
    return 1; // Exit with an error code
  }

  // Prompt the user to enter each element of the array
  printf("Enter the elements of the array:\n");
  for (int i = 0; i < n; i++)
  {
    printf("Element %d: ", i + 1);
    scanf("%d", &arr[i]);
  }

  //! For pre-defined arrays
  // // Determine the number of elements in the array
  // int n = sizeof(arr) / sizeof(arr[0]);

  // Print the unsorted array
  printf("Unsorted array: ");
  printArray(arr, n);

  // Sort the array using the Bubble Sort algorithm
  bubbleSort(arr, n);

  // Print the sorted array
  printf("Sorted array: ");
  printArray(arr, n);

  // Wait for user input (commonly used in Windows environments)
  getch();
  // Indicate successful program execution by returning 0
  return 0;
}
