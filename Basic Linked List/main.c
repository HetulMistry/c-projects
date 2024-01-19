#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

/**
 * @brief   Structure representing a node in a linked list.
 *
 * This structure holds an integer data value and a pointer to the next node
 * in the linked list.
 */
struct Node
{
  // Integer data stored in the node
  int data;
  // Pointer to the next node in the linked list
  struct Node *next;
};

/**
 * @brief   Creates a new node for a linked list with the given data.
 *
 * This function dynamically allocates memory for a new node, initializes its
 * data with the provided value, sets the next pointer to NULL, and returns the
 * pointer to the newly created node.
 *
 * @param   data The integer value to be stored in the new node.
 * @return  A pointer to the newly created node.
 *
 * @note    The caller is responsible for freeing the allocated memory when the
 *          node is no longer needed to prevent memory leaks.
 */
struct Node *createNode(int data)
{
  // Pointer to the newly created node
  struct Node *newNode = (struct Node *)malloc(sizeof(struct Node));

  // Check if memory allocation was successful
  if (newNode == NULL)
  {
    printf("Memory allocation failed\n");
    exit(1); // Exit the program if memory allocation fails
  }

  // Initialize the data and next pointer of the new node
  newNode->data = data;
  newNode->next = NULL;

  // Return the pointer to the newly created node
  return newNode;
}

/**
 * @brief   Inserts a new node with the given data at the beginning of a linked list.
 *
 * This function creates a new node with the provided data using the createNode
 * function, sets its next pointer to the current head of the linked list, and
 * updates the head pointer to point to the newly created node.
 *
 * @param   head A pointer to the head of the linked list.
 *              It is a pointer to a pointer to allow modification of the caller's
 *              head pointer when inserting at the beginning.
 * @param   data The integer value to be stored in the new node.
 *
 * @note    The caller is responsible for managing the memory of the linked list.
 *          It is assumed that the createNode function properly allocates memory
 *          for the new node.
 */
void insertAtBeginning(struct Node **head, int data)
{
  // Create a new node with the provided data
  struct Node *newNode = createNode(data);
  // Set the next pointer of the new node to the current head
  newNode->next = *head;
  // Update the head pointer to point to the newly created node
  *head = newNode;
}

/**
 * @brief   Inserts a new node with the given data at the end of a linked list.
 *
 * This function creates a new node with the provided data using the createNode
 * function. If the linked list is empty, the new node becomes the head of the
 * list. Otherwise, it traverses the linked list to find the last node and appends
 * the new node at the end.
 *
 * @param   head A pointer to the head of the linked list.
 *              It is a pointer to a pointer to allow modification of the caller's
 *              head pointer when inserting at the end.
 * @param   data The integer value to be stored in the new node.
 *
 * @note    The caller is responsible for managing the memory of the linked list.
 *          It is assumed that the createNode function properly allocates memory
 *          for the new node.
 */
void insertAtEnd(struct Node **head, int data)
{
  // Create a new node with the provided data
  struct Node *newNode = createNode(data);

  // Check if the linked list is empty
  if (*head == NULL)
  {
    *head = newNode;
    return;
  }

  // Traverse the linked list to find the last node
  struct Node *current = *head;
  while (current->next != NULL)
  {
    current = current->next;
  }

  // Append the new node at the end of the linked list
  current->next = newNode;
}

/**
 * @brief   Deletes the first occurrence of a node with the given data from the linked list.
 *
 * This function searches for a node with the specified key in the linked list,
 * removes it from the list, and frees the memory associated with the deleted node.
 * If the key is not found, it prints an error message.
 *
 * @param   head A pointer to the head of the linked list.
 *              It is a pointer to a pointer to allow modification of the caller's
 *              head pointer when deleting a node.
 * @param   key  The integer value to be searched and deleted from the linked list.
 *
 * @note    The caller is responsible for managing the memory of the linked list.
 *          The function assumes that the key corresponds to an existing node in
 *          the linked list.
 */
