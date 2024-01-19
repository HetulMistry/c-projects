#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <stdlib.h>

// Maximum number of users and expenses
#define MAX_USERS 10
#define MAX_EXPENSES 100

/**
 * @struct User
 *
 * @brief Defines a structure representing an individual user with a name and the amount they have paid.
 */
typedef struct
{
  char name[50];      // Member to store the name of the user (up to 50 characters)
  double amount_paid; // Member to store the total amount paid by the user (as a double)
} User;

/**
 * @struct Group
 *
 * @brief Defines a structure representing a group of users with an array of User structures and the number of users in the group.
 */
typedef struct
{
  User users[MAX_USERS]; // Array to store individual User structures within the group
  int num_users;         // Member to store the current number of users in the group
} Group;

/**
 * @struct Expense
 *
 * @brief Defines a structure representing an expense with information about the payer, amount, participants, and the number of participants involved.
 */
typedef struct
{
  char payer[50];                   // Member to store the name of the payer (up to 50 characters)
  double amount;                    // Member to store the total amount of the expense (as a double)
  char participants[MAX_USERS][50]; // 2D array to store the names of participants in the expense
  int num_participants;             // Member to store the current number of participants in the expense
} Expense;

/**
 * @struct ExpenseRecord
 *
 * @brief Defines a structure representing a record of expenses with an array of Expense structures and the number of expenses in the record.
 */
typedef struct
{
  Expense expenses[MAX_EXPENSES]; // Array to store individual Expense structures within the record
  int num_expenses;               // Member to store the current number of expenses in the record
} ExpenseRecord;

/**
 * @brief Adds a new expense to the group and record, updating participant balances and recording the expense details.
 *
 * @param group (Group*): Pointer to the Group structure representing the group of users.
 * @param record (ExpenseRecord*): Pointer to the ExpenseRecord structure representing the record of expenses.
 * @param expense (double): The amount of the expense to be added.
 */
void addExpense(Group *group, ExpenseRecord *record, double expense)
{
  Expense newExpense; // Create a new Expense structure to store information about the new expense
  int i;

  // Input the name of the payer
  printf("Enter the name of the payer: ");
  scanf("%s", newExpense.payer);

  // Initialize participants array for the new expense
  for (i = 0; i < group->num_users; ++i)
  {
    newExpense.participants[i][0] = '\0'; // Set the first character to null for each participant
  }

  newExpense.amount = expense; // Set the amount of the new expense

  // Input the number of participants
  printf("Enter the number of participants: ");
  scanf("%d", &newExpense.num_participants);

  // Input the names of participants one at a time
  printf("Enter the names of participants (one at a time):\n");
  for (i = 0; i < newExpense.num_participants; ++i)
  {
    printf("Participant %d: ", i + 1);
    scanf("%s", newExpense.participants[i]);
  }

  // Update the amount paid by the payer in the group
  for (i = 0; i < group->num_users; ++i)
  {
    if (strcmp(newExpense.payer, group->users[i].name) == 0)
    {
      group->users[i].amount_paid += newExpense.amount;
      break;
    }
  }

  // Add the new expense to the expense record
  record->expenses[record->num_expenses++] = newExpense;
}

/**
 * @brief Displays the summary of expenses, showing the amount each user owes or is owed within the group.
 *
 * @param group (Group*): Pointer to the Group structure representing the group of users.
 */
void displayBalances(Group *group)
{
  printf("\nExpense Summary:\n");

  // Iterate through each user in the group and display their name and amount paid
  for (int i = 0; i < group->num_users; ++i)
  {
    printf("%s owes %.2f\n", group->users[i].name, group->users[i].amount_paid);
  }
}

/**
 * @brief Displays detailed information about each recorded expense, including the payer, amount, and participants.
 *
 * @param record (ExpenseRecord*): Pointer to the ExpenseRecord structure representing the record of expenses.
 */
void displayExpenses(ExpenseRecord *record)
{
  printf("\nExpense Details:\n");

  // Iterate through each expense in the record and display its details
  for (int i = 0; i < record->num_expenses; ++i)
  {
    // Display payer name, expense amount, and list of participants
    printf("Payer: %s | Amount: %.2f | Participants: ", record->expenses[i].payer, record->expenses[i].amount);

    // Iterate through each participant and display their names
    for (int j = 0; j < record->expenses[i].num_participants; ++j)
    {
      printf("%s ", record->expenses[i].participants[j]);
    }

    printf("\n"); // Move to the next line for the next expense
  }
}

/**
 * @brief The main function of the expense-splitting application, allowing users to input group information, record expenses, and display summaries.
 *
 * @param argc (int): Number of command-line arguments.
 * @param argv (char const*[]): Array of command-line arguments.
 *
 * @return int: 0 if the program executes successfully, 1 if there's an error.
 */
int main(int argc, char const *argv[])
{
  Group group;         // Initialize a Group structure to store user information
  group.num_users = 0; // Set the initial number of users to zero

  ExpenseRecord record;    // Initialize an ExpenseRecord structure to store expense information
  record.num_expenses = 0; // Set the initial number of expenses to zero

  // Input the number of users in the group
  printf("Enter the number of users (up to %d): ", MAX_USERS);
  scanf("%d", &group.num_users);

  // Check for invalid number of users
  if (group.num_users > MAX_USERS || group.num_users <= 0)
  {
    printf("Invalid number of users. Exiting.\n");
    return 1; // Exit the program with an error code
  }

  // Input names of each user in the group and initialize amount_paid to zero
  for (int i = 0; i < group.num_users; ++i)
  {
    printf("Enter name of user %d: ", i + 1);
    scanf("%s", group.users[i].name);
    group.users[i].amount_paid = 0.0;
  }

  char option;
  do
  {
    double expense;
    printf("\nEnter an expense: ");
    scanf("%lf", &expense);

    // Call the function to add the expense and display balances and expenses
    addExpense(&group, &record, expense);
    displayBalances(&group);
    displayExpenses(&record);

    // Prompt user if they want to add another expense
    printf("\nDo you want to add another expense? (y/n): ");
    scanf(" %c", &option);

  } while (option == 'y' || option == 'Y');

  printf("\nExiting the expense-splitting app. Thank you!\n");

  getch();  // Wait for a key press before exiting the console window
  return 0; // Exit the program successfully
}
