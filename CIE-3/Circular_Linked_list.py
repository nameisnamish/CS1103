class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

class CircularLinkedList:
    def __init__(self):
        self.head = None

    def insert_at_beginning(self, data):
        new_node = Node(data)
        if self.head is None:
            self.head = new_node
            new_node.next = new_node
        else:
            new_node.next = self.head.next
            self.head.next = new_node

    def delete_first_node(self):
        if self.head is None:
            return
        if self.head.next == self.head:
            self.head = None
        else:
            self.head.next = self.head.next.next

    def traverse(self):
        if self.head is None:
            print("Circular Linked List is empty.")
            return
        current = self.head.next
        while True:
            print(current.data, end=" -> ")
            current = current.next
            if current == self.head.next:
                break
        print(f"{self.head.next.data}")

cll = CircularLinkedList()
cll.insert_at_beginning(301)
cll.insert_at_beginning(201)
cll.insert_at_beginning(101)
cll.traverse()

cll.delete_first_node()
cll.traverse()
