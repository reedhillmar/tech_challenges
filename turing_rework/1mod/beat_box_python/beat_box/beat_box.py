import subprocess

from beat_box.node import Node
from beat_box.linked_list import LinkedList

class BeatBox:
  def __init__(self, data=None):
    self.list = LinkedList()
    if data is not None:
      self.append(data)
    self._rate = 500
    self._voice = "Boing"

  def append(self, data):
    data = self.sanitize(data)

    if data:
      data = data.split(" ")

      for datum in data:
        self.list.append(datum)

  @property
  def count(self):
    return self.list.count
  
  def play(self):
    subprocess.run(["say", "-r", str(self._rate), "-v", self._voice, self.list.to_string()])

  def all(self):
    return self.list.to_string()
  
  def sanitize(self, data):
    _valid = ["tee", "dee", "deep", "bop", "boop", "la", "na", "doo", "ditt", "woo", "hoo", "shu"]

    data = data.split(" ")

    for datum in data:
      if datum not in _valid:
        data.remove(datum)
  
    print(data)

    if data:
      data = ' '.join(data)

    return data

  def prepend(self, data):
    data = self.sanitize(data)

    if data:
      data = data.split(" ")
      data.reverse()

      for datum in data:
        self.list.prepend(datum)

  def reset_rate(self):
    self._rate = 500

  def reset_voice(self):
    self._voice = "Boing"