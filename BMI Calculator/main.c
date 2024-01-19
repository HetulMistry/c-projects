#include <stdio.h>
#include <conio.h>

/**
 * @brief The main function of the program.
 *
 * @param argc Number of command-line arguments.
 * @param argv Array of command-line arguments.
 * @return Integer value indicating the exit status of the program.
 */
int main(int argc, char const *argv[])
{
  // Declare variables to store weight, height, and BMI
  float weight, height, bmi;

  // Prompt the user to enter their weight in kilograms
  printf("Enter your weight in kilograms: ");

  // Read the user input for weight
  scanf("%f", &weight);

  // Prompt the user to enter their height in meters
  printf("Enter your height in meters: ");

  // Read the user input for height
  scanf("%f", &height);

  // Calculate BMI using the formula: BMI = weight / (height * height)
  bmi = weight / (height * height);

  // Display the calculated BMI value with two decimal places
  printf("Your BMI is: %.2f\n", bmi);

  // Interpretation of BMI and display corresponding message
  if (bmi < 18.5)
  {
    printf("Underweight\n");
  }
  else if (bmi >= 18.5 && bmi < 25)
  {
    printf("Normal weight\n");
  }
  else if (bmi >= 25 && bmi < 30)
  {
    printf("Overweight\n");
  }
  else
  {
    printf("Obese\n");
  }

  // Wait for a key press before exiting (platform-dependent)
  getch();
  // Return 0 to indicate successful program execution
  return 0;
}
