
open Prims
open FStar_Pervasives

let tts_f : (FStar_Syntax_Syntax.term  ->  Prims.string) FStar_Pervasives_Native.option FStar_ST.ref = (FStar_Util.mk_ref FStar_Pervasives_Native.None)


let tts : FStar_Syntax_Syntax.term  ->  Prims.string = (fun t -> (

let uu____38 = (FStar_ST.op_Bang tts_f)
in (match (uu____38) with
| FStar_Pervasives_Native.None -> begin
"<<hook unset>>"
end
| FStar_Pervasives_Native.Some (f) -> begin
(f t)
end)))


let qual_id : FStar_Ident.lident  ->  FStar_Ident.ident  ->  FStar_Ident.lident = (fun lid id1 -> (

let uu____102 = (FStar_Ident.lid_of_ids (FStar_List.append lid.FStar_Ident.ns ((lid.FStar_Ident.ident)::(id1)::[])))
in (FStar_Ident.set_lid_range uu____102 id1.FStar_Ident.idRange)))


let mk_discriminator : FStar_Ident.lident  ->  FStar_Ident.lident = (fun lid -> (

let uu____109 = (

let uu____112 = (

let uu____115 = (FStar_Ident.mk_ident (((Prims.strcat FStar_Ident.reserved_prefix (Prims.strcat "is_" lid.FStar_Ident.ident.FStar_Ident.idText))), (lid.FStar_Ident.ident.FStar_Ident.idRange)))
in (uu____115)::[])
in (FStar_List.append lid.FStar_Ident.ns uu____112))
in (FStar_Ident.lid_of_ids uu____109)))


let is_name : FStar_Ident.lident  ->  Prims.bool = (fun lid -> (

let c = (FStar_Util.char_at lid.FStar_Ident.ident.FStar_Ident.idText (Prims.parse_int "0"))
in (FStar_Util.is_upper c)))


let arg_of_non_null_binder : 'Auu____133 . (FStar_Syntax_Syntax.bv * 'Auu____133)  ->  (FStar_Syntax_Syntax.term * 'Auu____133) = (fun uu____146 -> (match (uu____146) with
| (b, imp) -> begin
(

let uu____153 = (FStar_Syntax_Syntax.bv_to_name b)
in ((uu____153), (imp)))
end))


let args_of_non_null_binders : FStar_Syntax_Syntax.binders  ->  (FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list = (fun binders -> (FStar_All.pipe_right binders (FStar_List.collect (fun b -> (

let uu____205 = (FStar_Syntax_Syntax.is_null_binder b)
in (match (uu____205) with
| true -> begin
[]
end
| uu____222 -> begin
(

let uu____224 = (arg_of_non_null_binder b)
in (uu____224)::[])
end))))))


let args_of_binders : FStar_Syntax_Syntax.binders  ->  (FStar_Syntax_Syntax.binders * FStar_Syntax_Syntax.args) = (fun binders -> (

let uu____259 = (FStar_All.pipe_right binders (FStar_List.map (fun b -> (

let uu____341 = (FStar_Syntax_Syntax.is_null_binder b)
in (match (uu____341) with
| true -> begin
(

let b1 = (

let uu____367 = (FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None (FStar_Pervasives_Native.fst b).FStar_Syntax_Syntax.sort)
in ((uu____367), ((FStar_Pervasives_Native.snd b))))
in (

let uu____374 = (arg_of_non_null_binder b1)
in ((b1), (uu____374))))
end
| uu____395 -> begin
(

let uu____397 = (arg_of_non_null_binder b)
in ((b), (uu____397)))
end)))))
in (FStar_All.pipe_right uu____259 FStar_List.unzip)))


let name_binders : (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list = (fun binders -> (FStar_All.pipe_right binders (FStar_List.mapi (fun i b -> (

let uu____531 = (FStar_Syntax_Syntax.is_null_binder b)
in (match (uu____531) with
| true -> begin
(

let uu____540 = b
in (match (uu____540) with
| (a, imp) -> begin
(

let b1 = (

let uu____560 = (

let uu____562 = (FStar_Util.string_of_int i)
in (Prims.strcat "_" uu____562))
in (FStar_Ident.id_of_text uu____560))
in (

let b2 = {FStar_Syntax_Syntax.ppname = b1; FStar_Syntax_Syntax.index = (Prims.parse_int "0"); FStar_Syntax_Syntax.sort = a.FStar_Syntax_Syntax.sort}
in ((b2), (imp))))
end))
end
| uu____569 -> begin
b
end))))))


let name_function_binders : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t -> (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (binders, comp) -> begin
(

let uu____607 = (

let uu____614 = (

let uu____615 = (

let uu____630 = (name_binders binders)
in ((uu____630), (comp)))
in FStar_Syntax_Syntax.Tm_arrow (uu____615))
in (FStar_Syntax_Syntax.mk uu____614))
in (uu____607 FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos))
end
| uu____652 -> begin
t
end))


let null_binders_of_tks : (FStar_Syntax_Syntax.typ * FStar_Syntax_Syntax.aqual) Prims.list  ->  FStar_Syntax_Syntax.binders = (fun tks -> (FStar_All.pipe_right tks (FStar_List.map (fun uu____689 -> (match (uu____689) with
| (t, imp) -> begin
(

let uu____700 = (

let uu____701 = (FStar_Syntax_Syntax.null_binder t)
in (FStar_All.pipe_left FStar_Pervasives_Native.fst uu____701))
in ((uu____700), (imp)))
end)))))


let binders_of_tks : (FStar_Syntax_Syntax.typ * FStar_Syntax_Syntax.aqual) Prims.list  ->  FStar_Syntax_Syntax.binders = (fun tks -> (FStar_All.pipe_right tks (FStar_List.map (fun uu____756 -> (match (uu____756) with
| (t, imp) -> begin
(

let uu____773 = (FStar_Syntax_Syntax.new_bv (FStar_Pervasives_Native.Some (t.FStar_Syntax_Syntax.pos)) t)
in ((uu____773), (imp)))
end)))))


let binders_of_freevars : FStar_Syntax_Syntax.bv FStar_Util.set  ->  FStar_Syntax_Syntax.binder Prims.list = (fun fvs -> (

let uu____786 = (FStar_Util.set_elements fvs)
in (FStar_All.pipe_right uu____786 (FStar_List.map FStar_Syntax_Syntax.mk_binder))))


let mk_subst : 'Auu____798 . 'Auu____798  ->  'Auu____798 Prims.list = (fun s -> (s)::[])


let subst_of_list : FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.args  ->  FStar_Syntax_Syntax.subst_t = (fun formals actuals -> (match ((Prims.op_Equality (FStar_List.length formals) (FStar_List.length actuals))) with
| true -> begin
(FStar_List.fold_right2 (fun f a out -> (FStar_Syntax_Syntax.NT ((((FStar_Pervasives_Native.fst f)), ((FStar_Pervasives_Native.fst a)))))::out) formals actuals [])
end
| uu____878 -> begin
(failwith "Ill-formed substitution")
end))


let rename_binders : FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.subst_t = (fun replace_xs with_ys -> (match ((Prims.op_Equality (FStar_List.length replace_xs) (FStar_List.length with_ys))) with
| true -> begin
(FStar_List.map2 (fun uu____924 uu____925 -> (match (((uu____924), (uu____925))) with
| ((x, uu____951), (y, uu____953)) -> begin
(

let uu____974 = (

let uu____981 = (FStar_Syntax_Syntax.bv_to_name y)
in ((x), (uu____981)))
in FStar_Syntax_Syntax.NT (uu____974))
end)) replace_xs with_ys)
end
| uu____986 -> begin
(failwith "Ill-formed substitution")
end))


let rec unmeta : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun e -> (

let e1 = (FStar_Syntax_Subst.compress e)
in (match (e1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_meta (e2, uu____997) -> begin
(unmeta e2)
end
| FStar_Syntax_Syntax.Tm_ascribed (e2, uu____1003, uu____1004) -> begin
(unmeta e2)
end
| uu____1045 -> begin
e1
end)))


let rec unmeta_safe : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun e -> (

let e1 = (FStar_Syntax_Subst.compress e)
in (match (e1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_meta (e', m) -> begin
(match (m) with
| FStar_Syntax_Syntax.Meta_monadic (uu____1059) -> begin
e1
end
| FStar_Syntax_Syntax.Meta_monadic_lift (uu____1066) -> begin
e1
end
| uu____1075 -> begin
(unmeta_safe e')
end)
end
| FStar_Syntax_Syntax.Tm_ascribed (e2, uu____1077, uu____1078) -> begin
(unmeta_safe e2)
end
| uu____1119 -> begin
e1
end)))


let rec univ_kernel : FStar_Syntax_Syntax.universe  ->  (FStar_Syntax_Syntax.universe * Prims.int) = (fun u -> (match (u) with
| FStar_Syntax_Syntax.U_unknown -> begin
((u), ((Prims.parse_int "0")))
end
| FStar_Syntax_Syntax.U_name (uu____1138) -> begin
((u), ((Prims.parse_int "0")))
end
| FStar_Syntax_Syntax.U_unif (uu____1141) -> begin
((u), ((Prims.parse_int "0")))
end
| FStar_Syntax_Syntax.U_zero -> begin
((u), ((Prims.parse_int "0")))
end
| FStar_Syntax_Syntax.U_succ (u1) -> begin
(

let uu____1155 = (univ_kernel u1)
in (match (uu____1155) with
| (k, n1) -> begin
((k), ((n1 + (Prims.parse_int "1"))))
end))
end
| FStar_Syntax_Syntax.U_max (uu____1172) -> begin
(failwith "Imposible: univ_kernel (U_max _)")
end
| FStar_Syntax_Syntax.U_bvar (uu____1181) -> begin
(failwith "Imposible: univ_kernel (U_bvar _)")
end))


let constant_univ_as_nat : FStar_Syntax_Syntax.universe  ->  Prims.int = (fun u -> (

let uu____1196 = (univ_kernel u)
in (FStar_Pervasives_Native.snd uu____1196)))


let rec compare_univs : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.universe  ->  Prims.int = (fun u1 u2 -> (match (((u1), (u2))) with
| (FStar_Syntax_Syntax.U_bvar (uu____1216), uu____1217) -> begin
(failwith "Impossible: compare_univs")
end
| (uu____1221, FStar_Syntax_Syntax.U_bvar (uu____1222)) -> begin
(failwith "Impossible: compare_univs")
end
| (FStar_Syntax_Syntax.U_unknown, FStar_Syntax_Syntax.U_unknown) -> begin
(Prims.parse_int "0")
end
| (FStar_Syntax_Syntax.U_unknown, uu____1227) -> begin
(~- ((Prims.parse_int "1")))
end
| (uu____1229, FStar_Syntax_Syntax.U_unknown) -> begin
(Prims.parse_int "1")
end
| (FStar_Syntax_Syntax.U_zero, FStar_Syntax_Syntax.U_zero) -> begin
(Prims.parse_int "0")
end
| (FStar_Syntax_Syntax.U_zero, uu____1232) -> begin
(~- ((Prims.parse_int "1")))
end
| (uu____1234, FStar_Syntax_Syntax.U_zero) -> begin
(Prims.parse_int "1")
end
| (FStar_Syntax_Syntax.U_name (u11), FStar_Syntax_Syntax.U_name (u21)) -> begin
(FStar_String.compare u11.FStar_Ident.idText u21.FStar_Ident.idText)
end
| (FStar_Syntax_Syntax.U_name (uu____1238), FStar_Syntax_Syntax.U_unif (uu____1239)) -> begin
(~- ((Prims.parse_int "1")))
end
| (FStar_Syntax_Syntax.U_unif (uu____1249), FStar_Syntax_Syntax.U_name (uu____1250)) -> begin
(Prims.parse_int "1")
end
| (FStar_Syntax_Syntax.U_unif (u11), FStar_Syntax_Syntax.U_unif (u21)) -> begin
(

let uu____1278 = (FStar_Syntax_Unionfind.univ_uvar_id u11)
in (

let uu____1280 = (FStar_Syntax_Unionfind.univ_uvar_id u21)
in (uu____1278 - uu____1280)))
end
| (FStar_Syntax_Syntax.U_max (us1), FStar_Syntax_Syntax.U_max (us2)) -> begin
(

let n1 = (FStar_List.length us1)
in (

let n2 = (FStar_List.length us2)
in (match ((Prims.op_disEquality n1 n2)) with
| true -> begin
(n1 - n2)
end
| uu____1310 -> begin
(

let copt = (

let uu____1316 = (FStar_List.zip us1 us2)
in (FStar_Util.find_map uu____1316 (fun uu____1332 -> (match (uu____1332) with
| (u11, u21) -> begin
(

let c = (compare_univs u11 u21)
in (match ((Prims.op_disEquality c (Prims.parse_int "0"))) with
| true -> begin
FStar_Pervasives_Native.Some (c)
end
| uu____1351 -> begin
FStar_Pervasives_Native.None
end))
end))))
in (match (copt) with
| FStar_Pervasives_Native.None -> begin
(Prims.parse_int "0")
end
| FStar_Pervasives_Native.Some (c) -> begin
c
end))
end)))
end
| (FStar_Syntax_Syntax.U_max (uu____1360), uu____1361) -> begin
(~- ((Prims.parse_int "1")))
end
| (uu____1365, FStar_Syntax_Syntax.U_max (uu____1366)) -> begin
(Prims.parse_int "1")
end
| uu____1370 -> begin
(

let uu____1375 = (univ_kernel u1)
in (match (uu____1375) with
| (k1, n1) -> begin
(

let uu____1386 = (univ_kernel u2)
in (match (uu____1386) with
| (k2, n2) -> begin
(

let r = (compare_univs k1 k2)
in (match ((Prims.op_Equality r (Prims.parse_int "0"))) with
| true -> begin
(n1 - n2)
end
| uu____1403 -> begin
r
end))
end))
end))
end))


let eq_univs : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.universe  ->  Prims.bool = (fun u1 u2 -> (

let uu____1417 = (compare_univs u1 u2)
in (Prims.op_Equality uu____1417 (Prims.parse_int "0"))))


let ml_comp : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Range.range  ->  FStar_Syntax_Syntax.comp = (fun t r -> (

let uu____1436 = (

let uu____1437 = (FStar_Ident.set_lid_range FStar_Parser_Const.effect_ML_lid r)
in {FStar_Syntax_Syntax.comp_univs = (FStar_Syntax_Syntax.U_zero)::[]; FStar_Syntax_Syntax.effect_name = uu____1437; FStar_Syntax_Syntax.result_typ = t; FStar_Syntax_Syntax.effect_args = []; FStar_Syntax_Syntax.flags = (FStar_Syntax_Syntax.MLEFFECT)::[]})
in (FStar_Syntax_Syntax.mk_Comp uu____1436)))


let comp_effect_name : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Ident.lident = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (c1) -> begin
c1.FStar_Syntax_Syntax.effect_name
end
| FStar_Syntax_Syntax.Total (uu____1457) -> begin
FStar_Parser_Const.effect_Tot_lid
end
| FStar_Syntax_Syntax.GTotal (uu____1466) -> begin
FStar_Parser_Const.effect_GTot_lid
end))


let comp_flags : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.cflag Prims.list = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (uu____1489) -> begin
(FStar_Syntax_Syntax.TOTAL)::[]
end
| FStar_Syntax_Syntax.GTotal (uu____1498) -> begin
(FStar_Syntax_Syntax.SOMETRIVIAL)::[]
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
ct.FStar_Syntax_Syntax.flags
end))


let comp_to_comp_typ_nouniv : FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp_typ = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (c1) -> begin
c1
end
| FStar_Syntax_Syntax.Total (t, u_opt) -> begin
(

let uu____1525 = (

let uu____1526 = (FStar_Util.map_opt u_opt (fun x -> (x)::[]))
in (FStar_Util.dflt [] uu____1526))
in {FStar_Syntax_Syntax.comp_univs = uu____1525; FStar_Syntax_Syntax.effect_name = (comp_effect_name c); FStar_Syntax_Syntax.result_typ = t; FStar_Syntax_Syntax.effect_args = []; FStar_Syntax_Syntax.flags = (comp_flags c)})
end
| FStar_Syntax_Syntax.GTotal (t, u_opt) -> begin
(

let uu____1555 = (

let uu____1556 = (FStar_Util.map_opt u_opt (fun x -> (x)::[]))
in (FStar_Util.dflt [] uu____1556))
in {FStar_Syntax_Syntax.comp_univs = uu____1555; FStar_Syntax_Syntax.effect_name = (comp_effect_name c); FStar_Syntax_Syntax.result_typ = t; FStar_Syntax_Syntax.effect_args = []; FStar_Syntax_Syntax.flags = (comp_flags c)})
end))


let comp_set_flags : FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.cflag Prims.list  ->  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax = (fun c f -> (

let uu___126_1592 = c
in (

let uu____1593 = (

let uu____1594 = (

let uu___127_1595 = (comp_to_comp_typ_nouniv c)
in {FStar_Syntax_Syntax.comp_univs = uu___127_1595.FStar_Syntax_Syntax.comp_univs; FStar_Syntax_Syntax.effect_name = uu___127_1595.FStar_Syntax_Syntax.effect_name; FStar_Syntax_Syntax.result_typ = uu___127_1595.FStar_Syntax_Syntax.result_typ; FStar_Syntax_Syntax.effect_args = uu___127_1595.FStar_Syntax_Syntax.effect_args; FStar_Syntax_Syntax.flags = f})
in FStar_Syntax_Syntax.Comp (uu____1594))
in {FStar_Syntax_Syntax.n = uu____1593; FStar_Syntax_Syntax.pos = uu___126_1592.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___126_1592.FStar_Syntax_Syntax.vars})))


let lcomp_set_flags : FStar_Syntax_Syntax.lcomp  ->  FStar_Syntax_Syntax.cflag Prims.list  ->  FStar_Syntax_Syntax.lcomp = (fun lc fs -> (

let comp_typ_set_flags = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (uu____1621) -> begin
c
end
| FStar_Syntax_Syntax.GTotal (uu____1630) -> begin
c
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
(

let ct1 = (

let uu___128_1641 = ct
in {FStar_Syntax_Syntax.comp_univs = uu___128_1641.FStar_Syntax_Syntax.comp_univs; FStar_Syntax_Syntax.effect_name = uu___128_1641.FStar_Syntax_Syntax.effect_name; FStar_Syntax_Syntax.result_typ = uu___128_1641.FStar_Syntax_Syntax.result_typ; FStar_Syntax_Syntax.effect_args = uu___128_1641.FStar_Syntax_Syntax.effect_args; FStar_Syntax_Syntax.flags = fs})
in (

let uu___129_1642 = c
in {FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Comp (ct1); FStar_Syntax_Syntax.pos = uu___129_1642.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = uu___129_1642.FStar_Syntax_Syntax.vars}))
end))
in (FStar_Syntax_Syntax.mk_lcomp lc.FStar_Syntax_Syntax.eff_name lc.FStar_Syntax_Syntax.res_typ fs (fun uu____1645 -> (

let uu____1646 = (FStar_Syntax_Syntax.lcomp_comp lc)
in (comp_typ_set_flags uu____1646))))))


let comp_to_comp_typ : FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.comp_typ = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (c1) -> begin
c1
end
| FStar_Syntax_Syntax.Total (t, FStar_Pervasives_Native.Some (u)) -> begin
{FStar_Syntax_Syntax.comp_univs = (u)::[]; FStar_Syntax_Syntax.effect_name = (comp_effect_name c); FStar_Syntax_Syntax.result_typ = t; FStar_Syntax_Syntax.effect_args = []; FStar_Syntax_Syntax.flags = (comp_flags c)}
end
| FStar_Syntax_Syntax.GTotal (t, FStar_Pervasives_Native.Some (u)) -> begin
{FStar_Syntax_Syntax.comp_univs = (u)::[]; FStar_Syntax_Syntax.effect_name = (comp_effect_name c); FStar_Syntax_Syntax.result_typ = t; FStar_Syntax_Syntax.effect_args = []; FStar_Syntax_Syntax.flags = (comp_flags c)}
end
| uu____1686 -> begin
(failwith "Assertion failed: Computation type without universe")
end))


let is_named_tot : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (c1) -> begin
(FStar_Ident.lid_equals c1.FStar_Syntax_Syntax.effect_name FStar_Parser_Const.effect_Tot_lid)
end
| FStar_Syntax_Syntax.Total (uu____1701) -> begin
true
end
| FStar_Syntax_Syntax.GTotal (uu____1711) -> begin
false
end))


let is_total_comp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> ((FStar_Ident.lid_equals (comp_effect_name c) FStar_Parser_Const.effect_Tot_lid) || (FStar_All.pipe_right (comp_flags c) (FStar_Util.for_some (fun uu___113_1736 -> (match (uu___113_1736) with
| FStar_Syntax_Syntax.TOTAL -> begin
true
end
| FStar_Syntax_Syntax.RETURN -> begin
true
end
| uu____1740 -> begin
false
end))))))


let is_total_lcomp : FStar_Syntax_Syntax.lcomp  ->  Prims.bool = (fun c -> ((FStar_Ident.lid_equals c.FStar_Syntax_Syntax.eff_name FStar_Parser_Const.effect_Tot_lid) || (FStar_All.pipe_right c.FStar_Syntax_Syntax.cflags (FStar_Util.for_some (fun uu___114_1753 -> (match (uu___114_1753) with
| FStar_Syntax_Syntax.TOTAL -> begin
true
end
| FStar_Syntax_Syntax.RETURN -> begin
true
end
| uu____1757 -> begin
false
end))))))


let is_tot_or_gtot_lcomp : FStar_Syntax_Syntax.lcomp  ->  Prims.bool = (fun c -> (((FStar_Ident.lid_equals c.FStar_Syntax_Syntax.eff_name FStar_Parser_Const.effect_Tot_lid) || (FStar_Ident.lid_equals c.FStar_Syntax_Syntax.eff_name FStar_Parser_Const.effect_GTot_lid)) || (FStar_All.pipe_right c.FStar_Syntax_Syntax.cflags (FStar_Util.for_some (fun uu___115_1770 -> (match (uu___115_1770) with
| FStar_Syntax_Syntax.TOTAL -> begin
true
end
| FStar_Syntax_Syntax.RETURN -> begin
true
end
| uu____1774 -> begin
false
end))))))


