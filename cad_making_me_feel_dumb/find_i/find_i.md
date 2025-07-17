# Given the passage of text, count the number of 1 or 2 letter text patterns that start with the letter 'i'
#
# A text pattern starting with the letter 'i' is defined as
#   - A 1 or 2 character pattern in a word tha tstarts with the letter 'i'
#     - The letter 'i' by itself
#     - The letter 'i' at the end of a word
#     - The letter 'i' plus the letter that immediately follows it in the same word
#     - Text patterns are case insensitive, 'i' and 'I' should be treated the same
#     - Punctuation attached to a word should be ignored
#
#   - Examples
#     - 'I' -> 'i'
#     - 'alumni' -> 'i'
#     - 'financial' -> 'in', 'ia'
#     - 'sight' -> 'ig'
#
#   Output from this process should be a list of patterns and the number of times each pattern occurs, sorted in descending order by count
#   - Should look something like 'is=5,it=3,iv=3,i=1,ie=1'

INPUT = <<~EOF
  I wandered lonely as a cloud
  That floats on high o'er vales and hills,
  When all at once I saw a crowd,
  A host, of golden daffodils;
  Beside the lake, beneath the trees,
  Fluttering and dancing in the breeze.

  Continuous as the stars that shine
  And twinkle on the milky way,
  They stretched in never-ending line
  Along the margin of a bay:
  Ten thousand saw I at a glance,
  Tossing their heads in sprightly dance.

  The waves beside them danced; but they
  Out-did the sparkling waves in glee:
  A poet could not but be gay,nm
  In such a jocund company:
  I gazed—and gazed—but little thought
  What wealth the show to me had brought:

  For oft, when on my couch I lie
  In vacant or in pensive mood,
  They flash upon that inward eye
  Which is the bliss of solitude;
  And then my heart with pleasure fills,
  And dances with the daffodils.
EOF

# Output should be in=18,i=5,il=5,it=4,id=3,ig=2,is=2,ic=1,ie=1,ir=1,iv=1