void deleteNode(struct Node **head, int key)
{
  // Pointers to track the current node (temp) and its predecessor (prev)
  struct Node *temp = *head, *prev = NULL;

  // Check if the node to be deleted is the head of the linked list
  if (temp != NULL && temp->data == key)
  {
    *head = temp->next; // Update head to skip the first node
    free(temp);         // Free memory associated with the deleted node
    return;
  }

  // Traverse the linked list to find the node with the specified key
  while (temp != NULL && temp->data != key)
  {
    prev = temp;
    temp = temp->next;
  }

  // Check if the key was not found in the linked list
  if (temp == NULL)
  {
    printf("Key not found in the list\n");
    return;
  }

  // Update the next pointer of the predecessor to skip the node to be deleted, and free the memory associated with the deleted node
  prev->next = temp->next;
  free(temp);
}

/**
 * @brief   Displays the elements of a linked list.
 *
 * This function traverses the linked list starting from the provided head node
 * and prints the data of each node, followed by an arrow "->", until the end
 * of the list is reached. Finally, it prints "NULL" to indicate the end of the list.
 *
 * @param   head A pointer to the head of the linked list.
 *              It represents the starting point for displaying the elements.
 *
 * @note    The function assumes that the linked list is properly formed and
 *          that each node has been correctly initialized.
 */
void display(struct Node *head)
{
  // Pointer to traverse the linked list
  struct Node *current = head;

  // Traverse the linked list and print each node's data
  while (current != NULL)
  {
    printf("%d -> ", current->data);
    current = current->next;
  }

  // Print "NULL" to indicate the end of the linked list
  printf("NULL\n");
}

/**
 * @brief   Frees the memory allocated for all nodes in a linked list.
 *
 * This function traverses the linked list starting from the provided head node
 * and frees the memory associated with each node. It iterates through the list,
 * updating the current node pointer and freeing the memory until the end of the list
 * is reached.
 *
 * @param   head A pointer to the head of the linked list.
 *              It represents the starting point for freeing the memory.
 *
 * @note    The function assumes that the linked list is properly formed and
 *          that each node has been correctly initialized.
 */
void freeList(struct Node *head)
{
  // Pointer to traverse the linked list
  struct Node *current = head;

  // Traverse the linked list, free the memory of each node, and update the current pointer to the next node in the list
  while (current != NULL)
  {
    // Save the next node's pointer before freeing the current node
    struct Node *next = current->next;

    // Free the memory associated with the current node
    free(current);

    // Update the current pointer to the next node in the linked list
    current = next;
  }
}
/**
 * @brief   Main function to interactively perform operations on a linked list.
 *
 * The program provides a menu-driven interface for the user to perform
 * operations like inserting at the beginning or end, deleting a node,
 * displaying the linked list, and exiting the program. It uses various
 * functions to manipulate and manage the linked list.
 *
 * @param   argc Number of command-line arguments (unused).
 * @param   argv Command-line arguments (unused).
 *
 * @return  An integer indicating the exit status of the program.
 */
int main(int argc, char const *argv[])
{
  // Pointer to the head of the linked list
  struct Node *head = NULL;

  // Variables for user input and menu choice
  int choice, data, key;

  do
  {
    printf("\n1. Insert at the beginning\n");
    printf("2. Insert at the end\n");
    printf("3. Delete a node\n");
    printf("4. Display\n");
    printf("0. Exit\n");
    printf("Enter your choice: ");
    scanf("%d", &choice);

    switch (choice)
    {
    case 1:
      printf("Enter data to insert at the beginning: ");
      scanf("%d", &data);
      insertAtBeginning(&head, data);
      break;

    case 2:
      printf("Enter data to insert at the end: ");
      scanf("%d", &data);
      insertAtEnd(&head, data);
      break;

    case 3:
      printf("Enter the key to delete: ");
      scanf("%d", &key);
      deleteNode(&head, key);
      break;

    case 4:
      printf("Linked List: ");
      display(head);
      break;

    case 0:
      break;

    default:
      printf("Invalid choice\n");
    }
  } while (choice != 0);

  // Free the memory allocated for the linked list
  freeList(head);

  // Wait for a key press (assuming the existence of getch function)
  getch();

  // Return 0 to indicate successful execution
  return 0;
}