let is_partial_return : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> (FStar_All.pipe_right (comp_flags c) (FStar_Util.for_some (fun uu___116_1791 -> (match (uu___116_1791) with
| FStar_Syntax_Syntax.RETURN -> begin
true
end
| FStar_Syntax_Syntax.PARTIAL_RETURN -> begin
true
end
| uu____1795 -> begin
false
end)))))


let is_lcomp_partial_return : FStar_Syntax_Syntax.lcomp  ->  Prims.bool = (fun c -> (FStar_All.pipe_right c.FStar_Syntax_Syntax.cflags (FStar_Util.for_some (fun uu___117_1808 -> (match (uu___117_1808) with
| FStar_Syntax_Syntax.RETURN -> begin
true
end
| FStar_Syntax_Syntax.PARTIAL_RETURN -> begin
true
end
| uu____1812 -> begin
false
end)))))


let is_tot_or_gtot_comp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> ((is_total_comp c) || (FStar_Ident.lid_equals FStar_Parser_Const.effect_GTot_lid (comp_effect_name c))))


let is_pure_effect : FStar_Ident.lident  ->  Prims.bool = (fun l -> (((FStar_Ident.lid_equals l FStar_Parser_Const.effect_Tot_lid) || (FStar_Ident.lid_equals l FStar_Parser_Const.effect_PURE_lid)) || (FStar_Ident.lid_equals l FStar_Parser_Const.effect_Pure_lid)))


let is_pure_comp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (uu____1844) -> begin
true
end
| FStar_Syntax_Syntax.GTotal (uu____1854) -> begin
false
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
(((is_total_comp c) || (is_pure_effect ct.FStar_Syntax_Syntax.effect_name)) || (FStar_All.pipe_right ct.FStar_Syntax_Syntax.flags (FStar_Util.for_some (fun uu___118_1869 -> (match (uu___118_1869) with
| FStar_Syntax_Syntax.LEMMA -> begin
true
end
| uu____1872 -> begin
false
end)))))
end))


let is_ghost_effect : FStar_Ident.lident  ->  Prims.bool = (fun l -> (((FStar_Ident.lid_equals FStar_Parser_Const.effect_GTot_lid l) || (FStar_Ident.lid_equals FStar_Parser_Const.effect_GHOST_lid l)) || (FStar_Ident.lid_equals FStar_Parser_Const.effect_Ghost_lid l)))


let is_div_effect : FStar_Ident.lident  ->  Prims.bool = (fun l -> (((FStar_Ident.lid_equals l FStar_Parser_Const.effect_DIV_lid) || (FStar_Ident.lid_equals l FStar_Parser_Const.effect_Div_lid)) || (FStar_Ident.lid_equals l FStar_Parser_Const.effect_Dv_lid)))


let is_pure_or_ghost_comp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> ((is_pure_comp c) || (is_ghost_effect (comp_effect_name c))))


let is_pure_or_ghost_effect : FStar_Ident.lident  ->  Prims.bool = (fun l -> ((is_pure_effect l) || (is_ghost_effect l)))


let is_pure_lcomp : FStar_Syntax_Syntax.lcomp  ->  Prims.bool = (fun lc -> (((is_total_lcomp lc) || (is_pure_effect lc.FStar_Syntax_Syntax.eff_name)) || (FStar_All.pipe_right lc.FStar_Syntax_Syntax.cflags (FStar_Util.for_some (fun uu___119_1917 -> (match (uu___119_1917) with
| FStar_Syntax_Syntax.LEMMA -> begin
true
end
| uu____1920 -> begin
false
end))))))


let is_pure_or_ghost_lcomp : FStar_Syntax_Syntax.lcomp  ->  Prims.bool = (fun lc -> ((is_pure_lcomp lc) || (is_ghost_effect lc.FStar_Syntax_Syntax.eff_name)))


let is_pure_or_ghost_function : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____1936 = (

let uu____1937 = (FStar_Syntax_Subst.compress t)
in uu____1937.FStar_Syntax_Syntax.n)
in (match (uu____1936) with
| FStar_Syntax_Syntax.Tm_arrow (uu____1941, c) -> begin
(is_pure_or_ghost_comp c)
end
| uu____1963 -> begin
true
end)))


let is_lemma_comp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (ct) -> begin
(FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name FStar_Parser_Const.effect_Lemma_lid)
end
| uu____1978 -> begin
false
end))


let is_lemma : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____1987 = (

let uu____1988 = (FStar_Syntax_Subst.compress t)
in uu____1988.FStar_Syntax_Syntax.n)
in (match (uu____1987) with
| FStar_Syntax_Syntax.Tm_arrow (uu____1992, c) -> begin
(is_lemma_comp c)
end
| uu____2014 -> begin
false
end)))


let rec head_of : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun t -> (

let uu____2022 = (

let uu____2023 = (FStar_Syntax_Subst.compress t)
in uu____2023.FStar_Syntax_Syntax.n)
in (match (uu____2022) with
| FStar_Syntax_Syntax.Tm_app (t1, uu____2027) -> begin
(head_of t1)
end
| FStar_Syntax_Syntax.Tm_match (t1, uu____2053) -> begin
(head_of t1)
end
| FStar_Syntax_Syntax.Tm_abs (uu____2090, t1, uu____2092) -> begin
(head_of t1)
end
| FStar_Syntax_Syntax.Tm_ascribed (t1, uu____2118, uu____2119) -> begin
(head_of t1)
end
| FStar_Syntax_Syntax.Tm_meta (t1, uu____2161) -> begin
(head_of t1)
end
| uu____2166 -> begin
t
end)))


let head_and_args : FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list) = (fun t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_app (head1, args) -> begin
((head1), (args))
end
| uu____2244 -> begin
((t1), ([]))
end)))


let rec head_and_args' : FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.term * (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list) = (fun t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_app (head1, args) -> begin
(

let uu____2326 = (head_and_args' head1)
in (match (uu____2326) with
| (head2, args') -> begin
((head2), ((FStar_List.append args' args)))
end))
end
| uu____2395 -> begin
((t1), ([]))
end)))


let un_uinst : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_uinst (t2, uu____2422) -> begin
(FStar_Syntax_Subst.compress t2)
end
| uu____2427 -> begin
t1
end)))


let is_smt_lemma : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____2435 = (

let uu____2436 = (FStar_Syntax_Subst.compress t)
in uu____2436.FStar_Syntax_Syntax.n)
in (match (uu____2435) with
| FStar_Syntax_Syntax.Tm_arrow (uu____2440, c) -> begin
(match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (ct) when (FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name FStar_Parser_Const.effect_Lemma_lid) -> begin
(match (ct.FStar_Syntax_Syntax.effect_args) with
| (_req)::(_ens)::((pats, uu____2468))::uu____2469 -> begin
(

let pats' = (unmeta pats)
in (

let uu____2529 = (head_and_args pats')
in (match (uu____2529) with
| (head1, uu____2548) -> begin
(

let uu____2573 = (

let uu____2574 = (un_uinst head1)
in uu____2574.FStar_Syntax_Syntax.n)
in (match (uu____2573) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.cons_lid)
end
| uu____2579 -> begin
false
end))
end)))
end
| uu____2581 -> begin
false
end)
end
| uu____2593 -> begin
false
end)
end
| uu____2595 -> begin
false
end)))


let is_ml_comp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Comp (c1) -> begin
((FStar_Ident.lid_equals c1.FStar_Syntax_Syntax.effect_name FStar_Parser_Const.effect_ML_lid) || (FStar_All.pipe_right c1.FStar_Syntax_Syntax.flags (FStar_Util.for_some (fun uu___120_2614 -> (match (uu___120_2614) with
| FStar_Syntax_Syntax.MLEFFECT -> begin
true
end
| uu____2617 -> begin
false
end)))))
end
| uu____2619 -> begin
false
end))


let comp_result : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (t, uu____2636) -> begin
t
end
| FStar_Syntax_Syntax.GTotal (t, uu____2646) -> begin
t
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
ct.FStar_Syntax_Syntax.result_typ
end))


let set_result_typ : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.comp = (fun c t -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (uu____2675) -> begin
(FStar_Syntax_Syntax.mk_Total t)
end
| FStar_Syntax_Syntax.GTotal (uu____2684) -> begin
(FStar_Syntax_Syntax.mk_GTotal t)
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
(FStar_Syntax_Syntax.mk_Comp (

let uu___130_2696 = ct
in {FStar_Syntax_Syntax.comp_univs = uu___130_2696.FStar_Syntax_Syntax.comp_univs; FStar_Syntax_Syntax.effect_name = uu___130_2696.FStar_Syntax_Syntax.effect_name; FStar_Syntax_Syntax.result_typ = t; FStar_Syntax_Syntax.effect_args = uu___130_2696.FStar_Syntax_Syntax.effect_args; FStar_Syntax_Syntax.flags = uu___130_2696.FStar_Syntax_Syntax.flags}))
end))


let set_result_typ_lc : FStar_Syntax_Syntax.lcomp  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.lcomp = (fun lc t -> (FStar_Syntax_Syntax.mk_lcomp lc.FStar_Syntax_Syntax.eff_name t lc.FStar_Syntax_Syntax.cflags (fun uu____2710 -> (

let uu____2711 = (FStar_Syntax_Syntax.lcomp_comp lc)
in (set_result_typ uu____2711 t)))))


let is_trivial_wp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun c -> (FStar_All.pipe_right (comp_flags c) (FStar_Util.for_some (fun uu___121_2729 -> (match (uu___121_2729) with
| FStar_Syntax_Syntax.TOTAL -> begin
true
end
| FStar_Syntax_Syntax.RETURN -> begin
true
end
| uu____2733 -> begin
false
end)))))


let comp_effect_args : FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.args = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (uu____2741) -> begin
[]
end
| FStar_Syntax_Syntax.GTotal (uu____2758) -> begin
[]
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
ct.FStar_Syntax_Syntax.effect_args
end))


let primops : FStar_Ident.lident Prims.list = (FStar_Parser_Const.op_Eq)::(FStar_Parser_Const.op_notEq)::(FStar_Parser_Const.op_LT)::(FStar_Parser_Const.op_LTE)::(FStar_Parser_Const.op_GT)::(FStar_Parser_Const.op_GTE)::(FStar_Parser_Const.op_Subtraction)::(FStar_Parser_Const.op_Minus)::(FStar_Parser_Const.op_Addition_lid)::(FStar_Parser_Const.op_Multiply)::(FStar_Parser_Const.op_Division)::(FStar_Parser_Const.op_Modulus)::(FStar_Parser_Const.op_And)::(FStar_Parser_Const.op_Or)::(FStar_Parser_Const.op_Negation)::[]


let is_primop_lid : FStar_Ident.lident  ->  Prims.bool = (fun l -> (FStar_All.pipe_right primops (FStar_Util.for_some (FStar_Ident.lid_equals l))))


let is_primop : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun f -> (match (f.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(is_primop_lid fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
end
| uu____2802 -> begin
false
end))


let rec unascribe : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun e -> (

let e1 = (FStar_Syntax_Subst.compress e)
in (match (e1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_ascribed (e2, uu____2812, uu____2813) -> begin
(unascribe e2)
end
| uu____2854 -> begin
e1
end)))


let rec ascribe : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  ((FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax, FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax) FStar_Util.either * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option)  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t k -> (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_ascribed (t', uu____2907, uu____2908) -> begin
(ascribe t' k)
end
| uu____2949 -> begin
(FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_ascribed (((t), (k), (FStar_Pervasives_Native.None)))) FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos)
end))


let unfold_lazy : FStar_Syntax_Syntax.lazyinfo  ->  FStar_Syntax_Syntax.term = (fun i -> (

let uu____2976 = (

let uu____2985 = (FStar_ST.op_Bang FStar_Syntax_Syntax.lazy_chooser)
in (FStar_Util.must uu____2985))
in (uu____2976 i.FStar_Syntax_Syntax.lkind i)))


let rec unlazy : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun t -> (

let uu____3041 = (

let uu____3042 = (FStar_Syntax_Subst.compress t)
in uu____3042.FStar_Syntax_Syntax.n)
in (match (uu____3041) with
| FStar_Syntax_Syntax.Tm_lazy (i) -> begin
(

let uu____3046 = (unfold_lazy i)
in (FStar_All.pipe_left unlazy uu____3046))
end
| uu____3047 -> begin
t
end)))


let rec unlazy_emb : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun t -> (

let uu____3054 = (

let uu____3055 = (FStar_Syntax_Subst.compress t)
in uu____3055.FStar_Syntax_Syntax.n)
in (match (uu____3054) with
| FStar_Syntax_Syntax.Tm_lazy (i) -> begin
(match (i.FStar_Syntax_Syntax.lkind) with
| FStar_Syntax_Syntax.Lazy_embedding (uu____3059) -> begin
(

let uu____3068 = (unfold_lazy i)
in (FStar_All.pipe_left unlazy uu____3068))
end
| uu____3069 -> begin
t
end)
end
| uu____3070 -> begin
t
end)))


let eq_lazy_kind : FStar_Syntax_Syntax.lazy_kind  ->  FStar_Syntax_Syntax.lazy_kind  ->  Prims.bool = (fun k k' -> (match (((k), (k'))) with
| (FStar_Syntax_Syntax.BadLazy, FStar_Syntax_Syntax.BadLazy) -> begin
true
end
| (FStar_Syntax_Syntax.Lazy_bv, FStar_Syntax_Syntax.Lazy_bv) -> begin
true
end
| (FStar_Syntax_Syntax.Lazy_binder, FStar_Syntax_Syntax.Lazy_binder) -> begin
true
end
| (FStar_Syntax_Syntax.Lazy_fvar, FStar_Syntax_Syntax.Lazy_fvar) -> begin
true
end
| (FStar_Syntax_Syntax.Lazy_comp, FStar_Syntax_Syntax.Lazy_comp) -> begin
true
end
| (FStar_Syntax_Syntax.Lazy_env, FStar_Syntax_Syntax.Lazy_env) -> begin
true
end
| (FStar_Syntax_Syntax.Lazy_proofstate, FStar_Syntax_Syntax.Lazy_proofstate) -> begin
true
end
| (FStar_Syntax_Syntax.Lazy_goal, FStar_Syntax_Syntax.Lazy_goal) -> begin
true
end
| (FStar_Syntax_Syntax.Lazy_sigelt, FStar_Syntax_Syntax.Lazy_sigelt) -> begin
true
end
| (FStar_Syntax_Syntax.Lazy_uvar, FStar_Syntax_Syntax.Lazy_uvar) -> begin
true
end
| uu____3094 -> begin
false
end))


let rec unlazy_as_t : 'Auu____3107 . FStar_Syntax_Syntax.lazy_kind  ->  FStar_Syntax_Syntax.term  ->  'Auu____3107 = (fun k t -> (

let uu____3118 = (

let uu____3119 = (FStar_Syntax_Subst.compress t)
in uu____3119.FStar_Syntax_Syntax.n)
in (match (uu____3118) with
| FStar_Syntax_Syntax.Tm_lazy ({FStar_Syntax_Syntax.blob = v1; FStar_Syntax_Syntax.lkind = k'; FStar_Syntax_Syntax.ltyp = uu____3124; FStar_Syntax_Syntax.rng = uu____3125}) when (eq_lazy_kind k k') -> begin
(FStar_Dyn.undyn v1)
end
| uu____3128 -> begin
(failwith "Not a Tm_lazy of the expected kind")
end)))


let mk_lazy : 'a . 'a  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.lazy_kind  ->  FStar_Range.range FStar_Pervasives_Native.option  ->  FStar_Syntax_Syntax.term = (fun t typ k r -> (

let rng = (match (r) with
| FStar_Pervasives_Native.Some (r1) -> begin
r1
end
| FStar_Pervasives_Native.None -> begin
FStar_Range.dummyRange
end)
in (

let i = (

let uu____3169 = (FStar_Dyn.mkdyn t)
in {FStar_Syntax_Syntax.blob = uu____3169; FStar_Syntax_Syntax.lkind = k; FStar_Syntax_Syntax.ltyp = typ; FStar_Syntax_Syntax.rng = rng})
in (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_lazy (i)) FStar_Pervasives_Native.None rng))))


let canon_app : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t -> (

let uu____3182 = (

let uu____3197 = (unascribe t)
in (head_and_args' uu____3197))
in (match (uu____3182) with
| (hd1, args) -> begin
(FStar_Syntax_Syntax.mk_Tm_app hd1 args FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos)
end)))

type eq_result =
| Equal
| NotEqual
| Unknown


let uu___is_Equal : eq_result  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Equal -> begin
true
end
| uu____3231 -> begin
false
end))


let uu___is_NotEqual : eq_result  ->  Prims.bool = (fun projectee -> (match (projectee) with
| NotEqual -> begin
true
end
| uu____3242 -> begin
false
end))


let uu___is_Unknown : eq_result  ->  Prims.bool = (fun projectee -> (match (projectee) with
| Unknown -> begin
true
end
| uu____3253 -> begin
false
end))


let injectives : Prims.string Prims.list = ("FStar.Int8.int_to_t")::("FStar.Int16.int_to_t")::("FStar.Int32.int_to_t")::("FStar.Int64.int_to_t")::("FStar.UInt8.uint_to_t")::("FStar.UInt16.uint_to_t")::("FStar.UInt32.uint_to_t")::("FStar.UInt64.uint_to_t")::("FStar.Int8.__int_to_t")::("FStar.Int16.__int_to_t")::("FStar.Int32.__int_to_t")::("FStar.Int64.__int_to_t")::("FStar.UInt8.__uint_to_t")::("FStar.UInt16.__uint_to_t")::("FStar.UInt32.__uint_to_t")::("FStar.UInt64.__uint_to_t")::[]


let eq_inj : eq_result  ->  eq_result  ->  eq_result = (fun f g -> (match (((f), (g))) with
| (Equal, Equal) -> begin
Equal
end
| (NotEqual, uu____3303) -> begin
NotEqual
end
| (uu____3304, NotEqual) -> begin
NotEqual
end
| (Unknown, uu____3305) -> begin
Unknown
end
| (uu____3306, Unknown) -> begin
Unknown
end))


