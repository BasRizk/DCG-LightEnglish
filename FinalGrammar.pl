% 
% Assignment 1 | Compiler
% Author: Basem Rizk / 37-14415 / T10
% 

s(s(SNP,VP)) --> subject_noun_phrase(SNP), verb_phrase(VP).
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
verb_phrase(vp(CV,ONP,C,S)) --> clear_verb(CV), object_noun_phrase(ONP), conj(C), s(S).
% verb_phrase(vp(CV,ONP,VP)) --> clear_verb(CV), object_noun_phrase(ONP), verb_phrase(VP).
% verb_phrase(vp(CV,D,CN,VP)) --> clear_verb(CV), det(D), clear_noun(CN), verb_phrase(VP).
verb_phrase(vp(CV,ONP,P,VP)) --> clear_verb(CV), object_noun_phrase(ONP), prep(P), verb_phrase(VP).
verb_phrase(vp(CPV,ONP)) --> clear_prep_verb(CPV), object_noun_phrase(ONP).
verb_phrase(vp(CPV,ONP,C,S)) --> clear_prep_verb(CPV), object_noun_phrase(ONP), conj(C), s(S).
verb_phrase(vp(CPV,ONP,VP)) --> clear_prep_verb(CPV), object_noun_phrase(ONP), verb_phrase(VP).
verb_phrase(vp(CPV,ONP,P,VP)) --> clear_prep_verb(CPV), object_noun_phrase(ONP), prep(P), verb_phrase(VP).
verb_phrase(vp(CPV,VP)) --> clear_prep_verb(CPV), verb_phrase(VP).
% verb_phrase(vp(D,VP1, VP2)) --> det(D), verb_phrase(VP1), verb_phrase(VP2).
verb_phrase(vp(D,VP1, VP2)) --> relpro(D), verb_phrase(VP1), verb_phrase(VP2).
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
verb(v(ate)) --> [ate].
verb(v(fought)) --> [fought].
verb(v(striked)) --> [striked].
verb(v(played)) --> [played].
verb(v(performed)) --> [performed].
verb(v(acted)) --> [acted].
verb(v(expressed)) --> [expressed].
verb(v(spoke)) --> [spoke].
verb(v(brought)) --> [brought].
verb(v(sat)) --> [sat].
verb(v(stood)) --> [stood].
verb(v(drunk)) --> [drunk].
verb(v(shot)) --> [shot].
verb(v(caught)) --> [caught].
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
adj(a(smart)) --> [smart].
adj(a(beautiful)) --> [beautiful].
adj(a(fabulous)) --> [fabulous].
adj(a(gorgeous)) --> [gorgeous].
adj(a(black)) --> [black].
adj(a(happy)) --> [happy].
adj(a(sad)) --> [sad].
adj(a(fat)) --> [fat].
adj(a(thin)) --> [thin].
adj(a(short)) --> [short].
adj(a(interesting)) --> [interesting].
adj(a(tall)) --> [tall].
adj(a(magnificent)) --> [magnificent].
adj(a(astonishing)) --> [astonishing].
adj(a(incredible)) --> [incredible].
adj(a(unbelievable)) --> [unbelievable].
adj(a(dumb)) --> [dumb].
adj(a(stupid)) --> [stupid].
adj(a(superb)) --> [superb].
adv(a(quickly)) --> [quickly].
adv(a(secretly)) --> [secretly].
adv(a(clearly)) --> [clearly].
adv(a(slowly)) --> [slowly].
adv(a(purely)) --> [purely].
adv(a(clearly)) --> [clearly].
adv(a(strongly)) --> [strongly].
adv(a(aggresively)) --> [aggresively].
adv(a(tiredly)) --> [tiredly].
adv(a(admirably)) --> [admirably].
adv(a(magnificently)) --> [magnificently].
adv(a(happly)) --> [happly].
adv(a(sadly)) --> [sadly].
adv(a(shortly)) --> [shortly].
adv(a(gorgeously)) --> [gorgeously].
adv(a(beautifully)) --> [beautifully].
adv(a(smartly)) --> [smartly].
adv(a(weakly)) --> [weakly].
adv(a(crowdly)) --> [crowdly].
adv(a(cowardly)) --> [cowardly].
adv(a(bravely)) --> [bravely].
prep(p(for)) --> [for].
prep(p(and)) --> [and].
prep(p(in)) --> [in].
prep(p(after)) --> [after].
prep(p(behind)) --> [behind].
prep(p(before)) --> [before].
prep(p(among)) --> [among].
prep(p(over)) --> [over].
prep(p(to)) --> [to].
prep(p(on)) --> [on].
prep(p(under)) --> [under].
prep(p(underneath)) --> [underneath].
prep(p(beside)) --> [beside].
det(d(the)) --> [the].
det(d(every)) --> [every].
det(d(some)) --> [some].
det(d(many)) --> [many].
det(d(a)) --> [a].
det(d(an)) --> [an].
det(d(few)) --> [few].
det(d(one)) --> [one].
det(d(two)) --> [two].
det(d(three)) --> [three].
det(d(four)) --> [four].
det(d(five)) --> [five].
det(d(six)) --> [six].
det(d(seven)) --> [seven].
det(d(this)) --> [this].
det(d(that)) --> [that].
det(d(these)) --> [these].
det(d(those)) --> [those].
relpro(r(who)) --> [who].
relpro(r(whom)) --> [whom].
relpro(r(which)) --> [which].
relpro(r(that)) --> [that].
relpro(r(whose)) --> [whose].
conj(c(while)) --> [while].


% s(TREE, ['the', 'young', 'boy', 'who', 'worked', 'for', 'the', 'old', 'man', 'pushed', 'and', 'stored', 'a', 'big', 'box', 'in', 'the', 'large', 'empty', 'room', 'after', 'school'], []).
% s(TREE, ['the', 'old', 'woman', 'and', 'the', 'old', 'man', 'gave', 'the', 'poor', 'young', 'man', 'whom', 'they', 'liked', 'a', 'white', 'envelope', 'in', 'the', 'shed', 'behind', 'the', 'building'], []).
% s(TREE, ['every', 'boy', 'quickly', 'climbed', 'some', 'big', 'tree', 'while', 'every', 'girl', 'secretly', 'watched', 'some', 'boy'], []).
% s(TREE, ['some', 'brilliant', 'students', 'and', 'many', 'professors', 'watched', 'and', 'admired', 'talented', 'lecturers', 'and', 'appreciated', 'bright', 'scientists', 'and', 'researchers'], []).
