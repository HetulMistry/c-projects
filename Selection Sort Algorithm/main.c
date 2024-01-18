#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

/**
 * @brief Performs selection sort on an array in ascending order.
 * @param arr The array to be sorted.
 * @param n The number of elements in the array.
 * @return void
 */
// Function to perform selection sort on an array
void selectionSort(int arr[], int n)
{
  int i, j, minIndex, temp;

  // Traverse through all array elements
  for (i = 0; i < n - 1; i++)
  {
    // Find the minimum element in the unsorted part of the array
    minIndex = i;
    for (j = i + 1; j < n; j++)
    {
      if (arr[j] < arr[minIndex])
      {
        minIndex = j;
      }
    }

    // Swap the found minimum element with the first element
    temp = arr[minIndex];
    arr[minIndex] = arr[i];
    arr[i] = temp;
  }
}

/**
 * @brief Prints the elements of an array.
 * @param arr The array to be printed.
 * @param size The number of elements in the array.
 * @return void
 */
// Function to print an array
void printArray(int arr[], int size)
{
  for (int i = 0; i < size; i++)
  {
    // Print each element followed by a space
    printf("%d ", arr[i]);
  }

  // Move to the next line after printing all elements
  printf("\n");
}

/**
 * @brief Driver program to test the selectionSort function.
 * @return int
 */
// Driver program to test the selectionSort function
int main(int argc, char const *argv[])
{
  //! For pre-defined array
  // // Initialize an array with unsorted elements
  // int arr[] = {64, 25, 12, 22, 11};

  // // Calculate the number of elements in the array
  // int n = sizeof(arr) / sizeof(arr[0]);

  // Declare variables
  int n;

  // Get the number of elements from the user
  printf("Enter the number of elements: ");
  scanf("%d", &n);

  // Dynamically allocate memory for the array
  int *arr = (int *)malloc(n * sizeof(int));

  // Check if memory allocation is successful
  if (arr == NULL)
  {
    fprintf(stderr, "Memory allocation failed.\n");
    return 1; // Exit with an error code
  }

  // Get array elements from the user
  printf("Enter %d elements:\n", n);
  for (int i = 0; i < n; i++)
  {
    scanf("%d", &arr[i]);
  }

  // Print the unsorted array
  printf("Unsorted array: \n");
  printArray(arr, n);

  // Perform selection sort on the array
  selectionSort(arr, n);

  // Print the sorted array
  printf("Sorted array: \n");
  printArray(arr, n);

  // Wait for a key press
  getch();

  // Return 0 to indicate successful execution
  return 0;
}