let rec eq_tm : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  eq_result = (fun t1 t2 -> (

let t11 = (canon_app t1)
in (

let t21 = (canon_app t2)
in (

let equal_if = (fun uu___122_3427 -> (match (uu___122_3427) with
| true -> begin
Equal
end
| uu____3430 -> begin
Unknown
end))
in (

let equal_iff = (fun uu___123_3438 -> (match (uu___123_3438) with
| true -> begin
Equal
end
| uu____3441 -> begin
NotEqual
end))
in (

let eq_and = (fun f g -> (match (f) with
| Equal -> begin
(g ())
end
| uu____3459 -> begin
Unknown
end))
in (

let equal_data = (fun f1 args1 f2 args2 -> (

let uu____3481 = (FStar_Syntax_Syntax.fv_eq f1 f2)
in (match (uu____3481) with
| true -> begin
(

let uu____3485 = (FStar_List.zip args1 args2)
in (FStar_All.pipe_left (FStar_List.fold_left (fun acc uu____3562 -> (match (uu____3562) with
| ((a1, q1), (a2, q2)) -> begin
(

let uu____3603 = (eq_tm a1 a2)
in (eq_inj acc uu____3603))
end)) Equal) uu____3485))
end
| uu____3604 -> begin
NotEqual
end)))
in (

let heads_and_args_in_case_both_data = (

let uu____3617 = (

let uu____3634 = (FStar_All.pipe_right t11 unmeta)
in (FStar_All.pipe_right uu____3634 head_and_args))
in (match (uu____3617) with
| (head1, args1) -> begin
(

let uu____3687 = (

let uu____3704 = (FStar_All.pipe_right t21 unmeta)
in (FStar_All.pipe_right uu____3704 head_and_args))
in (match (uu____3687) with
| (head2, args2) -> begin
(

let uu____3757 = (

let uu____3762 = (

let uu____3763 = (un_uinst head1)
in uu____3763.FStar_Syntax_Syntax.n)
in (

let uu____3766 = (

let uu____3767 = (un_uinst head2)
in uu____3767.FStar_Syntax_Syntax.n)
in ((uu____3762), (uu____3766))))
in (match (uu____3757) with
| (FStar_Syntax_Syntax.Tm_fvar (f), FStar_Syntax_Syntax.Tm_fvar (g)) when ((Prims.op_Equality f.FStar_Syntax_Syntax.fv_qual (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor))) && (Prims.op_Equality g.FStar_Syntax_Syntax.fv_qual (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)))) -> begin
FStar_Pervasives_Native.Some (((f), (args1), (g), (args2)))
end
| uu____3794 -> begin
FStar_Pervasives_Native.None
end))
end))
end))
in (

let uu____3807 = (

let uu____3812 = (

let uu____3813 = (unmeta t11)
in uu____3813.FStar_Syntax_Syntax.n)
in (

let uu____3816 = (

let uu____3817 = (unmeta t21)
in uu____3817.FStar_Syntax_Syntax.n)
in ((uu____3812), (uu____3816))))
in (match (uu____3807) with
| (FStar_Syntax_Syntax.Tm_bvar (bv1), FStar_Syntax_Syntax.Tm_bvar (bv2)) -> begin
(equal_if (Prims.op_Equality bv1.FStar_Syntax_Syntax.index bv2.FStar_Syntax_Syntax.index))
end
| (FStar_Syntax_Syntax.Tm_lazy (uu____3823), uu____3824) -> begin
(

let uu____3825 = (unlazy t11)
in (eq_tm uu____3825 t21))
end
| (uu____3826, FStar_Syntax_Syntax.Tm_lazy (uu____3827)) -> begin
(

let uu____3828 = (unlazy t21)
in (eq_tm t11 uu____3828))
end
| (FStar_Syntax_Syntax.Tm_name (a), FStar_Syntax_Syntax.Tm_name (b)) -> begin
(equal_if (FStar_Syntax_Syntax.bv_eq a b))
end
| uu____3831 when (FStar_All.pipe_right heads_and_args_in_case_both_data FStar_Util.is_some) -> begin
(

let uu____3855 = (FStar_All.pipe_right heads_and_args_in_case_both_data FStar_Util.must)
in (FStar_All.pipe_right uu____3855 (fun uu____3903 -> (match (uu____3903) with
| (f, args1, g, args2) -> begin
(equal_data f args1 g args2)
end))))
end
| (FStar_Syntax_Syntax.Tm_fvar (f), FStar_Syntax_Syntax.Tm_fvar (g)) -> begin
(

let uu____3918 = (FStar_Syntax_Syntax.fv_eq f g)
in (equal_if uu____3918))
end
| (FStar_Syntax_Syntax.Tm_uinst (f, us), FStar_Syntax_Syntax.Tm_uinst (g, vs)) -> begin
(

let uu____3932 = (eq_tm f g)
in (eq_and uu____3932 (fun uu____3935 -> (

let uu____3936 = (eq_univs_list us vs)
in (equal_if uu____3936)))))
end
| (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_range (uu____3938)), uu____3939) -> begin
Unknown
end
| (uu____3940, FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_range (uu____3941))) -> begin
Unknown
end
| (FStar_Syntax_Syntax.Tm_constant (c), FStar_Syntax_Syntax.Tm_constant (d)) -> begin
(

let uu____3944 = (FStar_Const.eq_const c d)
in (equal_iff uu____3944))
end
| (FStar_Syntax_Syntax.Tm_uvar (u1, ([], uu____3947)), FStar_Syntax_Syntax.Tm_uvar (u2, ([], uu____3949))) -> begin
(

let uu____3978 = (FStar_Syntax_Unionfind.equiv u1.FStar_Syntax_Syntax.ctx_uvar_head u2.FStar_Syntax_Syntax.ctx_uvar_head)
in (equal_if uu____3978))
end
| (FStar_Syntax_Syntax.Tm_app (h1, args1), FStar_Syntax_Syntax.Tm_app (h2, args2)) -> begin
(

let uu____4032 = (

let uu____4037 = (

let uu____4038 = (un_uinst h1)
in uu____4038.FStar_Syntax_Syntax.n)
in (

let uu____4041 = (

let uu____4042 = (un_uinst h2)
in uu____4042.FStar_Syntax_Syntax.n)
in ((uu____4037), (uu____4041))))
in (match (uu____4032) with
| (FStar_Syntax_Syntax.Tm_fvar (f1), FStar_Syntax_Syntax.Tm_fvar (f2)) when ((FStar_Syntax_Syntax.fv_eq f1 f2) && (

let uu____4048 = (

let uu____4050 = (FStar_Syntax_Syntax.lid_of_fv f1)
in (FStar_Ident.string_of_lid uu____4050))
in (FStar_List.mem uu____4048 injectives))) -> begin
(equal_data f1 args1 f2 args2)
end
| uu____4052 -> begin
(

let uu____4057 = (eq_tm h1 h2)
in (eq_and uu____4057 (fun uu____4059 -> (eq_args args1 args2))))
end))
end
| (FStar_Syntax_Syntax.Tm_match (t12, bs1), FStar_Syntax_Syntax.Tm_match (t22, bs2)) -> begin
(match ((Prims.op_Equality (FStar_List.length bs1) (FStar_List.length bs2))) with
| true -> begin
(

let uu____4165 = (FStar_List.zip bs1 bs2)
in (

let uu____4228 = (eq_tm t12 t22)
in (FStar_List.fold_right (fun uu____4265 a -> (match (uu____4265) with
| (b1, b2) -> begin
(eq_and a (fun uu____4358 -> (branch_matches b1 b2)))
end)) uu____4165 uu____4228)))
end
| uu____4359 -> begin
Unknown
end)
end
| (FStar_Syntax_Syntax.Tm_type (u), FStar_Syntax_Syntax.Tm_type (v1)) -> begin
(

let uu____4363 = (eq_univs u v1)
in (equal_if uu____4363))
end
| (FStar_Syntax_Syntax.Tm_quoted (t12, q1), FStar_Syntax_Syntax.Tm_quoted (t22, q2)) -> begin
(

let uu____4377 = (eq_quoteinfo q1 q2)
in (eq_and uu____4377 (fun uu____4379 -> (eq_tm t12 t22))))
end
| (FStar_Syntax_Syntax.Tm_refine (t12, phi1), FStar_Syntax_Syntax.Tm_refine (t22, phi2)) -> begin
(

let uu____4392 = (eq_tm t12.FStar_Syntax_Syntax.sort t22.FStar_Syntax_Syntax.sort)
in (eq_and uu____4392 (fun uu____4394 -> (eq_tm phi1 phi2))))
end
| uu____4395 -> begin
Unknown
end))))))))))
and eq_quoteinfo : FStar_Syntax_Syntax.quoteinfo  ->  FStar_Syntax_Syntax.quoteinfo  ->  eq_result = (fun q1 q2 -> (match ((Prims.op_disEquality q1.FStar_Syntax_Syntax.qkind q2.FStar_Syntax_Syntax.qkind)) with
| true -> begin
NotEqual
end
| uu____4403 -> begin
(eq_antiquotes q1.FStar_Syntax_Syntax.antiquotes q2.FStar_Syntax_Syntax.antiquotes)
end))
and eq_antiquotes : (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax) Prims.list  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax) Prims.list  ->  eq_result = (fun a1 a2 -> (match (((a1), (a2))) with
| ([], []) -> begin
Equal
end
| ([], uu____4467) -> begin
NotEqual
end
| (uu____4498, []) -> begin
NotEqual
end
| (((x1, t1))::a11, ((x2, t2))::a21) -> begin
(match ((not ((FStar_Syntax_Syntax.bv_eq x1 x2)))) with
| true -> begin
NotEqual
end
| uu____4588 -> begin
(

let uu____4590 = (eq_tm t1 t2)
in (match (uu____4590) with
| NotEqual -> begin
NotEqual
end
| Unknown -> begin
(

let uu____4591 = (eq_antiquotes a11 a21)
in (match (uu____4591) with
| NotEqual -> begin
NotEqual
end
| uu____4592 -> begin
Unknown
end))
end
| Equal -> begin
(eq_antiquotes a11 a21)
end))
end)
end))
and eq_aqual : FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option  ->  FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option  ->  eq_result = (fun a1 a2 -> (match (((a1), (a2))) with
| (FStar_Pervasives_Native.None, FStar_Pervasives_Native.None) -> begin
Equal
end
| (FStar_Pervasives_Native.None, uu____4607) -> begin
NotEqual
end
| (uu____4614, FStar_Pervasives_Native.None) -> begin
NotEqual
end
| (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Implicit (b1)), FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Implicit (b2))) when (Prims.op_Equality b1 b2) -> begin
Equal
end
| (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Meta (t1)), FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Meta (t2))) -> begin
(eq_tm t1 t2)
end
| (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Equality), FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Equality)) -> begin
Equal
end
| uu____4644 -> begin
NotEqual
end))
and branch_matches : (FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)  ->  (FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)  ->  eq_result = (fun b1 b2 -> (

let related_by = (fun f o1 o2 -> (match (((o1), (o2))) with
| (FStar_Pervasives_Native.None, FStar_Pervasives_Native.None) -> begin
true
end
| (FStar_Pervasives_Native.Some (x), FStar_Pervasives_Native.Some (y)) -> begin
(f x y)
end
| (uu____4736, uu____4737) -> begin
false
end))
in (

let uu____4747 = b1
in (match (uu____4747) with
| (p1, w1, t1) -> begin
(

let uu____4781 = b2
in (match (uu____4781) with
| (p2, w2, t2) -> begin
(

let uu____4815 = (FStar_Syntax_Syntax.eq_pat p1 p2)
in (match (uu____4815) with
| true -> begin
(

let uu____4818 = ((

let uu____4822 = (eq_tm t1 t2)
in (Prims.op_Equality uu____4822 Equal)) && (related_by (fun t11 t21 -> (

let uu____4831 = (eq_tm t11 t21)
in (Prims.op_Equality uu____4831 Equal))) w1 w2))
in (match (uu____4818) with
| true -> begin
Equal
end
| uu____4833 -> begin
Unknown
end))
end
| uu____4835 -> begin
Unknown
end))
end))
end))))
and eq_args : FStar_Syntax_Syntax.args  ->  FStar_Syntax_Syntax.args  ->  eq_result = (fun a1 a2 -> (match (((a1), (a2))) with
| ([], []) -> begin
Equal
end
| (((a, uu____4896))::a11, ((b, uu____4899))::b1) -> begin
(

let uu____4973 = (eq_tm a b)
in (match (uu____4973) with
| Equal -> begin
(eq_args a11 b1)
end
| uu____4974 -> begin
Unknown
end))
end
| uu____4975 -> begin
Unknown
end))
and eq_univs_list : FStar_Syntax_Syntax.universes  ->  FStar_Syntax_Syntax.universes  ->  Prims.bool = (fun us vs -> ((Prims.op_Equality (FStar_List.length us) (FStar_List.length vs)) && (FStar_List.forall2 eq_univs us vs)))


let rec unrefine : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_refine (x, uu____5011) -> begin
(unrefine x.FStar_Syntax_Syntax.sort)
end
| FStar_Syntax_Syntax.Tm_ascribed (t2, uu____5017, uu____5018) -> begin
(unrefine t2)
end
| uu____5059 -> begin
t1
end)))


let rec is_uvar : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____5067 = (

let uu____5068 = (FStar_Syntax_Subst.compress t)
in uu____5068.FStar_Syntax_Syntax.n)
in (match (uu____5067) with
| FStar_Syntax_Syntax.Tm_uvar (uu____5072) -> begin
true
end
| FStar_Syntax_Syntax.Tm_uinst (t1, uu____5087) -> begin
(is_uvar t1)
end
| FStar_Syntax_Syntax.Tm_app (uu____5092) -> begin
(

let uu____5109 = (

let uu____5110 = (FStar_All.pipe_right t head_and_args)
in (FStar_All.pipe_right uu____5110 FStar_Pervasives_Native.fst))
in (FStar_All.pipe_right uu____5109 is_uvar))
end
| FStar_Syntax_Syntax.Tm_ascribed (t1, uu____5173, uu____5174) -> begin
(is_uvar t1)
end
| uu____5215 -> begin
false
end)))


let rec is_unit : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____5224 = (

let uu____5225 = (unrefine t)
in uu____5225.FStar_Syntax_Syntax.n)
in (match (uu____5224) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(((FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.unit_lid) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.squash_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.auto_squash_lid))
end
| FStar_Syntax_Syntax.Tm_app (head1, uu____5231) -> begin
(is_unit head1)
end
| FStar_Syntax_Syntax.Tm_uinst (t1, uu____5257) -> begin
(is_unit t1)
end
| uu____5262 -> begin
false
end)))


let is_eqtype_no_unrefine : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____5271 = (

let uu____5272 = (FStar_Syntax_Subst.compress t)
in uu____5272.FStar_Syntax_Syntax.n)
in (match (uu____5271) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.eqtype_lid)
end
| uu____5277 -> begin
false
end)))


let rec non_informative : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____5286 = (

let uu____5287 = (unrefine t)
in uu____5287.FStar_Syntax_Syntax.n)
in (match (uu____5286) with
| FStar_Syntax_Syntax.Tm_type (uu____5291) -> begin
true
end
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(((FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.unit_lid) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.squash_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.erased_lid))
end
| FStar_Syntax_Syntax.Tm_app (head1, uu____5295) -> begin
(non_informative head1)
end
| FStar_Syntax_Syntax.Tm_uinst (t1, uu____5321) -> begin
(non_informative t1)
end
| FStar_Syntax_Syntax.Tm_arrow (uu____5326, c) -> begin
((is_tot_or_gtot_comp c) && (non_informative (comp_result c)))
end
| uu____5348 -> begin
false
end)))


let is_fun : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun e -> (

let uu____5357 = (

let uu____5358 = (FStar_Syntax_Subst.compress e)
in uu____5358.FStar_Syntax_Syntax.n)
in (match (uu____5357) with
| FStar_Syntax_Syntax.Tm_abs (uu____5362) -> begin
true
end
| uu____5382 -> begin
false
end)))


let is_function_typ : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____5391 = (

let uu____5392 = (FStar_Syntax_Subst.compress t)
in uu____5392.FStar_Syntax_Syntax.n)
in (match (uu____5391) with
| FStar_Syntax_Syntax.Tm_arrow (uu____5396) -> begin
true
end
| uu____5412 -> begin
false
end)))


let rec pre_typ : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_refine (x, uu____5422) -> begin
(pre_typ x.FStar_Syntax_Syntax.sort)
end
| FStar_Syntax_Syntax.Tm_ascribed (t2, uu____5428, uu____5429) -> begin
(pre_typ t2)
end
| uu____5470 -> begin
t1
end)))


let destruct : FStar_Syntax_Syntax.term  ->  FStar_Ident.lident  ->  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list FStar_Pervasives_Native.option = (fun typ lid -> (

let typ1 = (FStar_Syntax_Subst.compress typ)
in (

let uu____5495 = (

let uu____5496 = (un_uinst typ1)
in uu____5496.FStar_Syntax_Syntax.n)
in (match (uu____5495) with
| FStar_Syntax_Syntax.Tm_app (head1, args) -> begin
(

let head2 = (un_uinst head1)
in (match (head2.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (tc) when (FStar_Syntax_Syntax.fv_eq_lid tc lid) -> begin
FStar_Pervasives_Native.Some (args)
end
| uu____5561 -> begin
FStar_Pervasives_Native.None
end))
end
| FStar_Syntax_Syntax.Tm_fvar (tc) when (FStar_Syntax_Syntax.fv_eq_lid tc lid) -> begin
FStar_Pervasives_Native.Some ([])
end
| uu____5591 -> begin
FStar_Pervasives_Native.None
end))))


let lids_of_sigelt : FStar_Syntax_Syntax.sigelt  ->  FStar_Ident.lident Prims.list = (fun se -> (match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_let (uu____5612, lids) -> begin
lids
end
| FStar_Syntax_Syntax.Sig_splice (lids, uu____5619) -> begin
lids
end
| FStar_Syntax_Syntax.Sig_bundle (uu____5624, lids) -> begin
lids
end
| FStar_Syntax_Syntax.Sig_inductive_typ (lid, uu____5635, uu____5636, uu____5637, uu____5638, uu____5639) -> begin
(lid)::[]
end
| FStar_Syntax_Syntax.Sig_effect_abbrev (lid, uu____5649, uu____5650, uu____5651, uu____5652) -> begin
(lid)::[]
end
| FStar_Syntax_Syntax.Sig_datacon (lid, uu____5658, uu____5659, uu____5660, uu____5661, uu____5662) -> begin
(lid)::[]
end
| FStar_Syntax_Syntax.Sig_declare_typ (lid, uu____5670, uu____5671) -> begin
(lid)::[]
end
| FStar_Syntax_Syntax.Sig_assume (lid, uu____5673, uu____5674) -> begin
(lid)::[]
end
| FStar_Syntax_Syntax.Sig_new_effect_for_free (n1) -> begin
(n1.FStar_Syntax_Syntax.mname)::[]
end
| FStar_Syntax_Syntax.Sig_new_effect (n1) -> begin
(n1.FStar_Syntax_Syntax.mname)::[]
end
| FStar_Syntax_Syntax.Sig_sub_effect (uu____5677) -> begin
[]
end
| FStar_Syntax_Syntax.Sig_pragma (uu____5678) -> begin
[]
end
| FStar_Syntax_Syntax.Sig_main (uu____5679) -> begin
[]
end))


let lid_of_sigelt : FStar_Syntax_Syntax.sigelt  ->  FStar_Ident.lident FStar_Pervasives_Native.option = (fun se -> (match ((lids_of_sigelt se)) with
| (l)::[] -> begin
FStar_Pervasives_Native.Some (l)
end
| uu____5693 -> begin
FStar_Pervasives_Native.None
end))


let quals_of_sigelt : FStar_Syntax_Syntax.sigelt  ->  FStar_Syntax_Syntax.qualifier Prims.list = (fun x -> x.FStar_Syntax_Syntax.sigquals)


let range_of_sigelt : FStar_Syntax_Syntax.sigelt  ->  FStar_Range.range = (fun x -> x.FStar_Syntax_Syntax.sigrng)


let range_of_lbname : (FStar_Syntax_Syntax.bv, FStar_Syntax_Syntax.fv) FStar_Util.either  ->  FStar_Range.range = (fun uu___124_5719 -> (match (uu___124_5719) with
| FStar_Util.Inl (x) -> begin
(FStar_Syntax_Syntax.range_of_bv x)
end
| FStar_Util.Inr (fv) -> begin
(FStar_Ident.range_of_lid fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
end))


let range_of_arg : 'Auu____5733 'Auu____5734 . ('Auu____5733 FStar_Syntax_Syntax.syntax * 'Auu____5734)  ->  FStar_Range.range = (fun uu____5745 -> (match (uu____5745) with
| (hd1, uu____5753) -> begin
hd1.FStar_Syntax_Syntax.pos
end))


let range_of_args : 'Auu____5767 'Auu____5768 . ('Auu____5767 FStar_Syntax_Syntax.syntax * 'Auu____5768) Prims.list  ->  FStar_Range.range  ->  FStar_Range.range = (fun args r -> (FStar_All.pipe_right args (FStar_List.fold_left (fun r1 a -> (FStar_Range.union_ranges r1 (range_of_arg a))) r)))


let mk_app : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun f args -> (match (args) with
| [] -> begin
f
end
| uu____5866 -> begin
(

let r = (range_of_args args f.FStar_Syntax_Syntax.pos)
in (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (((f), (args)))) FStar_Pervasives_Native.None r))
end))


let mk_app_binders : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun f bs -> (

let uu____5925 = (FStar_List.map (fun uu____5952 -> (match (uu____5952) with
| (bv, aq) -> begin
(

let uu____5971 = (FStar_Syntax_Syntax.bv_to_name bv)
in ((uu____5971), (aq)))
end)) bs)
in (mk_app f uu____5925)))


let mk_data : FStar_Ident.lident  ->  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Syntax_Syntax.syntax = (fun l args -> (match (args) with
| [] -> begin
(

let uu____6021 = (FStar_Ident.range_of_lid l)
in (

let uu____6022 = (

let uu____6031 = (FStar_Syntax_Syntax.fvar l FStar_Syntax_Syntax.delta_constant (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)))
in (FStar_Syntax_Syntax.mk uu____6031))
in (uu____6022 FStar_Pervasives_Native.None uu____6021)))
end
| uu____6039 -> begin
(

let e = (

let uu____6053 = (FStar_Syntax_Syntax.fvar l FStar_Syntax_Syntax.delta_constant (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)))
in (mk_app uu____6053 args))
in (FStar_Syntax_Syntax.mk e FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos))
end))


let field_projector_prefix : Prims.string = "__proj__"


let field_projector_sep : Prims.string = "__item__"


let field_projector_contains_constructor : Prims.string  ->  Prims.bool = (fun s -> (FStar_Util.starts_with s field_projector_prefix))


let mk_field_projector_name_from_string : Prims.string  ->  Prims.string  ->  Prims.string = (fun constr field -> (Prims.strcat field_projector_prefix (Prims.strcat constr (Prims.strcat field_projector_sep field))))


let mk_field_projector_name_from_ident : FStar_Ident.lident  ->  FStar_Ident.ident  ->  FStar_Ident.lident = (fun lid i -> (

let itext = i.FStar_Ident.idText
in (

let newi = (match ((field_projector_contains_constructor itext)) with
| true -> begin
i
end
| uu____6104 -> begin
(FStar_Ident.mk_ident (((mk_field_projector_name_from_string lid.FStar_Ident.ident.FStar_Ident.idText itext)), (i.FStar_Ident.idRange)))
end)
in (FStar_Ident.lid_of_ids (FStar_List.append lid.FStar_Ident.ns ((newi)::[]))))))


let mk_field_projector_name : FStar_Ident.lident  ->  FStar_Syntax_Syntax.bv  ->  Prims.int  ->  (FStar_Ident.lident * FStar_Syntax_Syntax.bv) = (fun lid x i -> (

let nm = (

let uu____6130 = (FStar_Syntax_Syntax.is_null_bv x)
in (match (uu____6130) with
| true -> begin
(

let uu____6133 = (

let uu____6139 = (

let uu____6141 = (FStar_Util.string_of_int i)
in (Prims.strcat "_" uu____6141))
in (

let uu____6144 = (FStar_Syntax_Syntax.range_of_bv x)
in ((uu____6139), (uu____6144))))
in (FStar_Ident.mk_ident uu____6133))
end
| uu____6146 -> begin
x.FStar_Syntax_Syntax.ppname
end))
in (

let y = (

let uu___131_6149 = x
in {FStar_Syntax_Syntax.ppname = nm; FStar_Syntax_Syntax.index = uu___131_6149.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = uu___131_6149.FStar_Syntax_Syntax.sort})
in (

let uu____6150 = (mk_field_projector_name_from_ident lid nm)
in ((uu____6150), (y))))))


let ses_of_sigbundle : FStar_Syntax_Syntax.sigelt  ->  FStar_Syntax_Syntax.sigelt Prims.list = (fun se -> (match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_bundle (ses, uu____6162) -> begin
ses
end
| uu____6171 -> begin
(failwith "ses_of_sigbundle: not a Sig_bundle")
end))


let eff_decl_of_new_effect : FStar_Syntax_Syntax.sigelt  ->  FStar_Syntax_Syntax.eff_decl = (fun se -> (match (se.FStar_Syntax_Syntax.sigel) with
| FStar_Syntax_Syntax.Sig_new_effect (ne) -> begin
ne
end
| uu____6182 -> begin
(failwith "eff_decl_of_new_effect: not a Sig_new_effect")
end))


