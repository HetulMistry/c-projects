#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

#define PORT 8888
#define BUFFER_SIZE 1024

/**
 * @brief Display an error message and exit the program.
 *
 * This function prints an error message provided as input and then terminates
 * the program with an exit status of 1.
 *
 * @param msg The error message to be displayed. It should be a string describing
 *            the nature of the error.
 *
 * @return This function does not return as it terminates the program.
 */
void error(const char *msg)
{
  // Display the error message along with additional information about the error
  perror(msg);
  // Terminate the program with an exit status of 1
  exit(1);
}

/**
 * @brief Simulate network monitoring by sending simulated data to a connected client.
 *
 * This function generates simulated network monitoring data, sends it to the connected
 * client through the specified socket, and repeats the process in an infinite loop with
 * a simulated delay to mimic real-time monitoring.
 *
 * @param client_socket The socket connected to the client to send monitoring data.
 *
 * @return This function runs indefinitely, simulating network monitoring data transmission
 *         to the connected client.
 */
void monitor_network(int client_socket)
{
  // Buffer to hold the simulated monitoring data
  char buffer[BUFFER_SIZE];

  // Infinite loop for simulating real-time monitoring
  while (1)
  {
    // Simulate monitoring data (replace with actual network monitoring logic)
    snprintf(buffer, BUFFER_SIZE, "Bandwidth: %d KB/s\nConnected Devices: %d\nNetwork Statistics: ...\n",
             rand() % 100, rand() % 10);

    // Send simulated data to the connected client
    send(client_socket, buffer, strlen(buffer), 0);

    // Sleep for a short period to simulate real-time monitoring
    sleep(1);
  }
}

/**
 * @brief Main function for the network monitoring server.
 *
 * This function sets up a socket for listening to incoming connections,
 * binds it to a specified port, and listens for client connections. It
 * forks a new process for each connected client to handle network monitoring.
 *
 * @param argc Number of command-line arguments.
 * @param argv Array of command-line arguments.
 *
 * @return This function runs indefinitely, accepting client connections and
 *         forking processes to handle each client's network monitoring.
 */
int main(int argc, char const *argv[])
{
  int server_socket, client_socket;
  struct sockaddr_in server_addr, client_addr;
  socklen_t client_addr_len = sizeof(client_addr);

  // Create socket
  server_socket = socket(AF_INET, SOCK_STREAM, 0);
  if (server_socket == -1)
  {
    error("Error creating socket");
  }

  // Set up server address struct
  memset(&server_addr, 0, sizeof(server_addr));
  server_addr.sin_family = AF_INET;
  server_addr.sin_addr.s_addr = INADDR_ANY;
  server_addr.sin_port = htons(PORT);

  // Bind socket to address
  if (bind(server_socket, (struct sockaddr *)&server_addr, sizeof(server_addr)) == -1)
  {
    error("Error binding socket");
  }

  // Listen for incoming connections
  if (listen(server_socket, 5) == -1)
  {
    error("Error listening for connections");
  }

  // Print server status
  printf("Server is listening on port %d...\n", PORT);

  // Accept client connections
  while (1)
  {
    client_socket = accept(server_socket, (struct sockaddr *)&client_addr, &client_addr_len);
    if (client_socket == -1)
    {
      error("Error accepting connection");
    }

    // Print client connection status
    printf("Client connected\n");

    // Fork a new process to handle each client
    if (fork() == 0)
    {
      close(server_socket); // Child process does not need the listening socket
      monitor_network(client_socket);
      close(client_socket);
      exit(0);
    }
    else
    {
      close(client_socket); // Parent process does not need the connected socket
    }
  }

  // Close the server socket (this line is not reachable due to the infinite loop)
  close(server_socket);

  return 0;
}
