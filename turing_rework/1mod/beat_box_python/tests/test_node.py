import pytest
from beat_box.node import Node

def test_it_can_be_a_node():
  node = Node("plop")
  assert isinstance(node, Node)

def test_it_can_have_data():
  node = Node("plop")
  assert node.data == "plop"

def test_it_has_no_next_node_by_default():
  node = Node("plop")
  assert node.next_node == None

def test_it_can_have_a_next_node():
  node = Node("plop", Node("deep"))
  assert isinstance(node.next_node, Node)
  assert node.next_node.data == "deep"