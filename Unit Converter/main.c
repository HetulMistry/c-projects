#include <stdio.h>
#include <conio.h>

/**
 * @brief Converts a value from one length unit to another.
 *
 * @param value The value to be converted.
 * @param fromUnit The source length unit (1: Meters, 2: Kilometers, 3: Centimeters).
 * @param toUnit The target length unit (1: Meters, 2: Kilometers, 3: Centimeters).
 *
 * @return The converted value. If fromUnit is equal to toUnit, no conversion is needed.
 *         If an invalid unit number is provided, the function returns 0.
 */
float convertLength(float value, int fromUnit, int toUnit)
{
  // Check if conversion is needed
  if (fromUnit == toUnit)
  {
    return value; // No conversion needed
  }

  // Conversion logic for length
  switch (fromUnit)
  {
  case 1:          // Meters
    value *= 1000; // Convert to millimeters
    break;
  case 2:             // Kilometers
    value *= 1000000; // Convert to millimeters
    break;
  case 3: // Centimeters
    // No conversion needed for centimeters
    break;
  default:
    printf("Invalid unit number\n");
    return 0; // Invalid unit number
  }

  // Convert to the target unit
  switch (toUnit)
  {
  case 1: // Meters
    value /= 1000;
    break;
  case 2: // Kilometers
    value /= 1000000;
    break;
  case 3: // Centimeters
    // No conversion needed for centimeters
    break;
  default:
    printf("Invalid unit number\n");
    return 0; // Invalid unit number
  }

  return value; // Return the converted value
}

/**
 * @brief Converts a value from one weight unit to another.
 *
 * @param value The value to be converted.
 * @param fromUnit The source weight unit (1: Kilograms, 2: Grams, 3: Pounds).
 * @param toUnit The target weight unit (1: Kilograms, 2: Grams, 3: Pounds).
 *
 * @return The converted value. If fromUnit is equal to toUnit, no conversion is needed.
 *         If an invalid unit number is provided, the function returns 0.
 */
float convertWeight(float value, int fromUnit, int toUnit)
{
  // Similar logic for weight conversion
  switch (fromUnit)
  {
  case 1:          // Kilograms
    value *= 1000; // Convert to grams
    break;
  case 2: // Grams
    // No conversion needed for grams
    break;
  case 3:             // Pounds
    value *= 453.592; // Convert to grams
    break;
  default:
    printf("Invalid unit number\n");
    return 0; // Invalid unit number
  }

  // Convert to the target unit
  switch (toUnit)
  {
  case 1: // Kilograms
    value /= 1000;
    break;
  case 2: // Grams
    // No conversion needed for grams
    break;
  case 3:             // Pounds
    value /= 453.592; // Convert to pounds
    break;
  default:
    printf("Invalid unit number\n");
    return 0; // Invalid unit number
  }

  return value; // Return the converted value
}

/**
 * @brief Converts a value from one temperature unit to another.
 *
 * @param value The value to be converted.
 * @param fromUnit The source temperature unit (1: Celsius, 2: Fahrenheit, 3: Kelvin).
 * @param toUnit The target temperature unit (1: Celsius, 2: Fahrenheit, 3: Kelvin).
 *
 * @return The converted value. If fromUnit is equal to toUnit, no conversion is needed.
 *         If an invalid unit number is provided, the function returns 0.
 */
float convertTemperature(float value, int fromUnit, int toUnit)
{
  // Similar logic for temperature conversion
  switch (fromUnit)
  {
  case 1:                         // Celsius
    value = (value * 9 / 5) + 32; // Convert to Fahrenheit
    break;
  case 2:                         // Fahrenheit
    value = (value - 32) * 5 / 9; // Convert to Celsius
    break;
  case 3:            // Kelvin
    value -= 273.15; // Convert to Celsius
    break;
  default:
    printf("Invalid unit number\n");
    return 0; // Invalid unit number
  }

  // Convert to the target unit
  switch (toUnit)
  {
  case 1: // Celsius
    // No conversion needed for Celsius
    break;
  case 2:                         // Fahrenheit
    value = (value * 9 / 5) + 32; // Convert to Fahrenheit
    break;
  case 3:            // Kelvin
    value += 273.15; // Convert to Kelvin
    break;
  default:
    printf("Invalid unit number\n");
    return 0; // Invalid unit number
  }

  return value; // Return the converted value
}

/**
 * @brief The main function for the Unit Converter program.
 *
 * @param argc The number of command-line arguments.
 * @param argv An array of command-line arguments.
 *
 * @return The exit status of the program.
 */
int main(int argc, char const *argv[])
{
  int category;

  // Main program loop
  while (1)
  {
    printf("Unit Converter\n");
    printf("1. Length\n");
    printf("2. Weight\n");
    printf("3. Temperature\n");
    printf("4. QUIT\n");

    printf("Enter the category number: ");
    scanf("%d", &category);

    switch (category)
    {
    case 1: // Length
      printf("Select units:\n");
      printf("1. Meters\n");
      printf("2. Kilometers\n");
      printf("3. Centimeters\n");
      printf("Enter the source unit number: ");
      int lengthFromUnit, lengthToUnit;
      scanf("%d", &lengthFromUnit);
      printf("Enter the target unit number: ");
      scanf("%d", &lengthToUnit);

      float lengthValue;
      printf("Enter the value: ");
      scanf("%f", &lengthValue);

      float convertedLength = convertLength(lengthValue, lengthFromUnit, lengthToUnit);
      printf("Result: %f\n", convertedLength);
      break;

    case 2: // Weight
      printf("Select units:\n");
      printf("1. Kilograms\n");
      printf("2. Grams\n");
      printf("3. Pounds\n");
      printf("Enter the source unit number: ");
      int weightFromUnit, weightToUnit;
      scanf("%d", &weightFromUnit);
      printf("Enter the target unit number: ");
      scanf("%d", &weightToUnit);

      float weightValue;
      printf("Enter the value: ");
      scanf("%f", &weightValue);

      float convertedWeight = convertWeight(weightValue, weightFromUnit, weightToUnit);
      printf("Result: %f\n", convertedWeight);
      break;

    case 3: // Temperature
      printf("Select units:\n");
      printf("1. Celsius\n");
      printf("2. Fahrenheit\n");
      printf("3. Kelvin\n");
      printf("Enter the source unit number: ");
      int tempFromUnit, tempToUnit;
      scanf("%d", &tempFromUnit);
      printf("Enter the target unit number: ");
      scanf("%d", &tempToUnit);

      float tempValue;
      printf("Enter the value: ");
      scanf("%f", &tempValue);

      float convertedTemp = convertTemperature(tempValue, tempFromUnit, tempToUnit);
      printf("Result: %f\n", convertedTemp);
      break;

    case 4:
      goto end;
      break;

    default:
      printf("Invalid category number\n");
    }
  }

end:
  printf("Enter any key to exit the program.");
  getch(); // Waits for a key press
  return 0;
}
