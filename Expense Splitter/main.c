#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_USERS 10
#define MAX_EXPENSES 100

typedef struct
{
  char name[50];
  double amount_paid;
} User;

typedef struct
{
  User users[MAX_USERS];
  int num_users;
} Group;

typedef struct
{
  char payer[50];
  double amount;
  char participants[MAX_USERS][50];
  int num_participants;
} Expense;

typedef struct
{
  Expense expenses[MAX_EXPENSES];
  int num_expenses;
} ExpenseRecord;

void addExpense(Group *group, ExpenseRecord *record, double expense)
{
  Expense newExpense;
  int i;

  printf("Enter the name of the payer: ");
  scanf("%s", newExpense.payer);

  for (i = 0; i < group->num_users; ++i)
  {
    newExpense.participants[i][0] = '\0';
  }

  newExpense.amount = expense;

  printf("Enter the number of participants: ");
  scanf("%d", &newExpense.num_participants);

  printf("Enter the names of participants (one at a time):\n");
  for (i = 0; i < newExpense.num_participants; ++i)
  {
    printf("Participant %d: ", i + 1);
    scanf("%s", newExpense.participants[i]);
  }

  for (i = 0; i < group->num_users; ++i)
  {
    if (strcmp(newExpense.payer, group->users[i].name) == 0)
    {
      group->users[i].amount_paid += newExpense.amount;
      break;
    }
  }

  record->expenses[record->num_expenses++] = newExpense;
}

void displayBalances(Group *group)
{
  printf("\nExpense Summary:\n");

  for (int i = 0; i < group->num_users; ++i)
  {
    printf("%s owes %.2f\n", group->users[i].name, group->users[i].amount_paid);
  }
}

void displayExpenses(ExpenseRecord *record)
{
  printf("\nExpense Details:\n");

  for (int i = 0; i < record->num_expenses; ++i)
  {
    printf("Payer: %s | Amount: %.2f | Participants: ",
           record->expenses[i].payer, record->expenses[i].amount);

    for (int j = 0; j < record->expenses[i].num_participants; ++j)
    {
      printf("%s ", record->expenses[i].participants[j]);
    }

    printf("\n");
  }
}

int main()
{
  Group group;
  group.num_users = 0;

  ExpenseRecord record;
  record.num_expenses = 0;

  printf("Enter the number of users (up to %d): ", MAX_USERS);
  scanf("%d", &group.num_users);

  if (group.num_users > MAX_USERS || group.num_users <= 0)
  {
    printf("Invalid number of users. Exiting.\n");
    return 1;
  }

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

    addExpense(&group, &record, expense);
    displayBalances(&group);
    displayExpenses(&record);

    printf("\nDo you want to add another expense? (y/n): ");
    scanf(" %c", &option);

  } while (option == 'y' || option == 'Y');

  printf("\nExiting the expense-splitting app. Thank you!\n");

  getch();
  return 0;
}
