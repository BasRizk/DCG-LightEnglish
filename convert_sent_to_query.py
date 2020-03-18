def create_query(init_var, _str):
    return init_var + "(TREE, " + _str + ", [])."


with open("incorrect_sentences.txt", "r") as f:
    queries = ""
    for sentence in f:
        sentence = sentence[:-1]
        queries += create_query("s", sentence) + "\n"

with open("generated_sentences.pl", "w") as f:
    f.write(queries)
    print("The End.")