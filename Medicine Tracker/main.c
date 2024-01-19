#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

/**
 * @struct Medication
 * @brief Represents a medication with its details.
 *
 * This structure holds information about a medication, including its name,
 * dosage, and the time for the next scheduled dose.
 */
struct Medication
{
  char name[50];       // Name of the medication, up to 50 characters
  int dosage;          // Dosage of the medication in milligrams
  time_t nextDoseTime; // Time for the next scheduled dose (in seconds since epoch)
};

/**
 * @brief Initializes a Medication structure with provided details.
 *
 * This function sets the attributes of a Medication structure, including
 * the medication name, dosage, and the time for the next scheduled dose.
 *
 * @param med Pointer to the Medication structure to be initialized.
 * @param name Pointer to a string representing the name of the medication.
 * @param dosage Dosage of the medication in milligrams.
 * @param nextDoseTime Time for the next scheduled dose (in seconds since epoch).
 */
void initializeMedication(struct Medication *med, const char *name, int dosage, time_t nextDoseTime)
{
  strcpy(med->name, name);          // Set the name of the medication
  med->dosage = dosage;             // Set the dosage of the medication
  med->nextDoseTime = nextDoseTime; // Set the time for the next scheduled dose
}

/**
 * @brief Displays details of a Medication structure.
 *
 * This function prints information about a Medication structure,
 * including the medication name, dosage, and the time for the next scheduled dose.
 *
 * @param med Pointer to the Medication structure to be displayed.
 */
void displayMedication(const struct Medication *med)
{
  printf("Medication: %s\n", med->name);                     // Print the name of the medication
  printf("Dosage: %d mg\n", med->dosage);                    // Print the dosage of the medication
  printf("Next Dose Time: %s", ctime(&(med->nextDoseTime))); // Print the time for the next scheduled dose
}

/**
 * @brief Updates the next scheduled dose time for a Medication structure.
 *
 * This function modifies the next scheduled dose time for a given Medication structure
 * by adding the specified time interval.
 *
 * @param med Pointer to the Medication structure to be updated.
 * @param interval Time interval (in seconds) to be added to the next scheduled dose time.
 */
void updateNextDoseTime(struct Medication *med, int interval)
{
  med->nextDoseTime += interval; // Update the next scheduled dose time by adding the specified interval
}

/**
 * @brief Reminds the user to take their medication.
 *
 * This function generates a reminder message to prompt the user to take their medication,
 * including the name of the medication.
 *
 * @param med Pointer to the Medication structure representing the medication to be taken.
 */
void remindUser(const struct Medication *med)
{
  printf("Reminder: It's time to take your medication - %s\n", med->name); // Print a reminder message including the name of the medication
}

/**
 * @brief Main function for the Medication Reminder System.
 *
 * This function serves as the entry point for the Medication Reminder System.
 * It initializes two medication structures, takes user input for medication details,
 * displays initial details, and then enters a simulation loop to remind the user
 * to take their medication at specified intervals.
 *
 * @param argc Number of command-line arguments.
 * @param argv Array of command-line argument strings.
 * @return 0 upon successful execution.
 */
int main(int argc, char const *argv[])
{
  struct Medication med1, med2;

  // Take input for Medication 1
  printf("Enter details for Medication 1:\n");
  printf("Name: ");
  scanf("%s", med1.name);
  printf("Dosage (mg): ");
  scanf("%d", &med1.dosage);
  printf("Initial Dose Time (in seconds from now): ");
  scanf("%ld", &med1.nextDoseTime);
  med1.nextDoseTime += time(NULL); // Convert to absolute time

  // Take input for Medication 2
  printf("\nEnter details for Medication 2:\n");
  printf("Name: ");
  scanf("%s", med2.name);
  printf("Dosage (mg): ");
  scanf("%d", &med2.dosage);
  printf("Initial Dose Time (in seconds from now): ");
  scanf("%ld", &med2.nextDoseTime);
  med2.nextDoseTime += time(NULL); // Convert to absolute time

  // Display initial medication details
  printf("\nInitial Medication Details:\n");
  displayMedication(&med1);
  displayMedication(&med2);

  // Simulation loop
  for (int i = 0; i < 5; ++i)
  {
    // Simulate the passage of time (e.g., 5 seconds per iteration)
    sleep(5);

    // Get current time
    time_t currentTime = time(NULL);

    // Check if it's time to take medication and remind the user
    if (currentTime >= med1.nextDoseTime)
    {
      remindUser(&med1);
      updateNextDoseTime(&med1, 30); // Update next dose time (e.g., 30 seconds interval)
    }

    if (currentTime >= med2.nextDoseTime)
    {
      remindUser(&med2);
      updateNextDoseTime(&med2, 40); // Update next dose time (e.g., 40 seconds interval)
    }
  }

  // Wait for user input before exiting (platform-dependent)
  printf("\nPress Enter to exit...");

  getch(); // Wait for key press before exit
  return 0;
}