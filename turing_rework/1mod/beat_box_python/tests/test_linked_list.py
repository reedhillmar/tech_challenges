import pytest
from beat_box.node import Node
from beat_box.linked_list import LinkedList

def test_it_can_be_a_linked_list():
  ll = LinkedList()
  assert isinstance(ll, LinkedList)

def test_it_has_no_head_by_default():
  ll = LinkedList()
  assert ll.head == None

def test_it_can_append_a_node():
  ll = LinkedList()
  ll.append("doop")

  assert isinstance(ll.head, Node)
  assert ll.head.data == "doop"
  assert ll.head.next_node == None

def test_it_can_append_another_node():
  ll = LinkedList()
  ll.append("doop")
  ll.append("deep")

  assert isinstance(ll.head.next_node, Node)
  assert ll.head.next_node.data == "deep"

def test_it_can_count_nodes_in_the_list():
  ll = LinkedList()

  assert ll.count == 0

  ll.append("doop")

  assert ll.count == 1

  ll.append("deep")

  assert ll.count == 2

def test_it_can_return_a_string_of_node_data():
  ll = LinkedList()

  assert ll.to_string() == ""

  ll.append("doop")
  ll.append("deep")

  assert ll.to_string() == "doop deep"

def test_it_can_prepend_a_node():
  ll = LinkedList()
  ll.append("doop")
  ll.append("deep")
  ll.prepend("dip")

  assert ll.head.data == "dip"
  assert ll.head.next_node.data == "doop"
  assert ll.head.next_node.next_node.data == "deep"

def test_it_can_insert_a_node():
  ll = LinkedList()
  ll.append("doop")
  ll.append("deep")
  ll.append("dip")
  ll.insert(1, "woo")

  assert ll.to_string() == "doop woo deep dip"
  assert ll.head.data == "doop"
  assert ll.head.next_node.data == "woo"
  assert ll.head.next_node.next_node.data == "deep"

def test_it_can_return_elements():
  ll = LinkedList()
  ll.append("deep")
  ll.append("woo")
  ll.append("shi")
  ll.append("shu")
  ll.append("blop")

  assert ll.find(2, 1) == "shi"
  assert ll.find(1, 3) == "woo shi shu"

def test_it_can_tell_if_an_element_is_present():
  ll = LinkedList()
  ll.append("deep")
  ll.append("woo")
  ll.append("shi")
  ll.append("shu")
  ll.append("blop")

  assert ll.includes("shi") == True
  assert ll.includes("false") == False

def test_it_can_remove_and_return_an_element():
  ll = LinkedList()
  ll.append("deep")
  ll.append("woo")
  ll.append("shi")
  ll.append("shu")
  ll.append("blop")

  assert ll.pop() == "blop"
  assert ll.pop() == "shu"
  assert ll.to_string() == "deep woo shi"