let set_uvar : FStar_Syntax_Syntax.uvar  ->  FStar_Syntax_Syntax.term  ->  unit = (fun uv t -> (

let uu____6195 = (FStar_Syntax_Unionfind.find uv)
in (match (uu____6195) with
| FStar_Pervasives_Native.Some (uu____6198) -> begin
(

let uu____6199 = (

let uu____6201 = (

let uu____6203 = (FStar_Syntax_Unionfind.uvar_id uv)
in (FStar_All.pipe_left FStar_Util.string_of_int uu____6203))
in (FStar_Util.format1 "Changing a fixed uvar! ?%s\n" uu____6201))
in (failwith uu____6199))
end
| uu____6208 -> begin
(FStar_Syntax_Unionfind.change uv t)
end)))


let qualifier_equal : FStar_Syntax_Syntax.qualifier  ->  FStar_Syntax_Syntax.qualifier  ->  Prims.bool = (fun q1 q2 -> (match (((q1), (q2))) with
| (FStar_Syntax_Syntax.Discriminator (l1), FStar_Syntax_Syntax.Discriminator (l2)) -> begin
(FStar_Ident.lid_equals l1 l2)
end
| (FStar_Syntax_Syntax.Projector (l1a, l1b), FStar_Syntax_Syntax.Projector (l2a, l2b)) -> begin
((FStar_Ident.lid_equals l1a l2a) && (Prims.op_Equality l1b.FStar_Ident.idText l2b.FStar_Ident.idText))
end
| (FStar_Syntax_Syntax.RecordType (ns1, f1), FStar_Syntax_Syntax.RecordType (ns2, f2)) -> begin
((((Prims.op_Equality (FStar_List.length ns1) (FStar_List.length ns2)) && (FStar_List.forall2 (fun x1 x2 -> (Prims.op_Equality x1.FStar_Ident.idText x2.FStar_Ident.idText)) f1 f2)) && (Prims.op_Equality (FStar_List.length f1) (FStar_List.length f2))) && (FStar_List.forall2 (fun x1 x2 -> (Prims.op_Equality x1.FStar_Ident.idText x2.FStar_Ident.idText)) f1 f2))
end
| (FStar_Syntax_Syntax.RecordConstructor (ns1, f1), FStar_Syntax_Syntax.RecordConstructor (ns2, f2)) -> begin
((((Prims.op_Equality (FStar_List.length ns1) (FStar_List.length ns2)) && (FStar_List.forall2 (fun x1 x2 -> (Prims.op_Equality x1.FStar_Ident.idText x2.FStar_Ident.idText)) f1 f2)) && (Prims.op_Equality (FStar_List.length f1) (FStar_List.length f2))) && (FStar_List.forall2 (fun x1 x2 -> (Prims.op_Equality x1.FStar_Ident.idText x2.FStar_Ident.idText)) f1 f2))
end
| uu____6291 -> begin
(Prims.op_Equality q1 q2)
end))


let abs : FStar_Syntax_Syntax.binders  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun bs t lopt -> (

let close_lopt = (fun lopt1 -> (match (lopt1) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (rc) -> begin
(

let uu____6337 = (

let uu___132_6338 = rc
in (

let uu____6339 = (FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ (FStar_Syntax_Subst.close bs))
in {FStar_Syntax_Syntax.residual_effect = uu___132_6338.FStar_Syntax_Syntax.residual_effect; FStar_Syntax_Syntax.residual_typ = uu____6339; FStar_Syntax_Syntax.residual_flags = uu___132_6338.FStar_Syntax_Syntax.residual_flags}))
in FStar_Pervasives_Native.Some (uu____6337))
end))
in (match (bs) with
| [] -> begin
t
end
| uu____6356 -> begin
(

let body = (

let uu____6358 = (FStar_Syntax_Subst.close bs t)
in (FStar_Syntax_Subst.compress uu____6358))
in (match (body.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_abs (bs', t1, lopt') -> begin
(

let uu____6388 = (

let uu____6395 = (

let uu____6396 = (

let uu____6415 = (

let uu____6424 = (FStar_Syntax_Subst.close_binders bs)
in (FStar_List.append uu____6424 bs'))
in (

let uu____6439 = (close_lopt lopt')
in ((uu____6415), (t1), (uu____6439))))
in FStar_Syntax_Syntax.Tm_abs (uu____6396))
in (FStar_Syntax_Syntax.mk uu____6395))
in (uu____6388 FStar_Pervasives_Native.None t1.FStar_Syntax_Syntax.pos))
end
| uu____6457 -> begin
(

let uu____6458 = (

let uu____6465 = (

let uu____6466 = (

let uu____6485 = (FStar_Syntax_Subst.close_binders bs)
in (

let uu____6494 = (close_lopt lopt)
in ((uu____6485), (body), (uu____6494))))
in FStar_Syntax_Syntax.Tm_abs (uu____6466))
in (FStar_Syntax_Syntax.mk uu____6465))
in (uu____6458 FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos))
end))
end)))


let arrow : (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list  ->  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun bs c -> (match (bs) with
| [] -> begin
(comp_result c)
end
| uu____6553 -> begin
(

let uu____6562 = (

let uu____6569 = (

let uu____6570 = (

let uu____6585 = (FStar_Syntax_Subst.close_binders bs)
in (

let uu____6594 = (FStar_Syntax_Subst.close_comp bs c)
in ((uu____6585), (uu____6594))))
in FStar_Syntax_Syntax.Tm_arrow (uu____6570))
in (FStar_Syntax_Syntax.mk uu____6569))
in (uu____6562 FStar_Pervasives_Native.None c.FStar_Syntax_Syntax.pos))
end))


let flat_arrow : (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list  ->  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun bs c -> (

let t = (arrow bs c)
in (

let uu____6646 = (

let uu____6647 = (FStar_Syntax_Subst.compress t)
in uu____6647.FStar_Syntax_Syntax.n)
in (match (uu____6646) with
| FStar_Syntax_Syntax.Tm_arrow (bs1, c1) -> begin
(match (c1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (tres, uu____6677) -> begin
(

let uu____6686 = (

let uu____6687 = (FStar_Syntax_Subst.compress tres)
in uu____6687.FStar_Syntax_Syntax.n)
in (match (uu____6686) with
| FStar_Syntax_Syntax.Tm_arrow (bs', c') -> begin
(FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_arrow ((((FStar_List.append bs1 bs')), (c')))) FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos)
end
| uu____6730 -> begin
t
end))
end
| uu____6731 -> begin
t
end)
end
| uu____6732 -> begin
t
end))))


let refine : FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun b t -> (

let uu____6750 = (

let uu____6751 = (FStar_Syntax_Syntax.range_of_bv b)
in (FStar_Range.union_ranges uu____6751 t.FStar_Syntax_Syntax.pos))
in (

let uu____6752 = (

let uu____6759 = (

let uu____6760 = (

let uu____6767 = (

let uu____6770 = (

let uu____6771 = (FStar_Syntax_Syntax.mk_binder b)
in (uu____6771)::[])
in (FStar_Syntax_Subst.close uu____6770 t))
in ((b), (uu____6767)))
in FStar_Syntax_Syntax.Tm_refine (uu____6760))
in (FStar_Syntax_Syntax.mk uu____6759))
in (uu____6752 FStar_Pervasives_Native.None uu____6750))))


let branch : FStar_Syntax_Syntax.branch  ->  FStar_Syntax_Syntax.branch = (fun b -> (FStar_Syntax_Subst.close_branch b))


let rec arrow_formals_comp : FStar_Syntax_Syntax.term  ->  ((FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list * FStar_Syntax_Syntax.comp) = (fun k -> (

let k1 = (FStar_Syntax_Subst.compress k)
in (match (k1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(

let uu____6854 = (FStar_Syntax_Subst.open_comp bs c)
in (match (uu____6854) with
| (bs1, c1) -> begin
(

let uu____6873 = (is_total_comp c1)
in (match (uu____6873) with
| true -> begin
(

let uu____6888 = (arrow_formals_comp (comp_result c1))
in (match (uu____6888) with
| (bs', k2) -> begin
(((FStar_List.append bs1 bs')), (k2))
end))
end
| uu____6945 -> begin
((bs1), (c1))
end))
end))
end
| FStar_Syntax_Syntax.Tm_refine ({FStar_Syntax_Syntax.ppname = uu____6955; FStar_Syntax_Syntax.index = uu____6956; FStar_Syntax_Syntax.sort = s}, uu____6958) -> begin
(

let rec aux = (fun s1 k2 -> (

let uu____6989 = (

let uu____6990 = (FStar_Syntax_Subst.compress s1)
in uu____6990.FStar_Syntax_Syntax.n)
in (match (uu____6989) with
| FStar_Syntax_Syntax.Tm_arrow (uu____7005) -> begin
(arrow_formals_comp s1)
end
| FStar_Syntax_Syntax.Tm_refine ({FStar_Syntax_Syntax.ppname = uu____7020; FStar_Syntax_Syntax.index = uu____7021; FStar_Syntax_Syntax.sort = s2}, uu____7023) -> begin
(aux s2 k2)
end
| uu____7031 -> begin
(

let uu____7032 = (FStar_Syntax_Syntax.mk_Total k2)
in (([]), (uu____7032)))
end)))
in (aux s k1))
end
| uu____7047 -> begin
(

let uu____7048 = (FStar_Syntax_Syntax.mk_Total k1)
in (([]), (uu____7048)))
end)))


let rec arrow_formals : FStar_Syntax_Syntax.term  ->  ((FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax) = (fun k -> (

let uu____7083 = (arrow_formals_comp k)
in (match (uu____7083) with
| (bs, c) -> begin
((bs), ((comp_result c)))
end)))


let let_rec_arity : FStar_Syntax_Syntax.letbinding  ->  (Prims.int * Prims.bool Prims.list FStar_Pervasives_Native.option) = (fun lb -> (

let rec arrow_until_decreases = (fun k -> (

let k1 = (FStar_Syntax_Subst.compress k)
in (match (k1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(

let uu____7225 = (FStar_Syntax_Subst.open_comp bs c)
in (match (uu____7225) with
| (bs1, c1) -> begin
(

let ct = (comp_to_comp_typ c1)
in (

let uu____7249 = (FStar_All.pipe_right ct.FStar_Syntax_Syntax.flags (FStar_Util.find_opt (fun uu___125_7258 -> (match (uu___125_7258) with
| FStar_Syntax_Syntax.DECREASES (uu____7260) -> begin
true
end
| uu____7264 -> begin
false
end))))
in (match (uu____7249) with
| FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.DECREASES (d)) -> begin
((bs1), (FStar_Pervasives_Native.Some (d)))
end
| uu____7299 -> begin
(

let uu____7302 = (is_total_comp c1)
in (match (uu____7302) with
| true -> begin
(

let uu____7321 = (arrow_until_decreases (comp_result c1))
in (match (uu____7321) with
| (bs', d) -> begin
(((FStar_List.append bs1 bs')), (d))
end))
end
| uu____7398 -> begin
((bs1), (FStar_Pervasives_Native.None))
end))
end)))
end))
end
| FStar_Syntax_Syntax.Tm_refine ({FStar_Syntax_Syntax.ppname = uu____7414; FStar_Syntax_Syntax.index = uu____7415; FStar_Syntax_Syntax.sort = k2}, uu____7417) -> begin
(arrow_until_decreases k2)
end
| uu____7425 -> begin
(([]), (FStar_Pervasives_Native.None))
end)))
in (

let uu____7446 = (arrow_until_decreases lb.FStar_Syntax_Syntax.lbtyp)
in (match (uu____7446) with
| (bs, dopt) -> begin
(

let n_univs = (FStar_List.length lb.FStar_Syntax_Syntax.lbunivs)
in (

let uu____7500 = (FStar_Util.map_opt dopt (fun d -> (

let d_bvs = (FStar_Syntax_Free.names d)
in (

let uu____7521 = (FStar_Common.tabulate n_univs (fun uu____7531 -> false))
in (

let uu____7534 = (FStar_All.pipe_right bs (FStar_List.map (fun uu____7559 -> (match (uu____7559) with
| (x, uu____7568) -> begin
(FStar_Util.set_mem x d_bvs)
end))))
in (FStar_List.append uu____7521 uu____7534))))))
in (((n_univs + (FStar_List.length bs))), (uu____7500))))
end))))


let abs_formals : FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.binders * FStar_Syntax_Syntax.term * FStar_Syntax_Syntax.residual_comp FStar_Pervasives_Native.option) = (fun t -> (

let subst_lcomp_opt = (fun s l -> (match (l) with
| FStar_Pervasives_Native.Some (rc) -> begin
(

let uu____7630 = (

let uu___133_7631 = rc
in (

let uu____7632 = (FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ (FStar_Syntax_Subst.subst s))
in {FStar_Syntax_Syntax.residual_effect = uu___133_7631.FStar_Syntax_Syntax.residual_effect; FStar_Syntax_Syntax.residual_typ = uu____7632; FStar_Syntax_Syntax.residual_flags = uu___133_7631.FStar_Syntax_Syntax.residual_flags}))
in FStar_Pervasives_Native.Some (uu____7630))
end
| uu____7641 -> begin
l
end))
in (

let rec aux = (fun t1 abs_body_lcomp -> (

let uu____7675 = (

let uu____7676 = (

let uu____7679 = (FStar_Syntax_Subst.compress t1)
in (FStar_All.pipe_left unascribe uu____7679))
in uu____7676.FStar_Syntax_Syntax.n)
in (match (uu____7675) with
| FStar_Syntax_Syntax.Tm_abs (bs, t2, what) -> begin
(

let uu____7725 = (aux t2 what)
in (match (uu____7725) with
| (bs', t3, what1) -> begin
(((FStar_List.append bs bs')), (t3), (what1))
end))
end
| uu____7797 -> begin
(([]), (t1), (abs_body_lcomp))
end)))
in (

let uu____7814 = (aux t FStar_Pervasives_Native.None)
in (match (uu____7814) with
| (bs, t1, abs_body_lcomp) -> begin
(

let uu____7862 = (FStar_Syntax_Subst.open_term' bs t1)
in (match (uu____7862) with
| (bs1, t2, opening) -> begin
(

let abs_body_lcomp1 = (subst_lcomp_opt opening abs_body_lcomp)
in ((bs1), (t2), (abs_body_lcomp1)))
end))
end)))))


let mk_letbinding : (FStar_Syntax_Syntax.bv, FStar_Syntax_Syntax.fv) FStar_Util.either  ->  FStar_Syntax_Syntax.univ_name Prims.list  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax Prims.list  ->  FStar_Range.range  ->  FStar_Syntax_Syntax.letbinding = (fun lbname univ_vars typ eff def lbattrs pos -> {FStar_Syntax_Syntax.lbname = lbname; FStar_Syntax_Syntax.lbunivs = univ_vars; FStar_Syntax_Syntax.lbtyp = typ; FStar_Syntax_Syntax.lbeff = eff; FStar_Syntax_Syntax.lbdef = def; FStar_Syntax_Syntax.lbattrs = lbattrs; FStar_Syntax_Syntax.lbpos = pos})


let close_univs_and_mk_letbinding : FStar_Syntax_Syntax.fv Prims.list FStar_Pervasives_Native.option  ->  (FStar_Syntax_Syntax.bv, FStar_Syntax_Syntax.fv) FStar_Util.either  ->  FStar_Syntax_Syntax.univ_name Prims.list  ->  FStar_Syntax_Syntax.term  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax Prims.list  ->  FStar_Range.range  ->  FStar_Syntax_Syntax.letbinding = (fun recs lbname univ_vars typ eff def attrs pos -> (

let def1 = (match (((recs), (univ_vars))) with
| (FStar_Pervasives_Native.None, uu____8025) -> begin
def
end
| (uu____8036, []) -> begin
def
end
| (FStar_Pervasives_Native.Some (fvs), uu____8048) -> begin
(

let universes = (FStar_All.pipe_right univ_vars (FStar_List.map (fun _0_1 -> FStar_Syntax_Syntax.U_name (_0_1))))
in (

let inst1 = (FStar_All.pipe_right fvs (FStar_List.map (fun fv -> ((fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v), (universes)))))
in (FStar_Syntax_InstFV.instantiate inst1 def)))
end)
in (

let typ1 = (FStar_Syntax_Subst.close_univ_vars univ_vars typ)
in (

let def2 = (FStar_Syntax_Subst.close_univ_vars univ_vars def1)
in (mk_letbinding lbname univ_vars typ1 eff def2 attrs pos)))))


let open_univ_vars_binders_and_comp : FStar_Syntax_Syntax.univ_names  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list  ->  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  (FStar_Syntax_Syntax.univ_names * (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list * FStar_Syntax_Syntax.comp) = (fun uvs binders c -> (match (binders) with
| [] -> begin
(

let uu____8145 = (FStar_Syntax_Subst.open_univ_vars_comp uvs c)
in (match (uu____8145) with
| (uvs1, c1) -> begin
((uvs1), ([]), (c1))
end))
end
| uu____8180 -> begin
(

let t' = (arrow binders c)
in (

let uu____8192 = (FStar_Syntax_Subst.open_univ_vars uvs t')
in (match (uu____8192) with
| (uvs1, t'1) -> begin
(

let uu____8213 = (

let uu____8214 = (FStar_Syntax_Subst.compress t'1)
in uu____8214.FStar_Syntax_Syntax.n)
in (match (uu____8213) with
| FStar_Syntax_Syntax.Tm_arrow (binders1, c1) -> begin
((uvs1), (binders1), (c1))
end
| uu____8263 -> begin
(failwith "Impossible")
end))
end)))
end))


let is_tuple_constructor : FStar_Syntax_Syntax.typ  ->  Prims.bool = (fun t -> (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Parser_Const.is_tuple_constructor_string fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v.FStar_Ident.str)
end
| uu____8288 -> begin
false
end))


let is_dtuple_constructor : FStar_Syntax_Syntax.typ  ->  Prims.bool = (fun t -> (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Parser_Const.is_dtuple_constructor_lid fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
end
| uu____8299 -> begin
false
end))


let is_lid_equality : FStar_Ident.lident  ->  Prims.bool = (fun x -> (FStar_Ident.lid_equals x FStar_Parser_Const.eq2_lid))


let is_forall : FStar_Ident.lident  ->  Prims.bool = (fun lid -> (FStar_Ident.lid_equals lid FStar_Parser_Const.forall_lid))


let is_exists : FStar_Ident.lident  ->  Prims.bool = (fun lid -> (FStar_Ident.lid_equals lid FStar_Parser_Const.exists_lid))


let is_qlid : FStar_Ident.lident  ->  Prims.bool = (fun lid -> ((is_forall lid) || (is_exists lid)))


let is_equality : FStar_Ident.lident FStar_Syntax_Syntax.withinfo_t  ->  Prims.bool = (fun x -> (is_lid_equality x.FStar_Syntax_Syntax.v))


let lid_is_connective : FStar_Ident.lident  ->  Prims.bool = (

let lst = (FStar_Parser_Const.and_lid)::(FStar_Parser_Const.or_lid)::(FStar_Parser_Const.not_lid)::(FStar_Parser_Const.iff_lid)::(FStar_Parser_Const.imp_lid)::[]
in (fun lid -> (FStar_Util.for_some (FStar_Ident.lid_equals lid) lst)))


let is_constructor : FStar_Syntax_Syntax.term  ->  FStar_Ident.lident  ->  Prims.bool = (fun t lid -> (

let uu____8362 = (

let uu____8363 = (pre_typ t)
in uu____8363.FStar_Syntax_Syntax.n)
in (match (uu____8362) with
| FStar_Syntax_Syntax.Tm_fvar (tc) -> begin
(FStar_Ident.lid_equals tc.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v lid)
end
| uu____8368 -> begin
false
end)))


let rec is_constructed_typ : FStar_Syntax_Syntax.term  ->  FStar_Ident.lident  ->  Prims.bool = (fun t lid -> (

let uu____8382 = (

let uu____8383 = (pre_typ t)
in uu____8383.FStar_Syntax_Syntax.n)
in (match (uu____8382) with
| FStar_Syntax_Syntax.Tm_fvar (uu____8387) -> begin
(is_constructor t lid)
end
| FStar_Syntax_Syntax.Tm_app (t1, uu____8389) -> begin
(is_constructed_typ t1 lid)
end
| FStar_Syntax_Syntax.Tm_uinst (t1, uu____8415) -> begin
(is_constructed_typ t1 lid)
end
| uu____8420 -> begin
false
end)))


let rec get_tycon : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term FStar_Pervasives_Native.option = (fun t -> (

let t1 = (pre_typ t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_bvar (uu____8433) -> begin
FStar_Pervasives_Native.Some (t1)
end
| FStar_Syntax_Syntax.Tm_name (uu____8434) -> begin
FStar_Pervasives_Native.Some (t1)
end
| FStar_Syntax_Syntax.Tm_fvar (uu____8435) -> begin
FStar_Pervasives_Native.Some (t1)
end
| FStar_Syntax_Syntax.Tm_app (t2, uu____8437) -> begin
(get_tycon t2)
end
| uu____8462 -> begin
FStar_Pervasives_Native.None
end)))


let is_fstar_tactics_by_tactic : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____8470 = (

let uu____8471 = (un_uinst t)
in uu____8471.FStar_Syntax_Syntax.n)
in (match (uu____8470) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.by_tactic_lid)
end
| uu____8476 -> begin
false
end)))


let is_builtin_tactic : FStar_Ident.lident  ->  Prims.bool = (fun md -> (

let path = (FStar_Ident.path_of_lid md)
in (match (((FStar_List.length path) > (Prims.parse_int "2"))) with
| true -> begin
(

let uu____8490 = (

let uu____8494 = (FStar_List.splitAt (Prims.parse_int "2") path)
in (FStar_Pervasives_Native.fst uu____8494))
in (match (uu____8490) with
| ("FStar")::("Tactics")::[] -> begin
true
end
| ("FStar")::("Reflection")::[] -> begin
true
end
| uu____8526 -> begin
false
end))
end
| uu____8531 -> begin
false
end)))


let ktype : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (FStar_Syntax_Syntax.U_unknown)) FStar_Pervasives_Native.None FStar_Range.dummyRange)


let ktype0 : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (FStar_Syntax_Syntax.U_zero)) FStar_Pervasives_Native.None FStar_Range.dummyRange)


let type_u : unit  ->  (FStar_Syntax_Syntax.typ * FStar_Syntax_Syntax.universe) = (fun uu____8545 -> (

let u = (

let uu____8551 = (FStar_Syntax_Unionfind.univ_fresh ())
in (FStar_All.pipe_left (fun _0_2 -> FStar_Syntax_Syntax.U_unif (_0_2)) uu____8551))
in (

let uu____8568 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (u)) FStar_Pervasives_Native.None FStar_Range.dummyRange)
in ((uu____8568), (u)))))


let attr_eq : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun a a' -> (

let uu____8581 = (eq_tm a a')
in (match (uu____8581) with
| Equal -> begin
true
end
| uu____8584 -> begin
false
end)))


let attr_substitute : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (

let uu____8589 = (

let uu____8596 = (

let uu____8597 = (

let uu____8598 = (FStar_Ident.lid_of_path (("FStar")::("Pervasives")::("Substitute")::[]) FStar_Range.dummyRange)
in (FStar_Syntax_Syntax.lid_as_fv uu____8598 FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None))
in FStar_Syntax_Syntax.Tm_fvar (uu____8597))
in (FStar_Syntax_Syntax.mk uu____8596))
in (uu____8589 FStar_Pervasives_Native.None FStar_Range.dummyRange))


let exp_true_bool : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool (true))) FStar_Pervasives_Native.None FStar_Range.dummyRange)


let exp_false_bool : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool (false))) FStar_Pervasives_Native.None FStar_Range.dummyRange)


let exp_unit : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_unit)) FStar_Pervasives_Native.None FStar_Range.dummyRange)


let exp_int : Prims.string  ->  FStar_Syntax_Syntax.term = (fun s -> (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int (((s), (FStar_Pervasives_Native.None))))) FStar_Pervasives_Native.None FStar_Range.dummyRange))


