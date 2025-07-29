from beat_box.node import Node

class LinkedList:
  def __init__(self, head=None):
    self.head = head

  def append(self, data):
    if self.head == None:
      self.head = Node(data)
    else:
      current_node = self.head

      while True:
        if current_node.next_node == None:
          current_node.next_node = Node(data)
          break
        else:
          current_node = current_node.next_node

  @property
  def count(self):
    _count = 0

    if self.head == None:
      return _count
    else:
      current_node = self.head

      while True:
        _count += 1
        
        if current_node.next_node == None:
          break
        else:
          current_node = current_node.next_node

      return _count
    
  def to_string(self):
    _string = ""

    if self.head == None:
      return _string
    else:
      current_node = self.head
      _string = current_node.data

      while current_node.next_node != None:
        current_node = current_node.next_node

        _string += f" {current_node.data}"

      return _string
    
  def prepend(self, data):
    if self.head == None:
      self.head = Node(data)
    else:
      current_node = self.head

      self.head = Node(data, current_node)

  def insert(self, index, data):
    _count = 0
    current_node = self.head
    previous_node = None

    while index > _count:
      _count += 1
      previous_node = current_node
      current_node = current_node.next_node
      

    previous_node.next_node = Node(data, previous_node.next_node)

  def find(self, index, elements):
    _count = 0
    current_node = self.head

    while index > _count:
      _count += 1
      current_node = current_node.next_node

    _count = 1
    _string = current_node.data

    while elements > _count:
      _count += 1
      
      if current_node.next_node != None:
        current_node = current_node.next_node

        _string += f" {current_node.data}"
    
    return _string
  
  def includes(self, data) -> bool:
    current_node = self.head

    while True:
      if current_node.data == data:
        return True
      else:
        current_node = current_node.next_node

        if current_node == None:
          return False
        
  def pop(self):
    current_node = self.head
    previous_node = None

    while True:
      if current_node.next_node == None:
        previous_node.next_node = None
        return current_node.data
      else:
        previous_node = current_node
        current_node = current_node.next_node