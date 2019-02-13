
open Prims
open FStar_Pervasives
exception Not_a_wp_implication of (Prims.string)


let uu___is_Not_a_wp_implication : Prims.exn  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Not_a_wp_implication (uu____13) -> begin
true
end
| uu____16 -> begin
false
end))


let __proj__Not_a_wp_implication__item__uu___ : Prims.exn  ->  Prims.string = (fun projectee -> (match (projectee) with
| Not_a_wp_implication (uu____27) -> begin
uu____27
end))


type label =
FStar_SMTEncoding_Term.error_label


type labels =
FStar_SMTEncoding_Term.error_labels


let sort_labels : (FStar_SMTEncoding_Term.error_label * Prims.bool) Prims.list  ->  ((FStar_SMTEncoding_Term.fv * Prims.string * FStar_Range.range) * Prims.bool) Prims.list = (fun l -> (FStar_List.sortWith (fun uu____85 uu____86 -> (match (((uu____85), (uu____86))) with
| (((uu____136, uu____137, r1), uu____139), ((uu____140, uu____141, r2), uu____143)) -> begin
(FStar_Range.compare r1 r2)
end)) l))


let remove_dups : labels  ->  (FStar_SMTEncoding_Term.fv * Prims.string * FStar_Range.range) Prims.list = (fun l -> (FStar_Util.remove_dups (fun uu____220 uu____221 -> (match (((uu____220), (uu____221))) with
| ((uu____251, m1, r1), (uu____254, m2, r2)) -> begin
((Prims.op_Equality r1 r2) && (Prims.op_Equality m1 m2))
end)) l))


type msg =
(Prims.string * FStar_Range.range)


type ranges =
(Prims.string FStar_Pervasives_Native.option * FStar_Range.range) Prims.list


let fresh_label : Prims.string  ->  FStar_Range.range  ->  FStar_SMTEncoding_Term.term  ->  (label * FStar_SMTEncoding_Term.term) = (

let ctr = (FStar_Util.mk_ref (Prims.parse_int "0"))
in (fun message range t -> (

let l = ((FStar_Util.incr ctr);
(

let uu____354 = (

let uu____356 = (FStar_ST.op_Bang ctr)
in (FStar_Util.string_of_int uu____356))
in (FStar_Util.format1 "label_%s" uu____354));
)
in (

let lvar = (FStar_SMTEncoding_Term.mk_fv ((l), (FStar_SMTEncoding_Term.Bool_sort)))
in (

let label = ((lvar), (message), (range))
in (

let lterm = (FStar_SMTEncoding_Util.mkFreeV lvar)
in (

let lt1 = (FStar_SMTEncoding_Term.mkOr ((lterm), (t)) range)
in ((label), (lt1)))))))))