let exp_char : FStar_BaseTypes.char  ->  FStar_Syntax_Syntax.term = (fun c -> (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_char (c))) FStar_Pervasives_Native.None FStar_Range.dummyRange))


let exp_string : Prims.string  ->  FStar_Syntax_Syntax.term = (fun s -> (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_string (((s), (FStar_Range.dummyRange))))) FStar_Pervasives_Native.None FStar_Range.dummyRange))


let fvar_const : FStar_Ident.lident  ->  FStar_Syntax_Syntax.term = (fun l -> (FStar_Syntax_Syntax.fvar l FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None))


let tand : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.and_lid)


let tor : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.or_lid)


let timp : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.imp_lid (FStar_Syntax_Syntax.Delta_constant_at_level ((Prims.parse_int "1"))) FStar_Pervasives_Native.None)


let tiff : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.iff_lid (FStar_Syntax_Syntax.Delta_constant_at_level ((Prims.parse_int "2"))) FStar_Pervasives_Native.None)


let t_bool : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.bool_lid)


let b2t_v : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.b2t_lid)


let t_not : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.not_lid)


let t_false : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.false_lid)


let t_true : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.true_lid)


let tac_opaque_attr : FStar_Syntax_Syntax.term = (exp_string "tac_opaque")


let dm4f_bind_range_attr : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.dm4f_bind_range_attr)


let tcdecltime_attr : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.tcdecltime_attr)


let inline_let_attr : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.inline_let_attr)


let t_ctx_uvar_and_sust : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.ctx_uvar_and_subst_lid)


let mk_conj_opt : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option = (fun phi1 phi2 -> (match (phi1) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.Some (phi2)
end
| FStar_Pervasives_Native.Some (phi11) -> begin
(

let uu____8713 = (

let uu____8716 = (FStar_Range.union_ranges phi11.FStar_Syntax_Syntax.pos phi2.FStar_Syntax_Syntax.pos)
in (

let uu____8717 = (

let uu____8724 = (

let uu____8725 = (

let uu____8742 = (

let uu____8753 = (FStar_Syntax_Syntax.as_arg phi11)
in (

let uu____8762 = (

let uu____8773 = (FStar_Syntax_Syntax.as_arg phi2)
in (uu____8773)::[])
in (uu____8753)::uu____8762))
in ((tand), (uu____8742)))
in FStar_Syntax_Syntax.Tm_app (uu____8725))
in (FStar_Syntax_Syntax.mk uu____8724))
in (uu____8717 FStar_Pervasives_Native.None uu____8716)))
in FStar_Pervasives_Native.Some (uu____8713))
end))


let mk_binop : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun op_t phi1 phi2 -> (

let uu____8853 = (FStar_Range.union_ranges phi1.FStar_Syntax_Syntax.pos phi2.FStar_Syntax_Syntax.pos)
in (

let uu____8854 = (

let uu____8861 = (

let uu____8862 = (

let uu____8879 = (

let uu____8890 = (FStar_Syntax_Syntax.as_arg phi1)
in (

let uu____8899 = (

let uu____8910 = (FStar_Syntax_Syntax.as_arg phi2)
in (uu____8910)::[])
in (uu____8890)::uu____8899))
in ((op_t), (uu____8879)))
in FStar_Syntax_Syntax.Tm_app (uu____8862))
in (FStar_Syntax_Syntax.mk uu____8861))
in (uu____8854 FStar_Pervasives_Native.None uu____8853))))


let mk_neg : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun phi -> (

let uu____8970 = (

let uu____8977 = (

let uu____8978 = (

let uu____8995 = (

let uu____9006 = (FStar_Syntax_Syntax.as_arg phi)
in (uu____9006)::[])
in ((t_not), (uu____8995)))
in FStar_Syntax_Syntax.Tm_app (uu____8978))
in (FStar_Syntax_Syntax.mk uu____8977))
in (uu____8970 FStar_Pervasives_Native.None phi.FStar_Syntax_Syntax.pos)))


let mk_conj : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun phi1 phi2 -> (mk_binop tand phi1 phi2))


let mk_conj_l : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax Prims.list  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun phi -> (match (phi) with
| [] -> begin
(FStar_Syntax_Syntax.fvar FStar_Parser_Const.true_lid FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None)
end
| (hd1)::tl1 -> begin
(FStar_List.fold_right mk_conj tl1 hd1)
end))


let mk_disj : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun phi1 phi2 -> (mk_binop tor phi1 phi2))


let mk_disj_l : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax Prims.list  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun phi -> (match (phi) with
| [] -> begin
t_false
end
| (hd1)::tl1 -> begin
(FStar_List.fold_right mk_disj tl1 hd1)
end))


let mk_imp : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term = (fun phi1 phi2 -> (mk_binop timp phi1 phi2))


let mk_iff : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term = (fun phi1 phi2 -> (mk_binop tiff phi1 phi2))


let b2t : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun e -> (

let uu____9206 = (

let uu____9213 = (

let uu____9214 = (

let uu____9231 = (

let uu____9242 = (FStar_Syntax_Syntax.as_arg e)
in (uu____9242)::[])
in ((b2t_v), (uu____9231)))
in FStar_Syntax_Syntax.Tm_app (uu____9214))
in (FStar_Syntax_Syntax.mk uu____9213))
in (uu____9206 FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos)))


let is_t_true : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____9289 = (

let uu____9290 = (unmeta t)
in uu____9290.FStar_Syntax_Syntax.n)
in (match (uu____9289) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.true_lid)
end
| uu____9295 -> begin
false
end)))


let mk_conj_simp : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t1 t2 -> (

let uu____9318 = (is_t_true t1)
in (match (uu____9318) with
| true -> begin
t2
end
| uu____9323 -> begin
(

let uu____9325 = (is_t_true t2)
in (match (uu____9325) with
| true -> begin
t1
end
| uu____9330 -> begin
(mk_conj t1 t2)
end))
end)))


let mk_disj_simp : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t1 t2 -> (

let uu____9353 = (is_t_true t1)
in (match (uu____9353) with
| true -> begin
t_true
end
| uu____9358 -> begin
(

let uu____9360 = (is_t_true t2)
in (match (uu____9360) with
| true -> begin
t_true
end
| uu____9365 -> begin
(mk_disj t1 t2)
end))
end)))


let teq : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.eq2_lid)


let mk_untyped_eq2 : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun e1 e2 -> (

let uu____9389 = (FStar_Range.union_ranges e1.FStar_Syntax_Syntax.pos e2.FStar_Syntax_Syntax.pos)
in (

let uu____9390 = (

let uu____9397 = (

let uu____9398 = (

let uu____9415 = (

let uu____9426 = (FStar_Syntax_Syntax.as_arg e1)
in (

let uu____9435 = (

let uu____9446 = (FStar_Syntax_Syntax.as_arg e2)
in (uu____9446)::[])
in (uu____9426)::uu____9435))
in ((teq), (uu____9415)))
in FStar_Syntax_Syntax.Tm_app (uu____9398))
in (FStar_Syntax_Syntax.mk uu____9397))
in (uu____9390 FStar_Pervasives_Native.None uu____9389))))


let mk_eq2 : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun u t e1 e2 -> (

let eq_inst = (FStar_Syntax_Syntax.mk_Tm_uinst teq ((u)::[]))
in (

let uu____9516 = (FStar_Range.union_ranges e1.FStar_Syntax_Syntax.pos e2.FStar_Syntax_Syntax.pos)
in (

let uu____9517 = (

let uu____9524 = (

let uu____9525 = (

let uu____9542 = (

let uu____9553 = (FStar_Syntax_Syntax.iarg t)
in (

let uu____9562 = (

let uu____9573 = (FStar_Syntax_Syntax.as_arg e1)
in (

let uu____9582 = (

let uu____9593 = (FStar_Syntax_Syntax.as_arg e2)
in (uu____9593)::[])
in (uu____9573)::uu____9582))
in (uu____9553)::uu____9562))
in ((eq_inst), (uu____9542)))
in FStar_Syntax_Syntax.Tm_app (uu____9525))
in (FStar_Syntax_Syntax.mk uu____9524))
in (uu____9517 FStar_Pervasives_Native.None uu____9516)))))


let mk_has_type : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t x t' -> (

let t_has_type = (fvar_const FStar_Parser_Const.has_type_lid)
in (

let t_has_type1 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_uinst (((t_has_type), ((FStar_Syntax_Syntax.U_zero)::(FStar_Syntax_Syntax.U_zero)::[])))) FStar_Pervasives_Native.None FStar_Range.dummyRange)
in (

let uu____9673 = (

let uu____9680 = (

let uu____9681 = (

let uu____9698 = (

let uu____9709 = (FStar_Syntax_Syntax.iarg t)
in (

let uu____9718 = (

let uu____9729 = (FStar_Syntax_Syntax.as_arg x)
in (

let uu____9738 = (

let uu____9749 = (FStar_Syntax_Syntax.as_arg t')
in (uu____9749)::[])
in (uu____9729)::uu____9738))
in (uu____9709)::uu____9718))
in ((t_has_type1), (uu____9698)))
in FStar_Syntax_Syntax.Tm_app (uu____9681))
in (FStar_Syntax_Syntax.mk uu____9680))
in (uu____9673 FStar_Pervasives_Native.None FStar_Range.dummyRange)))))


let mk_with_type : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun u t e -> (

let t_with_type = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.with_type_lid FStar_Syntax_Syntax.delta_equational FStar_Pervasives_Native.None)
in (

let t_with_type1 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_uinst (((t_with_type), ((u)::[])))) FStar_Pervasives_Native.None FStar_Range.dummyRange)
in (

let uu____9829 = (

let uu____9836 = (

let uu____9837 = (

let uu____9854 = (

let uu____9865 = (FStar_Syntax_Syntax.iarg t)
in (

let uu____9874 = (

let uu____9885 = (FStar_Syntax_Syntax.as_arg e)
in (uu____9885)::[])
in (uu____9865)::uu____9874))
in ((t_with_type1), (uu____9854)))
in FStar_Syntax_Syntax.Tm_app (uu____9837))
in (FStar_Syntax_Syntax.mk uu____9836))
in (uu____9829 FStar_Pervasives_Native.None FStar_Range.dummyRange)))))


let lex_t : FStar_Syntax_Syntax.term = (fvar_const FStar_Parser_Const.lex_t_lid)


let lex_top : FStar_Syntax_Syntax.term = (

let uu____9935 = (

let uu____9942 = (

let uu____9943 = (

let uu____9950 = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.lextop_lid FStar_Syntax_Syntax.delta_constant (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)))
in ((uu____9950), ((FStar_Syntax_Syntax.U_zero)::[])))
in FStar_Syntax_Syntax.Tm_uinst (uu____9943))
in (FStar_Syntax_Syntax.mk uu____9942))
in (uu____9935 FStar_Pervasives_Native.None FStar_Range.dummyRange))


let lex_pair : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.lexcons_lid FStar_Syntax_Syntax.delta_constant (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)))


let tforall : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.forall_lid (FStar_Syntax_Syntax.Delta_constant_at_level ((Prims.parse_int "1"))) FStar_Pervasives_Native.None)


let t_haseq : FStar_Syntax_Syntax.term = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.haseq_lid FStar_Syntax_Syntax.delta_constant FStar_Pervasives_Native.None)


let lcomp_of_comp : FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.lcomp = (fun c0 -> (

let uu____9968 = (match (c0.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Total (uu____9981) -> begin
((FStar_Parser_Const.effect_Tot_lid), ((FStar_Syntax_Syntax.TOTAL)::[]))
end
| FStar_Syntax_Syntax.GTotal (uu____9992) -> begin
((FStar_Parser_Const.effect_GTot_lid), ((FStar_Syntax_Syntax.SOMETRIVIAL)::[]))
end
| FStar_Syntax_Syntax.Comp (c) -> begin
((c.FStar_Syntax_Syntax.effect_name), (c.FStar_Syntax_Syntax.flags))
end)
in (match (uu____9968) with
| (eff_name, flags1) -> begin
(FStar_Syntax_Syntax.mk_lcomp eff_name (comp_result c0) flags1 (fun uu____10013 -> c0))
end)))


let mk_residual_comp : FStar_Ident.lident  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option  ->  FStar_Syntax_Syntax.cflag Prims.list  ->  FStar_Syntax_Syntax.residual_comp = (fun l t f -> {FStar_Syntax_Syntax.residual_effect = l; FStar_Syntax_Syntax.residual_typ = t; FStar_Syntax_Syntax.residual_flags = f})


let residual_tot : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.residual_comp = (fun t -> {FStar_Syntax_Syntax.residual_effect = FStar_Parser_Const.effect_Tot_lid; FStar_Syntax_Syntax.residual_typ = FStar_Pervasives_Native.Some (t); FStar_Syntax_Syntax.residual_flags = (FStar_Syntax_Syntax.TOTAL)::[]})


let residual_comp_of_comp : FStar_Syntax_Syntax.comp  ->  FStar_Syntax_Syntax.residual_comp = (fun c -> {FStar_Syntax_Syntax.residual_effect = (comp_effect_name c); FStar_Syntax_Syntax.residual_typ = FStar_Pervasives_Native.Some ((comp_result c)); FStar_Syntax_Syntax.residual_flags = (comp_flags c)})


let residual_comp_of_lcomp : FStar_Syntax_Syntax.lcomp  ->  FStar_Syntax_Syntax.residual_comp = (fun lc -> {FStar_Syntax_Syntax.residual_effect = lc.FStar_Syntax_Syntax.eff_name; FStar_Syntax_Syntax.residual_typ = FStar_Pervasives_Native.Some (lc.FStar_Syntax_Syntax.res_typ); FStar_Syntax_Syntax.residual_flags = lc.FStar_Syntax_Syntax.cflags})


let mk_forall_aux : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun fa x body -> (

let uu____10096 = (

let uu____10103 = (

let uu____10104 = (

let uu____10121 = (

let uu____10132 = (FStar_Syntax_Syntax.iarg x.FStar_Syntax_Syntax.sort)
in (

let uu____10141 = (

let uu____10152 = (

let uu____10161 = (

let uu____10162 = (

let uu____10163 = (FStar_Syntax_Syntax.mk_binder x)
in (uu____10163)::[])
in (abs uu____10162 body (FStar_Pervasives_Native.Some ((residual_tot ktype0)))))
in (FStar_Syntax_Syntax.as_arg uu____10161))
in (uu____10152)::[])
in (uu____10132)::uu____10141))
in ((fa), (uu____10121)))
in FStar_Syntax_Syntax.Tm_app (uu____10104))
in (FStar_Syntax_Syntax.mk uu____10103))
in (uu____10096 FStar_Pervasives_Native.None FStar_Range.dummyRange)))


let mk_forall_no_univ : FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ = (fun x body -> (mk_forall_aux tforall x body))


let mk_forall : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ = (fun u x body -> (

let tforall1 = (FStar_Syntax_Syntax.mk_Tm_uinst tforall ((u)::[]))
in (mk_forall_aux tforall1 x body)))


let close_forall_no_univs : (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option) Prims.list  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.typ = (fun bs f -> (FStar_List.fold_right (fun b f1 -> (

let uu____10293 = (FStar_Syntax_Syntax.is_null_binder b)
in (match (uu____10293) with
| true -> begin
f1
end
| uu____10296 -> begin
(mk_forall_no_univ (FStar_Pervasives_Native.fst b) f1)
end))) bs f))


let rec is_wild_pat : FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t  ->  Prims.bool = (fun p -> (match (p.FStar_Syntax_Syntax.v) with
| FStar_Syntax_Syntax.Pat_wild (uu____10312) -> begin
true
end
| uu____10314 -> begin
false
end))


let if_then_else : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun b t1 t2 -> (

let then_branch = (

let uu____10361 = (FStar_Syntax_Syntax.withinfo (FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool (true))) t1.FStar_Syntax_Syntax.pos)
in ((uu____10361), (FStar_Pervasives_Native.None), (t1)))
in (

let else_branch = (

let uu____10390 = (FStar_Syntax_Syntax.withinfo (FStar_Syntax_Syntax.Pat_constant (FStar_Const.Const_bool (false))) t2.FStar_Syntax_Syntax.pos)
in ((uu____10390), (FStar_Pervasives_Native.None), (t2)))
in (

let uu____10404 = (

let uu____10405 = (FStar_Range.union_ranges t1.FStar_Syntax_Syntax.pos t2.FStar_Syntax_Syntax.pos)
in (FStar_Range.union_ranges b.FStar_Syntax_Syntax.pos uu____10405))
in (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_match (((b), ((then_branch)::(else_branch)::[])))) FStar_Pervasives_Native.None uu____10404)))))


let mk_squash : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun u p -> (

let sq = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.squash_lid (FStar_Syntax_Syntax.Delta_constant_at_level ((Prims.parse_int "1"))) FStar_Pervasives_Native.None)
in (

let uu____10481 = (FStar_Syntax_Syntax.mk_Tm_uinst sq ((u)::[]))
in (

let uu____10484 = (

let uu____10495 = (FStar_Syntax_Syntax.as_arg p)
in (uu____10495)::[])
in (mk_app uu____10481 uu____10484)))))


let mk_auto_squash : FStar_Syntax_Syntax.universe  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun u p -> (

let sq = (FStar_Syntax_Syntax.fvar FStar_Parser_Const.auto_squash_lid (FStar_Syntax_Syntax.Delta_constant_at_level ((Prims.parse_int "2"))) FStar_Pervasives_Native.None)
in (

let uu____10535 = (FStar_Syntax_Syntax.mk_Tm_uinst sq ((u)::[]))
in (

let uu____10538 = (

let uu____10549 = (FStar_Syntax_Syntax.as_arg p)
in (uu____10549)::[])
in (mk_app uu____10535 uu____10538)))))


let un_squash : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option = (fun t -> (

let uu____10584 = (head_and_args t)
in (match (uu____10584) with
| (head1, args) -> begin
(

let head2 = (unascribe head1)
in (

let head3 = (un_uinst head2)
in (

let uu____10633 = (

let uu____10648 = (

let uu____10649 = (FStar_Syntax_Subst.compress head3)
in uu____10649.FStar_Syntax_Syntax.n)
in ((uu____10648), (args)))
in (match (uu____10633) with
| (FStar_Syntax_Syntax.Tm_fvar (fv), ((p, uu____10668))::[]) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.squash_lid) -> begin
FStar_Pervasives_Native.Some (p)
end
| (FStar_Syntax_Syntax.Tm_refine (b, p), []) -> begin
(match (b.FStar_Syntax_Syntax.sort.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_fvar (fv) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.unit_lid) -> begin
(

let uu____10734 = (

let uu____10739 = (

let uu____10740 = (FStar_Syntax_Syntax.mk_binder b)
in (uu____10740)::[])
in (FStar_Syntax_Subst.open_term uu____10739 p))
in (match (uu____10734) with
| (bs, p1) -> begin
(

let b1 = (match (bs) with
| (b1)::[] -> begin
b1
end
| uu____10797 -> begin
(failwith "impossible")
end)
in (

let uu____10805 = (

let uu____10807 = (FStar_Syntax_Free.names p1)
in (FStar_Util.set_mem (FStar_Pervasives_Native.fst b1) uu____10807))
in (match (uu____10805) with
| true -> begin
FStar_Pervasives_Native.None
end
| uu____10819 -> begin
FStar_Pervasives_Native.Some (p1)
end)))
end))
end
| uu____10823 -> begin
FStar_Pervasives_Native.None
end)
end
| uu____10826 -> begin
FStar_Pervasives_Native.None
end))))
end)))


