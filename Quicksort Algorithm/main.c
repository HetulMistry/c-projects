#include <stdio.h>
#include <conio.h>

/**
 * @brief Swaps the values of two integers.
 *
 * This function takes two integer pointers as input and swaps the values
 * they point to.
 *
 * @param a Pointer to the first integer.
 * @param b Pointer to the second integer.
 */
// Function to swap two elements in an array
void swap(int *a, int *b)
{
  // Store the value at the memory location pointed by 'a' in a temporary variable
  int temp = *a;

  // Assign the value at the memory location pointed by 'b' to the memory location pointed by 'a'
  *a = *b;
  // Assign the value stored in the temporary variable to the memory location pointed by 'b'
  *b = temp;
}

/**
 * @brief Partitions an array and returns the pivot index.
 *
 * This function takes an array, a low index, and a high index as input,
 * chooses the rightmost element as the pivot, and rearranges the array such
 * that elements smaller than or equal to the pivot are on the left, and
 * elements greater than the pivot are on the right.
 *
 * @param arr The array to be partitioned.
 * @param low The lowest index of the partition.
 * @param high The highest index of the partition.
 * @return The index of the pivot after partitioning.
 */
// Function to partition the array and return the pivot index
int partition(int arr[], int low, int high)
{
  int pivot = arr[high]; // Choosing the rightmost element as the pivot
  int i = low - 1;       // Index of smaller element

  // Iterate through the array
  for (int j = low; j < high; j++)
  {
    // If the current element is smaller than or equal to the pivot
    if (arr[j] <= pivot)
    {
      i++;
      swap(&arr[i], &arr[j]); // Swap elements at indices i and j
    }
  }

  // Swap the pivot element with the element at (i+1), which is the correct position
  swap(&arr[i + 1], &arr[high]);

  return i + 1; // Return the partition index
}

/**
 * @brief Sorts an array using the Quicksort algorithm.
 *
 * This function recursively applies the Quicksort algorithm to sort an array
 * in ascending order.
 *
 * @param arr The array to be sorted.
 * @param low The lowest index of the array or sub-array to be sorted.
 * @param high The highest index of the array or sub-array to be sorted.
 */
// Quicksort function
void quicksort(int arr[], int low, int high)
{
  // Base case: If low is less than high, there's more than one element in the sub-array
  if (low < high)
  {
    // Find the partition index where the array is divided into two halves
    int pi = partition(arr, low, high);

    // Recursively sort the sub-array to the left of the partition index
    quicksort(arr, low, pi - 1);

    // Recursively sort the sub-array to the right of the partition index
    quicksort(arr, pi + 1, high);
  }
}

/**
 * @brief Prints the elements of an array.
 *
 * This function prints the elements of the given array, separated by spaces,
 * followed by a newline character.
 *
 * @param arr The array to be printed.
 * @param size The number of elements in the array.
 */
// Function to print an array
void printArray(int arr[], int size)
{
  // Iterate through the elements of the array
  for (int i = 0; i < size; i++)
  {
    // Print the current element followed by a space
    printf("%d ", arr[i]);
  }

  // Move to the next line after printing all elements
  printf("\n");
}

/**
 * @brief Main function to demonstrate Quicksort on an array.
 *
 * The program takes user input for the number of elements in an array,
 * populates the array with user input, performs Quicksort, and prints both
 * the original and sorted arrays.
 *
 * @param argc Number of command-line arguments (unused).
 * @param argv Array of command-line arguments (unused).
 * @return Integer indicating the exit status of the program.
 */
int main(int argc, char const *argv[])
{
  // Declare a variable to store the number of elements in the array
  int n;

  // Prompt the user to enter the number of elements in the array
  printf("Enter the number of elements in the array: ");

  // Read the number of elements from the user
  scanf("%d", &n);

  // Declare an array with size 'n' to store the user-input elements
  int arr[n];

  // Prompt the user to enter 'n' elements for the array
  printf("Enter %d elements:\n", n);

  // Iterate through the array to read elements from the user
  for (int i = 0; i < n; i++)
  {
    scanf("%d", &arr[i]); // Taking array elements as user input
  }

  // Display the original array before sorting
  printf("Original array: ");
  printArray(arr, n);

  // Call the quicksort function to sort the array
  quicksort(arr, 0, n - 1);

  // Display the sorted array after quicksort
  printf("Sorted array: ");
  printArray(arr, n);

  // Wait for a key press (using getch) before exiting the program
  getch();
  // Return 0 to indicate successful execution of the program
  return 0;
}
