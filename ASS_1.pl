% Start state is S
% 
% NOUN ->  boy, man, box, room, woman, man, they, envelope, shed, building, tree, girl, students, professors, lecturers, scientists, researchers
% VERBS -> worked, pushed, stored, gave, liked, climbed, watched, admired, appreciated
% ADJ -> young, old, big, large, empty, poor, white, brilliant, talented, bright
% ADV -> quickly, secretly
% PREP -> for, and, in, after, in, behind
% DETERMIN -> the, who, whom, every, some, many, a, an, this, that, those, these, which
% 
% Sentences examples:
% a) The young boy who worked for the old man pushed and stored a big box in the large
% empty room after school.
% b) The old woman and the old man gave the poor young man whom they liked a white
% envelope in the shed behind the building.
% c) Every boy quickly climbed some big tree while every girl secretly watched some boy.
% d) Some brilliant students and many professors watched and admired talented lecturers
% and appreciated bright scientists and researchers.
% 
% Query format:
% s(T,[the,boy,pushed,a,box],[]).
% 
% A successful parse should result in building a parse tree for the input; make sure your parser
% generates such a tree. We linearly represent a parse tree as follows:
% a) l, where l is the label of a leaf.
% b) p(l1; l2; : : : ; ln), where p is a label of a parent node and li is the ith sub-tree thereof,
% where left-to-right order is assumed.
% 
%

% sentence(['the', 'young', 'boy', 'who', 'worked', 'for', 'the', 'old', 'man', 'pushed', 'and', 'stored', 'a', 'big', 'box', 'in', 'the', 'large', 'empty', 'room', 'after', 'school'],[]).


% Subjective and objective nouns, secondary nouns
sentence --> subject_noun_phrase, verb_phrase.

subject_noun_phrase --> det, clear_noun.
subject_noun_phrase --> det, clear_noun, subject_noun_phrase.
subject_noun_phrase --> det, clear_noun, prep, object_noun_phrase.
object_noun_phrase --> clear_noun.
object_noun_phrase --> subject_noun_phrase. 
object_noun_phrase --> clear_noun, prep, object_noun_phrase.
clear_noun --> noun.
clear_noun --> adj_phrase, noun.

verb_phrase --> clear_verb, object_noun_phrase.
verb_phrase --> clear_verb, object_noun_phrase, conj, sentence.
verb_phrase --> clear_verb, object_noun_phrase, verb_phrase.
verb_phrase --> clear_verb, object_noun_phrase, prep, verb_phrase.
verb_phrase --> clear_prep_verb, object_noun_phrase.
verb_phrase --> clear_prep_verb, object_noun_phrase, conj, sentence.
verb_phrase --> clear_prep_verb, object_noun_phrase, verb_phrase.
verb_phrase --> clear_prep_verb, object_noun_phrase, prep, verb_phrase.
verb_phrase --> clear_prep_verb, verb_phrase.
verb_phrase --> det, verb_phrase.
clear_verb --> verb.
clear_verb --> verb, adv_phrase.
clear_verb --> adv_phrase, verb.
clear_prep_verb --> verb, prep.
clear_prep_verb --> verb, adv_phrase, prep.

%  add prep with det verbs which are secondary
adj_phrase --> adj, adj_phrase.
adj_phrase --> adj.
adv_phrase --> adv, adv_phrase.
adv_phrase --> adv.

noun --> [boy].
noun --> [man].
noun --> [box].
noun --> [school].
noun --> [room].
noun --> [woman].
noun --> [man].
noun --> [they].
noun --> [envelope].
noun --> [shed].
noun --> [building].
noun --> [tree].
noun --> [girl].
noun --> [students].
noun --> [professors].
noun --> [lecturers].
noun --> [scientists].
noun --> [researchers].
noun --> [cat].
noun --> [bat].
verb --> [worked].
verb --> [pushed].
verb --> [stored].
verb --> [gave].
verb --> [liked].
verb --> [climbed].
verb --> [watched].
verb --> [admired].
verb --> [appreciated].
verb --> [eats].
adj --> [young].
adj --> [old].
adj --> [big].
adj --> [large].
adj --> [empty].
adj --> [poor].
adj --> [white].
adj --> [brilliant].
adj --> [talented].
adj --> [bright].
adv --> [quickly].
adv --> [secretly].
prep --> [for].
prep --> [and].
prep --> [in].
prep --> [after].
prep --> [in].
prep --> [behind].
det --> [the].
det --> [who].
det --> [whom].
det --> [every].
det --> [some].
det --> [many].
det --> [a].
det --> [an].
conj --> [while].











