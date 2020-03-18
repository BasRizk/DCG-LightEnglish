noun = 'boy, man, box, school, room, woman, man, they, envelope, shed, building, tree, girl, students, professors, lecturers, scientists, researchers, cat, bat'
verb = 'worked, pushed, stored, gave, liked, climbed, watched, admired, appreciated, ate, fought, striked, played, performed, acted, expressed, spoke, brought, sat, stood, drunk, shot, caught'
adj = 'young, old, big, large, empty, poor, white, brilliant, talented, bright, smart, beautiful, fabulous, gorgeous, black, happy, sad, fat, thin, short, interesting, tall, magnificent, astonishing, incredible, unbelievable, dumb, stupid, superb'
adv = 'quickly, secretly, clearly, slowly, purely, clearly, strongly, aggresively, tiredly, admirably, magnificently, happly, sadly, shortly, gorgeously, beautifully, smartly, weakly, crowdly, cowardly, bravely'
prep = "for, and, in, after, behind, before, among, over, to, on, under, underneath, beside"
det = 'the, every, some, many, a, an, few, one, two, three, four, five, six, seven, this, that, these, those'
relpro= 'who, whom, which, that, whose'
conj = 'while'

sentences = [
    "The young boy who worked for the old man pushed and stored a big box in the large empty room after school",
    "The old woman and the old man gave the poor young man whom they liked a white envelope in the shed behind the building",
    "Every boy quickly climbed some big tree while every girl secretly watched some boy",
    "Some brilliant students and many professors watched and admired talented lecturers and appreciated bright scientists and researchers"
]

noun_draft = "noun"
verb_draft = "verb"
adj_draft = "adj"
adv_draft = "adv"
prep_draft = "prep"
det_draft = "det"
relpro_draft = "relpro"
conj_draft = "conj"

def set_group(group_str, group_draft, print_num=None):
    terms_set = set()
    group_strs = ""
    for word in group_str.split(","):
        word = str.strip(word)
        group_strs += group_draft +\
             "(" + group_draft[0] + "(" + word + "))" +\
                  " --> " + "[" + word + "].\n"
        terms_set.add(word)
    if print_num is not None:
        print(print_num + " " + str(len(terms_set)))
    return group_strs

def create_query(init_var, _str):
    return init_var + "(TREE, " +\
        str(_str.lower().split(" ")) + ", [])."


output = ""
output += set_group(noun, noun_draft, print_num="#nouns=")
output += set_group(verb, verb_draft, print_num="#verbs=")
output += set_group(adj, adj_draft, print_num="#adj=")
output += set_group(adv, adv_draft, print_num="#adv=")
output += set_group(prep, prep_draft, print_num="#prep=")
output += set_group(det, det_draft, print_num="#det=")
output += set_group(relpro, relpro_draft, print_num="#relpro=")
output += set_group(conj, conj_draft, print_num="#conj=")

queries = ""
for sentence in sentences:
    queries += create_query("sentence", sentence) + "\n"

with open("generated_output.pl", "w") as f:
    f.writelines(output)
    f.write("\n")
    f.write(queries)
    print("The End.")





