#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

// Server IP address, port, and maximum buffer size
#define SERVER_IP "127.0.0.1"
#define PORT 12345
#define MAX_BUFFER_SIZE 1024

/**
 * @brief The main function of the client program.
 *
 * @param argc Number of command-line arguments.
 * @param argv Array of command-line arguments.
 * @return int Program exit status.
 */
int main(int argc, char const *argv[])
{
  // Socket descriptor for the client
  int clientSocket;

  // Struct to store server address information
  struct sockaddr_in serverAddr;

  // Buffer to store data to be sent/received
  char buffer[MAX_BUFFER_SIZE];

  // Create socket for the client
  if ((clientSocket = socket(AF_INET, SOCK_STREAM, 0)) == -1)
  {
    perror("Error creating socket");
    exit(EXIT_FAILURE);
  }

  // Set up server address struct
  memset(&serverAddr, 0, sizeof(serverAddr));
  serverAddr.sin_family = AF_INET;
  serverAddr.sin_port = htons(PORT);
  serverAddr.sin_addr.s_addr = inet_addr(SERVER_IP);

  // Connect to the server
  if (connect(clientSocket, (struct sockaddr *)&serverAddr, sizeof(serverAddr)) == -1)
  {
    perror("Error connecting to server");
    exit(EXIT_FAILURE);
  }

  // Print connection success message
  printf("Connected to server\n");

  // Send data to the server
  while (1)
  {
    // Prompt user to enter a message
    printf("Enter a message to send to the server (or type 'exit' to quit): ");
    fgets(buffer, sizeof(buffer), stdin);

    // Check for exit command
    if (strncmp(buffer, "exit", 4) == 0)
    {
      break;
    }

    // Send the message to the server
    send(clientSocket, buffer, strlen(buffer), 0);

    // Receive and print the echoed message from the server
    ssize_t bytesRead = recv(clientSocket, buffer, sizeof(buffer), 0);
    if (bytesRead <= 0)
    {
      perror("Error receiving data from server");
      break;
    }

    // Null-terminate the received data
    buffer[bytesRead] = '\0';

    // Print echoed message
    printf("Server says: %s", buffer);
  }

  // Close socket
  close(clientSocket);

  // Program exit
  return 0;
}
