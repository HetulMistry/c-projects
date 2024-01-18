#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <stdlib.h>

/**
 * @brief Displays the help message for the program.
 *
 * This function prints the usage information and available options for the
 * program to the standard output.
 */
void printHelp(void)
{
  // Display program usage and options
  printf("Usage: program_name [options] filename\n");
  printf("Options:\n");
  printf("  -h, --help     Display this help message\n");
  printf("  -c, --count    Count the number of lines in the file\n");
  printf("  -r, --read     Read and display the content of the file\n");
}

/**
 * @brief Counts the number of lines in a file.
 *
 * This function takes the name of a file as input, opens the file, and
 * counts the number of lines in it by iterating through the characters
 * and detecting newline characters.
 *
 * @param filename Pointer to the null-terminated string containing the
 *                 name of the file to be processed.
 * @return The number of lines in the file.
 * @note Exits the program with an error message if the file cannot be opened.
 */
int countLines(const char *filename)
{
  // Attempt to open the specified file
  FILE *file = fopen(filename, "r");
  if (file == NULL)
  {
    perror("Error opening file");
    exit(EXIT_FAILURE);
  }

  // Count the number of lines in the file
  int count = 0;
  char ch;
  while ((ch = fgetc(file)) != EOF)
  {
    if (ch == '\n')
    {
      count++;
    }
  }

  // Close the file
  fclose(file);

  // Return the count of lines
  return count;
}

/**
 * @brief Reads and displays the content of a file.
 *
 * This function takes the name of a file as input, opens the file, and
 * prints the content of the file character by character to the standard output.
 *
 * @param filename Pointer to the null-terminated string containing the
 *                 name of the file to be read and displayed.
 * @note Exits the program with an error message if the file cannot be opened.
 */
void readFile(const char *filename)
{
  // Attempt to open the specified file
  FILE *file = fopen(filename, "r");
  if (file == NULL)
  {
    perror("Error opening file");
    exit(EXIT_FAILURE);
  }

  // Display the content header
  printf("Content of %s:\n", filename);

  // Read and display the content character by character
  char ch;
  while ((ch = fgetc(file)) != EOF)
  {
    putchar(ch);
  }

  // Close the file
  fclose(file);
}

/**
 * @brief The main function to process command line arguments and perform actions.
 *
 * This function serves as the entry point for the program. It processes the
 * command line arguments, performs actions based on the provided options and
 * file name, and displays relevant information to the user.
 *
 * @param argc The number of command line arguments.
 * @param argv An array of strings representing the command line arguments.
 * @return EXIT_SUCCESS if the program executes successfully, EXIT_FAILURE otherwise.
 */
int main(int argc, char *argv[])
{
  // Check for sufficient command line arguments
  if (argc < 2)
  {
    printf("Error: Insufficient arguments.\n");
    printHelp();
    return EXIT_FAILURE;
  }

  // Variable to store the filename
  const char *filename = NULL;

  // Iterate through command line arguments
  for (int i = 1; i < argc; i++)
  {
    if (argv[i][0] == '-')
    {
      // It's an option
      if (argv[i][1] == 'h' || strcmp(argv[i], "--help") == 0)
      {
        // Display help message and exit successfully
        printHelp();
        return EXIT_SUCCESS;
      }
      else if (argv[i][1] == 'c' || strcmp(argv[i], "--count") == 0)
      {
        // Count lines in the file
        if (filename == NULL && i + 1 < argc)
        {
          filename = argv[++i];
          printf("Number of lines in %s: %d\n", filename, countLines(filename));
        }
        else
        {
          // Error: Missing filename for option -c/--count
          printf("Error: Missing filename for option -c/--count\n");
          printHelp();
          return EXIT_FAILURE;
        }
      }
      else if (argv[i][1] == 'r' || strcmp(argv[i], "--read") == 0)
      {
        // Read and display the content of the file
        if (filename == NULL && i + 1 < argc)
        {
          filename = argv[++i];
          readFile(filename);
        }
        else
        {
          // Error: Missing filename for option -r/--read
          printf("Error: Missing filename for option -r/--read\n");
          printHelp();
          return EXIT_FAILURE;
        }
      }
      else
      {
        // Error: Unknown option
        printf("Error: Unknown option %s\n", argv[i]);
        printHelp();
        return EXIT_FAILURE;
      }
    }
    else
    {
      // It's the filename
      if (filename == NULL)
      {
        filename = argv[i];
      }
      else
      {
        // Error: Multiple filenames provided
        printf("Error: Multiple filenames provided.\n");
        printHelp();
        return EXIT_FAILURE;
      }
    }
  }

  // Check if a filename is provided
  if (filename == NULL)
  {
    // Error: No filename provided
    printf("Error: No filename provided.\n");
    printHelp();
    return EXIT_FAILURE;
  }

  // Wait for a key press before exiting
  getch();
  // Exit successfully
  return EXIT_SUCCESS;
}
