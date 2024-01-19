#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

#define SERVER_IP "127.0.0.1" // Replace with the actual server IP address
#define PORT 8888
#define BUFFER_SIZE 1024

/**
 * @brief Display an error message and terminate the program.
 *
 * This function prints an error message provided as input using perror,
 * indicating additional system-specific error information, and then
 * terminates the program with an exit status of 1.
 *
 * @param msg The error message to be displayed. It should be a string describing
 *            the nature of the error.
 *
 * @return This function does not return as it terminates the program.
 */
void error(const char *msg)
{
  // Display the error message along with additional system-specific error information
  perror(msg);

  // Terminate the program with an exit status of 1
  exit(1);
}

/**
 * @brief Simple client to connect to a network monitoring server and receive monitoring data.
 *
 * This client program creates a socket, connects to a specified server address, and receives
 * monitoring data sent by the server. It prints the received data to the console and then
 * closes the connection.
 *
 * @param argc Number of command-line arguments.
 * @param argv Array of command-line arguments.
 *
 * @return This function connects to the server, receives monitoring data, prints it to the console,
 *         and then closes the connection before exiting.
 */
int main(int argc, char const *argv[])
{
  // Socket for communicating with the server
  int client_socket;

  // Server address structure
  struct sockaddr_in server_addr;

  // Buffer to store received monitoring data
  char buffer[BUFFER_SIZE];

  // Create socket
  client_socket = socket(AF_INET, SOCK_STREAM, 0);
  if (client_socket == -1)
  {
    error("Error creating socket");
  }

  // Set up server address struct
  memset(&server_addr, 0, sizeof(server_addr));
  server_addr.sin_family = AF_INET;
  server_addr.sin_addr.s_addr = inet_addr(SERVER_IP);
  server_addr.sin_port = htons(PORT);

  // Connect to server
  if (connect(client_socket, (struct sockaddr *)&server_addr, sizeof(server_addr)) == -1)
  {
    error("Error connecting to server");
  }

  // Connection successful message
  printf("Connected to the server\n");

  // Receive and print monitoring data
  while (recv(client_socket, buffer, BUFFER_SIZE, 0) > 0)
  {
    printf("%s\n", buffer);

    // Clear the buffer for the next iteration
    memset(buffer, 0, sizeof(buffer));
  }

  // Close the connection
  close(client_socket);

  return 0;
}