import 'dart:io';

import 'package:tasky/core/failure/failure.dart';

class ExceptionHandler {
  // Function to get error message based on status code or exception
  static String getErrorMessage(dynamic error) {
    if (error is int) {
      // Handle based on HTTP status code
      switch (error) {
        case 400:
          return "Bad Request: The server could not understand the request.";
        case 401:
          return "Unauthorized: Please check your credentials.";
        case 403:
          return "Forbidden: You don't have permission to access this resource.";
        case 404:
          return "Not Found: The requested resource could not be found.";
        case 500:
          return "Internal Server Error: Something went wrong on the server.";
        case 502:
          return "Bad Gateway: Invalid response from the upstream server.";
        case 503:
          return "Service Unavailable: The server is not ready to handle the request.";
        case 504:
          return "Gateway Timeout: The server took too long to respond.";
        default:
          return "Unexpected error occurred: HTTP $error.";
      }
    } else if (error is Exception) {
      // Handle common exceptions
      if (error is SocketException) {
        return "No Internet Connection: Please check your network.";
      } else if (error is HttpException) {
        return "HTTP Error: ${error.message}";
      } else if (error is FormatException) {
        return "Bad Response Format: Unable to process the response.";
      } else {
        return "Unexpected Error: ${error.toString()}";
      }
    } else if (error is ServerFailure) {
      return error.getMessage();
    } else if (error is CachFailure) {
      return error.getMessage();
    } else {
      return "Unknown Error: An unexpected error occurred.";
    }
  }
}
