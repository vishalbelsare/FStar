
let eff_to_string = (fun ( _59_1 ) -> (match (_59_1) with
| Microsoft_FStar_Extraction_ML_Syntax.E_PURE -> begin
"Pure"
end
| Microsoft_FStar_Extraction_ML_Syntax.E_IMPURE -> begin
"Impure"
end))

let fail = (fun ( r ) ( msg ) -> (let _59_10 = (let _68_25101 = (Microsoft_FStar_Absyn_Print.format_error r msg)
in (Support.Prims.pipe_left Support.Microsoft.FStar.Util.print_string _68_25101))
in (exit (1))))

let err_uninst = (fun ( e ) -> (let _68_25104 = (let _68_25103 = (Microsoft_FStar_Absyn_Print.exp_to_string e)
in (Support.Microsoft.FStar.Util.format1 "Variable %s has a polymorphic type; expected it to be fully instantiated" _68_25103))
in (fail e.Microsoft_FStar_Absyn_Syntax.pos _68_25104)))

let err_ill_typed_application = (fun ( e ) ( args ) ( t ) -> (let _68_25110 = (let _68_25109 = (Microsoft_FStar_Absyn_Print.exp_to_string e)
in (let _68_25108 = (Microsoft_FStar_Absyn_Print.args_to_string args)
in (Support.Microsoft.FStar.Util.format2 "Ill-typed application: application is %s \n remaining args are %s\n" _68_25109 _68_25108)))
in (fail e.Microsoft_FStar_Absyn_Syntax.pos _68_25110)))

let err_value_restriction = (fun ( e ) -> (fail e.Microsoft_FStar_Absyn_Syntax.pos "Refusing to generalize because of the value restriction"))

let err_unexpected_eff = (fun ( e ) ( f0 ) ( f1 ) -> (let _68_25116 = (let _68_25115 = (Microsoft_FStar_Absyn_Print.exp_to_string e)
in (Support.Microsoft.FStar.Util.format3 "for expression %s, Expected effect %s; got effect %s" _68_25115 (eff_to_string f0) (eff_to_string f1)))
in (fail e.Microsoft_FStar_Absyn_Syntax.pos _68_25116)))

let is_constructor = (fun ( e ) -> (match ((let _68_25119 = (Microsoft_FStar_Absyn_Util.compress_exp e)
in _68_25119.Microsoft_FStar_Absyn_Syntax.n)) with
| (Microsoft_FStar_Absyn_Syntax.Exp_fvar ((_, Some (Microsoft_FStar_Absyn_Syntax.Data_ctor)))) | (Microsoft_FStar_Absyn_Syntax.Exp_fvar ((_, Some (Microsoft_FStar_Absyn_Syntax.Record_ctor (_))))) -> begin
true
end
| _ -> begin
false
end))

let rec is_value_or_type_app = (fun ( e ) -> (match ((let _68_25122 = (Microsoft_FStar_Absyn_Util.compress_exp e)
in _68_25122.Microsoft_FStar_Absyn_Syntax.n)) with
| (Microsoft_FStar_Absyn_Syntax.Exp_constant (_)) | (Microsoft_FStar_Absyn_Syntax.Exp_bvar (_)) | (Microsoft_FStar_Absyn_Syntax.Exp_fvar (_)) | (Microsoft_FStar_Absyn_Syntax.Exp_abs (_)) -> begin
true
end
| Microsoft_FStar_Absyn_Syntax.Exp_app ((head, args)) -> begin
(match ((is_constructor head)) with
| true -> begin
(Support.Prims.pipe_right args (Support.List.for_all (fun ( _59_57 ) -> (match (_59_57) with
| (te, _) -> begin
(match (te) with
| Support.Microsoft.FStar.Util.Inl (_) -> begin
true
end
| Support.Microsoft.FStar.Util.Inr (e) -> begin
(is_value_or_type_app e)
end)
end))))
end
| false -> begin
(match ((let _68_25124 = (Microsoft_FStar_Absyn_Util.compress_exp head)
in _68_25124.Microsoft_FStar_Absyn_Syntax.n)) with
| (Microsoft_FStar_Absyn_Syntax.Exp_bvar (_)) | (Microsoft_FStar_Absyn_Syntax.Exp_fvar (_)) -> begin
(Support.Prims.pipe_right args (Support.List.for_all (fun ( _59_2 ) -> (match (_59_2) with
| (Support.Microsoft.FStar.Util.Inl (te), _) -> begin
true
end
| _ -> begin
false
end))))
end
| _ -> begin
false
end)
end)
end
| (Microsoft_FStar_Absyn_Syntax.Exp_meta (Microsoft_FStar_Absyn_Syntax.Meta_desugared ((e, _)))) | (Microsoft_FStar_Absyn_Syntax.Exp_ascribed ((e, _, _))) -> begin
(is_value_or_type_app e)
end
| _ -> begin
false
end))

