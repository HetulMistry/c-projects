#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

#define PORT 12345
#define MAX_BUFFER_SIZE 1024

/**
 * @brief The main function of the server program.
 *
 * @param argc Number of command-line arguments.
 * @param argv Array of command-line arguments.
 * @return int Program exit status.
 */
int main(int argc, char const *argv[])
{
  // Socket descriptors for server and client
  int serverSocket, clientSocket;
  // Structs to store server and client address information
  struct sockaddr_in serverAddr, clientAddr;
  // Size of the client address struct
  socklen_t addrSize = sizeof(struct sockaddr_in);
  // Buffer to store received data
  char buffer[MAX_BUFFER_SIZE];

  // Create socket for the server
  if ((serverSocket = socket(AF_INET, SOCK_STREAM, 0)) == -1)
  {
    perror("Error creating socket");
    exit(EXIT_FAILURE);
  }

  // Set up server address struct
  memset(&serverAddr, 0, sizeof(serverAddr));
  serverAddr.sin_family = AF_INET;
  serverAddr.sin_port = htons(PORT);
  serverAddr.sin_addr.s_addr = INADDR_ANY;

  // Bind socket to address and port
  if (bind(serverSocket, (struct sockaddr *)&serverAddr, sizeof(serverAddr)) == -1)
  {
    perror("Error binding socket");
    exit(EXIT_FAILURE);
  }

  // Listen for incoming connections
  if (listen(serverSocket, 10) == -1)
  {
    perror("Error listening for connections");
    exit(EXIT_FAILURE);
  }

  // Print server information
  printf("Server listening on port %d...\n", PORT);

  // Accept incoming connection
  if ((clientSocket = accept(serverSocket, (struct sockaddr *)&clientAddr, &addrSize)) == -1)
  {
    perror("Error accepting connection");
    exit(EXIT_FAILURE);
  }

  // Print client information
  printf("Client connected: %s\n", inet_ntoa(clientAddr.sin_addr));

  // Receive data from the client and echo it back
  while (1)
  {
    ssize_t bytesRead = recv(clientSocket, buffer, sizeof(buffer), 0);
    if (bytesRead <= 0)
    {
      perror("Error receiving data");
      break;
    }

    // Null-terminate the received data
    buffer[bytesRead] = '\0';

    // Print received data
    printf("Received from client: %s", buffer);

    // Echo the data back to the client
    send(clientSocket, buffer, bytesRead, 0);
  }

  // Close sockets
  close(clientSocket);
  close(serverSocket);

  // Program exit
  return 0;
}