let is_squash : FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.universe * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax) FStar_Pervasives_Native.option = (fun t -> (

let uu____10857 = (head_and_args t)
in (match (uu____10857) with
| (head1, args) -> begin
(

let uu____10908 = (

let uu____10923 = (

let uu____10924 = (FStar_Syntax_Subst.compress head1)
in uu____10924.FStar_Syntax_Syntax.n)
in ((uu____10923), (args)))
in (match (uu____10908) with
| (FStar_Syntax_Syntax.Tm_uinst ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (fv); FStar_Syntax_Syntax.pos = uu____10946; FStar_Syntax_Syntax.vars = uu____10947}, (u)::[]), ((t1, uu____10950))::[]) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.squash_lid) -> begin
FStar_Pervasives_Native.Some (((u), (t1)))
end
| uu____10997 -> begin
FStar_Pervasives_Native.None
end))
end)))


let is_auto_squash : FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.universe * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax) FStar_Pervasives_Native.option = (fun t -> (

let uu____11032 = (head_and_args t)
in (match (uu____11032) with
| (head1, args) -> begin
(

let uu____11083 = (

let uu____11098 = (

let uu____11099 = (FStar_Syntax_Subst.compress head1)
in uu____11099.FStar_Syntax_Syntax.n)
in ((uu____11098), (args)))
in (match (uu____11083) with
| (FStar_Syntax_Syntax.Tm_uinst ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (fv); FStar_Syntax_Syntax.pos = uu____11121; FStar_Syntax_Syntax.vars = uu____11122}, (u)::[]), ((t1, uu____11125))::[]) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.auto_squash_lid) -> begin
FStar_Pervasives_Native.Some (((u), (t1)))
end
| uu____11172 -> begin
FStar_Pervasives_Native.None
end))
end)))


let is_sub_singleton : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____11200 = (

let uu____11217 = (unmeta t)
in (head_and_args uu____11217))
in (match (uu____11200) with
| (head1, uu____11220) -> begin
(

let uu____11245 = (

let uu____11246 = (un_uinst head1)
in uu____11246.FStar_Syntax_Syntax.n)
in (match (uu____11245) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
((((((((((((((((((FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.squash_lid) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.auto_squash_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.and_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.or_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.not_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.imp_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.iff_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.ite_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.exists_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.forall_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.true_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.false_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.eq2_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.eq3_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.b2t_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.haseq_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.has_type_lid)) || (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.precedes_lid))
end
| uu____11251 -> begin
false
end))
end)))


let arrow_one : FStar_Syntax_Syntax.typ  ->  (FStar_Syntax_Syntax.binder * FStar_Syntax_Syntax.comp) FStar_Pervasives_Native.option = (fun t -> (

let uu____11271 = (

let uu____11284 = (

let uu____11285 = (FStar_Syntax_Subst.compress t)
in uu____11285.FStar_Syntax_Syntax.n)
in (match (uu____11284) with
| FStar_Syntax_Syntax.Tm_arrow ([], c) -> begin
(failwith "fatal: empty binders on arrow?")
end
| FStar_Syntax_Syntax.Tm_arrow ((b)::[], c) -> begin
FStar_Pervasives_Native.Some (((b), (c)))
end
| FStar_Syntax_Syntax.Tm_arrow ((b)::bs, c) -> begin
(

let uu____11415 = (

let uu____11426 = (

let uu____11427 = (arrow bs c)
in (FStar_Syntax_Syntax.mk_Total uu____11427))
in ((b), (uu____11426)))
in FStar_Pervasives_Native.Some (uu____11415))
end
| uu____11444 -> begin
FStar_Pervasives_Native.None
end))
in (FStar_Util.bind_opt uu____11271 (fun uu____11482 -> (match (uu____11482) with
| (b, c) -> begin
(

let uu____11519 = (FStar_Syntax_Subst.open_comp ((b)::[]) c)
in (match (uu____11519) with
| (bs, c1) -> begin
(

let b1 = (match (bs) with
| (b1)::[] -> begin
b1
end
| uu____11582 -> begin
(failwith "impossible: open_comp returned different amount of binders")
end)
in FStar_Pervasives_Native.Some (((b1), (c1))))
end))
end)))))


let is_free_in : FStar_Syntax_Syntax.bv  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun bv t -> (

let uu____11619 = (FStar_Syntax_Free.names t)
in (FStar_Util.set_mem bv uu____11619)))


type qpats =
FStar_Syntax_Syntax.args Prims.list

type connective =
| QAll of (FStar_Syntax_Syntax.binders * qpats * FStar_Syntax_Syntax.typ)
| QEx of (FStar_Syntax_Syntax.binders * qpats * FStar_Syntax_Syntax.typ)
| BaseConn of (FStar_Ident.lident * FStar_Syntax_Syntax.args)


let uu___is_QAll : connective  ->  Prims.bool = (fun projectee -> (match (projectee) with
| QAll (_0) -> begin
true
end
| uu____11671 -> begin
false
end))


let __proj__QAll__item___0 : connective  ->  (FStar_Syntax_Syntax.binders * qpats * FStar_Syntax_Syntax.typ) = (fun projectee -> (match (projectee) with
| QAll (_0) -> begin
_0
end))


let uu___is_QEx : connective  ->  Prims.bool = (fun projectee -> (match (projectee) with
| QEx (_0) -> begin
true
end
| uu____11715 -> begin
false
end))


let __proj__QEx__item___0 : connective  ->  (FStar_Syntax_Syntax.binders * qpats * FStar_Syntax_Syntax.typ) = (fun projectee -> (match (projectee) with
| QEx (_0) -> begin
_0
end))


let uu___is_BaseConn : connective  ->  Prims.bool = (fun projectee -> (match (projectee) with
| BaseConn (_0) -> begin
true
end
| uu____11757 -> begin
false
end))


let __proj__BaseConn__item___0 : connective  ->  (FStar_Ident.lident * FStar_Syntax_Syntax.args) = (fun projectee -> (match (projectee) with
| BaseConn (_0) -> begin
_0
end))


let destruct_typ_as_formula : FStar_Syntax_Syntax.term  ->  connective FStar_Pervasives_Native.option = (fun f -> (

let rec unmeta_monadic = (fun f1 -> (

let f2 = (FStar_Syntax_Subst.compress f1)
in (match (f2.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_meta (t, FStar_Syntax_Syntax.Meta_monadic (uu____11797)) -> begin
(unmeta_monadic t)
end
| FStar_Syntax_Syntax.Tm_meta (t, FStar_Syntax_Syntax.Meta_monadic_lift (uu____11809)) -> begin
(unmeta_monadic t)
end
| uu____11822 -> begin
f2
end)))
in (

let destruct_base_conn = (fun f1 -> (

let connectives = (((FStar_Parser_Const.true_lid), ((Prims.parse_int "0"))))::(((FStar_Parser_Const.false_lid), ((Prims.parse_int "0"))))::(((FStar_Parser_Const.and_lid), ((Prims.parse_int "2"))))::(((FStar_Parser_Const.or_lid), ((Prims.parse_int "2"))))::(((FStar_Parser_Const.imp_lid), ((Prims.parse_int "2"))))::(((FStar_Parser_Const.iff_lid), ((Prims.parse_int "2"))))::(((FStar_Parser_Const.ite_lid), ((Prims.parse_int "3"))))::(((FStar_Parser_Const.not_lid), ((Prims.parse_int "1"))))::(((FStar_Parser_Const.eq2_lid), ((Prims.parse_int "3"))))::(((FStar_Parser_Const.eq2_lid), ((Prims.parse_int "2"))))::(((FStar_Parser_Const.eq3_lid), ((Prims.parse_int "4"))))::(((FStar_Parser_Const.eq3_lid), ((Prims.parse_int "2"))))::[]
in (

let aux = (fun f2 uu____11918 -> (match (uu____11918) with
| (lid, arity) -> begin
(

let uu____11927 = (

let uu____11944 = (unmeta_monadic f2)
in (head_and_args uu____11944))
in (match (uu____11927) with
| (t, args) -> begin
(

let t1 = (un_uinst t)
in (

let uu____11974 = ((is_constructor t1 lid) && (Prims.op_Equality (FStar_List.length args) arity))
in (match (uu____11974) with
| true -> begin
FStar_Pervasives_Native.Some (BaseConn (((lid), (args))))
end
| uu____11991 -> begin
FStar_Pervasives_Native.None
end)))
end))
end))
in (FStar_Util.find_map connectives (aux f1)))))
in (

let patterns = (fun t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_meta (t2, FStar_Syntax_Syntax.Meta_pattern (pats)) -> begin
(

let uu____12054 = (FStar_Syntax_Subst.compress t2)
in ((pats), (uu____12054)))
end
| uu____12067 -> begin
(([]), (t1))
end)))
in (

let destruct_q_conn = (fun t -> (

let is_q = (fun fa fv -> (match (fa) with
| true -> begin
(is_forall fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
end
| uu____12114 -> begin
(is_exists fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
end))
in (

let flat = (fun t1 -> (

let uu____12134 = (head_and_args t1)
in (match (uu____12134) with
| (t2, args) -> begin
(

let uu____12189 = (un_uinst t2)
in (

let uu____12190 = (FStar_All.pipe_right args (FStar_List.map (fun uu____12231 -> (match (uu____12231) with
| (t3, imp) -> begin
(

let uu____12250 = (unascribe t3)
in ((uu____12250), (imp)))
end))))
in ((uu____12189), (uu____12190))))
end)))
in (

let rec aux = (fun qopt out t1 -> (

let uu____12301 = (

let uu____12325 = (flat t1)
in ((qopt), (uu____12325)))
in (match (uu____12301) with
| (FStar_Pervasives_Native.Some (fa), ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (tc); FStar_Syntax_Syntax.pos = uu____12365; FStar_Syntax_Syntax.vars = uu____12366}, (({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_abs ((b)::[], t2, uu____12369); FStar_Syntax_Syntax.pos = uu____12370; FStar_Syntax_Syntax.vars = uu____12371}, uu____12372))::[])) when (is_q fa tc) -> begin
(aux qopt ((b)::out) t2)
end
| (FStar_Pervasives_Native.Some (fa), ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (tc); FStar_Syntax_Syntax.pos = uu____12474; FStar_Syntax_Syntax.vars = uu____12475}, (uu____12476)::(({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_abs ((b)::[], t2, uu____12479); FStar_Syntax_Syntax.pos = uu____12480; FStar_Syntax_Syntax.vars = uu____12481}, uu____12482))::[])) when (is_q fa tc) -> begin
(aux qopt ((b)::out) t2)
end
| (FStar_Pervasives_Native.None, ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (tc); FStar_Syntax_Syntax.pos = uu____12599; FStar_Syntax_Syntax.vars = uu____12600}, (({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_abs ((b)::[], t2, uu____12603); FStar_Syntax_Syntax.pos = uu____12604; FStar_Syntax_Syntax.vars = uu____12605}, uu____12606))::[])) when (is_qlid tc.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v) -> begin
(

let uu____12699 = (

let uu____12703 = (is_forall tc.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
in FStar_Pervasives_Native.Some (uu____12703))
in (aux uu____12699 ((b)::out) t2))
end
| (FStar_Pervasives_Native.None, ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar (tc); FStar_Syntax_Syntax.pos = uu____12713; FStar_Syntax_Syntax.vars = uu____12714}, (uu____12715)::(({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_abs ((b)::[], t2, uu____12718); FStar_Syntax_Syntax.pos = uu____12719; FStar_Syntax_Syntax.vars = uu____12720}, uu____12721))::[])) when (is_qlid tc.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v) -> begin
(

let uu____12830 = (

let uu____12834 = (is_forall tc.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)
in FStar_Pervasives_Native.Some (uu____12834))
in (aux uu____12830 ((b)::out) t2))
end
| (FStar_Pervasives_Native.Some (b), uu____12844) -> begin
(

let bs = (FStar_List.rev out)
in (

let uu____12897 = (FStar_Syntax_Subst.open_term bs t1)
in (match (uu____12897) with
| (bs1, t2) -> begin
(

let uu____12906 = (patterns t2)
in (match (uu____12906) with
| (pats, body) -> begin
(match (b) with
| true -> begin
FStar_Pervasives_Native.Some (QAll (((bs1), (pats), (body))))
end
| uu____12954 -> begin
FStar_Pervasives_Native.Some (QEx (((bs1), (pats), (body))))
end)
end))
end)))
end
| uu____12956 -> begin
FStar_Pervasives_Native.None
end)))
in (aux FStar_Pervasives_Native.None [] t)))))
in (

let u_connectives = (((FStar_Parser_Const.true_lid), (FStar_Parser_Const.c_true_lid), ((Prims.parse_int "0"))))::(((FStar_Parser_Const.false_lid), (FStar_Parser_Const.c_false_lid), ((Prims.parse_int "0"))))::(((FStar_Parser_Const.and_lid), (FStar_Parser_Const.c_and_lid), ((Prims.parse_int "2"))))::(((FStar_Parser_Const.or_lid), (FStar_Parser_Const.c_or_lid), ((Prims.parse_int "2"))))::[]
in (

let destruct_sq_base_conn = (fun t -> (

let uu____13048 = (un_squash t)
in (FStar_Util.bind_opt uu____13048 (fun t1 -> (

let uu____13064 = (head_and_args' t1)
in (match (uu____13064) with
| (hd1, args) -> begin
(

let uu____13103 = (

let uu____13109 = (

let uu____13110 = (un_uinst hd1)
in uu____13110.FStar_Syntax_Syntax.n)
in ((uu____13109), ((FStar_List.length args))))
in (match (uu____13103) with
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_3) when ((_0_3 = (Prims.parse_int "2")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_and_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.and_lid), (args))))
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_4) when ((_0_4 = (Prims.parse_int "2")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_or_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.or_lid), (args))))
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_5) when ((_0_5 = (Prims.parse_int "2")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_eq2_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.c_eq2_lid), (args))))
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_6) when ((_0_6 = (Prims.parse_int "3")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_eq2_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.c_eq2_lid), (args))))
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_7) when ((_0_7 = (Prims.parse_int "2")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_eq3_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.c_eq3_lid), (args))))
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_8) when ((_0_8 = (Prims.parse_int "4")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_eq3_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.c_eq3_lid), (args))))
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_9) when ((_0_9 = (Prims.parse_int "0")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_true_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.true_lid), (args))))
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), _0_10) when ((_0_10 = (Prims.parse_int "0")) && (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.c_false_lid)) -> begin
FStar_Pervasives_Native.Some (BaseConn (((FStar_Parser_Const.false_lid), (args))))
end
| uu____13140 -> begin
FStar_Pervasives_Native.None
end))
end))))))
in (

let rec destruct_sq_forall = (fun t -> (

let uu____13170 = (un_squash t)
in (FStar_Util.bind_opt uu____13170 (fun t1 -> (

let uu____13185 = (arrow_one t1)
in (match (uu____13185) with
| FStar_Pervasives_Native.Some (b, c) -> begin
(

let uu____13200 = (

let uu____13202 = (is_tot_or_gtot_comp c)
in (not (uu____13202)))
in (match (uu____13200) with
| true -> begin
FStar_Pervasives_Native.None
end
| uu____13207 -> begin
(

let q = (

let uu____13212 = (comp_to_comp_typ_nouniv c)
in uu____13212.FStar_Syntax_Syntax.result_typ)
in (

let uu____13213 = (is_free_in (FStar_Pervasives_Native.fst b) q)
in (match (uu____13213) with
| true -> begin
(

let uu____13220 = (patterns q)
in (match (uu____13220) with
| (pats, q1) -> begin
(FStar_All.pipe_left maybe_collect (FStar_Pervasives_Native.Some (QAll ((((b)::[]), (pats), (q1))))))
end))
end
| uu____13281 -> begin
(

let uu____13283 = (

let uu____13284 = (

let uu____13289 = (

let uu____13290 = (FStar_Syntax_Syntax.as_arg (FStar_Pervasives_Native.fst b).FStar_Syntax_Syntax.sort)
in (

let uu____13301 = (

let uu____13312 = (FStar_Syntax_Syntax.as_arg q)
in (uu____13312)::[])
in (uu____13290)::uu____13301))
in ((FStar_Parser_Const.imp_lid), (uu____13289)))
in BaseConn (uu____13284))
in FStar_Pervasives_Native.Some (uu____13283))
end)))
end))
end
| uu____13345 -> begin
FStar_Pervasives_Native.None
end))))))
and destruct_sq_exists = (fun t -> (

let uu____13353 = (un_squash t)
in (FStar_Util.bind_opt uu____13353 (fun t1 -> (

let uu____13384 = (head_and_args' t1)
in (match (uu____13384) with
| (hd1, args) -> begin
(

let uu____13423 = (

let uu____13438 = (

let uu____13439 = (un_uinst hd1)
in uu____13439.FStar_Syntax_Syntax.n)
in ((uu____13438), (args)))
in (match (uu____13423) with
| (FStar_Syntax_Syntax.Tm_fvar (fv), ((a1, uu____13456))::((a2, uu____13458))::[]) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.dtuple2_lid) -> begin
(

let uu____13509 = (

let uu____13510 = (FStar_Syntax_Subst.compress a2)
in uu____13510.FStar_Syntax_Syntax.n)
in (match (uu____13509) with
| FStar_Syntax_Syntax.Tm_abs ((b)::[], q, uu____13517) -> begin
(

let uu____13552 = (FStar_Syntax_Subst.open_term ((b)::[]) q)
in (match (uu____13552) with
| (bs, q1) -> begin
(

let b1 = (match (bs) with
| (b1)::[] -> begin
b1
end
| uu____13605 -> begin
(failwith "impossible")
end)
in (

let uu____13613 = (patterns q1)
in (match (uu____13613) with
| (pats, q2) -> begin
(FStar_All.pipe_left maybe_collect (FStar_Pervasives_Native.Some (QEx ((((b1)::[]), (pats), (q2))))))
end)))
end))
end
| uu____13674 -> begin
FStar_Pervasives_Native.None
end))
end
| uu____13675 -> begin
FStar_Pervasives_Native.None
end))
end))))))
and maybe_collect = (fun f1 -> (match (f1) with
| FStar_Pervasives_Native.Some (QAll (bs, pats, phi)) -> begin
(

let uu____13698 = (destruct_sq_forall phi)
in (match (uu____13698) with
| FStar_Pervasives_Native.Some (QAll (bs', pats', psi)) -> begin
(FStar_All.pipe_left (fun _0_11 -> FStar_Pervasives_Native.Some (_0_11)) (QAll ((((FStar_List.append bs bs')), ((FStar_List.append pats pats')), (psi)))))
end
| uu____13714 -> begin
f1
end))
end
| FStar_Pervasives_Native.Some (QEx (bs, pats, phi)) -> begin
(

let uu____13720 = (destruct_sq_exists phi)
in (match (uu____13720) with
| FStar_Pervasives_Native.Some (QEx (bs', pats', psi)) -> begin
(FStar_All.pipe_left (fun _0_12 -> FStar_Pervasives_Native.Some (_0_12)) (QEx ((((FStar_List.append bs bs')), ((FStar_List.append pats pats')), (psi)))))
end
| uu____13736 -> begin
f1
end))
end
| uu____13739 -> begin
f1
end))
in (

let phi = (unmeta_monadic f)
in (

let uu____13743 = (destruct_base_conn phi)
in (FStar_Util.catch_opt uu____13743 (fun uu____13748 -> (

let uu____13749 = (destruct_q_conn phi)
in (FStar_Util.catch_opt uu____13749 (fun uu____13754 -> (

let uu____13755 = (destruct_sq_base_conn phi)
in (FStar_Util.catch_opt uu____13755 (fun uu____13760 -> (

let uu____13761 = (destruct_sq_forall phi)
in (FStar_Util.catch_opt uu____13761 (fun uu____13766 -> (

let uu____13767 = (destruct_sq_exists phi)
in (FStar_Util.catch_opt uu____13767 (fun uu____13771 -> FStar_Pervasives_Native.None))))))))))))))))))))))))


let unthunk_lemma_post : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t -> (

let uu____13784 = (

let uu____13785 = (FStar_Syntax_Subst.compress t)
in uu____13785.FStar_Syntax_Syntax.n)
in (match (uu____13784) with
| FStar_Syntax_Syntax.Tm_abs ((b)::[], e, uu____13792) -> begin
(

let uu____13827 = (FStar_Syntax_Subst.open_term ((b)::[]) e)
in (match (uu____13827) with
| (bs, e1) -> begin
(

let b1 = (FStar_List.hd bs)
in (

let uu____13861 = (is_free_in (FStar_Pervasives_Native.fst b1) e1)
in (match (uu____13861) with
| true -> begin
(

let uu____13868 = (

let uu____13879 = (FStar_Syntax_Syntax.as_arg exp_unit)
in (uu____13879)::[])
in (mk_app t uu____13868))
end
| uu____13904 -> begin
e1
end)))
end))
end
| uu____13906 -> begin
(

let uu____13907 = (

let uu____13918 = (FStar_Syntax_Syntax.as_arg exp_unit)
in (uu____13918)::[])
in (mk_app t uu____13907))
end)))


let action_as_lb : FStar_Ident.lident  ->  FStar_Syntax_Syntax.action  ->  FStar_Range.range  ->  FStar_Syntax_Syntax.sigelt = (fun eff_lid a pos -> (

let lb = (

let uu____13960 = (

let uu____13965 = (FStar_Syntax_Syntax.lid_as_fv a.FStar_Syntax_Syntax.action_name FStar_Syntax_Syntax.delta_equational FStar_Pervasives_Native.None)
in FStar_Util.Inr (uu____13965))
in (

let uu____13966 = (

let uu____13967 = (FStar_Syntax_Syntax.mk_Total a.FStar_Syntax_Syntax.action_typ)
in (arrow a.FStar_Syntax_Syntax.action_params uu____13967))
in (

let uu____13970 = (abs a.FStar_Syntax_Syntax.action_params a.FStar_Syntax_Syntax.action_defn FStar_Pervasives_Native.None)
in (close_univs_and_mk_letbinding FStar_Pervasives_Native.None uu____13960 a.FStar_Syntax_Syntax.action_univs uu____13966 FStar_Parser_Const.effect_Tot_lid uu____13970 [] pos))))
in {FStar_Syntax_Syntax.sigel = FStar_Syntax_Syntax.Sig_let (((((false), ((lb)::[]))), ((a.FStar_Syntax_Syntax.action_name)::[]))); FStar_Syntax_Syntax.sigrng = a.FStar_Syntax_Syntax.action_defn.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.sigquals = (FStar_Syntax_Syntax.Visible_default)::(FStar_Syntax_Syntax.Action (eff_lid))::[]; FStar_Syntax_Syntax.sigmeta = FStar_Syntax_Syntax.default_sigmeta; FStar_Syntax_Syntax.sigattrs = []}))


