#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include <ctype.h>

// Define the maximum size of the stack
#define MAX_SIZE 100

/**
 * @struct Stack
 * @brief A data structure representing a stack.
 */
// Stack structure
struct Stack
{
  int data[MAX_SIZE]; // Array to store stack elements
  int top;            //  Index of the top element in the stack
};

/**
 * @brief Initializes a stack by setting the top index to -1.
 *
 * This function sets the top index of the given stack to -1, indicating an
 * empty stack.
 *
 * @param stack A pointer to the Stack structure to be initialized.
 */
// Initialize an empty stack
void initialize(struct Stack *stack)
{
  stack->top = -1; // Set the top index to -1 for an empty stack
}

/**
 * @brief Checks if the stack is empty.
 *
 * This function checks if the given stack is empty by examining its top index.
 *
 * @param stack A pointer to the Stack structure to be checked.
 * @return 1 if the stack is empty, 0 otherwise.
 */
// Check if the stack is empty
int isEmpty(struct Stack *stack)
{
  return stack->top == -1; // Returns 1 if the stack is empty, 0 otherwise.
}

/**
 * @brief Checks if the stack is full.
 *
 * This function checks if the given stack is full by comparing its top index
 * with the maximum allowed index (MAX_SIZE - 1).
 *
 * @param stack A pointer to the Stack structure to be checked.
 * @return 1 if the stack is full, 0 otherwise.
 */
// Check if the stack is full
int isFull(struct Stack *stack)
{
  return stack->top == MAX_SIZE - 1; // Returns 1 if the stack is full, 0 otherwise.
}

/**
 * @brief Pushes a value onto the stack.
 *
 * This function adds a new value to the top of the stack. If the stack is already
 * full, it prints an error message and exits the program with a failure status.
 *
 * @param stack A pointer to the Stack structure representing the stack.
 * @param value The integer value to be pushed onto the stack.
 */
// Push operation to add an element to the stack
void push(struct Stack *stack, int value)
{
  if (isFull(stack))
  {
    printf("Stack Overflow\n"); // Print error message for stack overflow
    exit(EXIT_FAILURE);         // Exit program with failure status
  }
  stack->data[++stack->top] = value; // Add value to the top of the stack
}

/**
 * @brief Pops a value from the stack.
 *
 * This function removes and returns the value from the top of the stack. If the
 * stack is empty, it prints an error message and exits the program with a failure
 * status.
 *
 * @param stack A pointer to the Stack structure representing the stack.
 * @return The integer value popped from the stack.
 */
// Pop operation to remove and return the top element from the stack
int pop(struct Stack *stack)
{
  if (isEmpty(stack))
  {
    printf("Stack Underflow\n"); // Print error message for stack underflow
    exit(EXIT_FAILURE);          // Exit program with failure status
  }
  return stack->data[stack->top--]; // Return the popped value from the top of the stack
}

/**
 * @brief Evaluates a mathematical expression in postfix notation.
 *
 * This function takes a mathematical expression in postfix notation and evaluates
 * it using a stack. It supports the basic arithmetic operators: +, -, *, and /.
 * If an invalid operator is encountered, the function prints an error message and
 * exits the program with a failure status.
 *
 * @param expression A pointer to a null-terminated string representing the postfix expression.
 * @return The result of the evaluated expression.
 */
// Function to evaluate expressions using the stack
int evaluateExpression(const char *expression)
{
  struct Stack stack; // Create a stack for operand storage
  initialize(&stack); // Initialize the stack

  // Iterate through each character in the expression
  for (int i = 0; expression[i] != '\0'; ++i)
  {
    // If the character is a digit, push it onto the stack
    if (isdigit(expression[i]))
    {
      push(&stack, expression[i] - '0'); // Convert character to integer and push onto the stack
    }
    // If the character is an operator, pop two operands, perform the operation, and push the result back
    else
    {
      int operand2 = pop(&stack); // Pop the second operand from the stack
      int operand1 = pop(&stack); // Pop the first operand from the stack

      switch (expression[i])
      {
      case '+':
        push(&stack, operand1 + operand2); // Push the result of addition onto the stack
        break;
      case '-':
        push(&stack, operand1 - operand2); // Push the result of subtraction onto the stack
        break;
      case '*':
        push(&stack, operand1 * operand2); // Push the result of multiplication onto the stack
        break;
      case '/':
        push(&stack, operand1 / operand2); // Push the result of division onto the stack
        break;
      default:
        printf("Invalid operator: %c\n", expression[i]); // Print error message for invalid operator
        exit(EXIT_FAILURE);                              // Exit program with failure status
      }
    }
  }

  // The final result is on the top of the stack
  return pop(&stack); // Return the final result of the expression
}

/**
 * @brief The main function to evaluate a postfix expression provided by the user.
 *
 * This function prompts the user to enter a mathematical expression in postfix
 * notation, evaluates the expression using the evaluateExpression function, and
 * prints the result to the console.
 *
 * @param argc The number of command-line arguments.
 * @param argv An array of strings representing the command-line arguments.
 * @return 0 on successful completion.
 */
int main(int argc, char const *argv[])
{
  char expression[MAX_SIZE]; // Buffer to store the user's input expression

  // Get expression input from the user
  printf("Enter the expression: ");
  fgets(expression, sizeof(expression), stdin); // Read expression from user input

  // Evaluate the expression and print the result
  printf("Result: %d\n", evaluateExpression(expression)); // Print the result of the evaluated expression

  getch();  // Wait for a key press before exiting (assuming this is a console application)
  return 0; // Return 0 to indicate successful completion
}