let label_goals : (unit  ->  Prims.string) FStar_Pervasives_Native.option  ->  FStar_Range.range  ->  FStar_SMTEncoding_Term.term  ->  (labels * FStar_SMTEncoding_Term.term) = (fun use_env_msg r q -> (

let rec is_a_post_condition = (fun post_name_opt tm -> (match (((post_name_opt), (tm.FStar_SMTEncoding_Term.tm))) with
| (FStar_Pervasives_Native.None, uu____472) -> begin
false
end
| (FStar_Pervasives_Native.Some (nm), FStar_SMTEncoding_Term.FreeV (fv)) -> begin
(

let uu____493 = (FStar_SMTEncoding_Term.fv_name fv)
in (Prims.op_Equality nm uu____493))
end
| (uu____496, FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Var ("Valid"), (tm1)::[])) -> begin
(is_a_post_condition post_name_opt tm1)
end
| (uu____507, FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Var ("ApplyTT"), (tm1)::uu____509)) -> begin
(is_a_post_condition post_name_opt tm1)
end
| uu____521 -> begin
false
end))
in (

let conjuncts = (fun t -> (match (t.FStar_SMTEncoding_Term.tm) with
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.And, cs) -> begin
cs
end
| uu____545 -> begin
(t)::[]
end))
in (

let is_guard_free = (fun tm -> (match (tm.FStar_SMTEncoding_Term.tm) with
| FStar_SMTEncoding_Term.Quant (FStar_SMTEncoding_Term.Forall, (({FStar_SMTEncoding_Term.tm = FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Var ("Prims.guard_free"), (p)::[]); FStar_SMTEncoding_Term.freevars = uu____555; FStar_SMTEncoding_Term.rng = uu____556})::[])::[], iopt, uu____558, {FStar_SMTEncoding_Term.tm = FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Imp, (l)::(r1)::[]); FStar_SMTEncoding_Term.freevars = uu____561; FStar_SMTEncoding_Term.rng = uu____562}) -> begin
true
end
| uu____611 -> begin
false
end))
in (

let is_a_named_continuation = (fun lhs -> (FStar_All.pipe_right (conjuncts lhs) (FStar_Util.for_some is_guard_free)))
in (

let uu____623 = (match (use_env_msg) with
| FStar_Pervasives_Native.None -> begin
((false), (""))
end
| FStar_Pervasives_Native.Some (f) -> begin
(

let uu____653 = (f ())
in ((true), (uu____653)))
end)
in (match (uu____623) with
| (flag, msg_prefix) -> begin
(

let fresh_label1 = (fun msg ropt rng t -> (

let msg1 = (match (flag) with
| true -> begin
(Prims.strcat "Failed to verify implicit argument: " (Prims.strcat msg_prefix (Prims.strcat " :: " msg)))
end
| uu____705 -> begin
msg
end)
in (

let rng1 = (match (ropt) with
| FStar_Pervasives_Native.None -> begin
rng
end
| FStar_Pervasives_Native.Some (r1) -> begin
(

let uu____709 = (

let uu____711 = (FStar_Range.use_range rng)
in (

let uu____712 = (FStar_Range.use_range r1)
in (FStar_Range.rng_included uu____711 uu____712)))
in (match (uu____709) with
| true -> begin
rng
end
| uu____714 -> begin
(

let uu____716 = (FStar_Range.def_range rng)
in (FStar_Range.set_def_range r1 uu____716))
end))
end)
in (fresh_label msg1 rng1 t))))
in (

let rec aux = (fun default_msg ropt post_name_opt labels q1 -> (match (q1.FStar_SMTEncoding_Term.tm) with
| FStar_SMTEncoding_Term.BoundV (uu____771) -> begin
((labels), (q1))
end
| FStar_SMTEncoding_Term.Integer (uu____775) -> begin
((labels), (q1))
end
| FStar_SMTEncoding_Term.LblPos (uu____779) -> begin
(failwith "Impossible")
end
| FStar_SMTEncoding_Term.Labeled (arg, "could not prove post-condition", uu____793) -> begin
(

let fallback = (fun msg -> (aux default_msg ropt post_name_opt labels arg))
in (FStar_All.try_with (fun uu___273_839 -> (match (()) with
| () -> begin
(match (arg.FStar_SMTEncoding_Term.tm) with
| FStar_SMTEncoding_Term.Quant (FStar_SMTEncoding_Term.Forall, pats, iopt, (post)::sorts, {FStar_SMTEncoding_Term.tm = FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Imp, (lhs)::(rhs)::[]); FStar_SMTEncoding_Term.freevars = uu____858; FStar_SMTEncoding_Term.rng = rng}) -> begin
(

let post_name = (

let uu____894 = (

let uu____896 = (FStar_Syntax_Syntax.next_id ())
in (FStar_All.pipe_left FStar_Util.string_of_int uu____896))
in (Prims.strcat "^^post_condition_" uu____894))
in (

let names1 = (

let uu____904 = (FStar_SMTEncoding_Term.mk_fv ((post_name), (post)))
in (

let uu____906 = (FStar_List.map (fun s -> (

let uu____912 = (

let uu____918 = (

let uu____920 = (

let uu____922 = (FStar_Syntax_Syntax.next_id ())
in (FStar_All.pipe_left FStar_Util.string_of_int uu____922))
in (Prims.strcat "^^" uu____920))
in ((uu____918), (s)))
in (FStar_SMTEncoding_Term.mk_fv uu____912))) sorts)
in (uu____904)::uu____906))
in (

let instantiation = (FStar_List.map FStar_SMTEncoding_Util.mkFreeV names1)
in (

let uu____931 = (

let uu____936 = (FStar_SMTEncoding_Term.inst instantiation lhs)
in (

let uu____937 = (FStar_SMTEncoding_Term.inst instantiation rhs)
in ((uu____936), (uu____937))))
in (match (uu____931) with
| (lhs1, rhs1) -> begin
(

let uu____946 = (match (lhs1.FStar_SMTEncoding_Term.tm) with
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.And, clauses_lhs) -> begin
(

let uu____964 = (FStar_Util.prefix clauses_lhs)
in (match (uu____964) with
| (req, ens) -> begin
(match (ens.FStar_SMTEncoding_Term.tm) with
| FStar_SMTEncoding_Term.Quant (FStar_SMTEncoding_Term.Forall, pats_ens, iopt_ens, sorts_ens, {FStar_SMTEncoding_Term.tm = FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Imp, (ensures_conjuncts)::(post1)::[]); FStar_SMTEncoding_Term.freevars = uu____994; FStar_SMTEncoding_Term.rng = rng_ens}) -> begin
(

let uu____1028 = (is_a_post_condition (FStar_Pervasives_Native.Some (post_name)) post1)
in (match (uu____1028) with
| true -> begin
(

let uu____1038 = (aux "could not prove post-condition" FStar_Pervasives_Native.None (FStar_Pervasives_Native.Some (post_name)) labels ensures_conjuncts)
in (match (uu____1038) with
| (labels1, ensures_conjuncts1) -> begin
(

let pats_ens1 = (match (pats_ens) with
| [] -> begin
((post1)::[])::[]
end
| ([])::[] -> begin
((post1)::[])::[]
end
| uu____1082 -> begin
pats_ens
end)
in (

let ens1 = (

let uu____1088 = (

let uu____1089 = (

let uu____1109 = (FStar_SMTEncoding_Term.mk (FStar_SMTEncoding_Term.App (((FStar_SMTEncoding_Term.Imp), ((ensures_conjuncts1)::(post1)::[])))) rng_ens)
in ((FStar_SMTEncoding_Term.Forall), (pats_ens1), (iopt_ens), (sorts_ens), (uu____1109)))
in FStar_SMTEncoding_Term.Quant (uu____1089))
in (FStar_SMTEncoding_Term.mk uu____1088 ens.FStar_SMTEncoding_Term.rng))
in (

let lhs2 = (FStar_SMTEncoding_Term.mk (FStar_SMTEncoding_Term.App (((FStar_SMTEncoding_Term.And), ((FStar_List.append req ((ens1)::[])))))) lhs1.FStar_SMTEncoding_Term.rng)
in (

let uu____1124 = (FStar_SMTEncoding_Term.abstr names1 lhs2)
in ((labels1), (uu____1124))))))
end))
end
| uu____1127 -> begin
(

let uu____1129 = (

let uu____1130 = (

let uu____1132 = (

let uu____1134 = (

let uu____1136 = (FStar_SMTEncoding_Term.print_smt_term post1)
in (Prims.strcat "  ... " uu____1136))
in (Prims.strcat post_name uu____1134))
in (Prims.strcat "Ensures clause doesn\'t match post name:  " uu____1132))
in Not_a_wp_implication (uu____1130))
in (FStar_Exn.raise uu____1129))
end))
end
| uu____1146 -> begin
(

let uu____1147 = (

let uu____1148 = (

let uu____1150 = (

let uu____1152 = (

let uu____1154 = (FStar_SMTEncoding_Term.print_smt_term ens)
in (Prims.strcat "  ... " uu____1154))
in (Prims.strcat post_name uu____1152))
in (Prims.strcat "Ensures clause doesn\'t have the expected shape for post-condition " uu____1150))
in Not_a_wp_implication (uu____1148))
in (FStar_Exn.raise uu____1147))
end)
end))
end
| uu____1164 -> begin
(

let uu____1165 = (

let uu____1166 = (

let uu____1168 = (FStar_SMTEncoding_Term.print_smt_term lhs1)
in (Prims.strcat "LHS not a conjunct: " uu____1168))
in Not_a_wp_implication (uu____1166))
in (FStar_Exn.raise uu____1165))
end)
in (match (uu____946) with
| (labels1, lhs2) -> begin
(

let uu____1189 = (

let uu____1196 = (aux default_msg FStar_Pervasives_Native.None (FStar_Pervasives_Native.Some (post_name)) labels1 rhs1)
in (match (uu____1196) with
| (labels2, rhs2) -> begin
(

let uu____1216 = (FStar_SMTEncoding_Term.abstr names1 rhs2)
in ((labels2), (uu____1216)))
end))
in (match (uu____1189) with
| (labels2, rhs2) -> begin
(

let body = (FStar_SMTEncoding_Term.mkImp ((lhs2), (rhs2)) rng)
in (

let uu____1232 = (FStar_SMTEncoding_Term.mk (FStar_SMTEncoding_Term.Quant (((FStar_SMTEncoding_Term.Forall), (pats), (iopt), ((post)::sorts), (body)))) q1.FStar_SMTEncoding_Term.rng)
in ((labels2), (uu____1232))))
end))
end))
end)))))
end
| uu____1244 -> begin
(

let uu____1245 = (

let uu____1247 = (FStar_SMTEncoding_Term.print_smt_term arg)
in (Prims.strcat "arg not a quant: " uu____1247))
in (fallback uu____1245))
end)
end)) (fun uu___272_1252 -> (match (uu___272_1252) with
| Not_a_wp_implication (msg) -> begin
(fallback msg)
end))))
end
| FStar_SMTEncoding_Term.Labeled (arg, reason, r1) -> begin
(aux reason (FStar_Pervasives_Native.Some (r1)) post_name_opt labels arg)
end
| FStar_SMTEncoding_Term.Quant (FStar_SMTEncoding_Term.Forall, [], FStar_Pervasives_Native.None, sorts, {FStar_SMTEncoding_Term.tm = FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Imp, (lhs)::(rhs)::[]); FStar_SMTEncoding_Term.freevars = uu____1269; FStar_SMTEncoding_Term.rng = rng}) when (is_a_named_continuation lhs) -> begin
(

let uu____1299 = (FStar_Util.prefix sorts)
in (match (uu____1299) with
| (sorts', post) -> begin
(

let new_post_name = (

let uu____1320 = (

let uu____1322 = (FStar_Syntax_Syntax.next_id ())
in (FStar_All.pipe_left FStar_Util.string_of_int uu____1322))
in (Prims.strcat "^^post_condition_" uu____1320))
in (

let names1 = (

let uu____1330 = (FStar_List.map (fun s -> (

let uu____1336 = (

let uu____1342 = (

let uu____1344 = (

let uu____1346 = (FStar_Syntax_Syntax.next_id ())
in (FStar_All.pipe_left FStar_Util.string_of_int uu____1346))
in (Prims.strcat "^^" uu____1344))
in ((uu____1342), (s)))
in (FStar_SMTEncoding_Term.mk_fv uu____1336))) sorts')
in (

let uu____1352 = (

let uu____1355 = (FStar_SMTEncoding_Term.mk_fv ((new_post_name), (post)))
in (uu____1355)::[])
in (FStar_List.append uu____1330 uu____1352)))
in (

let instantiation = (FStar_List.map FStar_SMTEncoding_Util.mkFreeV names1)
in (

let uu____1360 = (

let uu____1365 = (FStar_SMTEncoding_Term.inst instantiation lhs)
in (

let uu____1366 = (FStar_SMTEncoding_Term.inst instantiation rhs)
in ((uu____1365), (uu____1366))))
in (match (uu____1360) with
| (lhs1, rhs1) -> begin
(

let uu____1375 = (FStar_Util.fold_map (fun labels1 tm -> (match (tm.FStar_SMTEncoding_Term.tm) with
| FStar_SMTEncoding_Term.Quant (FStar_SMTEncoding_Term.Forall, (({FStar_SMTEncoding_Term.tm = FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Var ("Prims.guard_free"), (p)::[]); FStar_SMTEncoding_Term.freevars = uu____1413; FStar_SMTEncoding_Term.rng = uu____1414})::[])::[], iopt, sorts1, {FStar_SMTEncoding_Term.tm = FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Imp, (l0)::(r1)::[]); FStar_SMTEncoding_Term.freevars = uu____1419; FStar_SMTEncoding_Term.rng = uu____1420}) -> begin
(

let uu____1468 = (is_a_post_condition (FStar_Pervasives_Native.Some (new_post_name)) r1)
in (match (uu____1468) with
| true -> begin
(

let uu____1478 = (aux default_msg FStar_Pervasives_Native.None post_name_opt labels1 l0)
in (match (uu____1478) with
| (labels2, l) -> begin
(

let uu____1497 = (

let uu____1498 = (

let uu____1499 = (

let uu____1519 = (FStar_SMTEncoding_Util.norng FStar_SMTEncoding_Term.mk (FStar_SMTEncoding_Term.App (((FStar_SMTEncoding_Term.Imp), ((l)::(r1)::[])))))
in ((FStar_SMTEncoding_Term.Forall), (((p)::[])::[]), (FStar_Pervasives_Native.Some ((Prims.parse_int "0"))), (sorts1), (uu____1519)))
in FStar_SMTEncoding_Term.Quant (uu____1499))
in (FStar_SMTEncoding_Term.mk uu____1498 q1.FStar_SMTEncoding_Term.rng))
in ((labels2), (uu____1497)))
end))
end
| uu____1539 -> begin
((labels1), (tm))
end))
end
| uu____1543 -> begin
((labels1), (tm))
end)) labels (conjuncts lhs1))
in (match (uu____1375) with
| (labels1, lhs_conjs) -> begin
(

let uu____1562 = (aux default_msg FStar_Pervasives_Native.None (FStar_Pervasives_Native.Some (new_post_name)) labels1 rhs1)
in (match (uu____1562) with
| (labels2, rhs2) -> begin
(

let body = (

let uu____1583 = (

let uu____1584 = (

let uu____1589 = (FStar_SMTEncoding_Term.mk_and_l lhs_conjs lhs1.FStar_SMTEncoding_Term.rng)
in ((uu____1589), (rhs2)))
in (FStar_SMTEncoding_Term.mkImp uu____1584 rng))
in (FStar_All.pipe_right uu____1583 (FStar_SMTEncoding_Term.abstr names1)))
in (

let q2 = (FStar_SMTEncoding_Term.mk (FStar_SMTEncoding_Term.Quant (((FStar_SMTEncoding_Term.Forall), ([]), (FStar_Pervasives_Native.None), (sorts), (body)))) q1.FStar_SMTEncoding_Term.rng)
in ((labels2), (q2))))
end))
end))
end)))))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Imp, (lhs)::(rhs)::[]) -> begin
(

let uu____1609 = (aux default_msg ropt post_name_opt labels rhs)
in (match (uu____1609) with
| (labels1, rhs1) -> begin
(

let uu____1628 = (FStar_SMTEncoding_Util.mkImp ((lhs), (rhs1)))
in ((labels1), (uu____1628)))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.And, conjuncts1) -> begin
(

let uu____1636 = (FStar_Util.fold_map (aux default_msg ropt post_name_opt) labels conjuncts1)
in (match (uu____1636) with
| (labels1, conjuncts2) -> begin
(

let uu____1663 = (FStar_SMTEncoding_Term.mk_and_l conjuncts2 q1.FStar_SMTEncoding_Term.rng)
in ((labels1), (uu____1663)))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.ITE, (hd1)::(q11)::(q2)::[]) -> begin
(

let uu____1671 = (aux default_msg ropt post_name_opt labels q11)
in (match (uu____1671) with
| (labels1, q12) -> begin
(

let uu____1690 = (aux default_msg ropt post_name_opt labels1 q2)
in (match (uu____1690) with
| (labels2, q21) -> begin
(

let uu____1709 = (FStar_SMTEncoding_Term.mkITE ((hd1), (q12), (q21)) q1.FStar_SMTEncoding_Term.rng)
in ((labels2), (uu____1709)))
end))
end))
end
| FStar_SMTEncoding_Term.Quant (FStar_SMTEncoding_Term.Exists, uu____1712, uu____1713, uu____1714, uu____1715) -> begin
(

let uu____1734 = (fresh_label1 default_msg ropt q1.FStar_SMTEncoding_Term.rng q1)
in (match (uu____1734) with
| (lab, q2) -> begin
(((lab)::labels), (q2))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Iff, uu____1749) -> begin
(

let uu____1754 = (fresh_label1 default_msg ropt q1.FStar_SMTEncoding_Term.rng q1)
in (match (uu____1754) with
| (lab, q2) -> begin
(((lab)::labels), (q2))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Or, uu____1769) -> begin
(

let uu____1774 = (fresh_label1 default_msg ropt q1.FStar_SMTEncoding_Term.rng q1)
in (match (uu____1774) with
| (lab, q2) -> begin
(((lab)::labels), (q2))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Var (uu____1789), uu____1790) when (is_a_post_condition post_name_opt q1) -> begin
((labels), (q1))
end
| FStar_SMTEncoding_Term.FreeV (uu____1798) -> begin
(

let uu____1807 = (fresh_label1 default_msg ropt q1.FStar_SMTEncoding_Term.rng q1)
in (match (uu____1807) with
| (lab, q2) -> begin
(((lab)::labels), (q2))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.TrueOp, uu____1822) -> begin
(

let uu____1827 = (fresh_label1 default_msg ropt q1.FStar_SMTEncoding_Term.rng q1)
in (match (uu____1827) with
| (lab, q2) -> begin
(((lab)::labels), (q2))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.FalseOp, uu____1842) -> begin
(

let uu____1847 = (fresh_label1 default_msg ropt q1.FStar_SMTEncoding_Term.rng q1)
in (match (uu____1847) with
| (lab, q2) -> begin
(((lab)::labels), (q2))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Not, uu____1862) -> begin
(

let uu____1867 = (fresh_label1 default_msg ropt q1.FStar_SMTEncoding_Term.rng q1)
in (match (uu____1867) with
| (lab, q2) -> begin
(((lab)::labels), (q2))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Eq, uu____1882) -> begin
(

let uu____1887 = (fresh_label1 default_msg ropt q1.FStar_SMTEncoding_Term.rng q1)
in (match (uu____1887) with
| (lab, q2) -> begin
(((lab)::labels), (q2))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.LT, uu____1902) -> begin
(

let uu____1907 = (fresh_label1 default_msg ropt q1.FStar_SMTEncoding_Term.rng q1)
in (match (uu____1907) with
| (lab, q2) -> begin
(((lab)::labels), (q2))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.LTE, uu____1922) -> begin
(

let uu____1927 = (fresh_label1 default_msg ropt q1.FStar_SMTEncoding_Term.rng q1)
in (match (uu____1927) with
| (lab, q2) -> begin
(((lab)::labels), (q2))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.GT, uu____1942) -> begin
(

let uu____1947 = (fresh_label1 default_msg ropt q1.FStar_SMTEncoding_Term.rng q1)
in (match (uu____1947) with
| (lab, q2) -> begin
(((lab)::labels), (q2))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.GTE, uu____1962) -> begin
(

let uu____1967 = (fresh_label1 default_msg ropt q1.FStar_SMTEncoding_Term.rng q1)
in (match (uu____1967) with
| (lab, q2) -> begin
(((lab)::labels), (q2))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.BvUlt, uu____1982) -> begin
(

let uu____1987 = (fresh_label1 default_msg ropt q1.FStar_SMTEncoding_Term.rng q1)
in (match (uu____1987) with
| (lab, q2) -> begin
(((lab)::labels), (q2))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Var (uu____2002), uu____2003) -> begin
(

let uu____2009 = (fresh_label1 default_msg ropt q1.FStar_SMTEncoding_Term.rng q1)
in (match (uu____2009) with
| (lab, q2) -> begin
(((lab)::labels), (q2))
end))
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Add, uu____2024) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Sub, uu____2036) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Div, uu____2048) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Mul, uu____2060) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Minus, uu____2072) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Mod, uu____2084) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.BvAnd, uu____2096) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.BvXor, uu____2108) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.BvOr, uu____2120) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.BvAdd, uu____2132) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.BvSub, uu____2144) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.BvShl, uu____2156) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.BvShr, uu____2168) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.BvUdiv, uu____2180) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.BvMod, uu____2192) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.BvMul, uu____2204) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.BvUext (uu____2216), uu____2217) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.BvToNat, uu____2230) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.NatToBv (uu____2242), uu____2243) -> begin
(failwith "Impossible: non-propositional term")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.ITE, uu____2256) -> begin
(failwith "Impossible: arity mismatch")
end
| FStar_SMTEncoding_Term.App (FStar_SMTEncoding_Term.Imp, uu____2268) -> begin
(failwith "Impossible: arity mismatch")
end
| FStar_SMTEncoding_Term.Quant (FStar_SMTEncoding_Term.Forall, pats, iopt, sorts, body) -> begin
(

let uu____2302 = (aux default_msg ropt post_name_opt labels body)
in (match (uu____2302) with
| (labels1, body1) -> begin
(

let uu____2321 = (FStar_SMTEncoding_Term.mk (FStar_SMTEncoding_Term.Quant (((FStar_SMTEncoding_Term.Forall), (pats), (iopt), (sorts), (body1)))) q1.FStar_SMTEncoding_Term.rng)
in ((labels1), (uu____2321)))
end))
end
| FStar_SMTEncoding_Term.Let (es, body) -> begin
(

let uu____2339 = (aux default_msg ropt post_name_opt labels body)
in (match (uu____2339) with
| (labels1, body1) -> begin
(

let uu____2358 = (FStar_SMTEncoding_Term.mkLet ((es), (body1)) q1.FStar_SMTEncoding_Term.rng)
in ((labels1), (uu____2358)))
end))
end))
in (aux "assertion failed" FStar_Pervasives_Native.None FStar_Pervasives_Native.None [] q)))
end)))))))


