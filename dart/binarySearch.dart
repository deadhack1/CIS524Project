// Binary Search in Dart (Multi-Paradigm Approach)
class Contact {
  final String name;
  final String phoneNumber;

  Contact({required this.name, required this.phoneNumber});
}

class PhoneBookSearch {
  // Binary search implementation using an iterative approach
  static int? binarySearch<T extends Comparable<T>>(
      List<T> arr, T target) {
    int left = 0;
    int right = arr.length - 1;

    while (left <= right) {
      int mid = (left + right) ~/ 2;
      int comparison = arr[mid].compareTo(target);

      if (comparison == 0) {
        return mid;
      } else if (comparison < 0) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return null;
  }

  // Phone book search method
  static Contact? searchContact(List<Contact> contacts, String name) {
    // Sort contacts by name
    contacts.sort((a, b) => a.name.compareTo(b.name));

    // Extract names for binary search
    List<String> names = contacts.map((contact) => contact.name).toList();

    // Perform binary search
    int? index = binarySearch(names, name);

    // Return contact if found
    return index != null ? contacts[index] : null;
  }

  // Main method to demonstrate usage
  static void main() {
    List<Contact> contacts = [
      Contact(name: 'Alice', phoneNumber: '123-456-7890'),
      Contact(name: 'Bob', phoneNumber: '234-567-8901'),
      Contact(name: 'Charlie', phoneNumber: '345-678-9012'),
      Contact(name: 'David', phoneNumber: '456-789-0123'),
      Contact(name: 'Eve', phoneNumber: '567-890-1234'),
    ];

    String searchName = 'Charlie';
    Contact? result = searchContact(contacts, searchName);

    if (result != null) {
      print('Found: ${result.name} - ${result.phoneNumber}');
    } else {
      print('Contact not found');
    }
  }
}

void main() {
  PhoneBookSearch.main();
}