let mk_reify : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t -> (

let reify_1 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify)) FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos)
in (

let uu____13996 = (

let uu____14003 = (

let uu____14004 = (

let uu____14021 = (

let uu____14032 = (FStar_Syntax_Syntax.as_arg t)
in (uu____14032)::[])
in ((reify_1), (uu____14021)))
in FStar_Syntax_Syntax.Tm_app (uu____14004))
in (FStar_Syntax_Syntax.mk uu____14003))
in (uu____13996 FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos))))


let mk_reflect : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax = (fun t -> (

let reflect_ = (

let uu____14087 = (

let uu____14094 = (

let uu____14095 = (

let uu____14096 = (FStar_Ident.lid_of_str "Bogus.Effect")
in FStar_Const.Const_reflect (uu____14096))
in FStar_Syntax_Syntax.Tm_constant (uu____14095))
in (FStar_Syntax_Syntax.mk uu____14094))
in (uu____14087 FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos))
in (

let uu____14101 = (

let uu____14108 = (

let uu____14109 = (

let uu____14126 = (

let uu____14137 = (FStar_Syntax_Syntax.as_arg t)
in (uu____14137)::[])
in ((reflect_), (uu____14126)))
in FStar_Syntax_Syntax.Tm_app (uu____14109))
in (FStar_Syntax_Syntax.mk uu____14108))
in (uu____14101 FStar_Pervasives_Native.None t.FStar_Syntax_Syntax.pos))))


let rec delta_qualifier : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.delta_depth = (fun t -> (

let t1 = (FStar_Syntax_Subst.compress t)
in (match (t1.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_delayed (uu____14184) -> begin
(failwith "Impossible")
end
| FStar_Syntax_Syntax.Tm_lazy (i) -> begin
(

let uu____14209 = (unfold_lazy i)
in (delta_qualifier uu____14209))
end
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
fv.FStar_Syntax_Syntax.fv_delta
end
| FStar_Syntax_Syntax.Tm_bvar (uu____14211) -> begin
FStar_Syntax_Syntax.delta_equational
end
| FStar_Syntax_Syntax.Tm_name (uu____14212) -> begin
FStar_Syntax_Syntax.delta_equational
end
| FStar_Syntax_Syntax.Tm_match (uu____14213) -> begin
FStar_Syntax_Syntax.delta_equational
end
| FStar_Syntax_Syntax.Tm_uvar (uu____14236) -> begin
FStar_Syntax_Syntax.delta_equational
end
| FStar_Syntax_Syntax.Tm_unknown -> begin
FStar_Syntax_Syntax.delta_equational
end
| FStar_Syntax_Syntax.Tm_type (uu____14249) -> begin
FStar_Syntax_Syntax.delta_constant
end
| FStar_Syntax_Syntax.Tm_quoted (uu____14250) -> begin
FStar_Syntax_Syntax.delta_constant
end
| FStar_Syntax_Syntax.Tm_constant (uu____14257) -> begin
FStar_Syntax_Syntax.delta_constant
end
| FStar_Syntax_Syntax.Tm_arrow (uu____14258) -> begin
FStar_Syntax_Syntax.delta_constant
end
| FStar_Syntax_Syntax.Tm_uinst (t2, uu____14274) -> begin
(delta_qualifier t2)
end
| FStar_Syntax_Syntax.Tm_refine ({FStar_Syntax_Syntax.ppname = uu____14279; FStar_Syntax_Syntax.index = uu____14280; FStar_Syntax_Syntax.sort = t2}, uu____14282) -> begin
(delta_qualifier t2)
end
| FStar_Syntax_Syntax.Tm_meta (t2, uu____14291) -> begin
(delta_qualifier t2)
end
| FStar_Syntax_Syntax.Tm_ascribed (t2, uu____14297, uu____14298) -> begin
(delta_qualifier t2)
end
| FStar_Syntax_Syntax.Tm_app (t2, uu____14340) -> begin
(delta_qualifier t2)
end
| FStar_Syntax_Syntax.Tm_abs (uu____14365, t2, uu____14367) -> begin
(delta_qualifier t2)
end
| FStar_Syntax_Syntax.Tm_let (uu____14392, t2) -> begin
(delta_qualifier t2)
end)))


let rec incr_delta_depth : FStar_Syntax_Syntax.delta_depth  ->  FStar_Syntax_Syntax.delta_depth = (fun d -> (match (d) with
| FStar_Syntax_Syntax.Delta_constant_at_level (i) -> begin
FStar_Syntax_Syntax.Delta_constant_at_level ((i + (Prims.parse_int "1")))
end
| FStar_Syntax_Syntax.Delta_equational_at_level (i) -> begin
FStar_Syntax_Syntax.Delta_equational_at_level ((i + (Prims.parse_int "1")))
end
| FStar_Syntax_Syntax.Delta_abstract (d1) -> begin
(incr_delta_depth d1)
end))


let incr_delta_qualifier : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.delta_depth = (fun t -> (

let uu____14431 = (delta_qualifier t)
in (incr_delta_depth uu____14431)))


let is_unknown : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (

let uu____14439 = (

let uu____14440 = (FStar_Syntax_Subst.compress t)
in uu____14440.FStar_Syntax_Syntax.n)
in (match (uu____14439) with
| FStar_Syntax_Syntax.Tm_unknown -> begin
true
end
| uu____14445 -> begin
false
end)))


let rec list_elements : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term Prims.list FStar_Pervasives_Native.option = (fun e -> (

let uu____14461 = (

let uu____14478 = (unmeta e)
in (head_and_args uu____14478))
in (match (uu____14461) with
| (head1, args) -> begin
(

let uu____14509 = (

let uu____14524 = (

let uu____14525 = (un_uinst head1)
in uu____14525.FStar_Syntax_Syntax.n)
in ((uu____14524), (args)))
in (match (uu____14509) with
| (FStar_Syntax_Syntax.Tm_fvar (fv), uu____14543) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.nil_lid) -> begin
FStar_Pervasives_Native.Some ([])
end
| (FStar_Syntax_Syntax.Tm_fvar (fv), (uu____14567)::((hd1, uu____14569))::((tl1, uu____14571))::[]) when (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.cons_lid) -> begin
(

let uu____14638 = (

let uu____14641 = (

let uu____14644 = (list_elements tl1)
in (FStar_Util.must uu____14644))
in (hd1)::uu____14641)
in FStar_Pervasives_Native.Some (uu____14638))
end
| uu____14653 -> begin
FStar_Pervasives_Native.None
end))
end)))


let rec apply_last : 'Auu____14677 . ('Auu____14677  ->  'Auu____14677)  ->  'Auu____14677 Prims.list  ->  'Auu____14677 Prims.list = (fun f l -> (match (l) with
| [] -> begin
(failwith "apply_last: got empty list")
end
| (a)::[] -> begin
(

let uu____14703 = (f a)
in (uu____14703)::[])
end
| (x)::xs -> begin
(

let uu____14708 = (apply_last f xs)
in (x)::uu____14708)
end))


let dm4f_lid : FStar_Syntax_Syntax.eff_decl  ->  Prims.string  ->  FStar_Ident.lident = (fun ed name -> (

let p = (FStar_Ident.path_of_lid ed.FStar_Syntax_Syntax.mname)
in (

let p' = (apply_last (fun s -> (Prims.strcat "_dm4f_" (Prims.strcat s (Prims.strcat "_" name)))) p)
in (FStar_Ident.lid_of_path p' FStar_Range.dummyRange))))


let rec mk_list : FStar_Syntax_Syntax.term  ->  FStar_Range.range  ->  FStar_Syntax_Syntax.term Prims.list  ->  FStar_Syntax_Syntax.term = (fun typ rng l -> (

let ctor = (fun l1 -> (

let uu____14763 = (

let uu____14770 = (

let uu____14771 = (FStar_Syntax_Syntax.lid_as_fv l1 FStar_Syntax_Syntax.delta_constant (FStar_Pervasives_Native.Some (FStar_Syntax_Syntax.Data_ctor)))
in FStar_Syntax_Syntax.Tm_fvar (uu____14771))
in (FStar_Syntax_Syntax.mk uu____14770))
in (uu____14763 FStar_Pervasives_Native.None rng)))
in (

let cons1 = (fun args pos -> (

let uu____14788 = (

let uu____14793 = (

let uu____14794 = (ctor FStar_Parser_Const.cons_lid)
in (FStar_Syntax_Syntax.mk_Tm_uinst uu____14794 ((FStar_Syntax_Syntax.U_zero)::[])))
in (FStar_Syntax_Syntax.mk_Tm_app uu____14793 args))
in (uu____14788 FStar_Pervasives_Native.None pos)))
in (

let nil = (fun args pos -> (

let uu____14810 = (

let uu____14815 = (

let uu____14816 = (ctor FStar_Parser_Const.nil_lid)
in (FStar_Syntax_Syntax.mk_Tm_uinst uu____14816 ((FStar_Syntax_Syntax.U_zero)::[])))
in (FStar_Syntax_Syntax.mk_Tm_app uu____14815 args))
in (uu____14810 FStar_Pervasives_Native.None pos)))
in (

let uu____14819 = (

let uu____14820 = (

let uu____14821 = (FStar_Syntax_Syntax.iarg typ)
in (uu____14821)::[])
in (nil uu____14820 rng))
in (FStar_List.fold_right (fun t a -> (

let uu____14855 = (

let uu____14856 = (FStar_Syntax_Syntax.iarg typ)
in (

let uu____14865 = (

let uu____14876 = (FStar_Syntax_Syntax.as_arg t)
in (

let uu____14885 = (

let uu____14896 = (FStar_Syntax_Syntax.as_arg a)
in (uu____14896)::[])
in (uu____14876)::uu____14885))
in (uu____14856)::uu____14865))
in (cons1 uu____14855 t.FStar_Syntax_Syntax.pos))) l uu____14819))))))


let rec eqlist : 'a . ('a  ->  'a  ->  Prims.bool)  ->  'a Prims.list  ->  'a Prims.list  ->  Prims.bool = (fun eq1 xs ys -> (match (((xs), (ys))) with
| ([], []) -> begin
true
end
| ((x)::xs1, (y)::ys1) -> begin
((eq1 x y) && (eqlist eq1 xs1 ys1))
end
| uu____15005 -> begin
false
end))


let eqsum : 'a 'b . ('a  ->  'a  ->  Prims.bool)  ->  ('b  ->  'b  ->  Prims.bool)  ->  ('a, 'b) FStar_Util.either  ->  ('a, 'b) FStar_Util.either  ->  Prims.bool = (fun e1 e2 x y -> (match (((x), (y))) with
| (FStar_Util.Inl (x1), FStar_Util.Inl (y1)) -> begin
(e1 x1 y1)
end
| (FStar_Util.Inr (x1), FStar_Util.Inr (y1)) -> begin
(e2 x1 y1)
end
| uu____15119 -> begin
false
end))


let eqprod : 'a 'b . ('a  ->  'a  ->  Prims.bool)  ->  ('b  ->  'b  ->  Prims.bool)  ->  ('a * 'b)  ->  ('a * 'b)  ->  Prims.bool = (fun e1 e2 x y -> (match (((x), (y))) with
| ((x1, x2), (y1, y2)) -> begin
((e1 x1 y1) && (e2 x2 y2))
end))


let eqopt : 'a . ('a  ->  'a  ->  Prims.bool)  ->  'a FStar_Pervasives_Native.option  ->  'a FStar_Pervasives_Native.option  ->  Prims.bool = (fun e x y -> (match (((x), (y))) with
| (FStar_Pervasives_Native.Some (x1), FStar_Pervasives_Native.Some (y1)) -> begin
(e x1 y1)
end
| uu____15285 -> begin
false
end))


let debug_term_eq : Prims.bool FStar_ST.ref = (FStar_Util.mk_ref false)


let check : Prims.string  ->  Prims.bool  ->  Prims.bool = (fun msg cond -> (match (cond) with
| true -> begin
true
end
| uu____15331 -> begin
((

let uu____15334 = (FStar_ST.op_Bang debug_term_eq)
in (match (uu____15334) with
| true -> begin
(FStar_Util.print1 ">>> term_eq failing: %s\n" msg)
end
| uu____15359 -> begin
()
end));
false;
)
end))


let fail : Prims.string  ->  Prims.bool = (fun msg -> (check msg false))


let rec term_eq_dbg : Prims.bool  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun dbg t1 t2 -> (

let t11 = (

let uu____15556 = (unmeta_safe t1)
in (canon_app uu____15556))
in (

let t21 = (

let uu____15562 = (unmeta_safe t2)
in (canon_app uu____15562))
in (

let uu____15565 = (

let uu____15570 = (

let uu____15571 = (

let uu____15574 = (un_uinst t11)
in (FStar_Syntax_Subst.compress uu____15574))
in uu____15571.FStar_Syntax_Syntax.n)
in (

let uu____15575 = (

let uu____15576 = (

let uu____15579 = (un_uinst t21)
in (FStar_Syntax_Subst.compress uu____15579))
in uu____15576.FStar_Syntax_Syntax.n)
in ((uu____15570), (uu____15575))))
in (match (uu____15565) with
| (FStar_Syntax_Syntax.Tm_uinst (uu____15581), uu____15582) -> begin
(failwith "term_eq: impossible, should have been removed")
end
| (uu____15591, FStar_Syntax_Syntax.Tm_uinst (uu____15592)) -> begin
(failwith "term_eq: impossible, should have been removed")
end
| (FStar_Syntax_Syntax.Tm_delayed (uu____15601), uu____15602) -> begin
(failwith "term_eq: impossible, should have been removed")
end
| (uu____15627, FStar_Syntax_Syntax.Tm_delayed (uu____15628)) -> begin
(failwith "term_eq: impossible, should have been removed")
end
| (FStar_Syntax_Syntax.Tm_ascribed (uu____15653), uu____15654) -> begin
(failwith "term_eq: impossible, should have been removed")
end
| (uu____15683, FStar_Syntax_Syntax.Tm_ascribed (uu____15684)) -> begin
(failwith "term_eq: impossible, should have been removed")
end
| (FStar_Syntax_Syntax.Tm_bvar (x), FStar_Syntax_Syntax.Tm_bvar (y)) -> begin
(check "bvar" (Prims.op_Equality x.FStar_Syntax_Syntax.index y.FStar_Syntax_Syntax.index))
end
| (FStar_Syntax_Syntax.Tm_name (x), FStar_Syntax_Syntax.Tm_name (y)) -> begin
(check "name" (Prims.op_Equality x.FStar_Syntax_Syntax.index y.FStar_Syntax_Syntax.index))
end
| (FStar_Syntax_Syntax.Tm_fvar (x), FStar_Syntax_Syntax.Tm_fvar (y)) -> begin
(

let uu____15723 = (FStar_Syntax_Syntax.fv_eq x y)
in (check "fvar" uu____15723))
end
| (FStar_Syntax_Syntax.Tm_constant (c1), FStar_Syntax_Syntax.Tm_constant (c2)) -> begin
(

let uu____15728 = (FStar_Const.eq_const c1 c2)
in (check "const" uu____15728))
end
| (FStar_Syntax_Syntax.Tm_type (uu____15731), FStar_Syntax_Syntax.Tm_type (uu____15732)) -> begin
true
end
| (FStar_Syntax_Syntax.Tm_abs (b1, t12, k1), FStar_Syntax_Syntax.Tm_abs (b2, t22, k2)) -> begin
((

let uu____15790 = (eqlist (binder_eq_dbg dbg) b1 b2)
in (check "abs binders" uu____15790)) && (

let uu____15800 = (term_eq_dbg dbg t12 t22)
in (check "abs bodies" uu____15800)))
end
| (FStar_Syntax_Syntax.Tm_arrow (b1, c1), FStar_Syntax_Syntax.Tm_arrow (b2, c2)) -> begin
((

let uu____15849 = (eqlist (binder_eq_dbg dbg) b1 b2)
in (check "arrow binders" uu____15849)) && (

let uu____15859 = (comp_eq_dbg dbg c1 c2)
in (check "arrow comp" uu____15859)))
end
| (FStar_Syntax_Syntax.Tm_refine (b1, t12), FStar_Syntax_Syntax.Tm_refine (b2, t22)) -> begin
((check "refine bv" (Prims.op_Equality b1.FStar_Syntax_Syntax.index b2.FStar_Syntax_Syntax.index)) && (

let uu____15877 = (term_eq_dbg dbg t12 t22)
in (check "refine formula" uu____15877)))
end
| (FStar_Syntax_Syntax.Tm_app (f1, a1), FStar_Syntax_Syntax.Tm_app (f2, a2)) -> begin
((

let uu____15934 = (term_eq_dbg dbg f1 f2)
in (check "app head" uu____15934)) && (

let uu____15938 = (eqlist (arg_eq_dbg dbg) a1 a2)
in (check "app args" uu____15938)))
end
| (FStar_Syntax_Syntax.Tm_match (t12, bs1), FStar_Syntax_Syntax.Tm_match (t22, bs2)) -> begin
((

let uu____16027 = (term_eq_dbg dbg t12 t22)
in (check "match head" uu____16027)) && (

let uu____16031 = (eqlist (branch_eq_dbg dbg) bs1 bs2)
in (check "match branches" uu____16031)))
end
| (FStar_Syntax_Syntax.Tm_lazy (uu____16048), uu____16049) -> begin
(

let uu____16050 = (

let uu____16052 = (unlazy t11)
in (term_eq_dbg dbg uu____16052 t21))
in (check "lazy_l" uu____16050))
end
| (uu____16054, FStar_Syntax_Syntax.Tm_lazy (uu____16055)) -> begin
(

let uu____16056 = (

let uu____16058 = (unlazy t21)
in (term_eq_dbg dbg t11 uu____16058))
in (check "lazy_r" uu____16056))
end
| (FStar_Syntax_Syntax.Tm_let ((b1, lbs1), t12), FStar_Syntax_Syntax.Tm_let ((b2, lbs2), t22)) -> begin
(((check "let flag" (Prims.op_Equality b1 b2)) && (

let uu____16103 = (eqlist (letbinding_eq_dbg dbg) lbs1 lbs2)
in (check "let lbs" uu____16103))) && (

let uu____16107 = (term_eq_dbg dbg t12 t22)
in (check "let body" uu____16107)))
end
| (FStar_Syntax_Syntax.Tm_uvar (u1, uu____16111), FStar_Syntax_Syntax.Tm_uvar (u2, uu____16113)) -> begin
(check "uvar" (Prims.op_Equality u1.FStar_Syntax_Syntax.ctx_uvar_head u2.FStar_Syntax_Syntax.ctx_uvar_head))
end
| (FStar_Syntax_Syntax.Tm_quoted (qt1, qi1), FStar_Syntax_Syntax.Tm_quoted (qt2, qi2)) -> begin
((

let uu____16171 = (

let uu____16173 = (eq_quoteinfo qi1 qi2)
in (Prims.op_Equality uu____16173 Equal))
in (check "tm_quoted qi" uu____16171)) && (

let uu____16176 = (term_eq_dbg dbg qt1 qt2)
in (check "tm_quoted payload" uu____16176)))
end
| (FStar_Syntax_Syntax.Tm_meta (t12, m1), FStar_Syntax_Syntax.Tm_meta (t22, m2)) -> begin
(match (((m1), (m2))) with
| (FStar_Syntax_Syntax.Meta_monadic (n1, ty1), FStar_Syntax_Syntax.Meta_monadic (n2, ty2)) -> begin
((

let uu____16206 = (FStar_Ident.lid_equals n1 n2)
in (check "meta_monadic lid" uu____16206)) && (

let uu____16210 = (term_eq_dbg dbg ty1 ty2)
in (check "meta_monadic type" uu____16210)))
end
| (FStar_Syntax_Syntax.Meta_monadic_lift (s1, t13, ty1), FStar_Syntax_Syntax.Meta_monadic_lift (s2, t23, ty2)) -> begin
(((

let uu____16229 = (FStar_Ident.lid_equals s1 s2)
in (check "meta_monadic_lift src" uu____16229)) && (

let uu____16233 = (FStar_Ident.lid_equals t13 t23)
in (check "meta_monadic_lift tgt" uu____16233))) && (

let uu____16237 = (term_eq_dbg dbg ty1 ty2)
in (check "meta_monadic_lift type" uu____16237)))
end
| uu____16240 -> begin
(fail "metas")
end)
end
| (FStar_Syntax_Syntax.Tm_unknown, uu____16246) -> begin
(fail "unk")
end
| (uu____16248, FStar_Syntax_Syntax.Tm_unknown) -> begin
(fail "unk")
end
| (FStar_Syntax_Syntax.Tm_bvar (uu____16250), uu____16251) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_name (uu____16253), uu____16254) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_fvar (uu____16256), uu____16257) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_constant (uu____16259), uu____16260) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_type (uu____16262), uu____16263) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_abs (uu____16265), uu____16266) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_arrow (uu____16286), uu____16287) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_refine (uu____16303), uu____16304) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_app (uu____16312), uu____16313) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_match (uu____16331), uu____16332) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_let (uu____16356), uu____16357) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_uvar (uu____16372), uu____16373) -> begin
(fail "bottom")
end
| (FStar_Syntax_Syntax.Tm_meta (uu____16387), uu____16388) -> begin
(fail "bottom")
end
| (uu____16396, FStar_Syntax_Syntax.Tm_bvar (uu____16397)) -> begin
(fail "bottom")
end
| (uu____16399, FStar_Syntax_Syntax.Tm_name (uu____16400)) -> begin
(fail "bottom")
end
| (uu____16402, FStar_Syntax_Syntax.Tm_fvar (uu____16403)) -> begin
(fail "bottom")
end
| (uu____16405, FStar_Syntax_Syntax.Tm_constant (uu____16406)) -> begin
(fail "bottom")
end
| (uu____16408, FStar_Syntax_Syntax.Tm_type (uu____16409)) -> begin
(fail "bottom")
end
| (uu____16411, FStar_Syntax_Syntax.Tm_abs (uu____16412)) -> begin
(fail "bottom")
end
| (uu____16432, FStar_Syntax_Syntax.Tm_arrow (uu____16433)) -> begin
(fail "bottom")
end
| (uu____16449, FStar_Syntax_Syntax.Tm_refine (uu____16450)) -> begin
(fail "bottom")
end
| (uu____16458, FStar_Syntax_Syntax.Tm_app (uu____16459)) -> begin
(fail "bottom")
end
| (uu____16477, FStar_Syntax_Syntax.Tm_match (uu____16478)) -> begin
(fail "bottom")
end
| (uu____16502, FStar_Syntax_Syntax.Tm_let (uu____16503)) -> begin
(fail "bottom")
end
| (uu____16518, FStar_Syntax_Syntax.Tm_uvar (uu____16519)) -> begin
(fail "bottom")
end
| (uu____16533, FStar_Syntax_Syntax.Tm_meta (uu____16534)) -> begin
(fail "bottom")
end)))))
and arg_eq_dbg : Prims.bool  ->  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option)  ->  (FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option)  ->  Prims.bool = (fun dbg a1 a2 -> (eqprod (fun t1 t2 -> (

let uu____16569 = (term_eq_dbg dbg t1 t2)
in (check "arg tm" uu____16569))) (fun q1 q2 -> (

let uu____16581 = (

let uu____16583 = (eq_aqual q1 q2)
in (Prims.op_Equality uu____16583 Equal))
in (check "arg qual" uu____16581))) a1 a2))
and binder_eq_dbg : Prims.bool  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option)  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier FStar_Pervasives_Native.option)  ->  Prims.bool = (fun dbg b1 b2 -> (eqprod (fun b11 b21 -> (

let uu____16608 = (term_eq_dbg dbg b11.FStar_Syntax_Syntax.sort b21.FStar_Syntax_Syntax.sort)
in (check "binder sort" uu____16608))) (fun q1 q2 -> (

let uu____16620 = (

let uu____16622 = (eq_aqual q1 q2)
in (Prims.op_Equality uu____16622 Equal))
in (check "binder qual" uu____16620))) b1 b2))
and lcomp_eq_dbg : FStar_Syntax_Syntax.lcomp  ->  FStar_Syntax_Syntax.lcomp  ->  Prims.bool = (fun c1 c2 -> (fail "lcomp"))
and residual_eq_dbg : FStar_Syntax_Syntax.residual_comp  ->  FStar_Syntax_Syntax.residual_comp  ->  Prims.bool = (fun r1 r2 -> (fail "residual"))
and comp_eq_dbg : Prims.bool  ->  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  Prims.bool = (fun dbg c1 c2 -> (

let c11 = (comp_to_comp_typ_nouniv c1)
in (

let c21 = (comp_to_comp_typ_nouniv c2)
in (((

let uu____16642 = (FStar_Ident.lid_equals c11.FStar_Syntax_Syntax.effect_name c21.FStar_Syntax_Syntax.effect_name)
in (check "comp eff" uu____16642)) && (

let uu____16646 = (term_eq_dbg dbg c11.FStar_Syntax_Syntax.result_typ c21.FStar_Syntax_Syntax.result_typ)
in (check "comp result typ" uu____16646))) && true))))
and eq_flags_dbg : Prims.bool  ->  FStar_Syntax_Syntax.cflag  ->  FStar_Syntax_Syntax.cflag  ->  Prims.bool = (fun dbg f1 f2 -> true)
and branch_eq_dbg : Prims.bool  ->  (FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)  ->  (FStar_Syntax_Syntax.pat' FStar_Syntax_Syntax.withinfo_t * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax FStar_Pervasives_Native.option * FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)  ->  Prims.bool = (fun dbg uu____16656 uu____16657 -> (match (((uu____16656), (uu____16657))) with
| ((p1, w1, t1), (p2, w2, t2)) -> begin
(((

let uu____16784 = (FStar_Syntax_Syntax.eq_pat p1 p2)
in (check "branch pat" uu____16784)) && (

let uu____16788 = (term_eq_dbg dbg t1 t2)
in (check "branch body" uu____16788))) && (

let uu____16792 = (match (((w1), (w2))) with
| (FStar_Pervasives_Native.Some (x), FStar_Pervasives_Native.Some (y)) -> begin
(term_eq_dbg dbg x y)
end
| (FStar_Pervasives_Native.None, FStar_Pervasives_Native.None) -> begin
true
end
| uu____16834 -> begin
false
end)
in (check "branch when" uu____16792)))
end))
and letbinding_eq_dbg : Prims.bool  ->  FStar_Syntax_Syntax.letbinding  ->  FStar_Syntax_Syntax.letbinding  ->  Prims.bool = (fun dbg lb1 lb2 -> (((

let uu____16855 = (eqsum (fun bv1 bv2 -> true) FStar_Syntax_Syntax.fv_eq lb1.FStar_Syntax_Syntax.lbname lb2.FStar_Syntax_Syntax.lbname)
in (check "lb bv" uu____16855)) && (

let uu____16864 = (term_eq_dbg dbg lb1.FStar_Syntax_Syntax.lbtyp lb2.FStar_Syntax_Syntax.lbtyp)
in (check "lb typ" uu____16864))) && (

let uu____16868 = (term_eq_dbg dbg lb1.FStar_Syntax_Syntax.lbdef lb2.FStar_Syntax_Syntax.lbdef)
in (check "lb def" uu____16868))))


