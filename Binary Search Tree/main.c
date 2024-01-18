#include <stdio.h>
#include <conio.h>
#include <stdlib.h>

// Define the structure of a tree node
struct TreeNode
{
  int data;               // Integer value stored in the tree node
  struct TreeNode *left;  // Pointer to the left child node (subtree)
  struct TreeNode *right; // Pointer to the right child node (subtree)
};

/**
 * Function to create a new tree node
 * @param value - Integer value to be stored in the new node
 * @returns - A pointer to the newly created tree node
 */
struct TreeNode *createNode(int value)
{
  // Allocate memory for a new tree node
  struct TreeNode *newNode = (struct TreeNode *)malloc(sizeof(struct TreeNode));
  // Set the data of the new node to the provided value
  newNode->data = value;
  // Initialize the left and right child pointers to NULL, indicating no children initially
  newNode->left = newNode->right = NULL;
  // Return a pointer to the newly created tree node
  return newNode;
}

/**
 * Function to insert a value into the Binary Search Tree (BST)
 * @param root - Pointer to the root of the BST
 * @param value - Integer value to be inserted into the BST
 * @returns - A pointer to the root of the BST after the insertion
 */
// Function to insert a value into the BST
struct TreeNode *insert(struct TreeNode *root, int value)
{
  // If the BST is empty, create a new node with the given value as the root
  if (root == NULL)
  {
    return createNode(value);
  }

  // If the value is less than the current node's data, recursively insert into the left subtree
  if (value < root->data)
  {
    root->left = insert(root->left, value);
  }
  // If the value is greater than the current node's data, recursively insert into the right subtree
  else if (value > root->data)
  {
    root->right = insert(root->right, value);
  }

  // Return the root of the BST after the insertion
  return root;
}

/**
 * Function to find the minimum value node in a Binary Search Tree (BST)
 * @param node - Pointer to the root or a subtree of the BST
 * @returns - A pointer to the node with the minimum value in the given subtree
 */
// Function to find the minimum value node in a BST
struct TreeNode *findMin(struct TreeNode *node)
{
  // Traverse the left child of each node until the leftmost node is reached
  while (node->left != NULL)
  {
    node = node->left;
  }

  // Return a pointer to the node with the minimum value in the subtree
  return node;
}
/**
 * Function to delete a value from the Binary Search Tree (BST)
 * @param root - Pointer to the root of the BST
 * @param value - Integer value to be deleted from the BST
 * @returns - A pointer to the root of the BST after the deletion
 */
// Function to delete a value from the BST
struct TreeNode *deleteNode(struct TreeNode *root, int value)
{
  // If the BST is empty, return the root
  if (root == NULL)
  {
    return root;
  }

  // If the value is less than the current node's data, recursively delete from the left subtree
  if (value < root->data)
  {
    root->left = deleteNode(root->left, value);
  }
  // If the value is greater than the current node's data, recursively delete from the right subtree
  else if (value > root->data)
  {
    root->right = deleteNode(root->right, value);
  }
  else
  {
    // Node with only one child or no child
    if (root->left == NULL)
    {
      struct TreeNode *temp = root->right;
      free(root);
      return temp;
    }
    else if (root->right == NULL)
    {
      struct TreeNode *temp = root->left;
      free(root);
      return temp;
    }

    // Node with two children: Get the in-order successor (smallest in the right subtree)
    struct TreeNode *temp = findMin(root->right);

    // Copy the in-order successor's content to this node
    root->data = temp->data;

    // Delete the in-order successor
    root->right = deleteNode(root->right, temp->data);
  }

  // Return the root of the BST after the deletion
  return root;
}

/**
 * Function to search for a value in the Binary Search Tree (BST)
 * @param root - Pointer to the root of the BST
 * @param Integer - value to be searched for in the BST
 * @return - A pointer to the node containing the searched value, or NULL if not found
 */
// Function to search for a value in the BST
struct TreeNode *search(struct TreeNode *root, int value)
{
  // If the BST is empty or the current node contains the desired value, return the current node
  if (root == NULL || root->data == value)
  {
    return root;
  }

  // If the value is less than the current node's data, recursively search in the left subtree
  if (value < root->data)
  {
    return search(root->left, value);
  }
  // If the value is greater than the current node's data, recursively search in the right subtree
  else
  {
    return search(root->right, value);
  }
}
/**
 * Function to perform in-order traversal of the Binary Search Tree (BST)
 * @param root Pointer to the root of the BST
 * @returns - (None) Outputs the elements of the BST in ascending order to the console
 */
// Function to print the in order traversal of the BST
void inOrderTraversal(struct TreeNode *root)
{
  // If the current node is not NULL, recursively traverse the left subtree
  if (root != NULL)
  {
    inOrderTraversal(root->left);

    // Print the data of the current node
    printf("%d ", root->data);

    // Recursively traverse the right subtree
    inOrderTraversal(root->right);
  }
}

/**
 * The main function for testing the Binary Search Tree (BST)
 *
 * @param argc - The number of command-line arguments (unused in this program).
 * @param argv - An array of command-line arguments (unused in this program).
 * @return 0 on successful execution.
 */
// Main function for testing the BST implementation
int main(int argc, char const *argv[])
{
  // Create an initially empty BST
  struct TreeNode *root = NULL;

  // Take user input to build the BST
  int inputValue;
  printf("Enter values to insert into the BST (enter -1 to stop):\n");
  while (1)
  {
    // Read an integer from the user
    scanf("%d", &inputValue);
    // Break the loop if the user enters -1
    if (inputValue == -1)
    {
      break;
    }
    // Insert the entered value into the BST
    root = insert(root, inputValue);
  }

  // Print the in-order traversal of the BST
  printf("In-order traversal of the BST: ");
  inOrderTraversal(root);
  printf("\n");

  // Take user input to search for a value
  int searchValue;
  printf("Enter a value to search for in the BST: ");
  scanf("%d", &searchValue);
  struct TreeNode *searchResult = search(root, searchValue);
  if (searchResult != NULL)
  {
    printf("%d found in the BST.\n", searchValue);
  }
  else
  {
    printf("%d not found in the BST.\n", searchValue);
  }

  // Take user input to delete a value
  int deleteValue;
  printf("Enter a value to delete from the BST: ");
  scanf("%d", &deleteValue);
  root = deleteNode(root, deleteValue);
  printf("In-order traversal after deleting %d: ", deleteValue);
  inOrderTraversal(root);
  printf("\n");

  // Free memory allocated for the BST nodes
  free(root);

  // Wait for a key press before exiting (for console-based applications)
  getchar(); // Consume the newline character left in the input buffer
  printf("Press Enter to exit...");

  // Wait for a key press before exiting (for console-based applications)
  getch();
  // Return 0 to indicate successful execution
  return 0;
}
