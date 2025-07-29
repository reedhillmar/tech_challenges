import pytest
from beat_box.node import Node
from beat_box.linked_list import LinkedList
from beat_box.beat_box import BeatBox

def test_it_can_be_a_beat_box():
  bb = BeatBox()
  assert isinstance(bb, BeatBox)

def test_it_has_an_empty_list_by_default():
  bb = BeatBox()
  assert isinstance(bb.list, LinkedList)
  assert bb.list.head == None

def test_it_can_append_a_string():
  bb = BeatBox()
  bb.append("deep doo ditt")
  
  assert bb.list.head.data == "deep"
  assert bb.list.head.next_node.data == "doo"

def test_it_can_count_a_list():
  bb = BeatBox()
  bb.append("deep doo ditt")
  bb.append("woo hoo shu")

  assert bb.count == 6

def test_it_can_play_beats():
  bb = BeatBox()
  bb.append("deep doo ditt woo hoo shu")

  assert bb.count == 6
  assert bb.list.count == 6

  # bb.play()

def test_it_can_validate_beats():
  bb = BeatBox("deep")
  bb.append("Mississippi")

  assert bb.all() == "deep"

  bb.prepend("tee tee tee Mississippi")

  assert bb.all() == "tee tee tee deep"