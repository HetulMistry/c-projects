#include <stdio.h>
#include <conio.h>

/**
 * main - The main function of the program
 *
 * This program reads integers from an input file, calculates the square of each
 * number, and writes the squared values to an output file. It takes command-line
 * arguments for flexibility in specifying input and output file names.
 *
 * @param argc: The number of command-line arguments
 * @param argv: An array of strings containing the command-line arguments
 *
 * @return 0 on success, 1 on failure
 */
int main(int argc, char const *argv[])
{
  // Declare file pointers for input and output
  FILE *inputFile, *outputFile;

  // Variable to store each read integer from the input file
  int number;

  // Arrays to store input and output file names
  char inputFileName[50], outputFileName[50];

  // Prompt the user to enter the name of the input file
  printf("Enter the name of the input file: ");
  scanf("%s", inputFileName);

  // Attempt to open the input file for reading
  if ((inputFile = fopen(inputFileName, "r")) == NULL)
  {
    perror("Error opening input file");
    return 1; // Return 1 to indicate an error to the operating system
  }

  // Prompt the user to enter the name of the output file
  printf("Enter the name of the output file: ");
  scanf("%s", outputFileName);

  // Attempt to open the output file for writing
  if ((outputFile = fopen(outputFileName, "w")) == NULL)
  {
    perror("Error opening output file");

    // Close the input file before returning in case of an error
    fclose(inputFile);

    return 1; // Return 1 to indicate an error to the operating system
  }

  // Read integers from the input file, calculate squares, and write to the output file
  while (fscanf(inputFile, "%d", &number) == 1)
  {
    // Calculate the square of the read number
    int squared = number * number;

    // Write the squared value to the output file
    fprintf(outputFile, "%d\n", squared);
  }

  // Close both input and output files
  fclose(inputFile);
  fclose(outputFile);

  // Print success message to the console
  printf("Operation completed successfully.\n");

  // Wait for a key press before exiting (using getch())
  getch();
  // Return 0 to indicate successful execution
  return 0;
}