let rec is_ml_value = (fun ( e ) -> (match (e) with
| (Microsoft_FStar_Extraction_ML_Syntax.MLE_Const (_)) | (Microsoft_FStar_Extraction_ML_Syntax.MLE_Var (_)) | (Microsoft_FStar_Extraction_ML_Syntax.MLE_Name (_)) | (Microsoft_FStar_Extraction_ML_Syntax.MLE_Fun (_)) -> begin
true
end
| (Microsoft_FStar_Extraction_ML_Syntax.MLE_CTor ((_, exps))) | (Microsoft_FStar_Extraction_ML_Syntax.MLE_Tuple (exps)) -> begin
(Support.Microsoft.FStar.Util.for_all is_ml_value exps)
end
| Microsoft_FStar_Extraction_ML_Syntax.MLE_Record ((_, fields)) -> begin
(Support.Microsoft.FStar.Util.for_all (fun ( _59_120 ) -> (match (_59_120) with
| (_, e) -> begin
(is_ml_value e)
end)) fields)
end
| _ -> begin
false
end))

let translate_typ = (fun ( g ) ( t ) -> (Microsoft_FStar_Extraction_ML_ExtractTyp.extractTyp g t))

let instantiate = (fun ( s ) ( args ) -> (Microsoft_FStar_Extraction_ML_Util.subst s args))

let erasable = (fun ( g ) ( f ) ( t ) -> ((f = Microsoft_FStar_Extraction_ML_Syntax.E_PURE) && (Microsoft_FStar_Extraction_ML_Env.erasableType g t)))

let erase = (fun ( g ) ( e ) ( f ) ( t ) -> (match ((erasable g f t)) with
| true -> begin
(let _59_135 = (Microsoft_FStar_Extraction_ML_Env.debug g (fun ( _59_134 ) -> (match (()) with
| () -> begin
(let _68_25153 = (Microsoft_FStar_Extraction_OCaml_Code.string_of_mlexpr g e)
in (let _68_25152 = (Microsoft_FStar_Extraction_OCaml_Code.string_of_mlty g t)
in (Support.Microsoft.FStar.Util.fprint2 "Erasing %s at type %s\n" _68_25153 _68_25152)))
end)))
in (Microsoft_FStar_Extraction_ML_Syntax.ml_unit, f, Microsoft_FStar_Extraction_ML_Syntax.ml_unit_ty))
end
| false -> begin
(e, f, t)
end))

let maybe_coerce = (fun ( g ) ( e ) ( tInferred ) ( tExpected ) -> (match ((Microsoft_FStar_Extraction_ML_Util.equiv g tInferred tExpected)) with
| true -> begin
e
end
| false -> begin
Microsoft_FStar_Extraction_ML_Syntax.MLE_Coerce ((e, tInferred, tExpected))
end))

let eff_leq = (fun ( f ) ( f' ) -> (match ((f, f')) with
| ((Microsoft_FStar_Extraction_ML_Syntax.E_PURE, _)) | ((_, Microsoft_FStar_Extraction_ML_Syntax.E_IMPURE)) -> begin
true
end
| _ -> begin
false
end))

let join = (fun ( f ) ( f' ) -> (match ((f, f')) with
| ((Microsoft_FStar_Extraction_ML_Syntax.E_IMPURE, _)) | ((_, Microsoft_FStar_Extraction_ML_Syntax.E_IMPURE)) -> begin
Microsoft_FStar_Extraction_ML_Syntax.E_IMPURE
end
| _ -> begin
Microsoft_FStar_Extraction_ML_Syntax.E_PURE
end))

let join_l = (fun ( fs ) -> (Support.List.fold_left join Microsoft_FStar_Extraction_ML_Syntax.E_PURE fs))

