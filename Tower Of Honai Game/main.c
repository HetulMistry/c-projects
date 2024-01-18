#include <stdio.h>
#include <conio.h>

/**
 * Solves the Tower of Hanoi problem for a given number of disks.
 *
 * @param n - The number of disks to be moved.
 * @param source - The source rod from which the disks need to be moved.
 * @param auxiliary - The auxiliary rod used for intermediate moves.
 * @param destination - The destination rod to which the disks need to be moved.
 *
 * The function recursively solves the Tower of Hanoi problem, printing each step
 * of the move sequence to transfer the stack of disks from the source rod to the
 * destination rod, using the auxiliary rod when necessary.
 */
void towerOfHanoi(int n, char source, char auxiliary, char destination)
{
  // Base case: If there is only one disk, move it directly to the destination.
  if (n == 1)
  {
    printf("Move disk 1 from %c to %c\n", source, destination);
    return;
  }

  // Move (n-1) disks from source to auxiliary using destination as the auxiliary rod.
  towerOfHanoi(n - 1, source, destination, auxiliary);

  // Move the nth disk from source to destination.
  printf("Move disk %d from %c to %c\n", n, source, destination);

  // Move (n-1) disks from auxiliary to destination using source as the auxiliary rod.
  towerOfHanoi(n - 1, auxiliary, source, destination);
}

/**
 * The main function to execute the Tower of Hanoi puzzle.
 *
 * @param argc - The number of command-line arguments (unused in this program).
 * @param argv - An array of command-line arguments (unused in this program).
 * @return 0 on successful execution.
 *
 * This function prompts the user to enter the number of disks for the Tower of Hanoi puzzle,
 * reads the input, and then calls the towerOfHanoi function to solve and display the steps
 * needed to complete the puzzle. The three rods are denoted by characters 'A', 'B', and 'C'.
 */
int main(int argc, char const *argv[])
{
  // Variable to store the number of disks entered by the user.
  int numDisks;

  // Prompt the user to enter the number of disks.
  printf("Enter the number of disks: ");

  // Read the user input for the number of disks.
  scanf("%d", &numDisks);

  // Call the towerOfHanoi function to solve and display the steps for the Tower of Hanoi puzzle.
  towerOfHanoi(numDisks, 'A', 'B', 'C');

  // Wait for a key press (specific to some environments, e.g., Turbo C)
  getch();
  // Return 0 to indicate successful execution.
  return 0;
}