let term_eq : FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t1 t2 -> (

let r = (

let uu____16885 = (FStar_ST.op_Bang debug_term_eq)
in (term_eq_dbg uu____16885 t1 t2))
in ((FStar_ST.op_Colon_Equals debug_term_eq false);
r;
)))


let rec sizeof : FStar_Syntax_Syntax.term  ->  Prims.int = (fun t -> (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_delayed (uu____16939) -> begin
(

let uu____16962 = (

let uu____16964 = (FStar_Syntax_Subst.compress t)
in (sizeof uu____16964))
in ((Prims.parse_int "1") + uu____16962))
end
| FStar_Syntax_Syntax.Tm_bvar (bv) -> begin
(

let uu____16967 = (sizeof bv.FStar_Syntax_Syntax.sort)
in ((Prims.parse_int "1") + uu____16967))
end
| FStar_Syntax_Syntax.Tm_name (bv) -> begin
(

let uu____16971 = (sizeof bv.FStar_Syntax_Syntax.sort)
in ((Prims.parse_int "1") + uu____16971))
end
| FStar_Syntax_Syntax.Tm_uinst (t1, us) -> begin
(

let uu____16980 = (sizeof t1)
in ((FStar_List.length us) + uu____16980))
end
| FStar_Syntax_Syntax.Tm_abs (bs, t1, uu____16984) -> begin
(

let uu____17009 = (sizeof t1)
in (

let uu____17011 = (FStar_List.fold_left (fun acc uu____17026 -> (match (uu____17026) with
| (bv, uu____17036) -> begin
(

let uu____17041 = (sizeof bv.FStar_Syntax_Syntax.sort)
in (acc + uu____17041))
end)) (Prims.parse_int "0") bs)
in (uu____17009 + uu____17011)))
end
| FStar_Syntax_Syntax.Tm_app (hd1, args) -> begin
(

let uu____17070 = (sizeof hd1)
in (

let uu____17072 = (FStar_List.fold_left (fun acc uu____17087 -> (match (uu____17087) with
| (arg, uu____17097) -> begin
(

let uu____17102 = (sizeof arg)
in (acc + uu____17102))
end)) (Prims.parse_int "0") args)
in (uu____17070 + uu____17072)))
end
| uu____17105 -> begin
(Prims.parse_int "1")
end))


let is_fvar : FStar_Ident.lident  ->  FStar_Syntax_Syntax.term  ->  Prims.bool = (fun lid t -> (

let uu____17119 = (

let uu____17120 = (un_uinst t)
in uu____17120.FStar_Syntax_Syntax.n)
in (match (uu____17119) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_Syntax_Syntax.fv_eq_lid fv lid)
end
| uu____17125 -> begin
false
end)))


let is_synth_by_tactic : FStar_Syntax_Syntax.term  ->  Prims.bool = (fun t -> (is_fvar FStar_Parser_Const.synth_lid t))


let has_attribute : FStar_Syntax_Syntax.attribute Prims.list  ->  FStar_Ident.lident  ->  Prims.bool = (fun attrs attr -> (FStar_Util.for_some (is_fvar attr) attrs))


let process_pragma : FStar_Syntax_Syntax.pragma  ->  FStar_Range.range  ->  unit = (fun p r -> (

let set_options1 = (fun t s -> (

let uu____17174 = (FStar_Options.set_options t s)
in (match (uu____17174) with
| FStar_Getopt.Success -> begin
()
end
| FStar_Getopt.Help -> begin
(FStar_Errors.raise_error ((FStar_Errors.Fatal_FailToProcessPragma), ("Failed to process pragma: use \'fstar --help\' to see which options are available")) r)
end
| FStar_Getopt.Error (s1) -> begin
(FStar_Errors.raise_error ((FStar_Errors.Fatal_FailToProcessPragma), ((Prims.strcat "Failed to process pragma: " s1))) r)
end)))
in (match (p) with
| FStar_Syntax_Syntax.LightOff -> begin
(match ((Prims.op_Equality p FStar_Syntax_Syntax.LightOff)) with
| true -> begin
(FStar_Options.set_ml_ish ())
end
| uu____17182 -> begin
()
end)
end
| FStar_Syntax_Syntax.SetOptions (o) -> begin
(set_options1 FStar_Options.Set o)
end
| FStar_Syntax_Syntax.ResetOptions (sopt) -> begin
((

let uu____17191 = (FStar_Options.restore_cmd_line_options false)
in (FStar_All.pipe_right uu____17191 (fun a1 -> ())));
(match (sopt) with
| FStar_Pervasives_Native.None -> begin
()
end
| FStar_Pervasives_Native.Some (s) -> begin
(set_options1 FStar_Options.Reset s)
end);
)
end
| FStar_Syntax_Syntax.PushOptions (sopt) -> begin
((FStar_Options.internal_push ());
(match (sopt) with
| FStar_Pervasives_Native.None -> begin
()
end
| FStar_Pervasives_Native.Some (s) -> begin
(set_options1 FStar_Options.Reset s)
end);
)
end
| FStar_Syntax_Syntax.PopOptions -> begin
(

let uu____17206 = (FStar_Options.internal_pop ())
in (match (uu____17206) with
| true -> begin
()
end
| uu____17209 -> begin
(FStar_Errors.raise_error ((FStar_Errors.Fatal_FailToProcessPragma), ("Cannot #pop-options, stack would become empty")) r)
end))
end)))


let rec unbound_variables : FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.bv Prims.list = (fun tm -> (

let t = (FStar_Syntax_Subst.compress tm)
in (match (t.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_delayed (uu____17238) -> begin
(failwith "Impossible")
end
| FStar_Syntax_Syntax.Tm_name (x) -> begin
[]
end
| FStar_Syntax_Syntax.Tm_uvar (uu____17265) -> begin
[]
end
| FStar_Syntax_Syntax.Tm_type (u) -> begin
[]
end
| FStar_Syntax_Syntax.Tm_bvar (x) -> begin
(x)::[]
end
| FStar_Syntax_Syntax.Tm_fvar (uu____17280) -> begin
[]
end
| FStar_Syntax_Syntax.Tm_constant (uu____17281) -> begin
[]
end
| FStar_Syntax_Syntax.Tm_lazy (uu____17282) -> begin
[]
end
| FStar_Syntax_Syntax.Tm_unknown -> begin
[]
end
| FStar_Syntax_Syntax.Tm_uinst (t1, us) -> begin
(unbound_variables t1)
end
| FStar_Syntax_Syntax.Tm_abs (bs, t1, uu____17291) -> begin
(

let uu____17316 = (FStar_Syntax_Subst.open_term bs t1)
in (match (uu____17316) with
| (bs1, t2) -> begin
(

let uu____17325 = (FStar_List.collect (fun uu____17337 -> (match (uu____17337) with
| (b, uu____17347) -> begin
(unbound_variables b.FStar_Syntax_Syntax.sort)
end)) bs1)
in (

let uu____17352 = (unbound_variables t2)
in (FStar_List.append uu____17325 uu____17352)))
end))
end
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(

let uu____17377 = (FStar_Syntax_Subst.open_comp bs c)
in (match (uu____17377) with
| (bs1, c1) -> begin
(

let uu____17386 = (FStar_List.collect (fun uu____17398 -> (match (uu____17398) with
| (b, uu____17408) -> begin
(unbound_variables b.FStar_Syntax_Syntax.sort)
end)) bs1)
in (

let uu____17413 = (unbound_variables_comp c1)
in (FStar_List.append uu____17386 uu____17413)))
end))
end
| FStar_Syntax_Syntax.Tm_refine (b, t1) -> begin
(

let uu____17422 = (FStar_Syntax_Subst.open_term ((((b), (FStar_Pervasives_Native.None)))::[]) t1)
in (match (uu____17422) with
| (bs, t2) -> begin
(

let uu____17445 = (FStar_List.collect (fun uu____17457 -> (match (uu____17457) with
| (b1, uu____17467) -> begin
(unbound_variables b1.FStar_Syntax_Syntax.sort)
end)) bs)
in (

let uu____17472 = (unbound_variables t2)
in (FStar_List.append uu____17445 uu____17472)))
end))
end
| FStar_Syntax_Syntax.Tm_app (t1, args) -> begin
(

let uu____17501 = (FStar_List.collect (fun uu____17515 -> (match (uu____17515) with
| (x, uu____17527) -> begin
(unbound_variables x)
end)) args)
in (

let uu____17536 = (unbound_variables t1)
in (FStar_List.append uu____17501 uu____17536)))
end
| FStar_Syntax_Syntax.Tm_match (t1, pats) -> begin
(

let uu____17577 = (unbound_variables t1)
in (

let uu____17580 = (FStar_All.pipe_right pats (FStar_List.collect (fun br -> (

let uu____17595 = (FStar_Syntax_Subst.open_branch br)
in (match (uu____17595) with
| (p, wopt, t2) -> begin
(

let uu____17617 = (unbound_variables t2)
in (

let uu____17620 = (match (wopt) with
| FStar_Pervasives_Native.None -> begin
[]
end
| FStar_Pervasives_Native.Some (t3) -> begin
(unbound_variables t3)
end)
in (FStar_List.append uu____17617 uu____17620)))
end)))))
in (FStar_List.append uu____17577 uu____17580)))
end
| FStar_Syntax_Syntax.Tm_ascribed (t1, asc, uu____17634) -> begin
(

let uu____17675 = (unbound_variables t1)
in (

let uu____17678 = (

let uu____17681 = (match ((FStar_Pervasives_Native.fst asc)) with
| FStar_Util.Inl (t2) -> begin
(unbound_variables t2)
end
| FStar_Util.Inr (c2) -> begin
(unbound_variables_comp c2)
end)
in (

let uu____17712 = (match ((FStar_Pervasives_Native.snd asc)) with
| FStar_Pervasives_Native.None -> begin
[]
end
| FStar_Pervasives_Native.Some (tac) -> begin
(unbound_variables tac)
end)
in (FStar_List.append uu____17681 uu____17712)))
in (FStar_List.append uu____17675 uu____17678)))
end
| FStar_Syntax_Syntax.Tm_let ((false, (lb)::[]), t1) -> begin
(

let uu____17753 = (unbound_variables lb.FStar_Syntax_Syntax.lbtyp)
in (

let uu____17756 = (

let uu____17759 = (unbound_variables lb.FStar_Syntax_Syntax.lbdef)
in (

let uu____17762 = (match (lb.FStar_Syntax_Syntax.lbname) with
| FStar_Util.Inr (uu____17767) -> begin
(unbound_variables t1)
end
| FStar_Util.Inl (bv) -> begin
(

let uu____17769 = (FStar_Syntax_Subst.open_term ((((bv), (FStar_Pervasives_Native.None)))::[]) t1)
in (match (uu____17769) with
| (uu____17790, t2) -> begin
(unbound_variables t2)
end))
end)
in (FStar_List.append uu____17759 uu____17762)))
in (FStar_List.append uu____17753 uu____17756)))
end
| FStar_Syntax_Syntax.Tm_let ((uu____17792, lbs), t1) -> begin
(

let uu____17812 = (FStar_Syntax_Subst.open_let_rec lbs t1)
in (match (uu____17812) with
| (lbs1, t2) -> begin
(

let uu____17827 = (unbound_variables t2)
in (

let uu____17830 = (FStar_List.collect (fun lb -> (

let uu____17837 = (unbound_variables lb.FStar_Syntax_Syntax.lbtyp)
in (

let uu____17840 = (unbound_variables lb.FStar_Syntax_Syntax.lbdef)
in (FStar_List.append uu____17837 uu____17840)))) lbs1)
in (FStar_List.append uu____17827 uu____17830)))
end))
end
| FStar_Syntax_Syntax.Tm_quoted (tm1, qi) -> begin
(match (qi.FStar_Syntax_Syntax.qkind) with
| FStar_Syntax_Syntax.Quote_static -> begin
[]
end
| FStar_Syntax_Syntax.Quote_dynamic -> begin
(unbound_variables tm1)
end)
end
| FStar_Syntax_Syntax.Tm_meta (t1, m) -> begin
(

let uu____17857 = (unbound_variables t1)
in (

let uu____17860 = (match (m) with
| FStar_Syntax_Syntax.Meta_pattern (args) -> begin
(FStar_List.collect (FStar_List.collect (fun uu____17899 -> (match (uu____17899) with
| (a, uu____17911) -> begin
(unbound_variables a)
end))) args)
end
| FStar_Syntax_Syntax.Meta_monadic_lift (uu____17920, uu____17921, t') -> begin
(unbound_variables t')
end
| FStar_Syntax_Syntax.Meta_monadic (uu____17927, t') -> begin
(unbound_variables t')
end
| FStar_Syntax_Syntax.Meta_labeled (uu____17933) -> begin
[]
end
| FStar_Syntax_Syntax.Meta_desugared (uu____17942) -> begin
[]
end
| FStar_Syntax_Syntax.Meta_named (uu____17943) -> begin
[]
end)
in (FStar_List.append uu____17857 uu____17860)))
end)))
and unbound_variables_comp : FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax  ->  FStar_Syntax_Syntax.bv Prims.list = (fun c -> (match (c.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.GTotal (t, uu____17950) -> begin
(unbound_variables t)
end
| FStar_Syntax_Syntax.Total (t, uu____17960) -> begin
(unbound_variables t)
end
| FStar_Syntax_Syntax.Comp (ct) -> begin
(

let uu____17970 = (unbound_variables ct.FStar_Syntax_Syntax.result_typ)
in (

let uu____17973 = (FStar_List.collect (fun uu____17987 -> (match (uu____17987) with
| (a, uu____17999) -> begin
(unbound_variables a)
end)) ct.FStar_Syntax_Syntax.effect_args)
in (FStar_List.append uu____17970 uu____17973)))
end))


let extract_attr' : FStar_Ident.lid  ->  FStar_Syntax_Syntax.term Prims.list  ->  (FStar_Syntax_Syntax.term Prims.list * FStar_Syntax_Syntax.args) FStar_Pervasives_Native.option = (fun attr_lid attrs -> (

let rec aux = (fun acc attrs1 -> (match (attrs1) with
| [] -> begin
FStar_Pervasives_Native.None
end
| (h)::t -> begin
(

let uu____18114 = (head_and_args h)
in (match (uu____18114) with
| (head1, args) -> begin
(

let uu____18175 = (

let uu____18176 = (FStar_Syntax_Subst.compress head1)
in uu____18176.FStar_Syntax_Syntax.n)
in (match (uu____18175) with
| FStar_Syntax_Syntax.Tm_fvar (fv) when (FStar_Syntax_Syntax.fv_eq_lid fv attr_lid) -> begin
(

let attrs' = (FStar_List.rev_acc acc t)
in FStar_Pervasives_Native.Some (((attrs'), (args))))
end
| uu____18229 -> begin
(aux ((h)::acc) t)
end))
end))
end))
in (aux [] attrs)))


let extract_attr : FStar_Ident.lid  ->  FStar_Syntax_Syntax.sigelt  ->  (FStar_Syntax_Syntax.sigelt * FStar_Syntax_Syntax.args) FStar_Pervasives_Native.option = (fun attr_lid se -> (

let uu____18253 = (extract_attr' attr_lid se.FStar_Syntax_Syntax.sigattrs)
in (match (uu____18253) with
| FStar_Pervasives_Native.None -> begin
FStar_Pervasives_Native.None
end
| FStar_Pervasives_Native.Some (attrs', t) -> begin
FStar_Pervasives_Native.Some ((((

let uu___134_18295 = se
in {FStar_Syntax_Syntax.sigel = uu___134_18295.FStar_Syntax_Syntax.sigel; FStar_Syntax_Syntax.sigrng = uu___134_18295.FStar_Syntax_Syntax.sigrng; FStar_Syntax_Syntax.sigquals = uu___134_18295.FStar_Syntax_Syntax.sigquals; FStar_Syntax_Syntax.sigmeta = uu___134_18295.FStar_Syntax_Syntax.sigmeta; FStar_Syntax_Syntax.sigattrs = attrs'})), (t)))
end)))