let rec extract_pat = (fun ( g ) ( p ) -> (match (p.Microsoft_FStar_Absyn_Syntax.v) with
| Microsoft_FStar_Absyn_Syntax.Pat_disj ([]) -> begin
(failwith ("Impossible"))
end
| Microsoft_FStar_Absyn_Syntax.Pat_disj (p::pats) -> begin
(let _59_176 = (extract_pat g p)
in (match (_59_176) with
| (g, p) -> begin
(let _68_25181 = (let _68_25180 = (let _68_25179 = (let _68_25178 = (Support.List.collect (fun ( x ) -> (let _68_25177 = (extract_pat g x)
in (Support.Prims.snd _68_25177))) pats)
in (Support.List.append p _68_25178))
in Microsoft_FStar_Extraction_ML_Syntax.MLP_Branch (_68_25179))
in (_68_25180)::[])
in (g, _68_25181))
end))
end
| Microsoft_FStar_Absyn_Syntax.Pat_constant (s) -> begin
(let _68_25184 = (let _68_25183 = (let _68_25182 = (Microsoft_FStar_Extraction_ML_Util.mlconst_of_const s)
in Microsoft_FStar_Extraction_ML_Syntax.MLP_Const (_68_25182))
in (_68_25183)::[])
in (g, _68_25184))
end
| Microsoft_FStar_Absyn_Syntax.Pat_cons ((f, q, pats)) -> begin
(let d = (match ((Microsoft_FStar_Extraction_ML_Env.lookup_fv g f)) with
| (Microsoft_FStar_Extraction_ML_Syntax.MLE_Name (n), _) -> begin
n
end
| _ -> begin
(failwith ("Expected a constructor"))
end)
in (let _59_195 = (Support.Microsoft.FStar.Util.fold_map extract_pat g pats)
in (match (_59_195) with
| (g, pats) -> begin
(let _68_25186 = (let _68_25185 = (Support.Prims.pipe_left (Microsoft_FStar_Extraction_ML_Util.resugar_pat q) (Microsoft_FStar_Extraction_ML_Syntax.MLP_CTor ((d, (Support.List.flatten pats)))))
in (_68_25185)::[])
in (g, _68_25186))
end)))
end
| Microsoft_FStar_Absyn_Syntax.Pat_var ((x, _)) -> begin
(let mlty = (translate_typ g x.Microsoft_FStar_Absyn_Syntax.sort)
in (let g = (Microsoft_FStar_Extraction_ML_Env.extend_bv g x ([], mlty) false)
in (g, (Microsoft_FStar_Extraction_ML_Syntax.MLP_Var ((Microsoft_FStar_Extraction_ML_Syntax.as_mlident x.Microsoft_FStar_Absyn_Syntax.v)))::[])))
end
| (Microsoft_FStar_Absyn_Syntax.Pat_wild (_)) | (Microsoft_FStar_Absyn_Syntax.Pat_dot_term (_)) -> begin
(g, (Microsoft_FStar_Extraction_ML_Syntax.MLP_Wild)::[])
end
| (Microsoft_FStar_Absyn_Syntax.Pat_dot_typ (_)) | (Microsoft_FStar_Absyn_Syntax.Pat_twild (_)) | (Microsoft_FStar_Absyn_Syntax.Pat_tvar (_)) -> begin
(g, [])
end))

