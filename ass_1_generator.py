noun = 'boy, man, box, school, room, woman, man, they, envelope, shed, building, tree, girl, students, professors, lecturers, scientists, researchers, cat, bat'
verb = 'worked, pushed, stored, gave, liked, climbed, watched, admired, appreciated, eats'
adj = 'young, old, big, large, empty, poor, white, brilliant, talented, bright'
adv = 'quickly, secretly'
prep = "for, and, in, after, in, behind"
det = 'the, who, whom, every, some, many, a, an'

sentences = [
    "The young boy who worked for the old man pushed and stored a big box in the large empty room after school",
    "The old woman and the old man gave the poor young man whom they liked a white envelope in the shed behind the building",
    "Every boy quickly climbed some big tree while every girl secretly watched some boy",
    "Some brilliant students and many professors watched and admired talented lecturers and appreciated bright scientists and researchers"
]

noun_draft = "noun --> "
verb_draft = "verb --> "
adj_draft = "adj --> "
adv_draft = "adv --> "
prep_draft = "prep --> "
det_draft = "det --> "

def set_group(group_str, group_draft):
    group_strs = ""
    for word in group_str.split(","):
        word = str.strip(word)
        group_strs += group_draft + "[" + word + "].\n"
    return group_strs

def create_query(init_var, _str):
    return init_var + "(" +\
        str(_str.lower().split(" ")) + ",[])."


output = ""
output += set_group(noun, noun_draft)
output += set_group(verb, verb_draft)
output += set_group(adj, adj_draft)
output += set_group(adv, adv_draft)
output += set_group(prep, prep_draft)
output += set_group(det, det_draft)


queries = ""
for sentence in sentences:
    queries += create_query("sentence", sentence) + "\n"

with open("generated_output.pl", "w") as f:
    f.writelines(output)
    f.write("\n")
    f.write(queries)
    print("The End.")





