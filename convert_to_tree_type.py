code = """
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

adj_phrase --> adj, adj_phrase.
adj_phrase --> adj.
adv_phrase --> adv, adv_phrase.
adv_phrase --> adv.
"""

def split_right_args(right_str):
    right_str = right_str.strip(".").strip()
    right_args = right_str.split(",")
    return right_args

def get_namings(right_args):
    namings = []
    for _arg in right_args:
        name = ''
        _arg = _arg.strip().split("_")
        print(_arg)
        for _split in _arg:
            print(_split)
            name += list(_split)[0].strip().upper()
        print(name)
        namings.append(name)
    return namings

lines_of_code = code.split("\n")
new_lines = ""
for line in lines_of_code:
    if len(line) <= 0:
        print("Empty line")
        continue
    line = line.split(" --> ")
    left_str = line[0].strip()
    right_args = split_right_args(line[1])
    right_namings = get_namings(right_args)
    left_name = get_namings([left_str])[0].lower()

    new_line = ""
    new_line = left_str + "(" + left_name + "("
    for _name in right_namings:
        new_line += _name + ","
    new_line = new_line[:-1] + ")" + ")"
    new_line += " --> "
    for i in range(len(right_args)):
        new_line += right_args[i] +\
            "(" + right_namings[i]  + "),"
    new_line = new_line[:-1] + "."
    new_lines += new_line + "\n"

with open("generated_code.pl", "w") as f:
    f.writelines(new_lines)
    print("The End.")