let detail_errors : Prims.bool  ->  FStar_TypeChecker_Env.env  ->  labels  ->  (FStar_SMTEncoding_Term.decls_t  ->  FStar_SMTEncoding_Z3.z3result)  ->  unit = (fun hint_replay env all_labels askZ3 -> (

let print_banner = (fun uu____2398 -> (

let msg = (

let uu____2401 = (

let uu____2403 = (FStar_TypeChecker_Env.get_range env)
in (FStar_Range.string_of_range uu____2403))
in (

let uu____2404 = (FStar_Util.string_of_int (Prims.parse_int "5"))
in (

let uu____2407 = (FStar_Util.string_of_int (FStar_List.length all_labels))
in (FStar_Util.format4 "Detailed %s report follows for %s\nTaking %s seconds per proof obligation (%s proofs in total)\n" (match (hint_replay) with
| true -> begin
"hint replay"
end
| uu____2413 -> begin
"error"
end) uu____2401 uu____2404 uu____2407))))
in (FStar_Util.print_error msg)))
in (

let print_result = (fun uu____2433 -> (match (uu____2433) with
| ((uu____2446, msg, r), success) -> begin
(match (success) with
| true -> begin
(

let uu____2462 = (FStar_Range.string_of_range r)
in (FStar_Util.print1 "OK: proof obligation at %s was proven in isolation\n" uu____2462))
end
| uu____2465 -> begin
(match (hint_replay) with
| true -> begin
(FStar_Errors.log_issue r ((FStar_Errors.Warning_HintFailedToReplayProof), ((Prims.strcat "Hint failed to replay this sub-proof: " msg))))
end
| uu____2470 -> begin
(

let uu____2472 = (

let uu____2478 = (

let uu____2480 = (FStar_Range.string_of_range r)
in (FStar_Util.format2 "XX: proof obligation at %s failed\n\t%s\n" uu____2480 msg))
in ((FStar_Errors.Error_ProofObligationFailed), (uu____2478)))
in (FStar_Errors.log_issue r uu____2472))
end)
end)
end))
in (

let elim = (fun labs -> (FStar_All.pipe_right labs (FStar_List.map (fun uu____2533 -> (match (uu____2533) with
| (l, uu____2542, uu____2543) -> begin
(

let a = (

let uu____2547 = (

let uu____2548 = (

let uu____2553 = (FStar_SMTEncoding_Util.mkFreeV l)
in ((uu____2553), (FStar_SMTEncoding_Util.mkTrue)))
in (FStar_SMTEncoding_Util.mkEq uu____2548))
in (

let uu____2554 = (

let uu____2556 = (FStar_SMTEncoding_Term.fv_name l)
in (Prims.strcat "@disable_label_" uu____2556))
in {FStar_SMTEncoding_Term.assumption_term = uu____2547; FStar_SMTEncoding_Term.assumption_caption = FStar_Pervasives_Native.Some ("Disabling label"); FStar_SMTEncoding_Term.assumption_name = uu____2554; FStar_SMTEncoding_Term.assumption_fact_ids = []}))
in FStar_SMTEncoding_Term.Assume (a))
end)))))
in (

let rec linear_check = (fun eliminated errors active -> ((FStar_SMTEncoding_Z3.refresh ());
(match (active) with
| [] -> begin
(

let results = (

let uu____2626 = (FStar_List.map (fun x -> ((x), (true))) eliminated)
in (

let uu____2643 = (FStar_List.map (fun x -> ((x), (false))) errors)
in (FStar_List.append uu____2626 uu____2643)))
in (sort_labels results))
end
| (hd1)::tl1 -> begin
((

let uu____2670 = (FStar_Util.string_of_int (FStar_List.length active))
in (FStar_Util.print1 "%s, " uu____2670));
(

let decls = (FStar_All.pipe_left elim (FStar_List.append eliminated (FStar_List.append errors tl1)))
in (

let result = (askZ3 decls)
in (match (result.FStar_SMTEncoding_Z3.z3result_status) with
| FStar_SMTEncoding_Z3.UNSAT (uu____2698) -> begin
(linear_check ((hd1)::eliminated) errors tl1)
end
| uu____2699 -> begin
(linear_check eliminated ((hd1)::errors) tl1)
end)));
)
end);
))
in ((print_banner ());
(FStar_Options.set_option "z3rlimit" (FStar_Options.Int ((Prims.parse_int "5"))));
(

let res = (linear_check [] [] all_labels)
in ((FStar_Util.print_string "\n");
(FStar_All.pipe_right res (FStar_List.iter print_result));
(

let uu____2748 = (FStar_Util.for_all FStar_Pervasives_Native.snd res)
in (match (uu____2748) with
| true -> begin
(FStar_Util.print_string "Failed: the heuristic of trying each proof in isolation failed to identify a precise error\n")
end
| uu____2772 -> begin
()
end));
));
))))))