let normalize_abs = (fun ( e0 ) -> (let rec aux = (fun ( bs ) ( e ) -> (let e = (Microsoft_FStar_Absyn_Util.compress_exp e)
in (match (e.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Exp_abs ((bs', body)) -> begin
(aux (Support.List.append bs bs') body)
end
| _ -> begin
(let e' = (Microsoft_FStar_Absyn_Util.unascribe e)
in (match ((Microsoft_FStar_Absyn_Util.is_fun e')) with
| true -> begin
(aux bs e')
end
| false -> begin
(Microsoft_FStar_Absyn_Syntax.mk_Exp_abs (bs, e) None e0.Microsoft_FStar_Absyn_Syntax.pos)
end))
end)))
in (aux [] e0)))

let maybe_eta_data = (fun ( qual ) ( residualType ) ( mlAppExpr ) -> (let rec eta_args = (fun ( more_args ) ( t ) -> (match (t) with
| Microsoft_FStar_Extraction_ML_Syntax.MLTY_Fun ((t0, _, t1)) -> begin
(let x = (let _68_25203 = (Microsoft_FStar_Absyn_Util.gensym ())
in (_68_25203, (- (1))))
in (eta_args ((((x, Some (t0)), Microsoft_FStar_Extraction_ML_Syntax.MLE_Var (x)))::more_args) t1))
end
| Microsoft_FStar_Extraction_ML_Syntax.MLTY_Named ((_, _)) -> begin
(Support.List.rev more_args)
end
| _ -> begin
(failwith ("Impossible"))
end))
in (let as_record = (fun ( qual ) ( e ) -> (match ((e, qual)) with
| (Microsoft_FStar_Extraction_ML_Syntax.MLE_CTor ((_, args)), Some (Microsoft_FStar_Absyn_Syntax.Record_ctor ((_, fields)))) -> begin
(let path = (Microsoft_FStar_Extraction_ML_Util.record_field_path fields)
in (let fields = (Microsoft_FStar_Extraction_ML_Util.record_fields fields args)
in Microsoft_FStar_Extraction_ML_Syntax.MLE_Record ((path, fields))))
end
| _ -> begin
e
end))
in (let resugar_and_maybe_eta = (fun ( qual ) ( e ) -> (let eargs = (eta_args [] residualType)
in (match (eargs) with
| [] -> begin
(let _68_25212 = (as_record qual e)
in (Microsoft_FStar_Extraction_ML_Util.resugar_exp _68_25212))
end
| _ -> begin
(let _59_279 = (Support.List.unzip eargs)
in (match (_59_279) with
| (binders, eargs) -> begin
(match (e) with
| Microsoft_FStar_Extraction_ML_Syntax.MLE_CTor ((head, args)) -> begin
(let body = (let _68_25213 = (Support.Prims.pipe_left (as_record qual) (Microsoft_FStar_Extraction_ML_Syntax.MLE_CTor ((head, (Support.List.append args eargs)))))
in (Support.Prims.pipe_left Microsoft_FStar_Extraction_ML_Util.resugar_exp _68_25213))
in Microsoft_FStar_Extraction_ML_Syntax.MLE_Fun ((binders, body)))
end
| _ -> begin
(failwith ("Impossible"))
end)
end))
end)))
in (match ((mlAppExpr, qual)) with
| (_, None) -> begin
mlAppExpr
end
| (Microsoft_FStar_Extraction_ML_Syntax.MLE_App ((Microsoft_FStar_Extraction_ML_Syntax.MLE_Name (mlp), mle::args)), Some (Microsoft_FStar_Absyn_Syntax.Record_projector (f))) -> begin
(let fn = (Microsoft_FStar_Extraction_ML_Util.mlpath_of_lid f)
in (let proj = Microsoft_FStar_Extraction_ML_Syntax.MLE_Proj ((mle, fn))
in (match (args) with
| [] -> begin
proj
end
| _ -> begin
Microsoft_FStar_Extraction_ML_Syntax.MLE_App ((proj, args))
end)))
end
| ((Microsoft_FStar_Extraction_ML_Syntax.MLE_App ((Microsoft_FStar_Extraction_ML_Syntax.MLE_Name (mlp), mlargs)), Some (Microsoft_FStar_Absyn_Syntax.Data_ctor))) | ((Microsoft_FStar_Extraction_ML_Syntax.MLE_App ((Microsoft_FStar_Extraction_ML_Syntax.MLE_Name (mlp), mlargs)), Some (Microsoft_FStar_Absyn_Syntax.Record_ctor (_)))) -> begin
(Support.Prims.pipe_left (resugar_and_maybe_eta qual) (Microsoft_FStar_Extraction_ML_Syntax.MLE_CTor ((mlp, mlargs))))
end
| ((Microsoft_FStar_Extraction_ML_Syntax.MLE_Name (mlp), Some (Microsoft_FStar_Absyn_Syntax.Data_ctor))) | ((Microsoft_FStar_Extraction_ML_Syntax.MLE_Name (mlp), Some (Microsoft_FStar_Absyn_Syntax.Record_ctor (_)))) -> begin
(Support.Prims.pipe_left (resugar_and_maybe_eta qual) (Microsoft_FStar_Extraction_ML_Syntax.MLE_CTor ((mlp, []))))
end
| _ -> begin
mlAppExpr
end)))))

let rec check_exp = (fun ( g ) ( e ) ( f ) ( t ) -> (let _59_345 = (let _68_25230 = (check_exp' g e f t)
in (erase g _68_25230 f t))
in (match (_59_345) with
| (e, _, _) -> begin
e
end)))
and check_exp' = (fun ( g ) ( e ) ( f ) ( t ) -> (match ((let _68_25235 = (Microsoft_FStar_Absyn_Util.compress_exp e)
in _68_25235.Microsoft_FStar_Absyn_Syntax.n)) with
| Microsoft_FStar_Absyn_Syntax.Exp_match ((scrutinee, pats)) -> begin
(let _59_357 = (synth_exp g scrutinee)
in (match (_59_357) with
| (e, f_e, t_e) -> begin
(let mlbranches = (Support.Prims.pipe_right pats (Support.List.map (fun ( _59_361 ) -> (match (_59_361) with
| (pat, when_opt, branch) -> begin
(let _59_364 = (extract_pat g pat)
in (match (_59_364) with
| (env, p) -> begin
(let when_opt = (match (when_opt) with
| None -> begin
None
end
| Some (w) -> begin
(let _68_25237 = (check_exp env w Microsoft_FStar_Extraction_ML_Syntax.E_IMPURE Microsoft_FStar_Extraction_ML_Syntax.ml_bool_ty)
in Some (_68_25237))
end)
in (let branch = (check_exp env branch f t)
in (let _68_25238 = (Support.List.hd p)
in (_68_25238, when_opt, branch))))
end))
end))))
in (match ((eff_leq f_e f)) with
| true -> begin
Microsoft_FStar_Extraction_ML_Syntax.MLE_Match ((e, mlbranches))
end
| false -> begin
(err_unexpected_eff scrutinee f f_e)
end))
end))
end
| _ -> begin
(let _59_376 = (synth_exp g e)
in (match (_59_376) with
| (e0, f0, t0) -> begin
(match ((eff_leq f0 f)) with
| true -> begin
(maybe_coerce g e0 t0 t)
end
| false -> begin
(err_unexpected_eff e f f0)
end)
end))
end))
and synth_exp = (fun ( g ) ( e ) -> (let _59_382 = (synth_exp' g e)
in (match (_59_382) with
| (e, f, t) -> begin
(erase g e f t)
end)))
and synth_exp' = (fun ( g ) ( e ) -> (match ((let _68_25243 = (Microsoft_FStar_Absyn_Util.compress_exp e)
in _68_25243.Microsoft_FStar_Absyn_Syntax.n)) with
| Microsoft_FStar_Absyn_Syntax.Exp_constant (c) -> begin
(let t = (Microsoft_FStar_Tc_Recheck.typing_const e.Microsoft_FStar_Absyn_Syntax.pos c)
in (let _68_25247 = (let _68_25245 = (Microsoft_FStar_Extraction_ML_Util.mlconst_of_const c)
in (Support.Prims.pipe_left (fun ( _68_25244 ) -> Microsoft_FStar_Extraction_ML_Syntax.MLE_Const (_68_25244)) _68_25245))
in (let _68_25246 = (translate_typ g t)
in (_68_25247, Microsoft_FStar_Extraction_ML_Syntax.E_PURE, _68_25246))))
end
| Microsoft_FStar_Absyn_Syntax.Exp_ascribed ((e0, t, f)) -> begin
(let t = (translate_typ g t)
in (let f = (match (f) with
| None -> begin
(failwith ("Ascription node with an empty effect label"))
end
| Some (l) -> begin
(Microsoft_FStar_Extraction_ML_ExtractTyp.translate_eff g l)
end)
in (let e = (check_exp g e0 f t)
in (e, f, t))))
end
| (Microsoft_FStar_Absyn_Syntax.Exp_bvar (_)) | (Microsoft_FStar_Absyn_Syntax.Exp_fvar (_)) -> begin
(let _59_409 = (Microsoft_FStar_Extraction_ML_Env.lookup_var g e)
in (match (_59_409) with
| ((x, mltys), qual) -> begin
(match (mltys) with
| ([], t) -> begin
(let _68_25248 = (maybe_eta_data qual t x)
in (_68_25248, Microsoft_FStar_Extraction_ML_Syntax.E_PURE, t))
end
| _ -> begin
(err_uninst e)
end)
end))
end
| Microsoft_FStar_Absyn_Syntax.Exp_app ((head, args)) -> begin
(let rec synth_app = (fun ( is_data ) ( _59_423 ) ( _59_426 ) ( restArgs ) -> (match ((_59_423, _59_426)) with
| ((mlhead, mlargs_f), (f, t)) -> begin
(match ((restArgs, t)) with
| ([], _) -> begin
(let _59_441 = (match ((Microsoft_FStar_Absyn_Util.is_primop head)) with
| true -> begin
(let _68_25257 = (Support.Prims.pipe_right (Support.List.rev mlargs_f) (Support.List.map Support.Prims.fst))
in ([], _68_25257))
end
| false -> begin
(Support.List.fold_left (fun ( _59_434 ) ( _59_437 ) -> (match ((_59_434, _59_437)) with
| ((lbs, out_args), (arg, f)) -> begin
(match ((f = Microsoft_FStar_Extraction_ML_Syntax.E_PURE)) with
| true -> begin
(lbs, (arg)::out_args)
end
| false -> begin
(let x = (let _68_25260 = (Microsoft_FStar_Absyn_Util.gensym ())
in (_68_25260, (- (1))))
in (((x, arg))::lbs, (Microsoft_FStar_Extraction_ML_Syntax.MLE_Var (x))::out_args))
end)
end)) ([], []) mlargs_f)
end)
in (match (_59_441) with
| (lbs, mlargs) -> begin
(let app = (Support.Prims.pipe_left (maybe_eta_data is_data t) (Microsoft_FStar_Extraction_ML_Syntax.MLE_App ((mlhead, mlargs))))
in (let l_app = (Support.List.fold_right (fun ( _59_445 ) ( out ) -> (match (_59_445) with
| (x, arg) -> begin
Microsoft_FStar_Extraction_ML_Syntax.MLE_Let (((false, ({Microsoft_FStar_Extraction_ML_Syntax.mllb_name = x; Microsoft_FStar_Extraction_ML_Syntax.mllb_tysc = None; Microsoft_FStar_Extraction_ML_Syntax.mllb_add_unit = false; Microsoft_FStar_Extraction_ML_Syntax.mllb_def = arg})::[]), out))
end)) lbs app)
in (l_app, f, t)))
end))
end
| ((Support.Microsoft.FStar.Util.Inl (_), _)::rest, Microsoft_FStar_Extraction_ML_Syntax.MLTY_Fun ((tunit, f', t))) -> begin
(match ((Microsoft_FStar_Extraction_ML_Util.equiv g tunit Microsoft_FStar_Extraction_ML_Syntax.ml_unit_ty)) with
| true -> begin
(synth_app is_data (mlhead, ((Microsoft_FStar_Extraction_ML_Syntax.ml_unit, Microsoft_FStar_Extraction_ML_Syntax.E_PURE))::mlargs_f) ((join f f'), t) rest)
end
| false -> begin
(failwith ("Impossible: ill-typed application"))
end)
end
| ((Support.Microsoft.FStar.Util.Inr (e0), _)::rest, Microsoft_FStar_Extraction_ML_Syntax.MLTY_Fun ((tExpected, f', t))) -> begin
(let _59_478 = (synth_exp g e0)
in (match (_59_478) with
| (e0, f0, tInferred) -> begin
(let e0 = (maybe_coerce g e0 tInferred tExpected)
in (let _68_25264 = (let _68_25263 = (join_l ((f)::(f')::(f0)::[]))
in (_68_25263, t))
in (synth_app is_data (mlhead, ((e0, f0))::mlargs_f) _68_25264 rest)))
end))
end
| _ -> begin
(match ((Microsoft_FStar_Extraction_ML_Util.delta_unfold g t)) with
| Some (t) -> begin
(synth_app is_data (mlhead, mlargs_f) (f, t) restArgs)
end
| None -> begin
(err_ill_typed_application e restArgs t)
end)
end)
end))
in (let head = (Microsoft_FStar_Absyn_Util.compress_exp head)
in (match (head.Microsoft_FStar_Absyn_Syntax.n) with
| (Microsoft_FStar_Absyn_Syntax.Exp_bvar (_)) | (Microsoft_FStar_Absyn_Syntax.Exp_fvar (_)) -> begin
(let _59_498 = (Microsoft_FStar_Extraction_ML_Env.lookup_var g head)
in (match (_59_498) with
| ((head, (vars, t)), qual) -> begin
(let n = (Support.List.length vars)
in (match ((n <= (Support.List.length args))) with
| true -> begin
(let _59_502 = (Support.Microsoft.FStar.Util.first_N n args)
in (match (_59_502) with
| (prefix, rest) -> begin
(let prefixAsMLTypes = (Support.List.map (Microsoft_FStar_Extraction_ML_ExtractTyp.getTypeFromArg g) prefix)
in (let t0 = t
in (let t = (instantiate (vars, t) prefixAsMLTypes)
in (match (rest) with
| [] -> begin
(let _68_25265 = (maybe_eta_data qual t head)
in (_68_25265, Microsoft_FStar_Extraction_ML_Syntax.E_PURE, t))
end
| _ -> begin
(synth_app qual (head, []) (Microsoft_FStar_Extraction_ML_Syntax.E_PURE, t) rest)
end))))
end))
end
| false -> begin
(err_uninst e)
end))
end))
end
| _ -> begin
(let _59_514 = (synth_exp g head)
in (match (_59_514) with
| (head, f, t) -> begin
(synth_app None (head, []) (f, t) args)
end))
end)))
end
| Microsoft_FStar_Absyn_Syntax.Exp_abs ((bs, body)) -> begin
(let _59_537 = (Support.List.fold_left (fun ( _59_521 ) ( _59_525 ) -> (match ((_59_521, _59_525)) with
| ((ml_bs, env), (b, _)) -> begin
(match (b) with
| Support.Microsoft.FStar.Util.Inl (a) -> begin
(let env = (Microsoft_FStar_Extraction_ML_Env.extend_ty env a (Some (Microsoft_FStar_Extraction_ML_Syntax.MLTY_Top)))
in (let ml_b = (let _68_25269 = (Support.Prims.pipe_left (fun ( _68_25268 ) -> Some (_68_25268)) Microsoft_FStar_Extraction_ML_Syntax.ml_unit_ty)
in ((Microsoft_FStar_Extraction_ML_Env.btvar_as_mlident a), _68_25269))
in ((ml_b)::ml_bs, env)))
end
| Support.Microsoft.FStar.Util.Inr (x) -> begin
(let t = (translate_typ env x.Microsoft_FStar_Absyn_Syntax.sort)
in (let env = (Microsoft_FStar_Extraction_ML_Env.extend_bv env x ([], t) false)
in (let ml_b = ((Microsoft_FStar_Extraction_ML_Syntax.as_mlident x.Microsoft_FStar_Absyn_Syntax.v), Some (t))
in ((ml_b)::ml_bs, env))))
end)
end)) ([], g) bs)
in (match (_59_537) with
| (ml_bs, env) -> begin
(let ml_bs = (Support.List.rev ml_bs)
in (let _59_542 = (synth_exp env body)
in (match (_59_542) with
| (ml_body, f, t) -> begin
(let _59_552 = (Support.List.fold_right (fun ( _59_546 ) ( _59_549 ) -> (match ((_59_546, _59_549)) with
| ((_, targ), (f, t)) -> begin
(let _68_25274 = (let _68_25273 = (let _68_25272 = (Support.Microsoft.FStar.Util.must targ)
in (_68_25272, f, t))
in Microsoft_FStar_Extraction_ML_Syntax.MLTY_Fun (_68_25273))
in (Microsoft_FStar_Extraction_ML_Syntax.E_PURE, _68_25274))
end)) ml_bs (f, t))
in (match (_59_552) with
| (f, tfun) -> begin
(Microsoft_FStar_Extraction_ML_Syntax.MLE_Fun ((ml_bs, ml_body)), f, tfun)
end))
end)))
end))
end
| Microsoft_FStar_Absyn_Syntax.Exp_let (((is_rec, lbs), e')) -> begin
(let maybe_generalize = (fun ( _59_564 ) -> (match (_59_564) with
| {Microsoft_FStar_Absyn_Syntax.lbname = lbname; Microsoft_FStar_Absyn_Syntax.lbtyp = t; Microsoft_FStar_Absyn_Syntax.lbeff = lbeff; Microsoft_FStar_Absyn_Syntax.lbdef = e} -> begin
(let f_e = (Microsoft_FStar_Extraction_ML_ExtractTyp.translate_eff g lbeff)
in (let t = (Microsoft_FStar_Absyn_Util.compress_typ t)
in (match (t.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Typ_fun ((bs, c)) when (Microsoft_FStar_Extraction_ML_Util.is_type_abstraction bs) -> begin
(let _59_588 = (match ((Support.Microsoft.FStar.Util.prefix_until (fun ( _59_3 ) -> (match (_59_3) with
| (Support.Microsoft.FStar.Util.Inr (_), _) -> begin
true
end
| _ -> begin
false
end)) bs)) with
| None -> begin
(bs, (Microsoft_FStar_Absyn_Util.comp_result c))
end
| Some ((bs, b, rest)) -> begin
(let _68_25278 = (Microsoft_FStar_Absyn_Syntax.mk_Typ_fun ((b)::rest, c) None c.Microsoft_FStar_Absyn_Syntax.pos)
in (bs, _68_25278))
end)
in (match (_59_588) with
| (tbinders, tbody) -> begin
(let n = (Support.List.length tbinders)
in (let e = (normalize_abs e)
in (match (e.Microsoft_FStar_Absyn_Syntax.n) with
| Microsoft_FStar_Absyn_Syntax.Exp_abs ((bs, body)) -> begin
(match ((n <= (Support.List.length bs))) with
| true -> begin
(let _59_597 = (Support.Microsoft.FStar.Util.first_N n bs)
in (match (_59_597) with
| (targs, rest_args) -> begin
(let expected_t = (match ((Microsoft_FStar_Absyn_Util.mk_subst_binder targs tbinders)) with
| None -> begin
(failwith ("Not enough type binders in the body of the let expression"))
end
| Some (s) -> begin
(Microsoft_FStar_Absyn_Util.subst_typ s tbody)
end)
in (let targs = (Support.Prims.pipe_right targs (Support.List.map (fun ( _59_4 ) -> (match (_59_4) with
| (Support.Microsoft.FStar.Util.Inl (a), _) -> begin
a
end
| _ -> begin
(failwith ("Impossible"))
end))))
in (let env = (Support.List.fold_left (fun ( env ) ( a ) -> (Microsoft_FStar_Extraction_ML_Env.extend_ty env a None)) g targs)
in (let expected_t = (translate_typ env expected_t)
in (let polytype = (let _68_25282 = (Support.Prims.pipe_right targs (Support.List.map Microsoft_FStar_Extraction_ML_Env.btvar_as_mlident))
in (_68_25282, expected_t))
in (let add_unit = (match (rest_args) with
| [] -> begin
(not ((is_value_or_type_app body)))
end
| _ -> begin
false
end)
in (let rest_args = (match (add_unit) with
| true -> begin
(Microsoft_FStar_Extraction_ML_Util.unit_binder)::rest_args
end
| false -> begin
rest_args
end)
in (let body = (match (rest_args) with
| [] -> begin
body
end
| _ -> begin
(Microsoft_FStar_Absyn_Syntax.mk_Exp_abs (rest_args, body) None e.Microsoft_FStar_Absyn_Syntax.pos)
end)
in (lbname, f_e, (t, (targs, polytype)), add_unit, body)))))))))
end))
end
| false -> begin
(failwith ("Not enough type binders"))
end)
end
| _ -> begin
(err_value_restriction e)
end)))
end))
end
| _ -> begin
(let expected_t = (translate_typ g t)
in (lbname, f_e, (t, ([], ([], expected_t))), false, e))
end)))
end))
in (let check_lb = (fun ( env ) ( _59_643 ) -> (match (_59_643) with
| (nm, (lbname, f, (t, (targs, polytype)), add_unit, e)) -> begin
(let env = (Support.List.fold_left (fun ( env ) ( a ) -> (Microsoft_FStar_Extraction_ML_Env.extend_ty env a None)) env targs)
in (let expected_t = (match (add_unit) with
| true -> begin
Microsoft_FStar_Extraction_ML_Syntax.MLTY_Fun ((Microsoft_FStar_Extraction_ML_Syntax.ml_unit_ty, Microsoft_FStar_Extraction_ML_Syntax.E_PURE, (Support.Prims.snd polytype)))
end
| false -> begin
(Support.Prims.snd polytype)
end)
in (let e = (check_exp env e f expected_t)
in (f, {Microsoft_FStar_Extraction_ML_Syntax.mllb_name = nm; Microsoft_FStar_Extraction_ML_Syntax.mllb_tysc = Some (polytype); Microsoft_FStar_Extraction_ML_Syntax.mllb_add_unit = add_unit; Microsoft_FStar_Extraction_ML_Syntax.mllb_def = e}))))
end))
in (let lbs = (Support.Prims.pipe_right lbs (Support.List.map maybe_generalize))
in (let _59_672 = (Support.List.fold_right (fun ( lb ) ( _59_653 ) -> (match (_59_653) with
| (env, lbs) -> begin
(let _59_666 = lb
in (match (_59_666) with
| (lbname, _, (t, (_, polytype)), add_unit, _) -> begin
(let _59_669 = (Microsoft_FStar_Extraction_ML_Env.extend_lb env lbname t polytype add_unit)
in (match (_59_669) with
| (env, nm) -> begin
(env, ((nm, lb))::lbs)
end))
end))
end)) lbs (g, []))
in (match (_59_672) with
| (env_body, lbs) -> begin
(let env_def = (match (is_rec) with
| true -> begin
env_body
end
| false -> begin
g
end)
in (let lbs = (Support.Prims.pipe_right lbs (Support.List.map (check_lb env_def)))
in (let _59_678 = (synth_exp env_body e')
in (match (_59_678) with
| (e', f', t') -> begin
(let f = (let _68_25292 = (let _68_25291 = (Support.List.map Support.Prims.fst lbs)
in (f')::_68_25291)
in (join_l _68_25292))
in (let _68_25296 = (let _68_25295 = (let _68_25294 = (let _68_25293 = (Support.List.map Support.Prims.snd lbs)
in (is_rec, _68_25293))
in (_68_25294, e'))
in Microsoft_FStar_Extraction_ML_Syntax.MLE_Let (_68_25295))
in (_68_25296, f, t')))
end))))
end)))))
end
| Microsoft_FStar_Absyn_Syntax.Exp_match ((e, pats)) -> begin
(failwith ("Matches must be checked; missing a compiler-provided annotation"))
end
| Microsoft_FStar_Absyn_Syntax.Exp_meta (Microsoft_FStar_Absyn_Syntax.Meta_desugared ((e, _))) -> begin
(synth_exp g e)
end
| (Microsoft_FStar_Absyn_Syntax.Exp_uvar (_)) | (Microsoft_FStar_Absyn_Syntax.Exp_delayed (_)) -> begin
(failwith ("Unexpected expression"))
end))

let fresh = (let c = (Support.Microsoft.FStar.Util.mk_ref 0)
in (fun ( x ) -> (let _59_698 = (Support.Microsoft.FStar.Util.incr c)
in (let _68_25299 = (Support.ST.read c)
in (x, _68_25299)))))

let ind_discriminator_body = (fun ( env ) ( discName ) ( constrName ) -> (let mlid = (fresh "_discr_")
in (let _59_707 = (let _68_25306 = (Microsoft_FStar_Absyn_Util.fv constrName)
in (Microsoft_FStar_Extraction_ML_Env.lookup_fv env _68_25306))
in (match (_59_707) with
| (_, ts) -> begin
(let arg_pat = (match ((Support.Prims.snd ts)) with
| Microsoft_FStar_Extraction_ML_Syntax.MLTY_Fun (_) -> begin
(Microsoft_FStar_Extraction_ML_Syntax.MLP_Wild)::[]
end
| _ -> begin
[]
end)
in (let rid = constrName
in (let discrBody = (let _68_25314 = (let _68_25313 = (let _68_25312 = (let _68_25311 = (let _68_25310 = (let _68_25309 = (let _68_25308 = (let _68_25307 = (Microsoft_FStar_Extraction_ML_Syntax.mlpath_of_lident rid)
in (_68_25307, arg_pat))
in Microsoft_FStar_Extraction_ML_Syntax.MLP_CTor (_68_25308))
in (_68_25309, None, Microsoft_FStar_Extraction_ML_Syntax.MLE_Const (Microsoft_FStar_Extraction_ML_Syntax.MLC_Bool (true))))
in (_68_25310)::((Microsoft_FStar_Extraction_ML_Syntax.MLP_Wild, None, Microsoft_FStar_Extraction_ML_Syntax.MLE_Const (Microsoft_FStar_Extraction_ML_Syntax.MLC_Bool (false))))::[])
in (Microsoft_FStar_Extraction_ML_Syntax.MLE_Name (([], (Microsoft_FStar_Extraction_ML_Syntax.idsym mlid))), _68_25311))
in Microsoft_FStar_Extraction_ML_Syntax.MLE_Match (_68_25312))
in (((mlid, None))::[], _68_25313))
in Microsoft_FStar_Extraction_ML_Syntax.MLE_Fun (_68_25314))
in Microsoft_FStar_Extraction_ML_Syntax.MLM_Let ((false, ({Microsoft_FStar_Extraction_ML_Syntax.mllb_name = (Microsoft_FStar_Extraction_ML_Env.convIdent discName.Microsoft_FStar_Absyn_Syntax.ident); Microsoft_FStar_Extraction_ML_Syntax.mllb_tysc = None; Microsoft_FStar_Extraction_ML_Syntax.mllb_add_unit = false; Microsoft_FStar_Extraction_ML_Syntax.mllb_def = discrBody})::[])))))
end))))




