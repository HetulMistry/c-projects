#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

/**
 * @brief Allocates memory for a 2D array.
 *
 * This function dynamically allocates memory for a 2D array with the specified number of rows and columns.
 *
 * @param rows Number of rows in the 2D array.
 * @param cols Number of columns in the 2D array.
 * @return A pointer to the allocated 2D array. The memory must be freed using the freeMemory function.
 * @note The caller is responsible for freeing the allocated memory using the freeMemory function to avoid memory leaks.
 * @see freeMemory
 */
// Function to allocate memory for a 2D array
int **allocateMemory(int rows, int cols)
{
  // Allocate memory for an array of row pointers
  int **array = (int **)malloc(rows * sizeof(int *));

  // Allocate memory for each row in the 2D array
  for (int i = 0; i < rows; i++)
  {
    array[i] = (int *)malloc(cols * sizeof(int));
  }
  // Return a pointer to the allocated 2D array
  return array;
}

/**
 * @brief Frees memory allocated for a 2D array.
 *
 * This function deallocates the memory previously allocated for a 2D array.
 *
 * @param array A pointer to the 2D array to be freed.
 * @param rows Number of rows in the 2D array.
 * @note It is important to use this function to free the memory allocated by the allocateMemory function.
 * @see allocateMemory
 */
// Function to free memory allocated for a 2D array
void freeMemory(int **array, int rows)
{
  // Free memory for each row in the 2D array
  for (int i = 0; i < rows; i++)
  {
    free(array[i]);
  }
  // Free memory for the array of row pointers
  free(array);
}

/**
 * @brief Performs matrix multiplication.
 *
 * This function multiplies two matrices and returns the resulting matrix.
 *
 * @param mat1 Pointer to the first matrix.
 * @param rows1 Number of rows in the first matrix.
 * @param cols1 Number of columns in the first matrix.
 * @param mat2 Pointer to the second matrix.
 * @param rows2 Number of rows in the second matrix.
 * @param cols2 Number of columns in the second matrix.
 * @return A pointer to the resulting matrix. If multiplication is not possible, NULL is returned.
 * @note The caller is responsible for freeing the allocated memory using the freeMemory function.
 * @see freeMemory
 */
// Function to perform matrix multiplication
int **matrixMultiply(int **mat1, int rows1, int cols1, int **mat2, int rows2, int cols2)
{
  // Check if matrix multiplication is possible
  if (cols1 != rows2)
  {
    printf("Matrix multiplication not possible!\n");
    return NULL;
  }

  // Allocate memory for the result matrix
  int **result = allocateMemory(rows1, cols2);

  // Perform matrix multiplication
  for (int i = 0; i < rows1; i++)
  {
    for (int j = 0; j < cols2; j++)
    {
      result[i][j] = 0;
      for (int k = 0; k < cols1; k++)
      {
        result[i][j] += mat1[i][k] * mat2[k][j];
      }
    }
  }

  // Return a pointer to the resulting matrix
  return result;
}

/**
 * @brief Performs matrix transposition.
 *
 * This function transposes a given matrix, swapping its rows and columns.
 *
 * @param mat Pointer to the input matrix.
 * @param rows Number of rows in the input matrix.
 * @param cols Number of columns in the input matrix.
 * @return A pointer to the transposed matrix.
 * @note The caller is responsible for freeing the allocated memory using the freeMemory function.
 * @see freeMemory
 */
// Function to perform matrix transposition
int **transposeMatrix(int **mat, int rows, int cols)
{
  // Allocate memory for the transposed matrix
  int **result = allocateMemory(cols, rows);

  // Perform matrix transposition
  for (int i = 0; i < rows; i++)
  {
    for (int j = 0; j < cols; j++)
    {
      result[j][i] = mat[i][j];
    }
  }

  // Return a pointer to the transposed matrix
  return result;
}

/**
 * @brief Prints a 2D array.
 *
 * This function prints the elements of a 2D array to the console.
 *
 * @param mat Pointer to the 2D array to be printed.
 * @param rows Number of rows in the 2D array.
 * @param cols Number of columns in the 2D array.
 */
// Function to print a 2D array
void printMatrix(int **mat, int rows, int cols)
{
  // Iterate through rows
  for (int i = 0; i < rows; i++)
  {
    // Iterate through columns
    for (int j = 0; j < cols; j++)
    {
      // Print each element followed by a tab
      printf("%d\t", mat[i][j]);
    }
    // Move to the next line after printing a row
    printf("\n");
  }
}

/**
 * @brief Main function to demonstrate matrix operations.
 *
 * This function takes input for two matrices, performs matrix multiplication and transposition,
 * and prints the input matrices along with the results to the console.
 *
 * @param argc Number of command-line arguments.
 * @param argv Array of command-line arguments.
 * @return 0 on successful execution.
 */
int main(int argc, char const *argv[])
{
  // Variables to store matrix dimensions
  int rows1, cols1, rows2, cols2;

  // Input matrix dimensions
  printf("Enter dimensions of matrix 1 (rows columns): ");
  scanf("%d %d", &rows1, &cols1);

  printf("Enter dimensions of matrix 2 (rows columns): ");
  scanf("%d %d", &rows2, &cols2);

  // Allocate memory for matrices
  int **matrix1 = allocateMemory(rows1, cols1);
  int **matrix2 = allocateMemory(rows2, cols2);

  // Input matrix elements
  printf("Enter elements of matrix 1:\n");
  for (int i = 0; i < rows1; i++)
  {
    for (int j = 0; j < cols1; j++)
    {
      scanf("%d", &matrix1[i][j]);
    }
  }

  printf("Enter elements of matrix 2:\n");
  for (int i = 0; i < rows2; i++)
  {
    for (int j = 0; j < cols2; j++)
    {
      scanf("%d", &matrix2[i][j]);
    }
  }

  // Perform matrix multiplication
  int **product = matrixMultiply(matrix1, rows1, cols1, matrix2, rows2, cols2);

  // Perform matrix transposition
  int **transpose = transposeMatrix(matrix1, rows1, cols1);

  // Print matrices and results
  printf("\nMatrix 1:\n");
  printMatrix(matrix1, rows1, cols1);

  printf("\nMatrix 2:\n");
  printMatrix(matrix2, rows2, cols2);

  printf("\nMatrix Multiplication:\n");
  printMatrix(product, rows1, cols2);

  printf("\nMatrix 1 Transpose:\n");
  printMatrix(transpose, cols1, rows1);

  // Free allocated memory
  freeMemory(matrix1, rows1);
  freeMemory(matrix2, rows2);
  freeMemory(product, rows1);
  freeMemory(transpose, cols1);

  // Wait for a key press and return 0 to indicate successful execution
  getch();
  return 0;
}
