// This page will have the blank function generator.
/* 
Function takes in a difficulty score of 1 - 5.
1 being the easiest and 5 being the hardest.
1 means 10% of the words are blocked out
5 means 90% of the words are blocked out

Anything in between will be a linear interpolation between the two.

It needs to return a string with the words blocked out.
The words that are blanked are decided at random.

*/
import 'dart:math';

Set<int> _randomIndices(int length, int numIndices) {
  Random random = Random();
  Set<int> indices = {};
  while (indices.length < numIndices) {
    int index = random.nextInt(length);
    indices.add(index);
  }
  List<int> sortedIndices = indices.toList()..sort();

  return sortedIndices.toSet();
}

Map<String, String> blankedWords(
  int difficulty,
  String ayah,
) {
  if (difficulty < 1 || difficulty > 5) {
    throw ArgumentError('Difficulty must be between 1 and 5');
  }

  List<String> words = ayah.split(' ');

  int numWordsToBlank = (((difficulty - 1) * 0.2 + 0.1) * words.length).ceil();

  // Convert to list after mapping
  List<String> blanked_words = [];
  Set<int> blanked_indices = _randomIndices(words.length, numWordsToBlank);

  for (int i = 0; i < numWordsToBlank; i++) {
    blanked_words.add(words[blanked_indices.elementAt(i)]);
    words[blanked_indices.elementAt(i)] =
        '_ ' * (words[blanked_indices.elementAt(i)].length * 0.5).toInt() + ' ';
  }

  return {
    'original': words.join(' '),
    'blanked': blanked_words.join(' '),
  };
}
