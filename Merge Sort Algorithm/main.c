#include <stdio.h>
#include <conio.h>

#define MAX_SIZE 100

/**
 * @brief Merge two sub-arrays of the array.
 *
 * This function merges two sub-arrays arr[l..m] and arr[m+1..r] into a single sorted sub-array.
 * It is a helper function for the Merge Sort algorithm.
 *
 * @param arr An array containing the sub-arrays to be merged.
 * @param l The index of the left sub-array.
 * @param m The index of the middle element.
 * @param r The index of the right sub-array.
 */
// Function to merge two sub-arrays arr[l..m] and arr[m+1..r]
void merge(int arr[], int l, int m, int r)
{
  int i, j, k;
  int n1 = m - l + 1;
  int n2 = r - m;

  // Create temporary arrays
  int L[n1], R[n2];

  // Copy data to temporary arrays L[] and R[]
  for (i = 0; i < n1; i++)
    L[i] = arr[l + i];
  for (j = 0; j < n2; j++)
    R[j] = arr[m + 1 + j];

  // Merge the temporary arrays back into arr[l..r]
  i = 0;
  j = 0;
  k = l;
  while (i < n1 && j < n2)
  {
    if (L[i] <= R[j])
    {
      arr[k] = L[i];
      i++;
    }
    else
    {
      arr[k] = R[j];
      j++;
    }
    k++;
  }

  // Copy the remaining elements of L[], if there are any
  while (i < n1)
  {
    arr[k] = L[i];
    i++;
    k++;
  }

  // Copy the remaining elements of R[], if there are any
  while (j < n2)
  {
    arr[k] = R[j];
    j++;
    k++;
  }
}

/**
 * @brief Recursive function to perform Merge Sort on the array.
 *
 * This function recursively applies the Merge Sort algorithm to sort the elements
 * in the given array within the specified range [l, r].
 *
 * @param arr An array to be sorted using the Merge Sort algorithm.
 * @param l The index of the leftmost element in the array or sub-array.
 * @param r The index of the rightmost element in the array or sub-array.
 */
// Recursive function to perform merge sort on the array
void mergeSort(int arr[], int l, int r)
{
  if (l < r)
  {
    // Calculate the middle index, avoiding overflow for large l and r
    int m = l + (r - l) / 2;

    // Recursively sort the first and second halves of the array
    mergeSort(arr, l, m);
    mergeSort(arr, m + 1, r);

    // Merge the sorted halves
    merge(arr, l, m, r);
  }
}

/**
 * @brief Function to print the elements of an array.
 *
 * This function prints the elements of the given array, separated by spaces, followed by a newline character.
 *
 * @param A An array containing the elements to be printed.
 * @param size The number of elements in the array.
 */
// Function to print an array
void printArray(int A[], int size)
{
  int i;
  // Loop through each element of the array and print it
  for (i = 0; i < size; i++)
    printf("%d ", A[i]);

  // Print a newline character to separate output
  printf("\n");
}

/**
 * @brief Driver program to test Merge Sort implementation.
 *
 * This function demonstrates the usage of the Merge Sort algorithm by sorting
 * an array and printing the original and sorted arrays.
 *
 * @return 0 indicating successful execution.
 */
// Driver program to test the above functions
int main(int argc, char const *argv[])
{
  // Initialize an array with unsorted elements
  int arr[MAX_SIZE];

  // Calculate the size of the array
  int arr_size;
  //! For pre-defined arrays
  // int arr_size = sizeof(arr) / sizeof(arr[0]);

  // Get the size of the array from the user
  printf("Enter the size of the array: ");
  scanf("%d", &arr_size);

  // Check for valid size
  if (arr_size > MAX_SIZE || arr_size <= 0)
  {
    printf("Invalid array size. Exiting...\n");
    return 1; // Exit with an error code
  }

  // Get array elements from the user
  printf("Enter %d elements for the array:\n", arr_size);
  for (int i = 0; i < arr_size; i++)
  {
    printf("Element %d: ", i + 1);
    scanf("%d", &arr[i]);
  }

  // Print the original unsorted array
  printf("Given array is \n");
  printArray(arr, arr_size);

  // Perform Merge Sort on the array
  mergeSort(arr, 0, arr_size - 1);

  // Print the sorted array
  printf("\nSorted array is \n");
  printArray(arr, arr_size);

  // Wait for a key press (used for some environments)
  getch();

  // Return 0 to indicate successful execution
  return 0;
}
