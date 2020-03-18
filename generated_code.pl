sentence(s(SNP,VP)) --> subject_noun_phrase(SNP), verb_phrase(VP).
subject_noun_phrase(snp(D,CN)) --> det(D), clear_noun(CN).
% subject_noun_phrase(snp(D,CN,SNP)) --> det(D), clear_noun(CN), subject_noun_phrase(SNP).
subject_noun_phrase(snp(D,CN,P,ONP)) --> det(D), clear_noun(CN), prep(P), object_noun_phrase(ONP).

object_noun_phrase(onp(CN)) --> clear_noun(CN).
object_noun_phrase(onp(D,CN)) --> det(D), clear_noun(CN).
% object_noun_phrase(onp(SNP)) --> subject_noun_phrase(SNP).
object_noun_phrase(onp(CN,P,ONP)) --> clear_noun(CN), prep(P), object_noun_phrase(ONP).
object_noun_phrase(onp(D1,CN1,D2,CN2)) --> det(D1), clear_noun(CN1), det(D2), clear_noun(CN2).
object_noun_phrase(onp(D,CN,P,ONP)) --> det(D), clear_noun(CN), prep(P), object_noun_phrase(ONP).
object_noun_phrase(onp(D,CN,V)) --> det(D), clear_noun(CN), clear_verb(V).
object_noun_phrase(onp(D1,CN1,SOP,ONP)) --> det(D1), clear_noun(CN1), secondary_object_phrase(SOP), object_noun_phrase(ONP).

secondary_object_phrase(sop(RP, CN, V)) --> relpro(RP), clear_noun(CN), clear_verb(V).
% object_noun_phrase(onp(SNP1,SNP2)) --> subject_noun_phrase(SNP1), subject_noun_phrase(SNP2).



clear_noun(cn(N)) --> noun(N).
clear_noun(cn(AP,N)) --> adj_phrase(AP), noun(N).

verb_phrase(vp(CV,ONP)) --> clear_verb(CV), object_noun_phrase(ONP).
verb_phrase(vp(CV,ONP,C,S)) --> clear_verb(CV), object_noun_phrase(ONP), conj(C), sentence(S).
% verb_phrase(vp(CV,ONP,VP)) --> clear_verb(CV), object_noun_phrase(ONP), verb_phrase(VP).
% verb_phrase(vp(CV,D,CN,VP)) --> clear_verb(CV), det(D), clear_noun(CN), verb_phrase(VP).
verb_phrase(vp(CV,ONP,P,VP)) --> clear_verb(CV), object_noun_phrase(ONP), prep(P), verb_phrase(VP).
verb_phrase(vp(CPV,ONP)) --> clear_prep_verb(CPV), object_noun_phrase(ONP).
verb_phrase(vp(CPV,ONP,C,S)) --> clear_prep_verb(CPV), object_noun_phrase(ONP), conj(C), sentence(S).
verb_phrase(vp(CPV,ONP,VP)) --> clear_prep_verb(CPV), object_noun_phrase(ONP), verb_phrase(VP).
verb_phrase(vp(CPV,ONP,P,VP)) --> clear_prep_verb(CPV), object_noun_phrase(ONP), prep(P), verb_phrase(VP).
verb_phrase(vp(CPV,VP)) --> clear_prep_verb(CPV), verb_phrase(VP).
verb_phrase(vp(D,VP1, VP2)) --> det(D), verb_phrase(VP1), verb_phrase(VP2).
clear_verb(cv(V)) --> verb(V).
clear_verb(cv(V,AP)) --> verb(V), adv_phrase(AP).
clear_verb(cv(AP,V)) --> adv_phrase(AP), verb(V).
clear_prep_verb(cpv(V,P)) --> verb(V), prep(P).
clear_prep_verb(cpv(V,AP,P)) --> verb(V), adv_phrase(AP), prep(P).
adj_phrase(ap(A,AP)) --> adj(A), adj_phrase(AP).
adj_phrase(ap(A)) --> adj(A).
adv_phrase(ap(A,AP)) --> adv(A), adv_phrase(AP).
adv_phrase(ap(A)) --> adv(A).

noun(n(boy)) --> [boy].
noun(n(man)) --> [man].
noun(n(box)) --> [box].
noun(n(school)) --> [school].
noun(n(room)) --> [room].
noun(n(woman)) --> [woman].
noun(n(man)) --> [man].
noun(n(they)) --> [they].
noun(n(envelope)) --> [envelope].
noun(n(shed)) --> [shed].
noun(n(building)) --> [building].
noun(n(tree)) --> [tree].
noun(n(girl)) --> [girl].
noun(n(students)) --> [students].
noun(n(professors)) --> [professors].
noun(n(lecturers)) --> [lecturers].
noun(n(scientists)) --> [scientists].
noun(n(researchers)) --> [researchers].
noun(n(cat)) --> [cat].
noun(n(bat)) --> [bat].
verb(v(worked)) --> [worked].
verb(v(pushed)) --> [pushed].
verb(v(stored)) --> [stored].
verb(v(gave)) --> [gave].
verb(v(liked)) --> [liked].
verb(v(climbed)) --> [climbed].
verb(v(watched)) --> [watched].
verb(v(admired)) --> [admired].
verb(v(appreciated)) --> [appreciated].
verb(v(eats)) --> [eats].
adj(a(young)) --> [young].
adj(a(old)) --> [old].
adj(a(big)) --> [big].
adj(a(large)) --> [large].
adj(a(empty)) --> [empty].
adj(a(poor)) --> [poor].
adj(a(white)) --> [white].
adj(a(brilliant)) --> [brilliant].
adj(a(talented)) --> [talented].
adj(a(bright)) --> [bright].
adv(a(quickly)) --> [quickly].
adv(a(secretly)) --> [secretly].
prep(p(for)) --> [for].
prep(p(and)) --> [and].
prep(p(in)) --> [in].
prep(p(after)) --> [after].
prep(p(in)) --> [in].
prep(p(behind)) --> [behind].
det(d(the)) --> [the].
det(d(who)) --> [who].
% det(d(whom)) --> [whom].
det(d(every)) --> [every].
det(d(some)) --> [some].
det(d(many)) --> [many].
det(d(a)) --> [a].
det(d(an)) --> [an].

conj(c(while)) --> [while].

relpro(r(who)) --> [who].
relpro(r(whom)) --> [whom].
relpro(r(which)) --> [which].
relpro(r(that)) --> [that].
relpro(r(whose)) --> [whose].


% sentence(TREE, ['the', 'young', 'boy', 'who', 'worked', 'for', 'the', 'old', 'man', 'pushed', 'and', 'stored', 'a', 'big', 'box', 'in', 'the', 'large', 'empty', 'room', 'after', 'school'], []).
% sentence(TREE, ['the', 'old', 'woman', 'and', 'the', 'old', 'man', 'gave', 'the', 'poor', 'young', 'man', 'whom', 'they', 'liked', 'a', 'white', 'envelope', 'in', 'the', 'shed', 'behind', 'the', 'building'], []).
% sentence(TREE, ['every', 'boy', 'quickly', 'climbed', 'some', 'big', 'tree', 'while', 'every', 'girl', 'secretly', 'watched', 'some', 'boy'], []).
% sentence(TREE, ['some', 'brilliant', 'students', 'and', 'many', 'professors', 'watched', 'and', 'admired', 'talented', 'lecturers', 'and', 'appreciated', 'bright', 'scientists', 'and', 'researchers'], []).
