open Prims
type step =
  | Beta
  | Iota
  | Zeta
  | Exclude of step
  | WHNF
  | Primops
  | Eager_unfolding
  | Inlining
  | NoDeltaSteps
  | UnfoldUntil of FStar_Syntax_Syntax.delta_depth
  | UnfoldTac
  | PureSubtermsWithinComputations
  | Simplify
  | EraseUniverses
  | AllowUnboundUniverses
  | Reify
  | CompressUvars
  | NoFullNorm
let uu___is_Beta: step -> Prims.bool =
  fun projectee  -> match projectee with | Beta  -> true | uu____13 -> false
let uu___is_Iota: step -> Prims.bool =
  fun projectee  -> match projectee with | Iota  -> true | uu____18 -> false
let uu___is_Zeta: step -> Prims.bool =
  fun projectee  -> match projectee with | Zeta  -> true | uu____23 -> false
let uu___is_Exclude: step -> Prims.bool =
  fun projectee  ->
    match projectee with | Exclude _0 -> true | uu____29 -> false
let __proj__Exclude__item___0: step -> step =
  fun projectee  -> match projectee with | Exclude _0 -> _0
let uu___is_WHNF: step -> Prims.bool =
  fun projectee  -> match projectee with | WHNF  -> true | uu____42 -> false
let uu___is_Primops: step -> Prims.bool =
  fun projectee  ->
    match projectee with | Primops  -> true | uu____47 -> false
let uu___is_Eager_unfolding: step -> Prims.bool =
  fun projectee  ->
    match projectee with | Eager_unfolding  -> true | uu____52 -> false
let uu___is_Inlining: step -> Prims.bool =
  fun projectee  ->
    match projectee with | Inlining  -> true | uu____57 -> false
let uu___is_NoDeltaSteps: step -> Prims.bool =
  fun projectee  ->
    match projectee with | NoDeltaSteps  -> true | uu____62 -> false
let uu___is_UnfoldUntil: step -> Prims.bool =
  fun projectee  ->
    match projectee with | UnfoldUntil _0 -> true | uu____68 -> false
let __proj__UnfoldUntil__item___0: step -> FStar_Syntax_Syntax.delta_depth =
  fun projectee  -> match projectee with | UnfoldUntil _0 -> _0
let uu___is_UnfoldTac: step -> Prims.bool =
  fun projectee  ->
    match projectee with | UnfoldTac  -> true | uu____81 -> false
let uu___is_PureSubtermsWithinComputations: step -> Prims.bool =
  fun projectee  ->
    match projectee with
    | PureSubtermsWithinComputations  -> true
    | uu____86 -> false
let uu___is_Simplify: step -> Prims.bool =
  fun projectee  ->
    match projectee with | Simplify  -> true | uu____91 -> false
let uu___is_EraseUniverses: step -> Prims.bool =
  fun projectee  ->
    match projectee with | EraseUniverses  -> true | uu____96 -> false
let uu___is_AllowUnboundUniverses: step -> Prims.bool =
  fun projectee  ->
    match projectee with
    | AllowUnboundUniverses  -> true
    | uu____101 -> false
let uu___is_Reify: step -> Prims.bool =
  fun projectee  ->
    match projectee with | Reify  -> true | uu____106 -> false
let uu___is_CompressUvars: step -> Prims.bool =
  fun projectee  ->
    match projectee with | CompressUvars  -> true | uu____111 -> false
let uu___is_NoFullNorm: step -> Prims.bool =
  fun projectee  ->
    match projectee with | NoFullNorm  -> true | uu____116 -> false
type steps = step Prims.list
type primitive_step =
  {
  name: FStar_Ident.lid;
  arity: Prims.int;
  strong_reduction_ok: Prims.bool;
  interpretation:
    FStar_Range.range ->
      FStar_Syntax_Syntax.args -> FStar_Syntax_Syntax.term option;}
let __proj__Mkprimitive_step__item__name: primitive_step -> FStar_Ident.lid =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        strong_reduction_ok = __fname__strong_reduction_ok;
        interpretation = __fname__interpretation;_} -> __fname__name
let __proj__Mkprimitive_step__item__arity: primitive_step -> Prims.int =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        strong_reduction_ok = __fname__strong_reduction_ok;
        interpretation = __fname__interpretation;_} -> __fname__arity
let __proj__Mkprimitive_step__item__strong_reduction_ok:
  primitive_step -> Prims.bool =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        strong_reduction_ok = __fname__strong_reduction_ok;
        interpretation = __fname__interpretation;_} ->
        __fname__strong_reduction_ok
let __proj__Mkprimitive_step__item__interpretation:
  primitive_step ->
    FStar_Range.range ->
      FStar_Syntax_Syntax.args -> FStar_Syntax_Syntax.term option
  =
  fun projectee  ->
    match projectee with
    | { name = __fname__name; arity = __fname__arity;
        strong_reduction_ok = __fname__strong_reduction_ok;
        interpretation = __fname__interpretation;_} ->
        __fname__interpretation
type closure =
  | Clos of (closure Prims.list* FStar_Syntax_Syntax.term* (closure
  Prims.list* FStar_Syntax_Syntax.term) FStar_Syntax_Syntax.memo*
  Prims.bool)
  | Univ of FStar_Syntax_Syntax.universe
  | Dummy
let uu___is_Clos: closure -> Prims.bool =
  fun projectee  ->
    match projectee with | Clos _0 -> true | uu____238 -> false
let __proj__Clos__item___0:
  closure ->
    (closure Prims.list* FStar_Syntax_Syntax.term* (closure Prims.list*
      FStar_Syntax_Syntax.term) FStar_Syntax_Syntax.memo* Prims.bool)
  = fun projectee  -> match projectee with | Clos _0 -> _0
let uu___is_Univ: closure -> Prims.bool =
  fun projectee  ->
    match projectee with | Univ _0 -> true | uu____279 -> false
let __proj__Univ__item___0: closure -> FStar_Syntax_Syntax.universe =
  fun projectee  -> match projectee with | Univ _0 -> _0
let uu___is_Dummy: closure -> Prims.bool =
  fun projectee  ->
    match projectee with | Dummy  -> true | uu____292 -> false
type env = closure Prims.list
let closure_to_string: closure -> Prims.string =
  fun uu___137_297  ->
    match uu___137_297 with
    | Clos (uu____298,t,uu____300,uu____301) ->
        FStar_Syntax_Print.term_to_string t
    | Univ uu____312 -> "Univ"
    | Dummy  -> "dummy"
type cfg =
  {
  steps: steps;
  tcenv: FStar_TypeChecker_Env.env;
  delta_level: FStar_TypeChecker_Env.delta_level Prims.list;
  primitive_steps: primitive_step Prims.list;}
let __proj__Mkcfg__item__steps: cfg -> steps =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps;_} -> __fname__steps
let __proj__Mkcfg__item__tcenv: cfg -> FStar_TypeChecker_Env.env =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps;_} -> __fname__tcenv
let __proj__Mkcfg__item__delta_level:
  cfg -> FStar_TypeChecker_Env.delta_level Prims.list =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps;_} -> __fname__delta_level
let __proj__Mkcfg__item__primitive_steps: cfg -> primitive_step Prims.list =
  fun projectee  ->
    match projectee with
    | { steps = __fname__steps; tcenv = __fname__tcenv;
        delta_level = __fname__delta_level;
        primitive_steps = __fname__primitive_steps;_} ->
        __fname__primitive_steps
type branches =
  (FStar_Syntax_Syntax.pat* FStar_Syntax_Syntax.term option*
    FStar_Syntax_Syntax.term) Prims.list
type subst_t = FStar_Syntax_Syntax.subst_elt Prims.list
type stack_elt =
  | Arg of (closure* FStar_Syntax_Syntax.aqual* FStar_Range.range)
  | UnivArgs of (FStar_Syntax_Syntax.universe Prims.list* FStar_Range.range)
  | MemoLazy of (env* FStar_Syntax_Syntax.term) FStar_Syntax_Syntax.memo
  | Match of (env* branches* FStar_Range.range)
  | Abs of (env* FStar_Syntax_Syntax.binders* env*
  FStar_Syntax_Syntax.residual_comp option* FStar_Range.range)
  | App of (FStar_Syntax_Syntax.term* FStar_Syntax_Syntax.aqual*
  FStar_Range.range)
  | Meta of (FStar_Syntax_Syntax.metadata* FStar_Range.range)
  | Let of (env* FStar_Syntax_Syntax.binders* FStar_Syntax_Syntax.letbinding*
  FStar_Range.range)
  | Steps of (steps* primitive_step Prims.list*
  FStar_TypeChecker_Env.delta_level Prims.list)
  | Debug of FStar_Syntax_Syntax.term
let uu___is_Arg: stack_elt -> Prims.bool =
  fun projectee  ->
    match projectee with | Arg _0 -> true | uu____462 -> false
let __proj__Arg__item___0:
  stack_elt -> (closure* FStar_Syntax_Syntax.aqual* FStar_Range.range) =
  fun projectee  -> match projectee with | Arg _0 -> _0
let uu___is_UnivArgs: stack_elt -> Prims.bool =
  fun projectee  ->
    match projectee with | UnivArgs _0 -> true | uu____488 -> false
let __proj__UnivArgs__item___0:
  stack_elt -> (FStar_Syntax_Syntax.universe Prims.list* FStar_Range.range) =
  fun projectee  -> match projectee with | UnivArgs _0 -> _0
let uu___is_MemoLazy: stack_elt -> Prims.bool =
  fun projectee  ->
    match projectee with | MemoLazy _0 -> true | uu____514 -> false
let __proj__MemoLazy__item___0:
  stack_elt -> (env* FStar_Syntax_Syntax.term) FStar_Syntax_Syntax.memo =
  fun projectee  -> match projectee with | MemoLazy _0 -> _0
let uu___is_Match: stack_elt -> Prims.bool =
  fun projectee  ->
    match projectee with | Match _0 -> true | uu____543 -> false
let __proj__Match__item___0: stack_elt -> (env* branches* FStar_Range.range)
  = fun projectee  -> match projectee with | Match _0 -> _0
let uu___is_Abs: stack_elt -> Prims.bool =
  fun projectee  ->
    match projectee with | Abs _0 -> true | uu____572 -> false
let __proj__Abs__item___0:
  stack_elt ->
    (env* FStar_Syntax_Syntax.binders* env* FStar_Syntax_Syntax.residual_comp
      option* FStar_Range.range)
  = fun projectee  -> match projectee with | Abs _0 -> _0
let uu___is_App: stack_elt -> Prims.bool =
  fun projectee  ->
    match projectee with | App _0 -> true | uu____607 -> false
let __proj__App__item___0:
  stack_elt ->
    (FStar_Syntax_Syntax.term* FStar_Syntax_Syntax.aqual* FStar_Range.range)
  = fun projectee  -> match projectee with | App _0 -> _0
let uu___is_Meta: stack_elt -> Prims.bool =
  fun projectee  ->
    match projectee with | Meta _0 -> true | uu____632 -> false
let __proj__Meta__item___0:
  stack_elt -> (FStar_Syntax_Syntax.metadata* FStar_Range.range) =
  fun projectee  -> match projectee with | Meta _0 -> _0
let uu___is_Let: stack_elt -> Prims.bool =
  fun projectee  ->
    match projectee with | Let _0 -> true | uu____656 -> false
let __proj__Let__item___0:
  stack_elt ->
    (env* FStar_Syntax_Syntax.binders* FStar_Syntax_Syntax.letbinding*
      FStar_Range.range)
  = fun projectee  -> match projectee with | Let _0 -> _0
let uu___is_Steps: stack_elt -> Prims.bool =
  fun projectee  ->
    match projectee with | Steps _0 -> true | uu____687 -> false
let __proj__Steps__item___0:
  stack_elt ->
    (steps* primitive_step Prims.list* FStar_TypeChecker_Env.delta_level
      Prims.list)
  = fun projectee  -> match projectee with | Steps _0 -> _0
let uu___is_Debug: stack_elt -> Prims.bool =
  fun projectee  ->
    match projectee with | Debug _0 -> true | uu____716 -> false
let __proj__Debug__item___0: stack_elt -> FStar_Syntax_Syntax.term =
  fun projectee  -> match projectee with | Debug _0 -> _0
type stack = stack_elt Prims.list
let mk t r = FStar_Syntax_Syntax.mk t None r
let set_memo r t =
  let uu____772 = FStar_ST.read r in
  match uu____772 with
  | Some uu____777 -> failwith "Unexpected set_memo: thunk already evaluated"
  | None  -> FStar_ST.write r (Some t)
let env_to_string: closure Prims.list -> Prims.string =
  fun env  ->
    let uu____787 = FStar_List.map closure_to_string env in
    FStar_All.pipe_right uu____787 (FStar_String.concat "; ")
let stack_elt_to_string: stack_elt -> Prims.string =
  fun uu___138_793  ->
    match uu___138_793 with
    | Arg (c,uu____795,uu____796) ->
        let uu____797 = closure_to_string c in
        FStar_Util.format1 "Closure %s" uu____797
    | MemoLazy uu____798 -> "MemoLazy"
    | Abs (uu____802,bs,uu____804,uu____805,uu____806) ->
        let uu____809 =
          FStar_All.pipe_left FStar_Util.string_of_int (FStar_List.length bs) in
        FStar_Util.format1 "Abs %s" uu____809
    | UnivArgs uu____816 -> "UnivArgs"
    | Match uu____820 -> "Match"
    | App (t,uu____825,uu____826) ->
        let uu____827 = FStar_Syntax_Print.term_to_string t in
        FStar_Util.format1 "App %s" uu____827
    | Meta (m,uu____829) -> "Meta"
    | Let uu____830 -> "Let"
    | Steps (uu____835,uu____836,uu____837) -> "Steps"
    | Debug t ->
        let uu____843 = FStar_Syntax_Print.term_to_string t in
        FStar_Util.format1 "Debug %s" uu____843
let stack_to_string: stack_elt Prims.list -> Prims.string =
  fun s  ->
    let uu____850 = FStar_List.map stack_elt_to_string s in
    FStar_All.pipe_right uu____850 (FStar_String.concat "; ")
let log: cfg -> (Prims.unit -> Prims.unit) -> Prims.unit =
  fun cfg  ->
    fun f  ->
      let uu____866 =
        FStar_TypeChecker_Env.debug cfg.tcenv (FStar_Options.Other "Norm") in
      if uu____866 then f () else ()
let is_empty uu___139_877 =
  match uu___139_877 with | [] -> true | uu____879 -> false
let lookup_bvar env x =
  try FStar_List.nth env x.FStar_Syntax_Syntax.index
  with
  | uu____900 ->
      let uu____901 =
        let uu____902 = FStar_Syntax_Print.db_to_string x in
        FStar_Util.format1 "Failed to find %s\n" uu____902 in
      failwith uu____901
let downgrade_ghost_effect_name:
  FStar_Ident.lident -> FStar_Ident.lident option =
  fun l  ->
    if FStar_Ident.lid_equals l FStar_Syntax_Const.effect_Ghost_lid
    then Some FStar_Syntax_Const.effect_Pure_lid
    else
      if FStar_Ident.lid_equals l FStar_Syntax_Const.effect_GTot_lid
      then Some FStar_Syntax_Const.effect_Tot_lid
      else
        if FStar_Ident.lid_equals l FStar_Syntax_Const.effect_GHOST_lid
        then Some FStar_Syntax_Const.effect_PURE_lid
        else None
let norm_universe:
  cfg ->
    closure Prims.list ->
      FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe
  =
  fun cfg  ->
    fun env  ->
      fun u  ->
        let norm_univs us =
          let us1 = FStar_Util.sort_with FStar_Syntax_Util.compare_univs us in
          let uu____937 =
            FStar_List.fold_left
              (fun uu____946  ->
                 fun u1  ->
                   match uu____946 with
                   | (cur_kernel,cur_max,out) ->
                       let uu____961 = FStar_Syntax_Util.univ_kernel u1 in
                       (match uu____961 with
                        | (k_u,n1) ->
                            let uu____970 =
                              FStar_Syntax_Util.eq_univs cur_kernel k_u in
                            if uu____970
                            then (cur_kernel, u1, out)
                            else (k_u, u1, (cur_max :: out))))
              (FStar_Syntax_Syntax.U_zero, FStar_Syntax_Syntax.U_zero, [])
              us1 in
          match uu____937 with
          | (uu____980,u1,out) -> FStar_List.rev (u1 :: out) in
        let rec aux u1 =
          let u2 = FStar_Syntax_Subst.compress_univ u1 in
          match u2 with
          | FStar_Syntax_Syntax.U_bvar x ->
              (try
                 let uu____996 = FStar_List.nth env x in
                 match uu____996 with
                 | Univ u3 -> aux u3
                 | Dummy  -> [u2]
                 | uu____999 ->
                     failwith "Impossible: universe variable bound to a term"
               with
               | uu____1003 ->
                   let uu____1004 =
                     FStar_All.pipe_right cfg.steps
                       (FStar_List.contains AllowUnboundUniverses) in
                   if uu____1004
                   then [FStar_Syntax_Syntax.U_unknown]
                   else failwith "Universe variable not found")
          | FStar_Syntax_Syntax.U_zero  -> [u2]
          | FStar_Syntax_Syntax.U_unif uu____1008 -> [u2]
          | FStar_Syntax_Syntax.U_name uu____1011 -> [u2]
          | FStar_Syntax_Syntax.U_unknown  -> [u2]
          | FStar_Syntax_Syntax.U_max [] -> [FStar_Syntax_Syntax.U_zero]
          | FStar_Syntax_Syntax.U_max us ->
              let us1 =
                let uu____1016 = FStar_List.collect aux us in
                FStar_All.pipe_right uu____1016 norm_univs in
              (match us1 with
               | u_k::hd1::rest ->
                   let rest1 = hd1 :: rest in
                   let uu____1027 = FStar_Syntax_Util.univ_kernel u_k in
                   (match uu____1027 with
                    | (FStar_Syntax_Syntax.U_zero ,n1) ->
                        let uu____1032 =
                          FStar_All.pipe_right rest1
                            (FStar_List.for_all
                               (fun u3  ->
                                  let uu____1035 =
                                    FStar_Syntax_Util.univ_kernel u3 in
                                  match uu____1035 with
                                  | (uu____1038,m) -> n1 <= m)) in
                        if uu____1032 then rest1 else us1
                    | uu____1042 -> us1)
               | uu____1045 -> us1)
          | FStar_Syntax_Syntax.U_succ u3 ->
              let uu____1048 = aux u3 in
              FStar_List.map (fun _0_40  -> FStar_Syntax_Syntax.U_succ _0_40)
                uu____1048 in
        let uu____1050 =
          FStar_All.pipe_right cfg.steps (FStar_List.contains EraseUniverses) in
        if uu____1050
        then FStar_Syntax_Syntax.U_unknown
        else
          (let uu____1052 = aux u in
           match uu____1052 with
           | [] -> FStar_Syntax_Syntax.U_zero
           | (FStar_Syntax_Syntax.U_zero )::[] -> FStar_Syntax_Syntax.U_zero
           | (FStar_Syntax_Syntax.U_zero )::u1::[] -> u1
           | (FStar_Syntax_Syntax.U_zero )::us ->
               FStar_Syntax_Syntax.U_max us
           | u1::[] -> u1
           | us -> FStar_Syntax_Syntax.U_max us)
let rec closure_as_term:
  cfg ->
    closure Prims.list ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun cfg  ->
    fun env  ->
      fun t  ->
        log cfg
          (fun uu____1140  ->
             let uu____1141 = FStar_Syntax_Print.tag_of_term t in
             let uu____1142 = FStar_Syntax_Print.term_to_string t in
             FStar_Util.print2 ">>> %s Closure_as_term %s\n" uu____1141
               uu____1142);
        (match env with
         | [] when
             FStar_All.pipe_left Prims.op_Negation
               (FStar_List.contains CompressUvars cfg.steps)
             -> t
         | uu____1143 ->
             let t1 = FStar_Syntax_Subst.compress t in
             (match t1.FStar_Syntax_Syntax.n with
              | FStar_Syntax_Syntax.Tm_delayed uu____1146 ->
                  failwith "Impossible"
              | FStar_Syntax_Syntax.Tm_unknown  -> t1
              | FStar_Syntax_Syntax.Tm_constant uu____1161 -> t1
              | FStar_Syntax_Syntax.Tm_name uu____1162 -> t1
              | FStar_Syntax_Syntax.Tm_fvar uu____1163 -> t1
              | FStar_Syntax_Syntax.Tm_uvar uu____1164 -> t1
              | FStar_Syntax_Syntax.Tm_type u ->
                  let uu____1174 =
                    let uu____1175 = norm_universe cfg env u in
                    FStar_Syntax_Syntax.Tm_type uu____1175 in
                  mk uu____1174 t1.FStar_Syntax_Syntax.pos
              | FStar_Syntax_Syntax.Tm_uinst (t',us) ->
                  let uu____1182 = FStar_List.map (norm_universe cfg env) us in
                  FStar_Syntax_Syntax.mk_Tm_uinst t' uu____1182
              | FStar_Syntax_Syntax.Tm_bvar x ->
                  let uu____1184 = lookup_bvar env x in
                  (match uu____1184 with
                   | Univ uu____1185 ->
                       failwith
                         "Impossible: term variable is bound to a universe"
                   | Dummy  -> t1
                   | Clos (env1,t0,r,uu____1189) ->
                       closure_as_term cfg env1 t0)
              | FStar_Syntax_Syntax.Tm_app (head1,args) ->
                  let head2 = closure_as_term_delayed cfg env head1 in
                  let args1 = closures_as_args_delayed cfg env args in
                  mk (FStar_Syntax_Syntax.Tm_app (head2, args1))
                    t1.FStar_Syntax_Syntax.pos
              | FStar_Syntax_Syntax.Tm_abs (bs,body,lopt) ->
                  let uu____1247 = closures_as_binders_delayed cfg env bs in
                  (match uu____1247 with
                   | (bs1,env1) ->
                       let body1 = closure_as_term_delayed cfg env1 body in
                       let uu____1267 =
                         let uu____1268 =
                           let uu____1278 = close_lcomp_opt cfg env1 lopt in
                           (bs1, body1, uu____1278) in
                         FStar_Syntax_Syntax.Tm_abs uu____1268 in
                       mk uu____1267 t1.FStar_Syntax_Syntax.pos)
              | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
                  let uu____1298 = closures_as_binders_delayed cfg env bs in
                  (match uu____1298 with
                   | (bs1,env1) ->
                       let c1 = close_comp cfg env1 c in
                       mk (FStar_Syntax_Syntax.Tm_arrow (bs1, c1))
                         t1.FStar_Syntax_Syntax.pos)
              | FStar_Syntax_Syntax.Tm_refine (x,phi) ->
                  let uu____1329 =
                    let uu____1336 =
                      let uu____1340 = FStar_Syntax_Syntax.mk_binder x in
                      [uu____1340] in
                    closures_as_binders_delayed cfg env uu____1336 in
                  (match uu____1329 with
                   | (x1,env1) ->
                       let phi1 = closure_as_term_delayed cfg env1 phi in
                       let uu____1354 =
                         let uu____1355 =
                           let uu____1360 =
                             let uu____1361 = FStar_List.hd x1 in
                             FStar_All.pipe_right uu____1361
                               FStar_Pervasives.fst in
                           (uu____1360, phi1) in
                         FStar_Syntax_Syntax.Tm_refine uu____1355 in
                       mk uu____1354 t1.FStar_Syntax_Syntax.pos)
              | FStar_Syntax_Syntax.Tm_ascribed (t11,(annot,tacopt),lopt) ->
                  let annot1 =
                    match annot with
                    | FStar_Util.Inl t2 ->
                        let uu____1429 = closure_as_term_delayed cfg env t2 in
                        FStar_Util.Inl uu____1429
                    | FStar_Util.Inr c ->
                        let uu____1443 = close_comp cfg env c in
                        FStar_Util.Inr uu____1443 in
                  let tacopt1 =
                    FStar_Util.map_opt tacopt
                      (closure_as_term_delayed cfg env) in
                  let uu____1458 =
                    let uu____1459 =
                      let uu____1477 = closure_as_term_delayed cfg env t11 in
                      (uu____1477, (annot1, tacopt1), lopt) in
                    FStar_Syntax_Syntax.Tm_ascribed uu____1459 in
                  mk uu____1458 t1.FStar_Syntax_Syntax.pos
              | FStar_Syntax_Syntax.Tm_meta
                  (t',FStar_Syntax_Syntax.Meta_pattern args) ->
                  let uu____1515 =
                    let uu____1516 =
                      let uu____1521 = closure_as_term_delayed cfg env t' in
                      let uu____1524 =
                        let uu____1525 =
                          FStar_All.pipe_right args
                            (FStar_List.map
                               (closures_as_args_delayed cfg env)) in
                        FStar_Syntax_Syntax.Meta_pattern uu____1525 in
                      (uu____1521, uu____1524) in
                    FStar_Syntax_Syntax.Tm_meta uu____1516 in
                  mk uu____1515 t1.FStar_Syntax_Syntax.pos
              | FStar_Syntax_Syntax.Tm_meta
                  (t',FStar_Syntax_Syntax.Meta_monadic (m,tbody)) ->
                  let uu____1567 =
                    let uu____1568 =
                      let uu____1573 = closure_as_term_delayed cfg env t' in
                      let uu____1576 =
                        let uu____1577 =
                          let uu____1582 =
                            closure_as_term_delayed cfg env tbody in
                          (m, uu____1582) in
                        FStar_Syntax_Syntax.Meta_monadic uu____1577 in
                      (uu____1573, uu____1576) in
                    FStar_Syntax_Syntax.Tm_meta uu____1568 in
                  mk uu____1567 t1.FStar_Syntax_Syntax.pos
              | FStar_Syntax_Syntax.Tm_meta
                  (t',FStar_Syntax_Syntax.Meta_monadic_lift (m1,m2,tbody)) ->
                  let uu____1601 =
                    let uu____1602 =
                      let uu____1607 = closure_as_term_delayed cfg env t' in
                      let uu____1610 =
                        let uu____1611 =
                          let uu____1617 =
                            closure_as_term_delayed cfg env tbody in
                          (m1, m2, uu____1617) in
                        FStar_Syntax_Syntax.Meta_monadic_lift uu____1611 in
                      (uu____1607, uu____1610) in
                    FStar_Syntax_Syntax.Tm_meta uu____1602 in
                  mk uu____1601 t1.FStar_Syntax_Syntax.pos
              | FStar_Syntax_Syntax.Tm_meta (t',m) ->
                  let uu____1630 =
                    let uu____1631 =
                      let uu____1636 = closure_as_term_delayed cfg env t' in
                      (uu____1636, m) in
                    FStar_Syntax_Syntax.Tm_meta uu____1631 in
                  mk uu____1630 t1.FStar_Syntax_Syntax.pos
              | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) ->
                  let env0 = env in
                  let env1 =
                    FStar_List.fold_left
                      (fun env1  -> fun uu____1657  -> Dummy :: env1) env
                      lb.FStar_Syntax_Syntax.lbunivs in
                  let typ =
                    closure_as_term_delayed cfg env1
                      lb.FStar_Syntax_Syntax.lbtyp in
                  let def =
                    closure_as_term cfg env1 lb.FStar_Syntax_Syntax.lbdef in
                  let body1 =
                    match lb.FStar_Syntax_Syntax.lbname with
                    | FStar_Util.Inr uu____1668 -> body
                    | FStar_Util.Inl uu____1669 ->
                        closure_as_term cfg (Dummy :: env0) body in
                  let lb1 =
                    let uu___153_1671 = lb in
                    {
                      FStar_Syntax_Syntax.lbname =
                        (uu___153_1671.FStar_Syntax_Syntax.lbname);
                      FStar_Syntax_Syntax.lbunivs =
                        (uu___153_1671.FStar_Syntax_Syntax.lbunivs);
                      FStar_Syntax_Syntax.lbtyp = typ;
                      FStar_Syntax_Syntax.lbeff =
                        (uu___153_1671.FStar_Syntax_Syntax.lbeff);
                      FStar_Syntax_Syntax.lbdef = def
                    } in
                  mk (FStar_Syntax_Syntax.Tm_let ((false, [lb1]), body1))
                    t1.FStar_Syntax_Syntax.pos
              | FStar_Syntax_Syntax.Tm_let ((uu____1678,lbs),body) ->
                  let norm_one_lb env1 lb =
                    let env_univs =
                      FStar_List.fold_right
                        (fun uu____1702  -> fun env2  -> Dummy :: env2)
                        lb.FStar_Syntax_Syntax.lbunivs env1 in
                    let env2 =
                      let uu____1707 = FStar_Syntax_Syntax.is_top_level lbs in
                      if uu____1707
                      then env_univs
                      else
                        FStar_List.fold_right
                          (fun uu____1711  -> fun env2  -> Dummy :: env2) lbs
                          env_univs in
                    let uu___154_1714 = lb in
                    let uu____1715 =
                      closure_as_term cfg env_univs
                        lb.FStar_Syntax_Syntax.lbtyp in
                    let uu____1718 =
                      closure_as_term cfg env2 lb.FStar_Syntax_Syntax.lbdef in
                    {
                      FStar_Syntax_Syntax.lbname =
                        (uu___154_1714.FStar_Syntax_Syntax.lbname);
                      FStar_Syntax_Syntax.lbunivs =
                        (uu___154_1714.FStar_Syntax_Syntax.lbunivs);
                      FStar_Syntax_Syntax.lbtyp = uu____1715;
                      FStar_Syntax_Syntax.lbeff =
                        (uu___154_1714.FStar_Syntax_Syntax.lbeff);
                      FStar_Syntax_Syntax.lbdef = uu____1718
                    } in
                  let lbs1 =
                    FStar_All.pipe_right lbs
                      (FStar_List.map (norm_one_lb env)) in
                  let body1 =
                    let body_env =
                      FStar_List.fold_right
                        (fun uu____1729  -> fun env1  -> Dummy :: env1) lbs1
                        env in
                    closure_as_term cfg body_env body in
                  mk (FStar_Syntax_Syntax.Tm_let ((true, lbs1), body1))
                    t1.FStar_Syntax_Syntax.pos
              | FStar_Syntax_Syntax.Tm_match (head1,branches) ->
                  let head2 = closure_as_term cfg env head1 in
                  let norm_one_branch env1 uu____1784 =
                    match uu____1784 with
                    | (pat,w_opt,tm) ->
                        let rec norm_pat env2 p =
                          match p.FStar_Syntax_Syntax.v with
                          | FStar_Syntax_Syntax.Pat_constant uu____1830 ->
                              (p, env2)
                          | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
                              let uu____1846 =
                                FStar_All.pipe_right pats
                                  (FStar_List.fold_left
                                     (fun uu____1880  ->
                                        fun uu____1881  ->
                                          match (uu____1880, uu____1881) with
                                          | ((pats1,env3),(p1,b)) ->
                                              let uu____1946 =
                                                norm_pat env3 p1 in
                                              (match uu____1946 with
                                               | (p2,env4) ->
                                                   (((p2, b) :: pats1), env4)))
                                     ([], env2)) in
                              (match uu____1846 with
                               | (pats1,env3) ->
                                   ((let uu___155_2012 = p in
                                     {
                                       FStar_Syntax_Syntax.v =
                                         (FStar_Syntax_Syntax.Pat_cons
                                            (fv, (FStar_List.rev pats1)));
                                       FStar_Syntax_Syntax.ty =
                                         (uu___155_2012.FStar_Syntax_Syntax.ty);
                                       FStar_Syntax_Syntax.p =
                                         (uu___155_2012.FStar_Syntax_Syntax.p)
                                     }), env3))
                          | FStar_Syntax_Syntax.Pat_var x ->
                              let x1 =
                                let uu___156_2026 = x in
                                let uu____2027 =
                                  closure_as_term cfg env2
                                    x.FStar_Syntax_Syntax.sort in
                                {
                                  FStar_Syntax_Syntax.ppname =
                                    (uu___156_2026.FStar_Syntax_Syntax.ppname);
                                  FStar_Syntax_Syntax.index =
                                    (uu___156_2026.FStar_Syntax_Syntax.index);
                                  FStar_Syntax_Syntax.sort = uu____2027
                                } in
                              ((let uu___157_2033 = p in
                                {
                                  FStar_Syntax_Syntax.v =
                                    (FStar_Syntax_Syntax.Pat_var x1);
                                  FStar_Syntax_Syntax.ty =
                                    (uu___157_2033.FStar_Syntax_Syntax.ty);
                                  FStar_Syntax_Syntax.p =
                                    (uu___157_2033.FStar_Syntax_Syntax.p)
                                }), (Dummy :: env2))
                          | FStar_Syntax_Syntax.Pat_wild x ->
                              let x1 =
                                let uu___158_2038 = x in
                                let uu____2039 =
                                  closure_as_term cfg env2
                                    x.FStar_Syntax_Syntax.sort in
                                {
                                  FStar_Syntax_Syntax.ppname =
                                    (uu___158_2038.FStar_Syntax_Syntax.ppname);
                                  FStar_Syntax_Syntax.index =
                                    (uu___158_2038.FStar_Syntax_Syntax.index);
                                  FStar_Syntax_Syntax.sort = uu____2039
                                } in
                              ((let uu___159_2045 = p in
                                {
                                  FStar_Syntax_Syntax.v =
                                    (FStar_Syntax_Syntax.Pat_wild x1);
                                  FStar_Syntax_Syntax.ty =
                                    (uu___159_2045.FStar_Syntax_Syntax.ty);
                                  FStar_Syntax_Syntax.p =
                                    (uu___159_2045.FStar_Syntax_Syntax.p)
                                }), (Dummy :: env2))
                          | FStar_Syntax_Syntax.Pat_dot_term (x,t2) ->
                              let x1 =
                                let uu___160_2055 = x in
                                let uu____2056 =
                                  closure_as_term cfg env2
                                    x.FStar_Syntax_Syntax.sort in
                                {
                                  FStar_Syntax_Syntax.ppname =
                                    (uu___160_2055.FStar_Syntax_Syntax.ppname);
                                  FStar_Syntax_Syntax.index =
                                    (uu___160_2055.FStar_Syntax_Syntax.index);
                                  FStar_Syntax_Syntax.sort = uu____2056
                                } in
                              let t3 = closure_as_term cfg env2 t2 in
                              ((let uu___161_2063 = p in
                                {
                                  FStar_Syntax_Syntax.v =
                                    (FStar_Syntax_Syntax.Pat_dot_term
                                       (x1, t3));
                                  FStar_Syntax_Syntax.ty =
                                    (uu___161_2063.FStar_Syntax_Syntax.ty);
                                  FStar_Syntax_Syntax.p =
                                    (uu___161_2063.FStar_Syntax_Syntax.p)
                                }), env2) in
                        let uu____2066 = norm_pat env1 pat in
                        (match uu____2066 with
                         | (pat1,env2) ->
                             let w_opt1 =
                               match w_opt with
                               | None  -> None
                               | Some w ->
                                   let uu____2090 =
                                     closure_as_term cfg env2 w in
                                   Some uu____2090 in
                             let tm1 = closure_as_term cfg env2 tm in
                             (pat1, w_opt1, tm1)) in
                  let uu____2095 =
                    let uu____2096 =
                      let uu____2112 =
                        FStar_All.pipe_right branches
                          (FStar_List.map (norm_one_branch env)) in
                      (head2, uu____2112) in
                    FStar_Syntax_Syntax.Tm_match uu____2096 in
                  mk uu____2095 t1.FStar_Syntax_Syntax.pos))
and closure_as_term_delayed:
  cfg ->
    closure Prims.list ->
      (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax -> FStar_Syntax_Syntax.term
  =
  fun cfg  ->
    fun env  ->
      fun t  ->
        match env with
        | [] when
            FStar_All.pipe_left Prims.op_Negation
              (FStar_List.contains CompressUvars cfg.steps)
            -> t
        | uu____2165 -> closure_as_term cfg env t
and closures_as_args_delayed:
  cfg ->
    closure Prims.list ->
      ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax* FStar_Syntax_Syntax.aqual) Prims.list ->
        ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
          FStar_Syntax_Syntax.syntax* FStar_Syntax_Syntax.aqual) Prims.list
  =
  fun cfg  ->
    fun env  ->
      fun args  ->
        match env with
        | [] when
            FStar_All.pipe_left Prims.op_Negation
              (FStar_List.contains CompressUvars cfg.steps)
            -> args
        | uu____2181 ->
            FStar_List.map
              (fun uu____2191  ->
                 match uu____2191 with
                 | (x,imp) ->
                     let uu____2206 = closure_as_term_delayed cfg env x in
                     (uu____2206, imp)) args
and closures_as_binders_delayed:
  cfg ->
    closure Prims.list ->
      (FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) Prims.list ->
        ((FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual) Prims.list*
          closure Prims.list)
  =
  fun cfg  ->
    fun env  ->
      fun bs  ->
        let uu____2218 =
          FStar_All.pipe_right bs
            (FStar_List.fold_left
               (fun uu____2242  ->
                  fun uu____2243  ->
                    match (uu____2242, uu____2243) with
                    | ((env1,out),(b,imp)) ->
                        let b1 =
                          let uu___162_2287 = b in
                          let uu____2288 =
                            closure_as_term_delayed cfg env1
                              b.FStar_Syntax_Syntax.sort in
                          {
                            FStar_Syntax_Syntax.ppname =
                              (uu___162_2287.FStar_Syntax_Syntax.ppname);
                            FStar_Syntax_Syntax.index =
                              (uu___162_2287.FStar_Syntax_Syntax.index);
                            FStar_Syntax_Syntax.sort = uu____2288
                          } in
                        let env2 = Dummy :: env1 in
                        (env2, ((b1, imp) :: out))) (env, [])) in
        match uu____2218 with | (env1,bs1) -> ((FStar_List.rev bs1), env1)
and close_comp:
  cfg ->
    closure Prims.list ->
      (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax ->
        (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax
  =
  fun cfg  ->
    fun env  ->
      fun c  ->
        match env with
        | [] when
            FStar_All.pipe_left Prims.op_Negation
              (FStar_List.contains CompressUvars cfg.steps)
            -> c
        | uu____2335 ->
            (match c.FStar_Syntax_Syntax.n with
             | FStar_Syntax_Syntax.Total (t,uopt) ->
                 let uu____2347 = closure_as_term_delayed cfg env t in
                 let uu____2348 =
                   FStar_Option.map (norm_universe cfg env) uopt in
                 FStar_Syntax_Syntax.mk_Total' uu____2347 uu____2348
             | FStar_Syntax_Syntax.GTotal (t,uopt) ->
                 let uu____2358 = closure_as_term_delayed cfg env t in
                 let uu____2359 =
                   FStar_Option.map (norm_universe cfg env) uopt in
                 FStar_Syntax_Syntax.mk_GTotal' uu____2358 uu____2359
             | FStar_Syntax_Syntax.Comp c1 ->
                 let rt =
                   closure_as_term_delayed cfg env
                     c1.FStar_Syntax_Syntax.result_typ in
                 let args =
                   closures_as_args_delayed cfg env
                     c1.FStar_Syntax_Syntax.effect_args in
                 let flags =
                   FStar_All.pipe_right c1.FStar_Syntax_Syntax.flags
                     (FStar_List.map
                        (fun uu___140_2375  ->
                           match uu___140_2375 with
                           | FStar_Syntax_Syntax.DECREASES t ->
                               let uu____2379 =
                                 closure_as_term_delayed cfg env t in
                               FStar_Syntax_Syntax.DECREASES uu____2379
                           | f -> f)) in
                 let uu____2383 =
                   let uu___163_2384 = c1 in
                   let uu____2385 =
                     FStar_List.map (norm_universe cfg env)
                       c1.FStar_Syntax_Syntax.comp_univs in
                   {
                     FStar_Syntax_Syntax.comp_univs = uu____2385;
                     FStar_Syntax_Syntax.effect_name =
                       (uu___163_2384.FStar_Syntax_Syntax.effect_name);
                     FStar_Syntax_Syntax.result_typ = rt;
                     FStar_Syntax_Syntax.effect_args = args;
                     FStar_Syntax_Syntax.flags = flags
                   } in
                 FStar_Syntax_Syntax.mk_Comp uu____2383)
and filter_out_lcomp_cflags:
  FStar_Syntax_Syntax.cflags Prims.list ->
    FStar_Syntax_Syntax.cflags Prims.list
  =
  fun flags  ->
    FStar_All.pipe_right flags
      (FStar_List.filter
         (fun uu___141_2390  ->
            match uu___141_2390 with
            | FStar_Syntax_Syntax.DECREASES uu____2391 -> false
            | uu____2394 -> true))
and close_lcomp_opt:
  cfg ->
    closure Prims.list ->
      FStar_Syntax_Syntax.residual_comp option ->
        FStar_Syntax_Syntax.residual_comp option
  =
  fun cfg  ->
    fun env  ->
      fun lopt  ->
        match lopt with
        | Some rc ->
            let flags =
              FStar_All.pipe_right rc.FStar_Syntax_Syntax.residual_flags
                (FStar_List.filter
                   (fun uu___142_2406  ->
                      match uu___142_2406 with
                      | FStar_Syntax_Syntax.DECREASES uu____2407 -> false
                      | uu____2410 -> true)) in
            let rc1 =
              let uu___164_2412 = rc in
              let uu____2413 =
                FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
                  (closure_as_term cfg env) in
              {
                FStar_Syntax_Syntax.residual_effect =
                  (uu___164_2412.FStar_Syntax_Syntax.residual_effect);
                FStar_Syntax_Syntax.residual_typ = uu____2413;
                FStar_Syntax_Syntax.residual_flags = flags
              } in
            Some rc1
        | uu____2419 -> lopt
let built_in_primitive_steps: primitive_step Prims.list =
  let const_as_tm c p = mk (FStar_Syntax_Syntax.Tm_constant c) p in
  let int_as_const p i =
    let uu____2438 =
      let uu____2439 =
        let uu____2445 = FStar_Util.string_of_int i in (uu____2445, None) in
      FStar_Const.Const_int uu____2439 in
    const_as_tm uu____2438 p in
  let bool_as_const p b = const_as_tm (FStar_Const.Const_bool b) p in
  let string_as_const p b =
    const_as_tm
      (FStar_Const.Const_string ((FStar_Util.bytes_of_string b), p)) p in
  let arg_as_int uu____2472 =
    match uu____2472 with
    | (a,uu____2477) ->
        let uu____2479 =
          let uu____2480 = FStar_Syntax_Subst.compress a in
          uu____2480.FStar_Syntax_Syntax.n in
        (match uu____2479 with
         | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int (i,None ))
             ->
             let uu____2490 = FStar_Util.int_of_string i in Some uu____2490
         | uu____2491 -> None) in
  let arg_as_bounded_int uu____2500 =
    match uu____2500 with
    | (a,uu____2507) ->
        let uu____2511 =
          let uu____2512 = FStar_Syntax_Subst.compress a in
          uu____2512.FStar_Syntax_Syntax.n in
        (match uu____2511 with
         | FStar_Syntax_Syntax.Tm_app
             ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv1;
                FStar_Syntax_Syntax.tk = uu____2519;
                FStar_Syntax_Syntax.pos = uu____2520;
                FStar_Syntax_Syntax.vars = uu____2521;_},({
                                                            FStar_Syntax_Syntax.n
                                                              =
                                                              FStar_Syntax_Syntax.Tm_constant
                                                              (FStar_Const.Const_int
                                                              (i,None ));
                                                            FStar_Syntax_Syntax.tk
                                                              = uu____2523;
                                                            FStar_Syntax_Syntax.pos
                                                              = uu____2524;
                                                            FStar_Syntax_Syntax.vars
                                                              = uu____2525;_},uu____2526)::[])
             when
             FStar_Util.ends_with
               (FStar_Ident.text_of_lid
                  (fv1.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v)
               "int_to_t"
             ->
             let uu____2557 =
               let uu____2560 = FStar_Util.int_of_string i in
               (fv1, uu____2560) in
             Some uu____2557
         | uu____2563 -> None) in
  let arg_as_bool uu____2572 =
    match uu____2572 with
    | (a,uu____2577) ->
        let uu____2579 =
          let uu____2580 = FStar_Syntax_Subst.compress a in
          uu____2580.FStar_Syntax_Syntax.n in
        (match uu____2579 with
         | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool b) ->
             Some b
         | uu____2585 -> None) in
  let arg_as_char uu____2592 =
    match uu____2592 with
    | (a,uu____2597) ->
        let uu____2599 =
          let uu____2600 = FStar_Syntax_Subst.compress a in
          uu____2600.FStar_Syntax_Syntax.n in
        (match uu____2599 with
         | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_char c) ->
             Some c
         | uu____2605 -> None) in
  let arg_as_string uu____2612 =
    match uu____2612 with
    | (a,uu____2617) ->
        let uu____2619 =
          let uu____2620 = FStar_Syntax_Subst.compress a in
          uu____2620.FStar_Syntax_Syntax.n in
        (match uu____2619 with
         | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_string
             (bytes,uu____2625)) -> Some (FStar_Util.string_of_bytes bytes)
         | uu____2628 -> None) in
  let arg_as_list f uu____2649 =
    match uu____2649 with
    | (a,uu____2658) ->
        let rec sequence l =
          match l with
          | [] -> Some []
          | (None )::uu____2677 -> None
          | (Some x)::xs ->
              let uu____2687 = sequence xs in
              (match uu____2687 with
               | None  -> None
               | Some xs' -> Some (x :: xs')) in
        let uu____2698 = FStar_Syntax_Util.list_elements a in
        (match uu____2698 with
         | None  -> None
         | Some elts ->
             let uu____2708 =
               FStar_List.map
                 (fun x  ->
                    let uu____2713 = FStar_Syntax_Syntax.as_arg x in
                    f uu____2713) elts in
             sequence uu____2708) in
  let lift_unary f aopts =
    match aopts with
    | (Some a)::[] -> let uu____2743 = f a in Some uu____2743
    | uu____2744 -> None in
  let lift_binary f aopts =
    match aopts with
    | (Some a0)::(Some a1)::[] -> let uu____2783 = f a0 a1 in Some uu____2783
    | uu____2784 -> None in
  let unary_op as_a f r args =
    let uu____2828 = FStar_List.map as_a args in lift_unary (f r) uu____2828 in
  let binary_op as_a f r args =
    let uu____2878 = FStar_List.map as_a args in lift_binary (f r) uu____2878 in
  let as_primitive_step uu____2895 =
    match uu____2895 with
    | (l,arity,f) ->
        { name = l; arity; strong_reduction_ok = true; interpretation = f } in
  let unary_int_op f =
    unary_op arg_as_int
      (fun r  -> fun x  -> let uu____2933 = f x in int_as_const r uu____2933) in
  let binary_int_op f =
    binary_op arg_as_int
      (fun r  ->
         fun x  ->
           fun y  -> let uu____2956 = f x y in int_as_const r uu____2956) in
  let unary_bool_op f =
    unary_op arg_as_bool
      (fun r  -> fun x  -> let uu____2973 = f x in bool_as_const r uu____2973) in
  let binary_bool_op f =
    binary_op arg_as_bool
      (fun r  ->
         fun x  ->
           fun y  -> let uu____2996 = f x y in bool_as_const r uu____2996) in
  let binary_string_op f =
    binary_op arg_as_string
      (fun r  ->
         fun x  ->
           fun y  -> let uu____3019 = f x y in string_as_const r uu____3019) in
  let list_of_string' rng s =
    let name l =
      let uu____3033 =
        let uu____3034 =
          FStar_Syntax_Syntax.lid_as_fv l FStar_Syntax_Syntax.Delta_constant
            None in
        FStar_Syntax_Syntax.Tm_fvar uu____3034 in
      mk uu____3033 rng in
    let char_t = name FStar_Syntax_Const.char_lid in
    let charterm c =
      mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_char c)) rng in
    let uu____3044 =
      let uu____3046 = FStar_String.list_of_string s in
      FStar_List.map charterm uu____3046 in
    FStar_All.pipe_left (FStar_Syntax_Util.mk_list char_t rng) uu____3044 in
  let string_of_list' rng l =
    let s = FStar_String.string_of_list l in FStar_Syntax_Const.exp_string s in
  let string_compare' rng s1 s2 =
    let r = FStar_String.compare s1 s2 in int_as_const rng r in
  let string_concat' rng args =
    match args with
    | a1::a2::[] ->
        let uu____3100 = arg_as_string a1 in
        (match uu____3100 with
         | Some s1 ->
             let uu____3104 = arg_as_list arg_as_string a2 in
             (match uu____3104 with
              | Some s2 ->
                  let r = FStar_String.concat s1 s2 in
                  let uu____3112 = string_as_const rng r in Some uu____3112
              | uu____3113 -> None)
         | uu____3116 -> None)
    | uu____3118 -> None in
  let string_of_int1 rng i =
    let uu____3129 = FStar_Util.string_of_int i in
    string_as_const rng uu____3129 in
  let string_of_bool1 rng b =
    string_as_const rng (if b then "true" else "false") in
  let string_of_int2 rng i =
    let uu____3145 = FStar_Util.string_of_int i in
    string_as_const rng uu____3145 in
  let string_of_bool2 rng b =
    string_as_const rng (if b then "true" else "false") in
  let decidable_eq neg rng args =
    let tru =
      mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool true)) rng in
    let fal =
      mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool false)) rng in
    match args with
    | (_typ,uu____3174)::(a1,uu____3176)::(a2,uu____3178)::[] ->
        let uu____3207 = FStar_Syntax_Util.eq_tm a1 a2 in
        (match uu____3207 with
         | FStar_Syntax_Util.Equal  -> Some (if neg then fal else tru)
         | FStar_Syntax_Util.NotEqual  -> Some (if neg then tru else fal)
         | uu____3219 -> None)
    | uu____3220 -> failwith "Unexpected number of arguments" in
  let basic_ops =
    let uu____3232 =
      let uu____3242 =
        let uu____3252 =
          let uu____3262 =
            let uu____3272 =
              let uu____3282 =
                let uu____3292 =
                  let uu____3302 =
                    let uu____3312 =
                      let uu____3322 =
                        let uu____3332 =
                          let uu____3342 =
                            let uu____3352 =
                              let uu____3362 =
                                let uu____3372 =
                                  let uu____3382 =
                                    let uu____3392 =
                                      let uu____3402 =
                                        let uu____3412 =
                                          let uu____3422 =
                                            let uu____3431 =
                                              FStar_Syntax_Const.p2l
                                                ["FStar";
                                                "String";
                                                "list_of_string"] in
                                            (uu____3431,
                                              (Prims.parse_int "1"),
                                              (unary_op arg_as_string
                                                 list_of_string')) in
                                          let uu____3437 =
                                            let uu____3447 =
                                              let uu____3456 =
                                                FStar_Syntax_Const.p2l
                                                  ["FStar";
                                                  "String";
                                                  "string_of_list"] in
                                              (uu____3456,
                                                (Prims.parse_int "1"),
                                                (unary_op
                                                   (arg_as_list arg_as_char)
                                                   string_of_list')) in
                                            let uu____3463 =
                                              let uu____3473 =
                                                let uu____3485 =
                                                  FStar_Syntax_Const.p2l
                                                    ["FStar";
                                                    "String";
                                                    "concat"] in
                                                (uu____3485,
                                                  (Prims.parse_int "2"),
                                                  string_concat') in
                                              [uu____3473] in
                                            uu____3447 :: uu____3463 in
                                          uu____3422 :: uu____3437 in
                                        (FStar_Syntax_Const.op_notEq,
                                          (Prims.parse_int "3"),
                                          (decidable_eq true)) :: uu____3412 in
                                      (FStar_Syntax_Const.op_Eq,
                                        (Prims.parse_int "3"),
                                        (decidable_eq false)) :: uu____3402 in
                                    (FStar_Syntax_Const.string_compare,
                                      (Prims.parse_int "2"),
                                      (binary_op arg_as_string
                                         string_compare'))
                                      :: uu____3392 in
                                  (FStar_Syntax_Const.string_of_bool_lid,
                                    (Prims.parse_int "1"),
                                    (unary_op arg_as_bool string_of_bool2))
                                    :: uu____3382 in
                                (FStar_Syntax_Const.string_of_int_lid,
                                  (Prims.parse_int "1"),
                                  (unary_op arg_as_int string_of_int2)) ::
                                  uu____3372 in
                              (FStar_Syntax_Const.strcat_lid,
                                (Prims.parse_int "2"),
                                (binary_string_op
                                   (fun x  -> fun y  -> Prims.strcat x y)))
                                :: uu____3362 in
                            (FStar_Syntax_Const.op_Or, (Prims.parse_int "2"),
                              (binary_bool_op (fun x  -> fun y  -> x || y)))
                              :: uu____3352 in
                          (FStar_Syntax_Const.op_And, (Prims.parse_int "2"),
                            (binary_bool_op (fun x  -> fun y  -> x && y))) ::
                            uu____3342 in
                        (FStar_Syntax_Const.op_Negation,
                          (Prims.parse_int "1"),
                          (unary_bool_op (fun x  -> Prims.op_Negation x))) ::
                          uu____3332 in
                      (FStar_Syntax_Const.op_Modulus, (Prims.parse_int "2"),
                        (binary_int_op (fun x  -> fun y  -> x mod y))) ::
                        uu____3322 in
                    (FStar_Syntax_Const.op_GTE, (Prims.parse_int "2"),
                      (binary_op arg_as_int
                         (fun r  ->
                            fun x  -> fun y  -> bool_as_const r (x >= y))))
                      :: uu____3312 in
                  (FStar_Syntax_Const.op_GT, (Prims.parse_int "2"),
                    (binary_op arg_as_int
                       (fun r  -> fun x  -> fun y  -> bool_as_const r (x > y))))
                    :: uu____3302 in
                (FStar_Syntax_Const.op_LTE, (Prims.parse_int "2"),
                  (binary_op arg_as_int
                     (fun r  -> fun x  -> fun y  -> bool_as_const r (x <= y))))
                  :: uu____3292 in
              (FStar_Syntax_Const.op_LT, (Prims.parse_int "2"),
                (binary_op arg_as_int
                   (fun r  -> fun x  -> fun y  -> bool_as_const r (x < y))))
                :: uu____3282 in
            (FStar_Syntax_Const.op_Division, (Prims.parse_int "2"),
              (binary_int_op (fun x  -> fun y  -> x / y))) :: uu____3272 in
          (FStar_Syntax_Const.op_Multiply, (Prims.parse_int "2"),
            (binary_int_op (fun x  -> fun y  -> x * y))) :: uu____3262 in
        (FStar_Syntax_Const.op_Subtraction, (Prims.parse_int "2"),
          (binary_int_op (fun x  -> fun y  -> x - y))) :: uu____3252 in
      (FStar_Syntax_Const.op_Addition, (Prims.parse_int "2"),
        (binary_int_op (fun x  -> fun y  -> x + y))) :: uu____3242 in
    (FStar_Syntax_Const.op_Minus, (Prims.parse_int "1"),
      (unary_int_op (fun x  -> - x))) :: uu____3232 in
  let bounded_arith_ops =
    let bounded_int_types =
      ["Int8";
      "UInt8";
      "Int16";
      "UInt16";
      "Int32";
      "UInt32";
      "Int64";
      "UInt64";
      "UInt128"] in
    let int_as_bounded r int_to_t1 n1 =
      let c = int_as_const r n1 in
      let int_to_t2 = FStar_Syntax_Syntax.fv_to_tm int_to_t1 in
      let uu____3835 =
        let uu____3836 =
          let uu____3837 = FStar_Syntax_Syntax.as_arg c in [uu____3837] in
        FStar_Syntax_Syntax.mk_Tm_app int_to_t2 uu____3836 in
      uu____3835 None r in
    FStar_All.pipe_right bounded_int_types
      (FStar_List.collect
         (fun m  ->
            let uu____3861 =
              let uu____3870 = FStar_Syntax_Const.p2l ["FStar"; m; "add"] in
              (uu____3870, (Prims.parse_int "2"),
                (binary_op arg_as_bounded_int
                   (fun r  ->
                      fun uu____3879  ->
                        fun uu____3880  ->
                          match (uu____3879, uu____3880) with
                          | ((int_to_t1,x),(uu____3891,y)) ->
                              int_as_bounded r int_to_t1 (x + y)))) in
            let uu____3897 =
              let uu____3907 =
                let uu____3916 = FStar_Syntax_Const.p2l ["FStar"; m; "sub"] in
                (uu____3916, (Prims.parse_int "2"),
                  (binary_op arg_as_bounded_int
                     (fun r  ->
                        fun uu____3925  ->
                          fun uu____3926  ->
                            match (uu____3925, uu____3926) with
                            | ((int_to_t1,x),(uu____3937,y)) ->
                                int_as_bounded r int_to_t1 (x - y)))) in
              let uu____3943 =
                let uu____3953 =
                  let uu____3962 = FStar_Syntax_Const.p2l ["FStar"; m; "mul"] in
                  (uu____3962, (Prims.parse_int "2"),
                    (binary_op arg_as_bounded_int
                       (fun r  ->
                          fun uu____3971  ->
                            fun uu____3972  ->
                              match (uu____3971, uu____3972) with
                              | ((int_to_t1,x),(uu____3983,y)) ->
                                  int_as_bounded r int_to_t1 (x * y)))) in
                [uu____3953] in
              uu____3907 :: uu____3943 in
            uu____3861 :: uu____3897)) in
  FStar_List.map as_primitive_step
    (FStar_List.append basic_ops bounded_arith_ops)
let equality_ops: primitive_step Prims.list =
  let interp_prop r args =
    match args with
    | (_typ,uu____4049)::(a1,uu____4051)::(a2,uu____4053)::[] ->
        let uu____4082 = FStar_Syntax_Util.eq_tm a1 a2 in
        (match uu____4082 with
         | FStar_Syntax_Util.Equal  ->
             Some
               (let uu___165_4086 = FStar_Syntax_Util.t_true in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___165_4086.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.tk =
                    (uu___165_4086.FStar_Syntax_Syntax.tk);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___165_4086.FStar_Syntax_Syntax.vars)
                })
         | FStar_Syntax_Util.NotEqual  ->
             Some
               (let uu___166_4093 = FStar_Syntax_Util.t_false in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___166_4093.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.tk =
                    (uu___166_4093.FStar_Syntax_Syntax.tk);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___166_4093.FStar_Syntax_Syntax.vars)
                })
         | uu____4098 -> None)
    | (_typ,uu____4100)::uu____4101::(a1,uu____4103)::(a2,uu____4105)::[] ->
        let uu____4142 = FStar_Syntax_Util.eq_tm a1 a2 in
        (match uu____4142 with
         | FStar_Syntax_Util.Equal  ->
             Some
               (let uu___165_4146 = FStar_Syntax_Util.t_true in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___165_4146.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.tk =
                    (uu___165_4146.FStar_Syntax_Syntax.tk);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___165_4146.FStar_Syntax_Syntax.vars)
                })
         | FStar_Syntax_Util.NotEqual  ->
             Some
               (let uu___166_4153 = FStar_Syntax_Util.t_false in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___166_4153.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.tk =
                    (uu___166_4153.FStar_Syntax_Syntax.tk);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___166_4153.FStar_Syntax_Syntax.vars)
                })
         | uu____4158 -> None)
    | uu____4159 -> failwith "Unexpected number of arguments" in
  let propositional_equality =
    {
      name = FStar_Syntax_Const.eq2_lid;
      arity = (Prims.parse_int "3");
      strong_reduction_ok = true;
      interpretation = interp_prop
    } in
  let hetero_propositional_equality =
    {
      name = FStar_Syntax_Const.eq3_lid;
      arity = (Prims.parse_int "4");
      strong_reduction_ok = true;
      interpretation = interp_prop
    } in
  [propositional_equality; hetero_propositional_equality]
let reduce_primops:
  cfg -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term =
  fun cfg  ->
    fun tm  ->
      let uu____4171 =
        FStar_All.pipe_left Prims.op_Negation
          (FStar_List.contains Primops cfg.steps) in
      if uu____4171
      then tm
      else
        (let uu____4173 = FStar_Syntax_Util.head_and_args tm in
         match uu____4173 with
         | (head1,args) ->
             let uu____4199 =
               let uu____4200 = FStar_Syntax_Util.un_uinst head1 in
               uu____4200.FStar_Syntax_Syntax.n in
             (match uu____4199 with
              | FStar_Syntax_Syntax.Tm_fvar fv ->
                  let uu____4204 =
                    FStar_List.tryFind
                      (fun ps  -> FStar_Syntax_Syntax.fv_eq_lid fv ps.name)
                      cfg.primitive_steps in
                  (match uu____4204 with
                   | None  -> tm
                   | Some prim_step ->
                       if (FStar_List.length args) < prim_step.arity
                       then tm
                       else
                         (let uu____4219 =
                            prim_step.interpretation
                              head1.FStar_Syntax_Syntax.pos args in
                          match uu____4219 with
                          | None  -> tm
                          | Some reduced -> reduced))
              | uu____4222 -> tm))
let reduce_equality:
  cfg -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term =
  fun cfg  ->
    fun tm  ->
      reduce_primops
        (let uu___167_4231 = cfg in
         {
           steps = [Primops];
           tcenv = (uu___167_4231.tcenv);
           delta_level = (uu___167_4231.delta_level);
           primitive_steps = equality_ops
         }) tm
let maybe_simplify:
  cfg ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax -> FStar_Syntax_Syntax.term
  =
  fun cfg  ->
    fun tm  ->
      let steps = cfg.steps in
      let w t =
        let uu___168_4255 = t in
        {
          FStar_Syntax_Syntax.n = (uu___168_4255.FStar_Syntax_Syntax.n);
          FStar_Syntax_Syntax.tk = (uu___168_4255.FStar_Syntax_Syntax.tk);
          FStar_Syntax_Syntax.pos = (tm.FStar_Syntax_Syntax.pos);
          FStar_Syntax_Syntax.vars = (uu___168_4255.FStar_Syntax_Syntax.vars)
        } in
      let simp_t t =
        match t.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Tm_fvar fv when
            FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.true_lid ->
            Some true
        | FStar_Syntax_Syntax.Tm_fvar fv when
            FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.false_lid ->
            Some false
        | uu____4274 -> None in
      let simplify arg = ((simp_t (fst arg)), arg) in
      let tm1 = reduce_primops cfg tm in
      let uu____4302 =
        FStar_All.pipe_left Prims.op_Negation
          (FStar_List.contains Simplify steps) in
      if uu____4302
      then tm1
      else
        (match tm1.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.Tm_app
             ({
                FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_uinst
                  ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
                     FStar_Syntax_Syntax.tk = uu____4305;
                     FStar_Syntax_Syntax.pos = uu____4306;
                     FStar_Syntax_Syntax.vars = uu____4307;_},uu____4308);
                FStar_Syntax_Syntax.tk = uu____4309;
                FStar_Syntax_Syntax.pos = uu____4310;
                FStar_Syntax_Syntax.vars = uu____4311;_},args)
             ->
             let uu____4331 =
               FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.and_lid in
             if uu____4331
             then
               let uu____4332 =
                 FStar_All.pipe_right args (FStar_List.map simplify) in
               (match uu____4332 with
                | (Some (true ),uu____4365)::(uu____4366,(arg,uu____4368))::[]
                    -> arg
                | (uu____4409,(arg,uu____4411))::(Some (true ),uu____4412)::[]
                    -> arg
                | (Some (false ),uu____4453)::uu____4454::[] ->
                    w FStar_Syntax_Util.t_false
                | uu____4492::(Some (false ),uu____4493)::[] ->
                    w FStar_Syntax_Util.t_false
                | uu____4531 -> tm1)
             else
               (let uu____4541 =
                  FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.or_lid in
                if uu____4541
                then
                  let uu____4542 =
                    FStar_All.pipe_right args (FStar_List.map simplify) in
                  match uu____4542 with
                  | (Some (true ),uu____4575)::uu____4576::[] ->
                      w FStar_Syntax_Util.t_true
                  | uu____4614::(Some (true ),uu____4615)::[] ->
                      w FStar_Syntax_Util.t_true
                  | (Some (false ),uu____4653)::(uu____4654,(arg,uu____4656))::[]
                      -> arg
                  | (uu____4697,(arg,uu____4699))::(Some (false ),uu____4700)::[]
                      -> arg
                  | uu____4741 -> tm1
                else
                  (let uu____4751 =
                     FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Syntax_Const.imp_lid in
                   if uu____4751
                   then
                     let uu____4752 =
                       FStar_All.pipe_right args (FStar_List.map simplify) in
                     match uu____4752 with
                     | uu____4785::(Some (true ),uu____4786)::[] ->
                         w FStar_Syntax_Util.t_true
                     | (Some (false ),uu____4824)::uu____4825::[] ->
                         w FStar_Syntax_Util.t_true
                     | (Some (true ),uu____4863)::(uu____4864,(arg,uu____4866))::[]
                         -> arg
                     | (uu____4907,(p,uu____4909))::(uu____4910,(q,uu____4912))::[]
                         ->
                         let uu____4954 = FStar_Syntax_Util.term_eq p q in
                         (if uu____4954
                          then w FStar_Syntax_Util.t_true
                          else tm1)
                     | uu____4956 -> tm1
                   else
                     (let uu____4966 =
                        FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Syntax_Const.not_lid in
                      if uu____4966
                      then
                        let uu____4967 =
                          FStar_All.pipe_right args (FStar_List.map simplify) in
                        match uu____4967 with
                        | (Some (true ),uu____5000)::[] ->
                            w FStar_Syntax_Util.t_false
                        | (Some (false ),uu____5024)::[] ->
                            w FStar_Syntax_Util.t_true
                        | uu____5048 -> tm1
                      else
                        (let uu____5058 =
                           FStar_Syntax_Syntax.fv_eq_lid fv
                             FStar_Syntax_Const.forall_lid in
                         if uu____5058
                         then
                           match args with
                           | (t,uu____5060)::[] ->
                               let uu____5073 =
                                 let uu____5074 =
                                   FStar_Syntax_Subst.compress t in
                                 uu____5074.FStar_Syntax_Syntax.n in
                               (match uu____5073 with
                                | FStar_Syntax_Syntax.Tm_abs
                                    (uu____5077::[],body,uu____5079) ->
                                    (match simp_t body with
                                     | Some (true ) ->
                                         w FStar_Syntax_Util.t_true
                                     | uu____5095 -> tm1)
                                | uu____5097 -> tm1)
                           | (uu____5098,Some (FStar_Syntax_Syntax.Implicit
                              uu____5099))::(t,uu____5101)::[] ->
                               let uu____5128 =
                                 let uu____5129 =
                                   FStar_Syntax_Subst.compress t in
                                 uu____5129.FStar_Syntax_Syntax.n in
                               (match uu____5128 with
                                | FStar_Syntax_Syntax.Tm_abs
                                    (uu____5132::[],body,uu____5134) ->
                                    (match simp_t body with
                                     | Some (true ) ->
                                         w FStar_Syntax_Util.t_true
                                     | uu____5150 -> tm1)
                                | uu____5152 -> tm1)
                           | uu____5153 -> tm1
                         else
                           (let uu____5160 =
                              FStar_Syntax_Syntax.fv_eq_lid fv
                                FStar_Syntax_Const.exists_lid in
                            if uu____5160
                            then
                              match args with
                              | (t,uu____5162)::[] ->
                                  let uu____5175 =
                                    let uu____5176 =
                                      FStar_Syntax_Subst.compress t in
                                    uu____5176.FStar_Syntax_Syntax.n in
                                  (match uu____5175 with
                                   | FStar_Syntax_Syntax.Tm_abs
                                       (uu____5179::[],body,uu____5181) ->
                                       (match simp_t body with
                                        | Some (false ) ->
                                            w FStar_Syntax_Util.t_false
                                        | uu____5197 -> tm1)
                                   | uu____5199 -> tm1)
                              | (uu____5200,Some
                                 (FStar_Syntax_Syntax.Implicit uu____5201))::
                                  (t,uu____5203)::[] ->
                                  let uu____5230 =
                                    let uu____5231 =
                                      FStar_Syntax_Subst.compress t in
                                    uu____5231.FStar_Syntax_Syntax.n in
                                  (match uu____5230 with
                                   | FStar_Syntax_Syntax.Tm_abs
                                       (uu____5234::[],body,uu____5236) ->
                                       (match simp_t body with
                                        | Some (false ) ->
                                            w FStar_Syntax_Util.t_false
                                        | uu____5252 -> tm1)
                                   | uu____5254 -> tm1)
                              | uu____5255 -> tm1
                            else reduce_equality cfg tm1)))))
         | FStar_Syntax_Syntax.Tm_app
             ({ FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_fvar fv;
                FStar_Syntax_Syntax.tk = uu____5263;
                FStar_Syntax_Syntax.pos = uu____5264;
                FStar_Syntax_Syntax.vars = uu____5265;_},args)
             ->
             let uu____5281 =
               FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.and_lid in
             if uu____5281
             then
               let uu____5282 =
                 FStar_All.pipe_right args (FStar_List.map simplify) in
               (match uu____5282 with
                | (Some (true ),uu____5315)::(uu____5316,(arg,uu____5318))::[]
                    -> arg
                | (uu____5359,(arg,uu____5361))::(Some (true ),uu____5362)::[]
                    -> arg
                | (Some (false ),uu____5403)::uu____5404::[] ->
                    w FStar_Syntax_Util.t_false
                | uu____5442::(Some (false ),uu____5443)::[] ->
                    w FStar_Syntax_Util.t_false
                | uu____5481 -> tm1)
             else
               (let uu____5491 =
                  FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.or_lid in
                if uu____5491
                then
                  let uu____5492 =
                    FStar_All.pipe_right args (FStar_List.map simplify) in
                  match uu____5492 with
                  | (Some (true ),uu____5525)::uu____5526::[] ->
                      w FStar_Syntax_Util.t_true
                  | uu____5564::(Some (true ),uu____5565)::[] ->
                      w FStar_Syntax_Util.t_true
                  | (Some (false ),uu____5603)::(uu____5604,(arg,uu____5606))::[]
                      -> arg
                  | (uu____5647,(arg,uu____5649))::(Some (false ),uu____5650)::[]
                      -> arg
                  | uu____5691 -> tm1
                else
                  (let uu____5701 =
                     FStar_Syntax_Syntax.fv_eq_lid fv
                       FStar_Syntax_Const.imp_lid in
                   if uu____5701
                   then
                     let uu____5702 =
                       FStar_All.pipe_right args (FStar_List.map simplify) in
                     match uu____5702 with
                     | uu____5735::(Some (true ),uu____5736)::[] ->
                         w FStar_Syntax_Util.t_true
                     | (Some (false ),uu____5774)::uu____5775::[] ->
                         w FStar_Syntax_Util.t_true
                     | (Some (true ),uu____5813)::(uu____5814,(arg,uu____5816))::[]
                         -> arg
                     | (uu____5857,(p,uu____5859))::(uu____5860,(q,uu____5862))::[]
                         ->
                         let uu____5904 = FStar_Syntax_Util.term_eq p q in
                         (if uu____5904
                          then w FStar_Syntax_Util.t_true
                          else tm1)
                     | uu____5906 -> tm1
                   else
                     (let uu____5916 =
                        FStar_Syntax_Syntax.fv_eq_lid fv
                          FStar_Syntax_Const.not_lid in
                      if uu____5916
                      then
                        let uu____5917 =
                          FStar_All.pipe_right args (FStar_List.map simplify) in
                        match uu____5917 with
                        | (Some (true ),uu____5950)::[] ->
                            w FStar_Syntax_Util.t_false
                        | (Some (false ),uu____5974)::[] ->
                            w FStar_Syntax_Util.t_true
                        | uu____5998 -> tm1
                      else
                        (let uu____6008 =
                           FStar_Syntax_Syntax.fv_eq_lid fv
                             FStar_Syntax_Const.forall_lid in
                         if uu____6008
                         then
                           match args with
                           | (t,uu____6010)::[] ->
                               let uu____6023 =
                                 let uu____6024 =
                                   FStar_Syntax_Subst.compress t in
                                 uu____6024.FStar_Syntax_Syntax.n in
                               (match uu____6023 with
                                | FStar_Syntax_Syntax.Tm_abs
                                    (uu____6027::[],body,uu____6029) ->
                                    (match simp_t body with
                                     | Some (true ) ->
                                         w FStar_Syntax_Util.t_true
                                     | uu____6045 -> tm1)
                                | uu____6047 -> tm1)
                           | (uu____6048,Some (FStar_Syntax_Syntax.Implicit
                              uu____6049))::(t,uu____6051)::[] ->
                               let uu____6078 =
                                 let uu____6079 =
                                   FStar_Syntax_Subst.compress t in
                                 uu____6079.FStar_Syntax_Syntax.n in
                               (match uu____6078 with
                                | FStar_Syntax_Syntax.Tm_abs
                                    (uu____6082::[],body,uu____6084) ->
                                    (match simp_t body with
                                     | Some (true ) ->
                                         w FStar_Syntax_Util.t_true
                                     | uu____6100 -> tm1)
                                | uu____6102 -> tm1)
                           | uu____6103 -> tm1
                         else
                           (let uu____6110 =
                              FStar_Syntax_Syntax.fv_eq_lid fv
                                FStar_Syntax_Const.exists_lid in
                            if uu____6110
                            then
                              match args with
                              | (t,uu____6112)::[] ->
                                  let uu____6125 =
                                    let uu____6126 =
                                      FStar_Syntax_Subst.compress t in
                                    uu____6126.FStar_Syntax_Syntax.n in
                                  (match uu____6125 with
                                   | FStar_Syntax_Syntax.Tm_abs
                                       (uu____6129::[],body,uu____6131) ->
                                       (match simp_t body with
                                        | Some (false ) ->
                                            w FStar_Syntax_Util.t_false
                                        | uu____6147 -> tm1)
                                   | uu____6149 -> tm1)
                              | (uu____6150,Some
                                 (FStar_Syntax_Syntax.Implicit uu____6151))::
                                  (t,uu____6153)::[] ->
                                  let uu____6180 =
                                    let uu____6181 =
                                      FStar_Syntax_Subst.compress t in
                                    uu____6181.FStar_Syntax_Syntax.n in
                                  (match uu____6180 with
                                   | FStar_Syntax_Syntax.Tm_abs
                                       (uu____6184::[],body,uu____6186) ->
                                       (match simp_t body with
                                        | Some (false ) ->
                                            w FStar_Syntax_Util.t_false
                                        | uu____6202 -> tm1)
                                   | uu____6204 -> tm1)
                              | uu____6205 -> tm1
                            else reduce_equality cfg tm1)))))
         | uu____6212 -> tm1)
let is_norm_request hd1 args =
  let uu____6230 =
    let uu____6234 =
      let uu____6235 = FStar_Syntax_Util.un_uinst hd1 in
      uu____6235.FStar_Syntax_Syntax.n in
    (uu____6234, args) in
  match uu____6230 with
  | (FStar_Syntax_Syntax.Tm_fvar fv,uu____6240::uu____6241::[]) ->
      FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.normalize_term
  | (FStar_Syntax_Syntax.Tm_fvar fv,uu____6244::[]) ->
      FStar_Syntax_Syntax.fv_eq_lid fv FStar_Syntax_Const.normalize
  | uu____6246 -> false
let get_norm_request args =
  match args with
  | uu____6268::(tm,uu____6270)::[] -> tm
  | (tm,uu____6280)::[] -> tm
  | uu____6285 -> failwith "Impossible"
let is_reify_head: stack_elt Prims.list -> Prims.bool =
  fun uu___143_6293  ->
    match uu___143_6293 with
    | (App
        ({
           FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
             (FStar_Const.Const_reify );
           FStar_Syntax_Syntax.tk = uu____6295;
           FStar_Syntax_Syntax.pos = uu____6296;
           FStar_Syntax_Syntax.vars = uu____6297;_},uu____6298,uu____6299))::uu____6300
        -> true
    | uu____6306 -> false
let rec norm:
  cfg -> env -> stack -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun cfg  ->
    fun env  ->
      fun stack1  ->
        fun t  ->
          let t1 = FStar_Syntax_Subst.compress t in
          let firstn k l =
            if (FStar_List.length l) < k
            then (l, [])
            else FStar_Util.first_N k l in
          log cfg
            (fun uu____6420  ->
               let uu____6421 = FStar_Syntax_Print.tag_of_term t1 in
               let uu____6422 = FStar_Syntax_Print.term_to_string t1 in
               let uu____6423 =
                 let uu____6424 =
                   let uu____6426 = firstn (Prims.parse_int "4") stack1 in
                   FStar_All.pipe_left FStar_Pervasives.fst uu____6426 in
                 stack_to_string uu____6424 in
               FStar_Util.print3
                 ">>> %s\nNorm %s with top of the stack %s \n" uu____6421
                 uu____6422 uu____6423);
          (match t1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_delayed uu____6438 ->
               failwith "Impossible: got a delayed substitution"
           | FStar_Syntax_Syntax.Tm_unknown  -> rebuild cfg env stack1 t1
           | FStar_Syntax_Syntax.Tm_uvar uu____6453 ->
               rebuild cfg env stack1 t1
           | FStar_Syntax_Syntax.Tm_constant uu____6462 ->
               rebuild cfg env stack1 t1
           | FStar_Syntax_Syntax.Tm_name uu____6463 ->
               rebuild cfg env stack1 t1
           | FStar_Syntax_Syntax.Tm_fvar
               { FStar_Syntax_Syntax.fv_name = uu____6464;
                 FStar_Syntax_Syntax.fv_delta =
                   FStar_Syntax_Syntax.Delta_constant ;
                 FStar_Syntax_Syntax.fv_qual = uu____6465;_}
               -> rebuild cfg env stack1 t1
           | FStar_Syntax_Syntax.Tm_fvar
               { FStar_Syntax_Syntax.fv_name = uu____6470;
                 FStar_Syntax_Syntax.fv_delta = uu____6471;
                 FStar_Syntax_Syntax.fv_qual = Some
                   (FStar_Syntax_Syntax.Data_ctor );_}
               -> rebuild cfg env stack1 t1
           | FStar_Syntax_Syntax.Tm_fvar
               { FStar_Syntax_Syntax.fv_name = uu____6475;
                 FStar_Syntax_Syntax.fv_delta = uu____6476;
                 FStar_Syntax_Syntax.fv_qual = Some
                   (FStar_Syntax_Syntax.Record_ctor uu____6477);_}
               -> rebuild cfg env stack1 t1
           | FStar_Syntax_Syntax.Tm_app (hd1,args) when
               (FStar_Syntax_Util.is_fstar_tactics_embed hd1) ||
                 (FStar_Syntax_Util.is_fstar_tactics_by_tactic hd1)
               ->
               let args1 = closures_as_args_delayed cfg env args in
               let hd2 = closure_as_term cfg env hd1 in
               let t2 =
                 let uu___169_6510 = t1 in
                 {
                   FStar_Syntax_Syntax.n =
                     (FStar_Syntax_Syntax.Tm_app (hd2, args1));
                   FStar_Syntax_Syntax.tk =
                     (uu___169_6510.FStar_Syntax_Syntax.tk);
                   FStar_Syntax_Syntax.pos =
                     (uu___169_6510.FStar_Syntax_Syntax.pos);
                   FStar_Syntax_Syntax.vars =
                     (uu___169_6510.FStar_Syntax_Syntax.vars)
                 } in
               rebuild cfg env stack1 t2
           | FStar_Syntax_Syntax.Tm_app (hd1,args) when
               ((let uu____6536 =
                   FStar_All.pipe_right cfg.steps
                     (FStar_List.contains NoFullNorm) in
                 Prims.op_Negation uu____6536) && (is_norm_request hd1 args))
                 &&
                 (Prims.op_Negation
                    (FStar_Ident.lid_equals
                       (cfg.tcenv).FStar_TypeChecker_Env.curmodule
                       FStar_Syntax_Const.prims_lid))
               ->
               let tm = get_norm_request args in
               let s =
                 [Reify;
                 UnfoldUntil FStar_Syntax_Syntax.Delta_constant;
                 Primops] in
               let cfg' =
                 let uu___170_6549 = cfg in
                 {
                   steps = s;
                   tcenv = (uu___170_6549.tcenv);
                   delta_level =
                     [FStar_TypeChecker_Env.Unfold
                        FStar_Syntax_Syntax.Delta_constant];
                   primitive_steps = (uu___170_6549.primitive_steps)
                 } in
               let stack' = (Debug t1) ::
                 (Steps
                    ((cfg.steps), (cfg.primitive_steps), (cfg.delta_level)))
                 :: stack1 in
               norm cfg' env stack' tm
           | FStar_Syntax_Syntax.Tm_app
               ({
                  FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                    (FStar_Const.Const_reify );
                  FStar_Syntax_Syntax.tk = uu____6554;
                  FStar_Syntax_Syntax.pos = uu____6555;
                  FStar_Syntax_Syntax.vars = uu____6556;_},a1::a2::rest)
               ->
               let uu____6590 = FStar_Syntax_Util.head_and_args t1 in
               (match uu____6590 with
                | (hd1,uu____6601) ->
                    let t' =
                      FStar_Syntax_Syntax.mk
                        (FStar_Syntax_Syntax.Tm_app (hd1, [a1])) None
                        t1.FStar_Syntax_Syntax.pos in
                    let t2 =
                      FStar_Syntax_Syntax.mk
                        (FStar_Syntax_Syntax.Tm_app (t', (a2 :: rest))) None
                        t1.FStar_Syntax_Syntax.pos in
                    norm cfg env stack1 t2)
           | FStar_Syntax_Syntax.Tm_app
               ({
                  FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                    (FStar_Const.Const_reflect uu____6656);
                  FStar_Syntax_Syntax.tk = uu____6657;
                  FStar_Syntax_Syntax.pos = uu____6658;
                  FStar_Syntax_Syntax.vars = uu____6659;_},a::[])
               when
               (FStar_All.pipe_right cfg.steps (FStar_List.contains Reify))
                 && (is_reify_head stack1)
               ->
               let uu____6682 = FStar_List.tl stack1 in
               norm cfg env uu____6682 (fst a)
           | FStar_Syntax_Syntax.Tm_app
               ({
                  FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_constant
                    (FStar_Const.Const_reify );
                  FStar_Syntax_Syntax.tk = uu____6685;
                  FStar_Syntax_Syntax.pos = uu____6686;
                  FStar_Syntax_Syntax.vars = uu____6687;_},a::[])
               when
               FStar_All.pipe_right cfg.steps (FStar_List.contains Reify) ->
               let uu____6710 = FStar_Syntax_Util.head_and_args t1 in
               (match uu____6710 with
                | (reify_head,uu____6721) ->
                    let a1 =
                      let uu____6737 =
                        FStar_All.pipe_left FStar_Syntax_Util.unascribe
                          (fst a) in
                      FStar_Syntax_Subst.compress uu____6737 in
                    (match a1.FStar_Syntax_Syntax.n with
                     | FStar_Syntax_Syntax.Tm_app
                         ({
                            FStar_Syntax_Syntax.n =
                              FStar_Syntax_Syntax.Tm_constant
                              (FStar_Const.Const_reflect uu____6740);
                            FStar_Syntax_Syntax.tk = uu____6741;
                            FStar_Syntax_Syntax.pos = uu____6742;
                            FStar_Syntax_Syntax.vars = uu____6743;_},a2::[])
                         -> norm cfg env stack1 (fst a2)
                     | uu____6768 ->
                         let stack2 =
                           (App
                              (reify_head, None,
                                (t1.FStar_Syntax_Syntax.pos)))
                           :: stack1 in
                         norm cfg env stack2 a1))
           | FStar_Syntax_Syntax.Tm_type u ->
               let u1 = norm_universe cfg env u in
               let uu____6776 =
                 mk (FStar_Syntax_Syntax.Tm_type u1)
                   t1.FStar_Syntax_Syntax.pos in
               rebuild cfg env stack1 uu____6776
           | FStar_Syntax_Syntax.Tm_uinst (t',us) ->
               let uu____6783 =
                 FStar_All.pipe_right cfg.steps
                   (FStar_List.contains EraseUniverses) in
               if uu____6783
               then norm cfg env stack1 t'
               else
                 (let us1 =
                    let uu____6786 =
                      let uu____6790 =
                        FStar_List.map (norm_universe cfg env) us in
                      (uu____6790, (t1.FStar_Syntax_Syntax.pos)) in
                    UnivArgs uu____6786 in
                  let stack2 = us1 :: stack1 in norm cfg env stack2 t')
           | FStar_Syntax_Syntax.Tm_fvar f ->
               let t0 = t1 in
               let should_delta =
                 FStar_All.pipe_right cfg.delta_level
                   (FStar_Util.for_some
                      (fun uu___144_6799  ->
                         match uu___144_6799 with
                         | FStar_TypeChecker_Env.UnfoldTac  -> false
                         | FStar_TypeChecker_Env.NoDelta  -> false
                         | FStar_TypeChecker_Env.Inlining  -> true
                         | FStar_TypeChecker_Env.Eager_unfolding_only  ->
                             true
                         | FStar_TypeChecker_Env.Unfold l ->
                             FStar_TypeChecker_Common.delta_depth_greater_than
                               f.FStar_Syntax_Syntax.fv_delta l)) in
               let should_delta1 =
                 let uu____6802 =
                   (FStar_List.mem FStar_TypeChecker_Env.UnfoldTac
                      cfg.delta_level)
                     &&
                     (((((((((FStar_Syntax_Syntax.fv_eq_lid f
                                FStar_Syntax_Const.and_lid)
                               ||
                               (FStar_Syntax_Syntax.fv_eq_lid f
                                  FStar_Syntax_Const.or_lid))
                              ||
                              (FStar_Syntax_Syntax.fv_eq_lid f
                                 FStar_Syntax_Const.imp_lid))
                             ||
                             (FStar_Syntax_Syntax.fv_eq_lid f
                                FStar_Syntax_Const.forall_lid))
                            ||
                            (FStar_Syntax_Syntax.fv_eq_lid f
                               FStar_Syntax_Const.squash_lid))
                           ||
                           (FStar_Syntax_Syntax.fv_eq_lid f
                              FStar_Syntax_Const.exists_lid))
                          ||
                          (FStar_Syntax_Syntax.fv_eq_lid f
                             FStar_Syntax_Const.eq2_lid))
                         ||
                         (FStar_Syntax_Syntax.fv_eq_lid f
                            FStar_Syntax_Const.true_lid))
                        ||
                        (FStar_Syntax_Syntax.fv_eq_lid f
                           FStar_Syntax_Const.false_lid)) in
                 if uu____6802 then false else should_delta in
               if Prims.op_Negation should_delta1
               then rebuild cfg env stack1 t1
               else
                 (let r_env =
                    let uu____6806 = FStar_Syntax_Syntax.range_of_fv f in
                    FStar_TypeChecker_Env.set_range cfg.tcenv uu____6806 in
                  let uu____6807 =
                    FStar_TypeChecker_Env.lookup_definition cfg.delta_level
                      r_env
                      (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
                  match uu____6807 with
                  | None  ->
                      (log cfg
                         (fun uu____6818  ->
                            FStar_Util.print "Tm_fvar case 2\n" []);
                       rebuild cfg env stack1 t1)
                  | Some (us,t2) ->
                      (log cfg
                         (fun uu____6824  ->
                            let uu____6825 =
                              FStar_Syntax_Print.term_to_string t0 in
                            let uu____6826 =
                              FStar_Syntax_Print.term_to_string t2 in
                            FStar_Util.print2 ">>> Unfolded %s to %s\n"
                              uu____6825 uu____6826);
                       (let t3 =
                          let uu____6828 =
                            FStar_All.pipe_right cfg.steps
                              (FStar_List.contains
                                 (UnfoldUntil
                                    FStar_Syntax_Syntax.Delta_constant)) in
                          if uu____6828
                          then t2
                          else
                            FStar_Syntax_Subst.set_use_range
                              (FStar_Ident.range_of_lid
                                 (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v)
                              t2 in
                        let n1 = FStar_List.length us in
                        if n1 > (Prims.parse_int "0")
                        then
                          match stack1 with
                          | (UnivArgs (us',uu____6844))::stack2 ->
                              let env1 =
                                FStar_All.pipe_right us'
                                  (FStar_List.fold_left
                                     (fun env1  -> fun u  -> (Univ u) :: env1)
                                     env) in
                              norm cfg env1 stack2 t3
                          | uu____6857 when
                              FStar_All.pipe_right cfg.steps
                                (FStar_List.contains EraseUniverses)
                              -> norm cfg env stack1 t3
                          | uu____6858 ->
                              let uu____6859 =
                                let uu____6860 =
                                  FStar_Syntax_Print.lid_to_string
                                    (f.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
                                FStar_Util.format1
                                  "Impossible: missing universe instantiation on %s"
                                  uu____6860 in
                              failwith uu____6859
                        else norm cfg env stack1 t3)))
           | FStar_Syntax_Syntax.Tm_bvar x ->
               let uu____6867 = lookup_bvar env x in
               (match uu____6867 with
                | Univ uu____6868 ->
                    failwith
                      "Impossible: term variable is bound to a universe"
                | Dummy  -> failwith "Term variable not found"
                | Clos (env1,t0,r,fix) ->
                    if
                      (Prims.op_Negation fix) ||
                        (Prims.op_Negation
                           (FStar_List.contains (Exclude Zeta) cfg.steps))
                    then
                      let uu____6883 = FStar_ST.read r in
                      (match uu____6883 with
                       | Some (env2,t') ->
                           (log cfg
                              (fun uu____6902  ->
                                 let uu____6903 =
                                   FStar_Syntax_Print.term_to_string t1 in
                                 let uu____6904 =
                                   FStar_Syntax_Print.term_to_string t' in
                                 FStar_Util.print2
                                   "Lazy hit: %s cached to %s\n" uu____6903
                                   uu____6904);
                            (let uu____6905 =
                               let uu____6906 =
                                 FStar_Syntax_Subst.compress t' in
                               uu____6906.FStar_Syntax_Syntax.n in
                             match uu____6905 with
                             | FStar_Syntax_Syntax.Tm_abs uu____6909 ->
                                 norm cfg env2 stack1 t'
                             | uu____6919 -> rebuild cfg env2 stack1 t'))
                       | None  -> norm cfg env1 ((MemoLazy r) :: stack1) t0)
                    else norm cfg env1 stack1 t0)
           | FStar_Syntax_Syntax.Tm_abs (bs,body,lopt) ->
               (match stack1 with
                | (UnivArgs uu____6942)::uu____6943 ->
                    failwith
                      "Ill-typed term: universes cannot be applied to term abstraction"
                | (Match uu____6948)::uu____6949 ->
                    failwith
                      "Ill-typed term: cannot pattern match an abstraction"
                | (Arg (c,uu____6955,uu____6956))::stack_rest ->
                    (match c with
                     | Univ uu____6959 -> norm cfg (c :: env) stack_rest t1
                     | uu____6960 ->
                         (match bs with
                          | [] -> failwith "Impossible"
                          | uu____6963::[] ->
                              (match lopt with
                               | None  when FStar_Options.__unit_tests () ->
                                   (log cfg
                                      (fun uu____6971  ->
                                         let uu____6972 = closure_to_string c in
                                         FStar_Util.print1 "\tShifted %s\n"
                                           uu____6972);
                                    norm cfg (c :: env) stack_rest body)
                               | Some rc when
                                   ((FStar_Ident.lid_equals
                                       rc.FStar_Syntax_Syntax.residual_effect
                                       FStar_Syntax_Const.effect_Tot_lid)
                                      ||
                                      (FStar_Ident.lid_equals
                                         rc.FStar_Syntax_Syntax.residual_effect
                                         FStar_Syntax_Const.effect_GTot_lid))
                                     ||
                                     (FStar_All.pipe_right
                                        rc.FStar_Syntax_Syntax.residual_flags
                                        (FStar_Util.for_some
                                           (fun uu___145_6975  ->
                                              match uu___145_6975 with
                                              | FStar_Syntax_Syntax.TOTAL  ->
                                                  true
                                              | uu____6976 -> false)))
                                   ->
                                   (log cfg
                                      (fun uu____6978  ->
                                         let uu____6979 = closure_to_string c in
                                         FStar_Util.print1 "\tShifted %s\n"
                                           uu____6979);
                                    norm cfg (c :: env) stack_rest body)
                               | uu____6980 when
                                   FStar_All.pipe_right cfg.steps
                                     (FStar_List.contains Reify)
                                   -> norm cfg (c :: env) stack_rest body
                               | uu____6982 ->
                                   let cfg1 =
                                     let uu___171_6985 = cfg in
                                     {
                                       steps = (WHNF :: (Exclude Iota) ::
                                         (Exclude Zeta) :: (cfg.steps));
                                       tcenv = (uu___171_6985.tcenv);
                                       delta_level =
                                         (uu___171_6985.delta_level);
                                       primitive_steps =
                                         (uu___171_6985.primitive_steps)
                                     } in
                                   let uu____6986 =
                                     closure_as_term cfg1 env t1 in
                                   rebuild cfg1 env stack1 uu____6986)
                          | uu____6987::tl1 ->
                              (log cfg
                                 (fun uu____6997  ->
                                    let uu____6998 = closure_to_string c in
                                    FStar_Util.print1 "\tShifted %s\n"
                                      uu____6998);
                               (let body1 =
                                  mk
                                    (FStar_Syntax_Syntax.Tm_abs
                                       (tl1, body, lopt))
                                    t1.FStar_Syntax_Syntax.pos in
                                norm cfg (c :: env) stack_rest body1))))
                | (Steps (s,ps,dl))::stack2 ->
                    norm
                      (let uu___172_7017 = cfg in
                       {
                         steps = s;
                         tcenv = (uu___172_7017.tcenv);
                         delta_level = dl;
                         primitive_steps = ps
                       }) env stack2 t1
                | (MemoLazy r)::stack2 ->
                    (set_memo r (env, t1);
                     log cfg
                       (fun uu____7030  ->
                          let uu____7031 =
                            FStar_Syntax_Print.term_to_string t1 in
                          FStar_Util.print1 "\tSet memo %s\n" uu____7031);
                     norm cfg env stack2 t1)
                | (Debug uu____7032)::uu____7033 ->
                    if FStar_List.contains WHNF cfg.steps
                    then
                      let uu____7035 = closure_as_term cfg env t1 in
                      rebuild cfg env stack1 uu____7035
                    else
                      (let uu____7037 = FStar_Syntax_Subst.open_term' bs body in
                       match uu____7037 with
                       | (bs1,body1,opening) ->
                           let lopt1 =
                             match lopt with
                             | Some rc ->
                                 let uu____7048 =
                                   let uu___173_7049 = rc in
                                   let uu____7050 =
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening) in
                                   {
                                     FStar_Syntax_Syntax.residual_effect =
                                       (uu___173_7049.FStar_Syntax_Syntax.residual_effect);
                                     FStar_Syntax_Syntax.residual_typ =
                                       uu____7050;
                                     FStar_Syntax_Syntax.residual_flags =
                                       (uu___173_7049.FStar_Syntax_Syntax.residual_flags)
                                   } in
                                 Some uu____7048
                             | uu____7056 -> lopt in
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____7065  -> Dummy :: env1) env) in
                           (log cfg
                              (fun uu____7070  ->
                                 let uu____7071 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1) in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____7071);
                            (let stack2 =
                               (Steps
                                  ((cfg.steps), (cfg.primitive_steps),
                                    (cfg.delta_level)))
                               :: stack1 in
                             let cfg1 =
                               let uu___174_7083 = cfg in
                               let uu____7084 =
                                 FStar_List.filter
                                   (fun ps  -> ps.strong_reduction_ok)
                                   cfg.primitive_steps in
                               {
                                 steps = (uu___174_7083.steps);
                                 tcenv = (uu___174_7083.tcenv);
                                 delta_level = (uu___174_7083.delta_level);
                                 primitive_steps = uu____7084
                               } in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack2) body1)))
                | (Meta uu____7089)::uu____7090 ->
                    if FStar_List.contains WHNF cfg.steps
                    then
                      let uu____7094 = closure_as_term cfg env t1 in
                      rebuild cfg env stack1 uu____7094
                    else
                      (let uu____7096 = FStar_Syntax_Subst.open_term' bs body in
                       match uu____7096 with
                       | (bs1,body1,opening) ->
                           let lopt1 =
                             match lopt with
                             | Some rc ->
                                 let uu____7107 =
                                   let uu___173_7108 = rc in
                                   let uu____7109 =
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening) in
                                   {
                                     FStar_Syntax_Syntax.residual_effect =
                                       (uu___173_7108.FStar_Syntax_Syntax.residual_effect);
                                     FStar_Syntax_Syntax.residual_typ =
                                       uu____7109;
                                     FStar_Syntax_Syntax.residual_flags =
                                       (uu___173_7108.FStar_Syntax_Syntax.residual_flags)
                                   } in
                                 Some uu____7107
                             | uu____7115 -> lopt in
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____7124  -> Dummy :: env1) env) in
                           (log cfg
                              (fun uu____7129  ->
                                 let uu____7130 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1) in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____7130);
                            (let stack2 =
                               (Steps
                                  ((cfg.steps), (cfg.primitive_steps),
                                    (cfg.delta_level)))
                               :: stack1 in
                             let cfg1 =
                               let uu___174_7142 = cfg in
                               let uu____7143 =
                                 FStar_List.filter
                                   (fun ps  -> ps.strong_reduction_ok)
                                   cfg.primitive_steps in
                               {
                                 steps = (uu___174_7142.steps);
                                 tcenv = (uu___174_7142.tcenv);
                                 delta_level = (uu___174_7142.delta_level);
                                 primitive_steps = uu____7143
                               } in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack2) body1)))
                | (Let uu____7148)::uu____7149 ->
                    if FStar_List.contains WHNF cfg.steps
                    then
                      let uu____7155 = closure_as_term cfg env t1 in
                      rebuild cfg env stack1 uu____7155
                    else
                      (let uu____7157 = FStar_Syntax_Subst.open_term' bs body in
                       match uu____7157 with
                       | (bs1,body1,opening) ->
                           let lopt1 =
                             match lopt with
                             | Some rc ->
                                 let uu____7168 =
                                   let uu___173_7169 = rc in
                                   let uu____7170 =
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening) in
                                   {
                                     FStar_Syntax_Syntax.residual_effect =
                                       (uu___173_7169.FStar_Syntax_Syntax.residual_effect);
                                     FStar_Syntax_Syntax.residual_typ =
                                       uu____7170;
                                     FStar_Syntax_Syntax.residual_flags =
                                       (uu___173_7169.FStar_Syntax_Syntax.residual_flags)
                                   } in
                                 Some uu____7168
                             | uu____7176 -> lopt in
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____7185  -> Dummy :: env1) env) in
                           (log cfg
                              (fun uu____7190  ->
                                 let uu____7191 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1) in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____7191);
                            (let stack2 =
                               (Steps
                                  ((cfg.steps), (cfg.primitive_steps),
                                    (cfg.delta_level)))
                               :: stack1 in
                             let cfg1 =
                               let uu___174_7203 = cfg in
                               let uu____7204 =
                                 FStar_List.filter
                                   (fun ps  -> ps.strong_reduction_ok)
                                   cfg.primitive_steps in
                               {
                                 steps = (uu___174_7203.steps);
                                 tcenv = (uu___174_7203.tcenv);
                                 delta_level = (uu___174_7203.delta_level);
                                 primitive_steps = uu____7204
                               } in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack2) body1)))
                | (App uu____7209)::uu____7210 ->
                    if FStar_List.contains WHNF cfg.steps
                    then
                      let uu____7215 = closure_as_term cfg env t1 in
                      rebuild cfg env stack1 uu____7215
                    else
                      (let uu____7217 = FStar_Syntax_Subst.open_term' bs body in
                       match uu____7217 with
                       | (bs1,body1,opening) ->
                           let lopt1 =
                             match lopt with
                             | Some rc ->
                                 let uu____7228 =
                                   let uu___173_7229 = rc in
                                   let uu____7230 =
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening) in
                                   {
                                     FStar_Syntax_Syntax.residual_effect =
                                       (uu___173_7229.FStar_Syntax_Syntax.residual_effect);
                                     FStar_Syntax_Syntax.residual_typ =
                                       uu____7230;
                                     FStar_Syntax_Syntax.residual_flags =
                                       (uu___173_7229.FStar_Syntax_Syntax.residual_flags)
                                   } in
                                 Some uu____7228
                             | uu____7236 -> lopt in
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____7245  -> Dummy :: env1) env) in
                           (log cfg
                              (fun uu____7250  ->
                                 let uu____7251 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1) in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____7251);
                            (let stack2 =
                               (Steps
                                  ((cfg.steps), (cfg.primitive_steps),
                                    (cfg.delta_level)))
                               :: stack1 in
                             let cfg1 =
                               let uu___174_7263 = cfg in
                               let uu____7264 =
                                 FStar_List.filter
                                   (fun ps  -> ps.strong_reduction_ok)
                                   cfg.primitive_steps in
                               {
                                 steps = (uu___174_7263.steps);
                                 tcenv = (uu___174_7263.tcenv);
                                 delta_level = (uu___174_7263.delta_level);
                                 primitive_steps = uu____7264
                               } in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack2) body1)))
                | (Abs uu____7269)::uu____7270 ->
                    if FStar_List.contains WHNF cfg.steps
                    then
                      let uu____7278 = closure_as_term cfg env t1 in
                      rebuild cfg env stack1 uu____7278
                    else
                      (let uu____7280 = FStar_Syntax_Subst.open_term' bs body in
                       match uu____7280 with
                       | (bs1,body1,opening) ->
                           let lopt1 =
                             match lopt with
                             | Some rc ->
                                 let uu____7291 =
                                   let uu___173_7292 = rc in
                                   let uu____7293 =
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening) in
                                   {
                                     FStar_Syntax_Syntax.residual_effect =
                                       (uu___173_7292.FStar_Syntax_Syntax.residual_effect);
                                     FStar_Syntax_Syntax.residual_typ =
                                       uu____7293;
                                     FStar_Syntax_Syntax.residual_flags =
                                       (uu___173_7292.FStar_Syntax_Syntax.residual_flags)
                                   } in
                                 Some uu____7291
                             | uu____7299 -> lopt in
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____7308  -> Dummy :: env1) env) in
                           (log cfg
                              (fun uu____7313  ->
                                 let uu____7314 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1) in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____7314);
                            (let stack2 =
                               (Steps
                                  ((cfg.steps), (cfg.primitive_steps),
                                    (cfg.delta_level)))
                               :: stack1 in
                             let cfg1 =
                               let uu___174_7326 = cfg in
                               let uu____7327 =
                                 FStar_List.filter
                                   (fun ps  -> ps.strong_reduction_ok)
                                   cfg.primitive_steps in
                               {
                                 steps = (uu___174_7326.steps);
                                 tcenv = (uu___174_7326.tcenv);
                                 delta_level = (uu___174_7326.delta_level);
                                 primitive_steps = uu____7327
                               } in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack2) body1)))
                | [] ->
                    if FStar_List.contains WHNF cfg.steps
                    then
                      let uu____7332 = closure_as_term cfg env t1 in
                      rebuild cfg env stack1 uu____7332
                    else
                      (let uu____7334 = FStar_Syntax_Subst.open_term' bs body in
                       match uu____7334 with
                       | (bs1,body1,opening) ->
                           let lopt1 =
                             match lopt with
                             | Some rc ->
                                 let uu____7345 =
                                   let uu___173_7346 = rc in
                                   let uu____7347 =
                                     FStar_Util.map_opt
                                       rc.FStar_Syntax_Syntax.residual_typ
                                       (FStar_Syntax_Subst.subst opening) in
                                   {
                                     FStar_Syntax_Syntax.residual_effect =
                                       (uu___173_7346.FStar_Syntax_Syntax.residual_effect);
                                     FStar_Syntax_Syntax.residual_typ =
                                       uu____7347;
                                     FStar_Syntax_Syntax.residual_flags =
                                       (uu___173_7346.FStar_Syntax_Syntax.residual_flags)
                                   } in
                                 Some uu____7345
                             | uu____7353 -> lopt in
                           let env' =
                             FStar_All.pipe_right bs1
                               (FStar_List.fold_left
                                  (fun env1  ->
                                     fun uu____7362  -> Dummy :: env1) env) in
                           (log cfg
                              (fun uu____7367  ->
                                 let uu____7368 =
                                   FStar_All.pipe_left
                                     FStar_Util.string_of_int
                                     (FStar_List.length bs1) in
                                 FStar_Util.print1 "\tShifted %s dummies\n"
                                   uu____7368);
                            (let stack2 =
                               (Steps
                                  ((cfg.steps), (cfg.primitive_steps),
                                    (cfg.delta_level)))
                               :: stack1 in
                             let cfg1 =
                               let uu___174_7380 = cfg in
                               let uu____7381 =
                                 FStar_List.filter
                                   (fun ps  -> ps.strong_reduction_ok)
                                   cfg.primitive_steps in
                               {
                                 steps = (uu___174_7380.steps);
                                 tcenv = (uu___174_7380.tcenv);
                                 delta_level = (uu___174_7380.delta_level);
                                 primitive_steps = uu____7381
                               } in
                             norm cfg1 env'
                               ((Abs
                                   (env, bs1, env', lopt1,
                                     (t1.FStar_Syntax_Syntax.pos))) ::
                               stack2) body1))))
           | FStar_Syntax_Syntax.Tm_app (head1,args) ->
               let stack2 =
                 FStar_All.pipe_right stack1
                   (FStar_List.fold_right
                      (fun uu____7408  ->
                         fun stack2  ->
                           match uu____7408 with
                           | (a,aq) ->
                               let uu____7416 =
                                 let uu____7417 =
                                   let uu____7421 =
                                     let uu____7422 =
                                       let uu____7432 =
                                         FStar_Util.mk_ref None in
                                       (env, a, uu____7432, false) in
                                     Clos uu____7422 in
                                   (uu____7421, aq,
                                     (t1.FStar_Syntax_Syntax.pos)) in
                                 Arg uu____7417 in
                               uu____7416 :: stack2) args) in
               (log cfg
                  (fun uu____7454  ->
                     let uu____7455 =
                       FStar_All.pipe_left FStar_Util.string_of_int
                         (FStar_List.length args) in
                     FStar_Util.print1 "\tPushed %s arguments\n" uu____7455);
                norm cfg env stack2 head1)
           | FStar_Syntax_Syntax.Tm_refine (x,f) ->
               if FStar_List.contains WHNF cfg.steps
               then
                 (match (env, stack1) with
                  | ([],[]) ->
                      let t_x = norm cfg env [] x.FStar_Syntax_Syntax.sort in
                      let t2 =
                        mk
                          (FStar_Syntax_Syntax.Tm_refine
                             ((let uu___175_7478 = x in
                               {
                                 FStar_Syntax_Syntax.ppname =
                                   (uu___175_7478.FStar_Syntax_Syntax.ppname);
                                 FStar_Syntax_Syntax.index =
                                   (uu___175_7478.FStar_Syntax_Syntax.index);
                                 FStar_Syntax_Syntax.sort = t_x
                               }), f)) t1.FStar_Syntax_Syntax.pos in
                      rebuild cfg env stack1 t2
                  | uu____7479 ->
                      let uu____7482 = closure_as_term cfg env t1 in
                      rebuild cfg env stack1 uu____7482)
               else
                 (let t_x = norm cfg env [] x.FStar_Syntax_Syntax.sort in
                  let uu____7485 = FStar_Syntax_Subst.open_term [(x, None)] f in
                  match uu____7485 with
                  | (closing,f1) ->
                      let f2 = norm cfg (Dummy :: env) [] f1 in
                      let t2 =
                        let uu____7501 =
                          let uu____7502 =
                            let uu____7507 =
                              FStar_Syntax_Subst.close closing f2 in
                            ((let uu___176_7508 = x in
                              {
                                FStar_Syntax_Syntax.ppname =
                                  (uu___176_7508.FStar_Syntax_Syntax.ppname);
                                FStar_Syntax_Syntax.index =
                                  (uu___176_7508.FStar_Syntax_Syntax.index);
                                FStar_Syntax_Syntax.sort = t_x
                              }), uu____7507) in
                          FStar_Syntax_Syntax.Tm_refine uu____7502 in
                        mk uu____7501 t1.FStar_Syntax_Syntax.pos in
                      rebuild cfg env stack1 t2)
           | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
               if FStar_List.contains WHNF cfg.steps
               then
                 let uu____7521 = closure_as_term cfg env t1 in
                 rebuild cfg env stack1 uu____7521
               else
                 (let uu____7523 = FStar_Syntax_Subst.open_comp bs c in
                  match uu____7523 with
                  | (bs1,c1) ->
                      let c2 =
                        let uu____7529 =
                          FStar_All.pipe_right bs1
                            (FStar_List.fold_left
                               (fun env1  -> fun uu____7535  -> Dummy :: env1)
                               env) in
                        norm_comp cfg uu____7529 c1 in
                      let t2 =
                        let uu____7542 = norm_binders cfg env bs1 in
                        FStar_Syntax_Util.arrow uu____7542 c2 in
                      rebuild cfg env stack1 t2)
           | FStar_Syntax_Syntax.Tm_ascribed (t11,(tc,tacopt),l) ->
               (match stack1 with
                | (Match uu____7585)::uu____7586 -> norm cfg env stack1 t11
                | (Arg uu____7591)::uu____7592 -> norm cfg env stack1 t11
                | (App
                    ({
                       FStar_Syntax_Syntax.n =
                         FStar_Syntax_Syntax.Tm_constant
                         (FStar_Const.Const_reify );
                       FStar_Syntax_Syntax.tk = uu____7597;
                       FStar_Syntax_Syntax.pos = uu____7598;
                       FStar_Syntax_Syntax.vars = uu____7599;_},uu____7600,uu____7601))::uu____7602
                    -> norm cfg env stack1 t11
                | (MemoLazy uu____7608)::uu____7609 ->
                    norm cfg env stack1 t11
                | uu____7614 ->
                    let t12 = norm cfg env [] t11 in
                    (log cfg
                       (fun uu____7617  ->
                          FStar_Util.print_string
                            "+++ Normalizing ascription \n");
                     (let tc1 =
                        match tc with
                        | FStar_Util.Inl t2 ->
                            let uu____7630 = norm cfg env [] t2 in
                            FStar_Util.Inl uu____7630
                        | FStar_Util.Inr c ->
                            let uu____7638 = norm_comp cfg env c in
                            FStar_Util.Inr uu____7638 in
                      let tacopt1 =
                        FStar_Util.map_opt tacopt (norm cfg env []) in
                      let uu____7643 =
                        mk
                          (FStar_Syntax_Syntax.Tm_ascribed
                             (t12, (tc1, tacopt1), l))
                          t1.FStar_Syntax_Syntax.pos in
                      rebuild cfg env stack1 uu____7643)))
           | FStar_Syntax_Syntax.Tm_match (head1,branches) ->
               let stack2 =
                 (Match (env, branches, (t1.FStar_Syntax_Syntax.pos))) ::
                 stack1 in
               norm cfg env stack2 head1
           | FStar_Syntax_Syntax.Tm_let
               ((uu____7694,{
                              FStar_Syntax_Syntax.lbname = FStar_Util.Inr
                                uu____7695;
                              FStar_Syntax_Syntax.lbunivs = uu____7696;
                              FStar_Syntax_Syntax.lbtyp = uu____7697;
                              FStar_Syntax_Syntax.lbeff = uu____7698;
                              FStar_Syntax_Syntax.lbdef = uu____7699;_}::uu____7700),uu____7701)
               -> rebuild cfg env stack1 t1
           | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) ->
               let n1 =
                 FStar_TypeChecker_Env.norm_eff_name cfg.tcenv
                   lb.FStar_Syntax_Syntax.lbeff in
               let uu____7727 =
                 (let uu____7728 =
                    FStar_All.pipe_right cfg.steps
                      (FStar_List.contains NoDeltaSteps) in
                  Prims.op_Negation uu____7728) &&
                   ((FStar_Syntax_Util.is_pure_effect n1) ||
                      ((FStar_Syntax_Util.is_ghost_effect n1) &&
                         (let uu____7729 =
                            FStar_All.pipe_right cfg.steps
                              (FStar_List.contains
                                 PureSubtermsWithinComputations) in
                          Prims.op_Negation uu____7729))) in
               if uu____7727
               then
                 let env1 =
                   let uu____7732 =
                     let uu____7733 =
                       let uu____7743 = FStar_Util.mk_ref None in
                       (env, (lb.FStar_Syntax_Syntax.lbdef), uu____7743,
                         false) in
                     Clos uu____7733 in
                   uu____7732 :: env in
                 norm cfg env1 stack1 body
               else
                 (let uu____7767 =
                    let uu____7770 =
                      let uu____7771 =
                        let uu____7772 =
                          FStar_All.pipe_right lb.FStar_Syntax_Syntax.lbname
                            FStar_Util.left in
                        FStar_All.pipe_right uu____7772
                          FStar_Syntax_Syntax.mk_binder in
                      [uu____7771] in
                    FStar_Syntax_Subst.open_term uu____7770 body in
                  match uu____7767 with
                  | (bs,body1) ->
                      let lb1 =
                        let uu___177_7778 = lb in
                        let uu____7779 =
                          let uu____7782 =
                            let uu____7783 = FStar_List.hd bs in
                            FStar_All.pipe_right uu____7783
                              FStar_Pervasives.fst in
                          FStar_All.pipe_right uu____7782
                            (fun _0_41  -> FStar_Util.Inl _0_41) in
                        let uu____7792 =
                          norm cfg env [] lb.FStar_Syntax_Syntax.lbtyp in
                        let uu____7795 =
                          norm cfg env [] lb.FStar_Syntax_Syntax.lbdef in
                        {
                          FStar_Syntax_Syntax.lbname = uu____7779;
                          FStar_Syntax_Syntax.lbunivs =
                            (uu___177_7778.FStar_Syntax_Syntax.lbunivs);
                          FStar_Syntax_Syntax.lbtyp = uu____7792;
                          FStar_Syntax_Syntax.lbeff =
                            (uu___177_7778.FStar_Syntax_Syntax.lbeff);
                          FStar_Syntax_Syntax.lbdef = uu____7795
                        } in
                      let env' =
                        FStar_All.pipe_right bs
                          (FStar_List.fold_left
                             (fun env1  -> fun uu____7805  -> Dummy :: env1)
                             env) in
                      norm cfg env'
                        ((Let (env, bs, lb1, (t1.FStar_Syntax_Syntax.pos)))
                        :: stack1) body1)
           | FStar_Syntax_Syntax.Tm_let (lbs,body) when
               FStar_List.contains (Exclude Zeta) cfg.steps ->
               let uu____7821 = closure_as_term cfg env t1 in
               rebuild cfg env stack1 uu____7821
           | FStar_Syntax_Syntax.Tm_let (lbs,body) ->
               let uu____7834 =
                 FStar_List.fold_right
                   (fun lb  ->
                      fun uu____7856  ->
                        match uu____7856 with
                        | (rec_env,memos,i) ->
                            let f_i =
                              let uu____7895 =
                                let uu___178_7896 =
                                  FStar_Util.left
                                    lb.FStar_Syntax_Syntax.lbname in
                                {
                                  FStar_Syntax_Syntax.ppname =
                                    (uu___178_7896.FStar_Syntax_Syntax.ppname);
                                  FStar_Syntax_Syntax.index = i;
                                  FStar_Syntax_Syntax.sort =
                                    (uu___178_7896.FStar_Syntax_Syntax.sort)
                                } in
                              FStar_Syntax_Syntax.bv_to_tm uu____7895 in
                            let fix_f_i =
                              mk (FStar_Syntax_Syntax.Tm_let (lbs, f_i))
                                t1.FStar_Syntax_Syntax.pos in
                            let memo = FStar_Util.mk_ref None in
                            let rec_env1 = (Clos (env, fix_f_i, memo, true))
                              :: rec_env in
                            (rec_env1, (memo :: memos),
                              (i + (Prims.parse_int "1")))) (snd lbs)
                   (env, [], (Prims.parse_int "0")) in
               (match uu____7834 with
                | (rec_env,memos,uu____7956) ->
                    let uu____7971 =
                      FStar_List.map2
                        (fun lb  ->
                           fun memo  ->
                             FStar_ST.write memo
                               (Some
                                  (rec_env, (lb.FStar_Syntax_Syntax.lbdef))))
                        (snd lbs) memos in
                    let body_env =
                      FStar_List.fold_right
                        (fun lb  ->
                           fun env1  ->
                             let uu____8013 =
                               let uu____8014 =
                                 let uu____8024 = FStar_Util.mk_ref None in
                                 (rec_env, (lb.FStar_Syntax_Syntax.lbdef),
                                   uu____8024, false) in
                               Clos uu____8014 in
                             uu____8013 :: env1) (snd lbs) env in
                    norm cfg body_env stack1 body)
           | FStar_Syntax_Syntax.Tm_meta (head1,m) ->
               (match m with
                | FStar_Syntax_Syntax.Meta_monadic (m1,t2) ->
                    let should_reify =
                      match stack1 with
                      | (App
                          ({
                             FStar_Syntax_Syntax.n =
                               FStar_Syntax_Syntax.Tm_constant
                               (FStar_Const.Const_reify );
                             FStar_Syntax_Syntax.tk = uu____8062;
                             FStar_Syntax_Syntax.pos = uu____8063;
                             FStar_Syntax_Syntax.vars = uu____8064;_},uu____8065,uu____8066))::uu____8067
                          ->
                          FStar_All.pipe_right cfg.steps
                            (FStar_List.contains Reify)
                      | uu____8073 -> false in
                    if Prims.op_Negation should_reify
                    then
                      let t3 = norm cfg env [] t2 in
                      let stack2 =
                        (Steps
                           ((cfg.steps), (cfg.primitive_steps),
                             (cfg.delta_level)))
                        :: stack1 in
                      let cfg1 =
                        let uu____8080 =
                          FStar_All.pipe_right cfg.steps
                            (FStar_List.contains
                               PureSubtermsWithinComputations) in
                        if uu____8080
                        then
                          let uu___179_8081 = cfg in
                          {
                            steps =
                              [PureSubtermsWithinComputations;
                              Primops;
                              AllowUnboundUniverses;
                              EraseUniverses;
                              Exclude Zeta;
                              NoDeltaSteps];
                            tcenv = (uu___179_8081.tcenv);
                            delta_level =
                              [FStar_TypeChecker_Env.Inlining;
                              FStar_TypeChecker_Env.Eager_unfolding_only];
                            primitive_steps = (uu___179_8081.primitive_steps)
                          }
                        else
                          (let uu___180_8083 = cfg in
                           {
                             steps =
                               (FStar_List.append
                                  [NoDeltaSteps; Exclude Zeta] cfg.steps);
                             tcenv = (uu___180_8083.tcenv);
                             delta_level = [FStar_TypeChecker_Env.NoDelta];
                             primitive_steps =
                               (uu___180_8083.primitive_steps)
                           }) in
                      norm cfg1 env
                        ((Meta
                            ((FStar_Syntax_Syntax.Meta_monadic (m1, t3)),
                              (t3.FStar_Syntax_Syntax.pos))) :: stack2) head1
                    else
                      (let uu____8085 =
                         let uu____8086 = FStar_Syntax_Subst.compress head1 in
                         uu____8086.FStar_Syntax_Syntax.n in
                       match uu____8085 with
                       | FStar_Syntax_Syntax.Tm_let ((false ,lb::[]),body) ->
                           let ed =
                             FStar_TypeChecker_Env.get_effect_decl cfg.tcenv
                               m1 in
                           let uu____8100 = ed.FStar_Syntax_Syntax.bind_repr in
                           (match uu____8100 with
                            | (uu____8101,bind_repr) ->
                                (match lb.FStar_Syntax_Syntax.lbname with
                                 | FStar_Util.Inr uu____8105 ->
                                     failwith
                                       "Cannot reify a top-level let binding"
                                 | FStar_Util.Inl x ->
                                     let is_return e =
                                       let uu____8112 =
                                         let uu____8113 =
                                           FStar_Syntax_Subst.compress e in
                                         uu____8113.FStar_Syntax_Syntax.n in
                                       match uu____8112 with
                                       | FStar_Syntax_Syntax.Tm_meta
                                           (e1,FStar_Syntax_Syntax.Meta_monadic
                                            (uu____8118,uu____8119))
                                           ->
                                           let uu____8128 =
                                             let uu____8129 =
                                               FStar_Syntax_Subst.compress e1 in
                                             uu____8129.FStar_Syntax_Syntax.n in
                                           (match uu____8128 with
                                            | FStar_Syntax_Syntax.Tm_meta
                                                (e2,FStar_Syntax_Syntax.Meta_monadic_lift
                                                 (uu____8134,msrc,uu____8136))
                                                when
                                                FStar_Syntax_Util.is_pure_effect
                                                  msrc
                                                ->
                                                let uu____8145 =
                                                  FStar_Syntax_Subst.compress
                                                    e2 in
                                                Some uu____8145
                                            | uu____8146 -> None)
                                       | uu____8147 -> None in
                                     let uu____8148 =
                                       is_return lb.FStar_Syntax_Syntax.lbdef in
                                     (match uu____8148 with
                                      | Some e ->
                                          let lb1 =
                                            let uu___181_8152 = lb in
                                            {
                                              FStar_Syntax_Syntax.lbname =
                                                (uu___181_8152.FStar_Syntax_Syntax.lbname);
                                              FStar_Syntax_Syntax.lbunivs =
                                                (uu___181_8152.FStar_Syntax_Syntax.lbunivs);
                                              FStar_Syntax_Syntax.lbtyp =
                                                (uu___181_8152.FStar_Syntax_Syntax.lbtyp);
                                              FStar_Syntax_Syntax.lbeff =
                                                FStar_Syntax_Const.effect_PURE_lid;
                                              FStar_Syntax_Syntax.lbdef = e
                                            } in
                                          let uu____8153 =
                                            FStar_List.tl stack1 in
                                          let uu____8154 =
                                            let uu____8155 =
                                              let uu____8158 =
                                                let uu____8159 =
                                                  let uu____8167 =
                                                    FStar_Syntax_Util.mk_reify
                                                      body in
                                                  ((false, [lb1]),
                                                    uu____8167) in
                                                FStar_Syntax_Syntax.Tm_let
                                                  uu____8159 in
                                              FStar_Syntax_Syntax.mk
                                                uu____8158 in
                                            uu____8155 None
                                              head1.FStar_Syntax_Syntax.pos in
                                          norm cfg env uu____8153 uu____8154
                                      | None  ->
                                          let uu____8184 =
                                            let uu____8185 = is_return body in
                                            match uu____8185 with
                                            | Some
                                                {
                                                  FStar_Syntax_Syntax.n =
                                                    FStar_Syntax_Syntax.Tm_bvar
                                                    y;
                                                  FStar_Syntax_Syntax.tk =
                                                    uu____8188;
                                                  FStar_Syntax_Syntax.pos =
                                                    uu____8189;
                                                  FStar_Syntax_Syntax.vars =
                                                    uu____8190;_}
                                                ->
                                                FStar_Syntax_Syntax.bv_eq x y
                                            | uu____8195 -> false in
                                          if uu____8184
                                          then
                                            norm cfg env stack1
                                              lb.FStar_Syntax_Syntax.lbdef
                                          else
                                            (let head2 =
                                               FStar_All.pipe_left
                                                 FStar_Syntax_Util.mk_reify
                                                 lb.FStar_Syntax_Syntax.lbdef in
                                             let body1 =
                                               FStar_All.pipe_left
                                                 FStar_Syntax_Util.mk_reify
                                                 body in
                                             let body_rc =
                                               {
                                                 FStar_Syntax_Syntax.residual_effect
                                                   = m1;
                                                 FStar_Syntax_Syntax.residual_typ
                                                   = (Some t2);
                                                 FStar_Syntax_Syntax.residual_flags
                                                   = []
                                               } in
                                             let body2 =
                                               let uu____8218 =
                                                 let uu____8221 =
                                                   let uu____8222 =
                                                     let uu____8232 =
                                                       let uu____8234 =
                                                         FStar_Syntax_Syntax.mk_binder
                                                           x in
                                                       [uu____8234] in
                                                     (uu____8232, body1,
                                                       (Some body_rc)) in
                                                   FStar_Syntax_Syntax.Tm_abs
                                                     uu____8222 in
                                                 FStar_Syntax_Syntax.mk
                                                   uu____8221 in
                                               uu____8218 None
                                                 body1.FStar_Syntax_Syntax.pos in
                                             let close1 =
                                               closure_as_term cfg env in
                                             let bind_inst =
                                               let uu____8253 =
                                                 let uu____8254 =
                                                   FStar_Syntax_Subst.compress
                                                     bind_repr in
                                                 uu____8254.FStar_Syntax_Syntax.n in
                                               match uu____8253 with
                                               | FStar_Syntax_Syntax.Tm_uinst
                                                   (bind1,uu____8260::uu____8261::[])
                                                   ->
                                                   let uu____8267 =
                                                     let uu____8270 =
                                                       let uu____8271 =
                                                         let uu____8276 =
                                                           let uu____8278 =
                                                             let uu____8279 =
                                                               close1
                                                                 lb.FStar_Syntax_Syntax.lbtyp in
                                                             (cfg.tcenv).FStar_TypeChecker_Env.universe_of
                                                               cfg.tcenv
                                                               uu____8279 in
                                                           let uu____8280 =
                                                             let uu____8282 =
                                                               let uu____8283
                                                                 = close1 t2 in
                                                               (cfg.tcenv).FStar_TypeChecker_Env.universe_of
                                                                 cfg.tcenv
                                                                 uu____8283 in
                                                             [uu____8282] in
                                                           uu____8278 ::
                                                             uu____8280 in
                                                         (bind1, uu____8276) in
                                                       FStar_Syntax_Syntax.Tm_uinst
                                                         uu____8271 in
                                                     FStar_Syntax_Syntax.mk
                                                       uu____8270 in
                                                   uu____8267 None
                                                     t2.FStar_Syntax_Syntax.pos
                                               | uu____8295 ->
                                                   failwith
                                                     "NIY : Reification of indexed effects" in
                                             let reified =
                                               let uu____8301 =
                                                 let uu____8304 =
                                                   let uu____8305 =
                                                     let uu____8315 =
                                                       let uu____8317 =
                                                         FStar_Syntax_Syntax.as_arg
                                                           lb.FStar_Syntax_Syntax.lbtyp in
                                                       let uu____8318 =
                                                         let uu____8320 =
                                                           FStar_Syntax_Syntax.as_arg
                                                             t2 in
                                                         let uu____8321 =
                                                           let uu____8323 =
                                                             FStar_Syntax_Syntax.as_arg
                                                               FStar_Syntax_Syntax.tun in
                                                           let uu____8324 =
                                                             let uu____8326 =
                                                               FStar_Syntax_Syntax.as_arg
                                                                 head2 in
                                                             let uu____8327 =
                                                               let uu____8329
                                                                 =
                                                                 FStar_Syntax_Syntax.as_arg
                                                                   FStar_Syntax_Syntax.tun in
                                                               let uu____8330
                                                                 =
                                                                 let uu____8332
                                                                   =
                                                                   FStar_Syntax_Syntax.as_arg
                                                                    body2 in
                                                                 [uu____8332] in
                                                               uu____8329 ::
                                                                 uu____8330 in
                                                             uu____8326 ::
                                                               uu____8327 in
                                                           uu____8323 ::
                                                             uu____8324 in
                                                         uu____8320 ::
                                                           uu____8321 in
                                                       uu____8317 ::
                                                         uu____8318 in
                                                     (bind_inst, uu____8315) in
                                                   FStar_Syntax_Syntax.Tm_app
                                                     uu____8305 in
                                                 FStar_Syntax_Syntax.mk
                                                   uu____8304 in
                                               uu____8301 None
                                                 t2.FStar_Syntax_Syntax.pos in
                                             let uu____8344 =
                                               FStar_List.tl stack1 in
                                             norm cfg env uu____8344 reified))))
                       | FStar_Syntax_Syntax.Tm_app (head_app,args) ->
                           let ed =
                             FStar_TypeChecker_Env.get_effect_decl cfg.tcenv
                               m1 in
                           let uu____8362 = ed.FStar_Syntax_Syntax.bind_repr in
                           (match uu____8362 with
                            | (uu____8363,bind_repr) ->
                                let maybe_unfold_action head2 =
                                  let maybe_extract_fv t3 =
                                    let t4 =
                                      let uu____8386 =
                                        let uu____8387 =
                                          FStar_Syntax_Subst.compress t3 in
                                        uu____8387.FStar_Syntax_Syntax.n in
                                      match uu____8386 with
                                      | FStar_Syntax_Syntax.Tm_uinst
                                          (t4,uu____8393) -> t4
                                      | uu____8398 -> head2 in
                                    let uu____8399 =
                                      let uu____8400 =
                                        FStar_Syntax_Subst.compress t4 in
                                      uu____8400.FStar_Syntax_Syntax.n in
                                    match uu____8399 with
                                    | FStar_Syntax_Syntax.Tm_fvar x -> Some x
                                    | uu____8405 -> None in
                                  let uu____8406 = maybe_extract_fv head2 in
                                  match uu____8406 with
                                  | Some x when
                                      let uu____8412 =
                                        FStar_Syntax_Syntax.lid_of_fv x in
                                      FStar_TypeChecker_Env.is_action
                                        cfg.tcenv uu____8412
                                      ->
                                      let head3 = norm cfg env [] head2 in
                                      let action_unfolded =
                                        let uu____8416 =
                                          maybe_extract_fv head3 in
                                        match uu____8416 with
                                        | Some uu____8419 -> Some true
                                        | uu____8420 -> Some false in
                                      (head3, action_unfolded)
                                  | uu____8423 -> (head2, None) in
                                ((let is_arg_impure uu____8434 =
                                    match uu____8434 with
                                    | (e,q) ->
                                        let uu____8439 =
                                          let uu____8440 =
                                            FStar_Syntax_Subst.compress e in
                                          uu____8440.FStar_Syntax_Syntax.n in
                                        (match uu____8439 with
                                         | FStar_Syntax_Syntax.Tm_meta
                                             (e0,FStar_Syntax_Syntax.Meta_monadic_lift
                                              (m11,m2,t'))
                                             ->
                                             Prims.op_Negation
                                               (FStar_Syntax_Util.is_pure_effect
                                                  m11)
                                         | uu____8455 -> false) in
                                  let uu____8456 =
                                    let uu____8457 =
                                      let uu____8461 =
                                        FStar_Syntax_Syntax.as_arg head_app in
                                      uu____8461 :: args in
                                    FStar_Util.for_some is_arg_impure
                                      uu____8457 in
                                  if uu____8456
                                  then
                                    let uu____8464 =
                                      let uu____8465 =
                                        FStar_Syntax_Print.term_to_string
                                          head1 in
                                      FStar_Util.format1
                                        "Incompability between typechecker and normalizer; this monadic application contains impure terms %s\n"
                                        uu____8465 in
                                    failwith uu____8464
                                  else ());
                                 (let uu____8467 =
                                    maybe_unfold_action head_app in
                                  match uu____8467 with
                                  | (head_app1,found_action) ->
                                      let mk1 tm =
                                        FStar_Syntax_Syntax.mk tm None
                                          t2.FStar_Syntax_Syntax.pos in
                                      let body =
                                        mk1
                                          (FStar_Syntax_Syntax.Tm_app
                                             (head_app1, args)) in
                                      let body1 =
                                        match found_action with
                                        | None  ->
                                            FStar_Syntax_Util.mk_reify body
                                        | Some (false ) ->
                                            mk1
                                              (FStar_Syntax_Syntax.Tm_meta
                                                 (body,
                                                   (FStar_Syntax_Syntax.Meta_monadic
                                                      (m1, t2))))
                                        | Some (true ) -> body in
                                      let uu____8502 = FStar_List.tl stack1 in
                                      norm cfg env uu____8502 body1)))
                       | FStar_Syntax_Syntax.Tm_meta
                           (e,FStar_Syntax_Syntax.Meta_monadic_lift
                            (msrc,mtgt,t'))
                           ->
                           let lifted =
                             let uu____8516 = closure_as_term cfg env t' in
                             reify_lift cfg.tcenv e msrc mtgt uu____8516 in
                           let uu____8517 = FStar_List.tl stack1 in
                           norm cfg env uu____8517 lifted
                       | FStar_Syntax_Syntax.Tm_match (e,branches) ->
                           let branches1 =
                             FStar_All.pipe_right branches
                               (FStar_List.map
                                  (fun uu____8600  ->
                                     match uu____8600 with
                                     | (pat,wopt,tm) ->
                                         let uu____8638 =
                                           FStar_Syntax_Util.mk_reify tm in
                                         (pat, wopt, uu____8638))) in
                           let tm =
                             mk (FStar_Syntax_Syntax.Tm_match (e, branches1))
                               t2.FStar_Syntax_Syntax.pos in
                           let uu____8664 = FStar_List.tl stack1 in
                           norm cfg env uu____8664 tm
                       | uu____8665 -> norm cfg env stack1 head1)
                | FStar_Syntax_Syntax.Meta_monadic_lift (m1,m',t2) ->
                    let should_reify =
                      match stack1 with
                      | (App
                          ({
                             FStar_Syntax_Syntax.n =
                               FStar_Syntax_Syntax.Tm_constant
                               (FStar_Const.Const_reify );
                             FStar_Syntax_Syntax.tk = uu____8674;
                             FStar_Syntax_Syntax.pos = uu____8675;
                             FStar_Syntax_Syntax.vars = uu____8676;_},uu____8677,uu____8678))::uu____8679
                          ->
                          FStar_All.pipe_right cfg.steps
                            (FStar_List.contains Reify)
                      | uu____8685 -> false in
                    if should_reify
                    then
                      let uu____8686 = FStar_List.tl stack1 in
                      let uu____8687 =
                        let uu____8688 = closure_as_term cfg env t2 in
                        reify_lift cfg.tcenv head1 m1 m' uu____8688 in
                      norm cfg env uu____8686 uu____8687
                    else
                      (let t3 = norm cfg env [] t2 in
                       let uu____8691 =
                         ((FStar_Syntax_Util.is_pure_effect m1) ||
                            (FStar_Syntax_Util.is_ghost_effect m1))
                           &&
                           (FStar_All.pipe_right cfg.steps
                              (FStar_List.contains
                                 PureSubtermsWithinComputations)) in
                       if uu____8691
                       then
                         let stack2 =
                           (Steps
                              ((cfg.steps), (cfg.primitive_steps),
                                (cfg.delta_level)))
                           :: stack1 in
                         let cfg1 =
                           let uu___182_8697 = cfg in
                           {
                             steps =
                               [PureSubtermsWithinComputations;
                               Primops;
                               AllowUnboundUniverses;
                               EraseUniverses;
                               Exclude Zeta];
                             tcenv = (uu___182_8697.tcenv);
                             delta_level =
                               [FStar_TypeChecker_Env.Inlining;
                               FStar_TypeChecker_Env.Eager_unfolding_only];
                             primitive_steps =
                               (uu___182_8697.primitive_steps)
                           } in
                         norm cfg1 env
                           ((Meta
                               ((FStar_Syntax_Syntax.Meta_monadic_lift
                                   (m1, m', t3)),
                                 (head1.FStar_Syntax_Syntax.pos))) :: stack2)
                           head1
                       else
                         norm cfg env
                           ((Meta
                               ((FStar_Syntax_Syntax.Meta_monadic_lift
                                   (m1, m', t3)),
                                 (head1.FStar_Syntax_Syntax.pos))) :: stack1)
                           head1)
                | uu____8699 ->
                    (match stack1 with
                     | uu____8700::uu____8701 ->
                         (match m with
                          | FStar_Syntax_Syntax.Meta_labeled (l,r,uu____8705)
                              -> norm cfg env ((Meta (m, r)) :: stack1) head1
                          | FStar_Syntax_Syntax.Meta_alien (b,s) ->
                              norm cfg env
                                ((Meta (m, (t1.FStar_Syntax_Syntax.pos))) ::
                                stack1) head1
                          | FStar_Syntax_Syntax.Meta_pattern args ->
                              let args1 = norm_pattern_args cfg env args in
                              norm cfg env
                                ((Meta
                                    ((FStar_Syntax_Syntax.Meta_pattern args1),
                                      (t1.FStar_Syntax_Syntax.pos))) ::
                                stack1) head1
                          | uu____8722 -> norm cfg env stack1 head1)
                     | [] ->
                         let head2 = norm cfg env [] head1 in
                         let m1 =
                           match m with
                           | FStar_Syntax_Syntax.Meta_pattern args ->
                               let uu____8732 =
                                 norm_pattern_args cfg env args in
                               FStar_Syntax_Syntax.Meta_pattern uu____8732
                           | uu____8739 -> m in
                         let t2 =
                           mk (FStar_Syntax_Syntax.Tm_meta (head2, m1))
                             t1.FStar_Syntax_Syntax.pos in
                         rebuild cfg env stack1 t2)))
and reify_lift:
  FStar_TypeChecker_Env.env ->
    (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
      FStar_Syntax_Syntax.syntax ->
      FStar_Syntax_Syntax.monad_name ->
        FStar_Syntax_Syntax.monad_name ->
          FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun env  ->
    fun e  ->
      fun msrc  ->
        fun mtgt  ->
          fun t  ->
            if FStar_Syntax_Util.is_pure_effect msrc
            then
              let ed = FStar_TypeChecker_Env.get_effect_decl env mtgt in
              let uu____8751 = ed.FStar_Syntax_Syntax.return_repr in
              match uu____8751 with
              | (uu____8752,return_repr) ->
                  let return_inst =
                    let uu____8759 =
                      let uu____8760 =
                        FStar_Syntax_Subst.compress return_repr in
                      uu____8760.FStar_Syntax_Syntax.n in
                    match uu____8759 with
                    | FStar_Syntax_Syntax.Tm_uinst (return_tm,uu____8766::[])
                        ->
                        let uu____8772 =
                          let uu____8775 =
                            let uu____8776 =
                              let uu____8781 =
                                let uu____8783 =
                                  env.FStar_TypeChecker_Env.universe_of env t in
                                [uu____8783] in
                              (return_tm, uu____8781) in
                            FStar_Syntax_Syntax.Tm_uinst uu____8776 in
                          FStar_Syntax_Syntax.mk uu____8775 in
                        uu____8772 None e.FStar_Syntax_Syntax.pos
                    | uu____8795 ->
                        failwith "NIY : Reification of indexed effects" in
                  let uu____8798 =
                    let uu____8801 =
                      let uu____8802 =
                        let uu____8812 =
                          let uu____8814 = FStar_Syntax_Syntax.as_arg t in
                          let uu____8815 =
                            let uu____8817 = FStar_Syntax_Syntax.as_arg e in
                            [uu____8817] in
                          uu____8814 :: uu____8815 in
                        (return_inst, uu____8812) in
                      FStar_Syntax_Syntax.Tm_app uu____8802 in
                    FStar_Syntax_Syntax.mk uu____8801 in
                  uu____8798 None e.FStar_Syntax_Syntax.pos
            else
              (let uu____8830 = FStar_TypeChecker_Env.monad_leq env msrc mtgt in
               match uu____8830 with
               | None  ->
                   let uu____8832 =
                     FStar_Util.format2
                       "Impossible : trying to reify a lift between unrelated effects (%s and %s)"
                       (FStar_Ident.text_of_lid msrc)
                       (FStar_Ident.text_of_lid mtgt) in
                   failwith uu____8832
               | Some
                   { FStar_TypeChecker_Env.msource = uu____8833;
                     FStar_TypeChecker_Env.mtarget = uu____8834;
                     FStar_TypeChecker_Env.mlift =
                       { FStar_TypeChecker_Env.mlift_wp = uu____8835;
                         FStar_TypeChecker_Env.mlift_term = None ;_};_}
                   ->
                   failwith
                     "Impossible : trying to reify a non-reifiable lift (from %s to %s)"
               | Some
                   { FStar_TypeChecker_Env.msource = uu____8846;
                     FStar_TypeChecker_Env.mtarget = uu____8847;
                     FStar_TypeChecker_Env.mlift =
                       { FStar_TypeChecker_Env.mlift_wp = uu____8848;
                         FStar_TypeChecker_Env.mlift_term = Some lift;_};_}
                   ->
                   let uu____8866 = FStar_Syntax_Util.mk_reify e in
                   lift t FStar_Syntax_Syntax.tun uu____8866)
and norm_pattern_args:
  cfg ->
    env ->
      ((FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
        FStar_Syntax_Syntax.syntax* FStar_Syntax_Syntax.aqual) Prims.list
        Prims.list ->
        (FStar_Syntax_Syntax.term* FStar_Syntax_Syntax.aqual) Prims.list
          Prims.list
  =
  fun cfg  ->
    fun env  ->
      fun args  ->
        FStar_All.pipe_right args
          (FStar_List.map
             (FStar_List.map
                (fun uu____8896  ->
                   match uu____8896 with
                   | (a,imp) ->
                       let uu____8903 = norm cfg env [] a in
                       (uu____8903, imp))))
and norm_comp:
  cfg -> env -> FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp =
  fun cfg  ->
    fun env  ->
      fun comp  ->
        let comp1 = ghost_to_pure_aux cfg env comp in
        match comp1.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Total (t,uopt) ->
            let uu___183_8918 = comp1 in
            let uu____8921 =
              let uu____8922 =
                let uu____8928 = norm cfg env [] t in
                let uu____8929 =
                  FStar_Option.map (norm_universe cfg env) uopt in
                (uu____8928, uu____8929) in
              FStar_Syntax_Syntax.Total uu____8922 in
            {
              FStar_Syntax_Syntax.n = uu____8921;
              FStar_Syntax_Syntax.tk = (uu___183_8918.FStar_Syntax_Syntax.tk);
              FStar_Syntax_Syntax.pos =
                (uu___183_8918.FStar_Syntax_Syntax.pos);
              FStar_Syntax_Syntax.vars =
                (uu___183_8918.FStar_Syntax_Syntax.vars)
            }
        | FStar_Syntax_Syntax.GTotal (t,uopt) ->
            let uu___184_8944 = comp1 in
            let uu____8947 =
              let uu____8948 =
                let uu____8954 = norm cfg env [] t in
                let uu____8955 =
                  FStar_Option.map (norm_universe cfg env) uopt in
                (uu____8954, uu____8955) in
              FStar_Syntax_Syntax.GTotal uu____8948 in
            {
              FStar_Syntax_Syntax.n = uu____8947;
              FStar_Syntax_Syntax.tk = (uu___184_8944.FStar_Syntax_Syntax.tk);
              FStar_Syntax_Syntax.pos =
                (uu___184_8944.FStar_Syntax_Syntax.pos);
              FStar_Syntax_Syntax.vars =
                (uu___184_8944.FStar_Syntax_Syntax.vars)
            }
        | FStar_Syntax_Syntax.Comp ct ->
            let norm_args args =
              FStar_All.pipe_right args
                (FStar_List.map
                   (fun uu____8986  ->
                      match uu____8986 with
                      | (a,i) ->
                          let uu____8993 = norm cfg env [] a in
                          (uu____8993, i))) in
            let flags =
              FStar_All.pipe_right ct.FStar_Syntax_Syntax.flags
                (FStar_List.map
                   (fun uu___146_8998  ->
                      match uu___146_8998 with
                      | FStar_Syntax_Syntax.DECREASES t ->
                          let uu____9002 = norm cfg env [] t in
                          FStar_Syntax_Syntax.DECREASES uu____9002
                      | f -> f)) in
            let uu___185_9006 = comp1 in
            let uu____9009 =
              let uu____9010 =
                let uu___186_9011 = ct in
                let uu____9012 =
                  FStar_List.map (norm_universe cfg env)
                    ct.FStar_Syntax_Syntax.comp_univs in
                let uu____9013 =
                  norm cfg env [] ct.FStar_Syntax_Syntax.result_typ in
                let uu____9016 = norm_args ct.FStar_Syntax_Syntax.effect_args in
                {
                  FStar_Syntax_Syntax.comp_univs = uu____9012;
                  FStar_Syntax_Syntax.effect_name =
                    (uu___186_9011.FStar_Syntax_Syntax.effect_name);
                  FStar_Syntax_Syntax.result_typ = uu____9013;
                  FStar_Syntax_Syntax.effect_args = uu____9016;
                  FStar_Syntax_Syntax.flags = flags
                } in
              FStar_Syntax_Syntax.Comp uu____9010 in
            {
              FStar_Syntax_Syntax.n = uu____9009;
              FStar_Syntax_Syntax.tk = (uu___185_9006.FStar_Syntax_Syntax.tk);
              FStar_Syntax_Syntax.pos =
                (uu___185_9006.FStar_Syntax_Syntax.pos);
              FStar_Syntax_Syntax.vars =
                (uu___185_9006.FStar_Syntax_Syntax.vars)
            }
and ghost_to_pure_aux:
  cfg ->
    env ->
      FStar_Syntax_Syntax.comp ->
        (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax
  =
  fun cfg  ->
    fun env  ->
      fun c  ->
        let norm1 t =
          norm
            (let uu___187_9033 = cfg in
             {
               steps =
                 [Eager_unfolding;
                 UnfoldUntil FStar_Syntax_Syntax.Delta_constant;
                 AllowUnboundUniverses];
               tcenv = (uu___187_9033.tcenv);
               delta_level = (uu___187_9033.delta_level);
               primitive_steps = (uu___187_9033.primitive_steps)
             }) env [] t in
        let non_info t =
          let uu____9038 = norm1 t in
          FStar_Syntax_Util.non_informative uu____9038 in
        match c.FStar_Syntax_Syntax.n with
        | FStar_Syntax_Syntax.Total uu____9041 -> c
        | FStar_Syntax_Syntax.GTotal (t,uopt) when non_info t ->
            let uu___188_9055 = c in
            {
              FStar_Syntax_Syntax.n = (FStar_Syntax_Syntax.Total (t, uopt));
              FStar_Syntax_Syntax.tk = (uu___188_9055.FStar_Syntax_Syntax.tk);
              FStar_Syntax_Syntax.pos =
                (uu___188_9055.FStar_Syntax_Syntax.pos);
              FStar_Syntax_Syntax.vars =
                (uu___188_9055.FStar_Syntax_Syntax.vars)
            }
        | FStar_Syntax_Syntax.Comp ct ->
            let l =
              FStar_TypeChecker_Env.norm_eff_name cfg.tcenv
                ct.FStar_Syntax_Syntax.effect_name in
            let uu____9065 =
              (FStar_Syntax_Util.is_ghost_effect l) &&
                (non_info ct.FStar_Syntax_Syntax.result_typ) in
            if uu____9065
            then
              let ct1 =
                match downgrade_ghost_effect_name
                        ct.FStar_Syntax_Syntax.effect_name
                with
                | Some pure_eff ->
                    let uu___189_9070 = ct in
                    {
                      FStar_Syntax_Syntax.comp_univs =
                        (uu___189_9070.FStar_Syntax_Syntax.comp_univs);
                      FStar_Syntax_Syntax.effect_name = pure_eff;
                      FStar_Syntax_Syntax.result_typ =
                        (uu___189_9070.FStar_Syntax_Syntax.result_typ);
                      FStar_Syntax_Syntax.effect_args =
                        (uu___189_9070.FStar_Syntax_Syntax.effect_args);
                      FStar_Syntax_Syntax.flags =
                        (uu___189_9070.FStar_Syntax_Syntax.flags)
                    }
                | None  ->
                    let ct1 =
                      FStar_TypeChecker_Env.unfold_effect_abbrev cfg.tcenv c in
                    let uu___190_9072 = ct1 in
                    {
                      FStar_Syntax_Syntax.comp_univs =
                        (uu___190_9072.FStar_Syntax_Syntax.comp_univs);
                      FStar_Syntax_Syntax.effect_name =
                        FStar_Syntax_Const.effect_PURE_lid;
                      FStar_Syntax_Syntax.result_typ =
                        (uu___190_9072.FStar_Syntax_Syntax.result_typ);
                      FStar_Syntax_Syntax.effect_args =
                        (uu___190_9072.FStar_Syntax_Syntax.effect_args);
                      FStar_Syntax_Syntax.flags =
                        (uu___190_9072.FStar_Syntax_Syntax.flags)
                    } in
              let uu___191_9073 = c in
              {
                FStar_Syntax_Syntax.n = (FStar_Syntax_Syntax.Comp ct1);
                FStar_Syntax_Syntax.tk =
                  (uu___191_9073.FStar_Syntax_Syntax.tk);
                FStar_Syntax_Syntax.pos =
                  (uu___191_9073.FStar_Syntax_Syntax.pos);
                FStar_Syntax_Syntax.vars =
                  (uu___191_9073.FStar_Syntax_Syntax.vars)
              }
            else c
        | uu____9079 -> c
and norm_binder:
  cfg ->
    env ->
      FStar_Syntax_Syntax.binder ->
        (FStar_Syntax_Syntax.bv* FStar_Syntax_Syntax.aqual)
  =
  fun cfg  ->
    fun env  ->
      fun uu____9082  ->
        match uu____9082 with
        | (x,imp) ->
            let uu____9085 =
              let uu___192_9086 = x in
              let uu____9087 = norm cfg env [] x.FStar_Syntax_Syntax.sort in
              {
                FStar_Syntax_Syntax.ppname =
                  (uu___192_9086.FStar_Syntax_Syntax.ppname);
                FStar_Syntax_Syntax.index =
                  (uu___192_9086.FStar_Syntax_Syntax.index);
                FStar_Syntax_Syntax.sort = uu____9087
              } in
            (uu____9085, imp)
and norm_binders:
  cfg -> env -> FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.binders =
  fun cfg  ->
    fun env  ->
      fun bs  ->
        let uu____9093 =
          FStar_List.fold_left
            (fun uu____9100  ->
               fun b  ->
                 match uu____9100 with
                 | (nbs',env1) ->
                     let b1 = norm_binder cfg env1 b in
                     ((b1 :: nbs'), (Dummy :: env1))) ([], env) bs in
        match uu____9093 with | (nbs,uu____9117) -> FStar_List.rev nbs
and norm_lcomp_opt:
  cfg ->
    env ->
      FStar_Syntax_Syntax.residual_comp option ->
        FStar_Syntax_Syntax.residual_comp option
  =
  fun cfg  ->
    fun env  ->
      fun lopt  ->
        match lopt with
        | Some rc ->
            let flags =
              filter_out_lcomp_cflags rc.FStar_Syntax_Syntax.residual_flags in
            let uu____9128 =
              let uu___193_9129 = rc in
              let uu____9130 =
                FStar_Util.map_opt rc.FStar_Syntax_Syntax.residual_typ
                  (norm cfg env []) in
              {
                FStar_Syntax_Syntax.residual_effect =
                  (uu___193_9129.FStar_Syntax_Syntax.residual_effect);
                FStar_Syntax_Syntax.residual_typ = uu____9130;
                FStar_Syntax_Syntax.residual_flags =
                  (uu___193_9129.FStar_Syntax_Syntax.residual_flags)
              } in
            Some uu____9128
        | uu____9136 -> lopt
and rebuild:
  cfg -> env -> stack -> FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun cfg  ->
    fun env  ->
      fun stack1  ->
        fun t  ->
          match stack1 with
          | [] -> t
          | (Debug tm)::stack2 ->
              ((let uu____9146 =
                  FStar_All.pipe_left (FStar_TypeChecker_Env.debug cfg.tcenv)
                    (FStar_Options.Other "print_normalized_terms") in
                if uu____9146
                then
                  let uu____9147 = FStar_Syntax_Print.term_to_string tm in
                  let uu____9148 = FStar_Syntax_Print.term_to_string t in
                  FStar_Util.print2 "Normalized %s to %s\n" uu____9147
                    uu____9148
                else ());
               rebuild cfg env stack2 t)
          | (Steps (s,ps,dl))::stack2 ->
              rebuild
                (let uu___194_9159 = cfg in
                 {
                   steps = s;
                   tcenv = (uu___194_9159.tcenv);
                   delta_level = dl;
                   primitive_steps = ps
                 }) env stack2 t
          | (Meta (m,r))::stack2 ->
              let t1 = mk (FStar_Syntax_Syntax.Tm_meta (t, m)) r in
              rebuild cfg env stack2 t1
          | (MemoLazy r)::stack2 ->
              (set_memo r (env, t);
               log cfg
                 (fun uu____9179  ->
                    let uu____9180 = FStar_Syntax_Print.term_to_string t in
                    FStar_Util.print1 "\tSet memo %s\n" uu____9180);
               rebuild cfg env stack2 t)
          | (Let (env',bs,lb,r))::stack2 ->
              let body = FStar_Syntax_Subst.close bs t in
              let t1 =
                FStar_Syntax_Syntax.mk
                  (FStar_Syntax_Syntax.Tm_let ((false, [lb]), body)) None r in
              rebuild cfg env' stack2 t1
          | (Abs (env',bs,env'',lopt,r))::stack2 ->
              let bs1 = norm_binders cfg env' bs in
              let lopt1 = norm_lcomp_opt cfg env'' lopt in
              let uu____9211 =
                let uu___195_9212 = FStar_Syntax_Util.abs bs1 t lopt1 in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___195_9212.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.tk =
                    (uu___195_9212.FStar_Syntax_Syntax.tk);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___195_9212.FStar_Syntax_Syntax.vars)
                } in
              rebuild cfg env stack2 uu____9211
          | (Arg (Univ uu____9217,uu____9218,uu____9219))::uu____9220 ->
              failwith "Impossible"
          | (Arg (Dummy ,uu____9222,uu____9223))::uu____9224 ->
              failwith "Impossible"
          | (UnivArgs (us,r))::stack2 ->
              let t1 = FStar_Syntax_Syntax.mk_Tm_uinst t us in
              rebuild cfg env stack2 t1
          | (Arg (Clos (env1,tm,m,uu____9236),aq,r))::stack2 ->
              (log cfg
                 (fun uu____9252  ->
                    let uu____9253 = FStar_Syntax_Print.term_to_string tm in
                    FStar_Util.print1 "Rebuilding with arg %s\n" uu____9253);
               if FStar_List.contains (Exclude Iota) cfg.steps
               then
                 (if FStar_List.contains WHNF cfg.steps
                  then
                    let arg = closure_as_term cfg env1 tm in
                    let t1 =
                      FStar_Syntax_Syntax.extend_app t (arg, aq) None r in
                    rebuild cfg env1 stack2 t1
                  else
                    (let stack3 = (App (t, aq, r)) :: stack2 in
                     norm cfg env1 stack3 tm))
               else
                 (let uu____9264 = FStar_ST.read m in
                  match uu____9264 with
                  | None  ->
                      if FStar_List.contains WHNF cfg.steps
                      then
                        let arg = closure_as_term cfg env1 tm in
                        let t1 =
                          FStar_Syntax_Syntax.extend_app t (arg, aq) None r in
                        rebuild cfg env1 stack2 t1
                      else
                        (let stack3 = (MemoLazy m) :: (App (t, aq, r)) ::
                           stack2 in
                         norm cfg env1 stack3 tm)
                  | Some (uu____9290,a) ->
                      let t1 =
                        FStar_Syntax_Syntax.extend_app t (a, aq) None r in
                      rebuild cfg env1 stack2 t1))
          | (App (head1,aq,r))::stack2 ->
              let t1 = FStar_Syntax_Syntax.extend_app head1 (t, aq) None r in
              let uu____9312 = maybe_simplify cfg t1 in
              rebuild cfg env stack2 uu____9312
          | (Match (env1,branches,r))::stack2 ->
              (log cfg
                 (fun uu____9319  ->
                    let uu____9320 = FStar_Syntax_Print.term_to_string t in
                    FStar_Util.print1
                      "Rebuilding with match, scrutinee is %s ...\n"
                      uu____9320);
               (let scrutinee = t in
                let norm_and_rebuild_match uu____9325 =
                  log cfg
                    (fun uu____9327  ->
                       let uu____9328 =
                         FStar_Syntax_Print.term_to_string scrutinee in
                       let uu____9329 =
                         let uu____9330 =
                           FStar_All.pipe_right branches
                             (FStar_List.map
                                (fun uu____9337  ->
                                   match uu____9337 with
                                   | (p,uu____9343,uu____9344) ->
                                       FStar_Syntax_Print.pat_to_string p)) in
                         FStar_All.pipe_right uu____9330
                           (FStar_String.concat "\n\t") in
                       FStar_Util.print2
                         "match is irreducible: scrutinee=%s\nbranches=%s\n"
                         uu____9328 uu____9329);
                  (let whnf = FStar_List.contains WHNF cfg.steps in
                   let cfg_exclude_iota_zeta =
                     let new_delta =
                       FStar_All.pipe_right cfg.delta_level
                         (FStar_List.filter
                            (fun uu___147_9354  ->
                               match uu___147_9354 with
                               | FStar_TypeChecker_Env.Inlining  -> true
                               | FStar_TypeChecker_Env.Eager_unfolding_only 
                                   -> true
                               | uu____9355 -> false)) in
                     let steps' =
                       let uu____9358 =
                         FStar_All.pipe_right cfg.steps
                           (FStar_List.contains
                              PureSubtermsWithinComputations) in
                       if uu____9358
                       then [Exclude Zeta]
                       else [Exclude Iota; Exclude Zeta] in
                     let uu___196_9361 = cfg in
                     {
                       steps = (FStar_List.append steps' cfg.steps);
                       tcenv = (uu___196_9361.tcenv);
                       delta_level = new_delta;
                       primitive_steps = (uu___196_9361.primitive_steps)
                     } in
                   let norm_or_whnf env2 t1 =
                     if whnf
                     then closure_as_term cfg_exclude_iota_zeta env2 t1
                     else norm cfg_exclude_iota_zeta env2 [] t1 in
                   let rec norm_pat env2 p =
                     match p.FStar_Syntax_Syntax.v with
                     | FStar_Syntax_Syntax.Pat_constant uu____9395 ->
                         (p, env2)
                     | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
                         let uu____9411 =
                           FStar_All.pipe_right pats
                             (FStar_List.fold_left
                                (fun uu____9445  ->
                                   fun uu____9446  ->
                                     match (uu____9445, uu____9446) with
                                     | ((pats1,env3),(p1,b)) ->
                                         let uu____9511 = norm_pat env3 p1 in
                                         (match uu____9511 with
                                          | (p2,env4) ->
                                              (((p2, b) :: pats1), env4)))
                                ([], env2)) in
                         (match uu____9411 with
                          | (pats1,env3) ->
                              ((let uu___197_9577 = p in
                                {
                                  FStar_Syntax_Syntax.v =
                                    (FStar_Syntax_Syntax.Pat_cons
                                       (fv, (FStar_List.rev pats1)));
                                  FStar_Syntax_Syntax.ty =
                                    (uu___197_9577.FStar_Syntax_Syntax.ty);
                                  FStar_Syntax_Syntax.p =
                                    (uu___197_9577.FStar_Syntax_Syntax.p)
                                }), env3))
                     | FStar_Syntax_Syntax.Pat_var x ->
                         let x1 =
                           let uu___198_9591 = x in
                           let uu____9592 =
                             norm_or_whnf env2 x.FStar_Syntax_Syntax.sort in
                           {
                             FStar_Syntax_Syntax.ppname =
                               (uu___198_9591.FStar_Syntax_Syntax.ppname);
                             FStar_Syntax_Syntax.index =
                               (uu___198_9591.FStar_Syntax_Syntax.index);
                             FStar_Syntax_Syntax.sort = uu____9592
                           } in
                         ((let uu___199_9598 = p in
                           {
                             FStar_Syntax_Syntax.v =
                               (FStar_Syntax_Syntax.Pat_var x1);
                             FStar_Syntax_Syntax.ty =
                               (uu___199_9598.FStar_Syntax_Syntax.ty);
                             FStar_Syntax_Syntax.p =
                               (uu___199_9598.FStar_Syntax_Syntax.p)
                           }), (Dummy :: env2))
                     | FStar_Syntax_Syntax.Pat_wild x ->
                         let x1 =
                           let uu___200_9603 = x in
                           let uu____9604 =
                             norm_or_whnf env2 x.FStar_Syntax_Syntax.sort in
                           {
                             FStar_Syntax_Syntax.ppname =
                               (uu___200_9603.FStar_Syntax_Syntax.ppname);
                             FStar_Syntax_Syntax.index =
                               (uu___200_9603.FStar_Syntax_Syntax.index);
                             FStar_Syntax_Syntax.sort = uu____9604
                           } in
                         ((let uu___201_9610 = p in
                           {
                             FStar_Syntax_Syntax.v =
                               (FStar_Syntax_Syntax.Pat_wild x1);
                             FStar_Syntax_Syntax.ty =
                               (uu___201_9610.FStar_Syntax_Syntax.ty);
                             FStar_Syntax_Syntax.p =
                               (uu___201_9610.FStar_Syntax_Syntax.p)
                           }), (Dummy :: env2))
                     | FStar_Syntax_Syntax.Pat_dot_term (x,t1) ->
                         let x1 =
                           let uu___202_9620 = x in
                           let uu____9621 =
                             norm_or_whnf env2 x.FStar_Syntax_Syntax.sort in
                           {
                             FStar_Syntax_Syntax.ppname =
                               (uu___202_9620.FStar_Syntax_Syntax.ppname);
                             FStar_Syntax_Syntax.index =
                               (uu___202_9620.FStar_Syntax_Syntax.index);
                             FStar_Syntax_Syntax.sort = uu____9621
                           } in
                         let t2 = norm_or_whnf env2 t1 in
                         ((let uu___203_9628 = p in
                           {
                             FStar_Syntax_Syntax.v =
                               (FStar_Syntax_Syntax.Pat_dot_term (x1, t2));
                             FStar_Syntax_Syntax.ty =
                               (uu___203_9628.FStar_Syntax_Syntax.ty);
                             FStar_Syntax_Syntax.p =
                               (uu___203_9628.FStar_Syntax_Syntax.p)
                           }), env2) in
                   let branches1 =
                     match env1 with
                     | [] when whnf -> branches
                     | uu____9632 ->
                         FStar_All.pipe_right branches
                           (FStar_List.map
                              (fun branch1  ->
                                 let uu____9635 =
                                   FStar_Syntax_Subst.open_branch branch1 in
                                 match uu____9635 with
                                 | (p,wopt,e) ->
                                     let uu____9653 = norm_pat env1 p in
                                     (match uu____9653 with
                                      | (p1,env2) ->
                                          let wopt1 =
                                            match wopt with
                                            | None  -> None
                                            | Some w ->
                                                let uu____9677 =
                                                  norm_or_whnf env2 w in
                                                Some uu____9677 in
                                          let e1 = norm_or_whnf env2 e in
                                          FStar_Syntax_Util.branch
                                            (p1, wopt1, e1)))) in
                   let uu____9682 =
                     mk (FStar_Syntax_Syntax.Tm_match (scrutinee, branches1))
                       r in
                   rebuild cfg env1 stack2 uu____9682) in
                let rec is_cons head1 =
                  match head1.FStar_Syntax_Syntax.n with
                  | FStar_Syntax_Syntax.Tm_uinst (h,uu____9692) -> is_cons h
                  | FStar_Syntax_Syntax.Tm_constant uu____9697 -> true
                  | FStar_Syntax_Syntax.Tm_fvar
                      { FStar_Syntax_Syntax.fv_name = uu____9698;
                        FStar_Syntax_Syntax.fv_delta = uu____9699;
                        FStar_Syntax_Syntax.fv_qual = Some
                          (FStar_Syntax_Syntax.Data_ctor );_}
                      -> true
                  | FStar_Syntax_Syntax.Tm_fvar
                      { FStar_Syntax_Syntax.fv_name = uu____9703;
                        FStar_Syntax_Syntax.fv_delta = uu____9704;
                        FStar_Syntax_Syntax.fv_qual = Some
                          (FStar_Syntax_Syntax.Record_ctor uu____9705);_}
                      -> true
                  | uu____9712 -> false in
                let guard_when_clause wopt b rest =
                  match wopt with
                  | None  -> b
                  | Some w ->
                      let then_branch = b in
                      let else_branch =
                        mk (FStar_Syntax_Syntax.Tm_match (scrutinee, rest)) r in
                      FStar_Syntax_Util.if_then_else w then_branch
                        else_branch in
                let rec matches_pat scrutinee_orig p =
                  let scrutinee1 = FStar_Syntax_Util.unmeta scrutinee_orig in
                  let uu____9811 = FStar_Syntax_Util.head_and_args scrutinee1 in
                  match uu____9811 with
                  | (head1,args) ->
                      (match p.FStar_Syntax_Syntax.v with
                       | FStar_Syntax_Syntax.Pat_var uu____9843 ->
                           FStar_Util.Inl [scrutinee_orig]
                       | FStar_Syntax_Syntax.Pat_wild uu____9845 ->
                           FStar_Util.Inl [scrutinee_orig]
                       | FStar_Syntax_Syntax.Pat_dot_term uu____9847 ->
                           FStar_Util.Inl []
                       | FStar_Syntax_Syntax.Pat_constant s ->
                           (match scrutinee1.FStar_Syntax_Syntax.n with
                            | FStar_Syntax_Syntax.Tm_constant s' when 
                                s = s' -> FStar_Util.Inl []
                            | uu____9859 ->
                                let uu____9860 =
                                  let uu____9861 = is_cons head1 in
                                  Prims.op_Negation uu____9861 in
                                FStar_Util.Inr uu____9860)
                       | FStar_Syntax_Syntax.Pat_cons (fv,arg_pats) ->
                           let uu____9875 =
                             let uu____9876 =
                               FStar_Syntax_Util.un_uinst head1 in
                             uu____9876.FStar_Syntax_Syntax.n in
                           (match uu____9875 with
                            | FStar_Syntax_Syntax.Tm_fvar fv' when
                                FStar_Syntax_Syntax.fv_eq fv fv' ->
                                matches_args [] args arg_pats
                            | uu____9883 ->
                                let uu____9884 =
                                  let uu____9885 = is_cons head1 in
                                  Prims.op_Negation uu____9885 in
                                FStar_Util.Inr uu____9884))
                and matches_args out a p =
                  match (a, p) with
                  | ([],[]) -> FStar_Util.Inl out
                  | ((t1,uu____9919)::rest_a,(p1,uu____9922)::rest_p) ->
                      let uu____9950 = matches_pat t1 p1 in
                      (match uu____9950 with
                       | FStar_Util.Inl s ->
                           matches_args (FStar_List.append out s) rest_a
                             rest_p
                       | m -> m)
                  | uu____9964 -> FStar_Util.Inr false in
                let rec matches scrutinee1 p =
                  match p with
                  | [] -> norm_and_rebuild_match ()
                  | (p1,wopt,b)::rest ->
                      let uu____10035 = matches_pat scrutinee1 p1 in
                      (match uu____10035 with
                       | FStar_Util.Inr (false ) -> matches scrutinee1 rest
                       | FStar_Util.Inr (true ) -> norm_and_rebuild_match ()
                       | FStar_Util.Inl s ->
                           (log cfg
                              (fun uu____10045  ->
                                 let uu____10046 =
                                   FStar_Syntax_Print.pat_to_string p1 in
                                 let uu____10047 =
                                   let uu____10048 =
                                     FStar_List.map
                                       FStar_Syntax_Print.term_to_string s in
                                   FStar_All.pipe_right uu____10048
                                     (FStar_String.concat "; ") in
                                 FStar_Util.print2
                                   "Matches pattern %s with subst = %s\n"
                                   uu____10046 uu____10047);
                            (let env2 =
                               FStar_List.fold_left
                                 (fun env2  ->
                                    fun t1  ->
                                      let uu____10057 =
                                        let uu____10058 =
                                          let uu____10068 =
                                            FStar_Util.mk_ref (Some ([], t1)) in
                                          ([], t1, uu____10068, false) in
                                        Clos uu____10058 in
                                      uu____10057 :: env2) env1 s in
                             let uu____10091 = guard_when_clause wopt b rest in
                             norm cfg env2 stack2 uu____10091))) in
                let uu____10092 =
                  FStar_All.pipe_right cfg.steps
                    (FStar_List.contains (Exclude Iota)) in
                if uu____10092
                then norm_and_rebuild_match ()
                else matches scrutinee branches))
let config: step Prims.list -> FStar_TypeChecker_Env.env -> cfg =
  fun s  ->
    fun e  ->
      let d =
        FStar_All.pipe_right s
          (FStar_List.collect
             (fun uu___148_10108  ->
                match uu___148_10108 with
                | UnfoldUntil k -> [FStar_TypeChecker_Env.Unfold k]
                | Eager_unfolding  ->
                    [FStar_TypeChecker_Env.Eager_unfolding_only]
                | Inlining  -> [FStar_TypeChecker_Env.Inlining]
                | UnfoldTac  -> [FStar_TypeChecker_Env.UnfoldTac]
                | uu____10111 -> [])) in
      let d1 =
        match d with
        | [] -> [FStar_TypeChecker_Env.NoDelta]
        | uu____10115 -> d in
      {
        steps = s;
        tcenv = e;
        delta_level = d1;
        primitive_steps = built_in_primitive_steps
      }
let normalize_with_primitive_steps:
  primitive_step Prims.list ->
    step Prims.list ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun ps  ->
    fun s  ->
      fun e  ->
        fun t  ->
          let c = config s e in
          let c1 =
            let uu___204_10139 = config s e in
            {
              steps = (uu___204_10139.steps);
              tcenv = (uu___204_10139.tcenv);
              delta_level = (uu___204_10139.delta_level);
              primitive_steps = (FStar_List.append c.primitive_steps ps)
            } in
          norm c1 [] [] t
let normalize:
  steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  = fun s  -> fun e  -> fun t  -> normalize_with_primitive_steps [] s e t
let normalize_comp:
  steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp
  =
  fun s  ->
    fun e  ->
      fun t  -> let uu____10164 = config s e in norm_comp uu____10164 [] t
let normalize_universe:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe -> FStar_Syntax_Syntax.universe
  =
  fun env  ->
    fun u  ->
      let uu____10173 = config [] env in norm_universe uu____10173 [] u
let ghost_to_pure:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      (FStar_Syntax_Syntax.comp',Prims.unit) FStar_Syntax_Syntax.syntax
  =
  fun env  ->
    fun c  ->
      let uu____10182 = config [] env in ghost_to_pure_aux uu____10182 [] c
let ghost_to_pure_lcomp:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.lcomp -> FStar_Syntax_Syntax.lcomp
  =
  fun env  ->
    fun lc  ->
      let cfg =
        config
          [Eager_unfolding;
          UnfoldUntil FStar_Syntax_Syntax.Delta_constant;
          EraseUniverses;
          AllowUnboundUniverses] env in
      let non_info t =
        let uu____10196 = norm cfg [] [] t in
        FStar_Syntax_Util.non_informative uu____10196 in
      let uu____10197 =
        (FStar_Syntax_Util.is_ghost_effect lc.FStar_Syntax_Syntax.eff_name)
          && (non_info lc.FStar_Syntax_Syntax.res_typ) in
      if uu____10197
      then
        match downgrade_ghost_effect_name lc.FStar_Syntax_Syntax.eff_name
        with
        | Some pure_eff ->
            let uu___205_10199 = lc in
            {
              FStar_Syntax_Syntax.eff_name = pure_eff;
              FStar_Syntax_Syntax.res_typ =
                (uu___205_10199.FStar_Syntax_Syntax.res_typ);
              FStar_Syntax_Syntax.cflags =
                (uu___205_10199.FStar_Syntax_Syntax.cflags);
              FStar_Syntax_Syntax.comp =
                ((fun uu____10200  ->
                    let uu____10201 = lc.FStar_Syntax_Syntax.comp () in
                    ghost_to_pure env uu____10201))
            }
        | None  -> lc
      else lc
let term_to_string:
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> Prims.string =
  fun env  ->
    fun t  ->
      let t1 =
        try normalize [AllowUnboundUniverses] env t
        with
        | e ->
            ((let uu____10216 = FStar_Util.message_of_exn e in
              FStar_Util.print1_warning "Normalization failed with error %s"
                uu____10216);
             t) in
      FStar_Syntax_Print.term_to_string t1
let comp_to_string:
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.comp -> Prims.string =
  fun env  ->
    fun c  ->
      let c1 =
        try
          let uu____10227 = config [AllowUnboundUniverses] env in
          norm_comp uu____10227 [] c
        with
        | e ->
            ((let uu____10231 = FStar_Util.message_of_exn e in
              FStar_Util.print1_warning "Normalization failed with error %s"
                uu____10231);
             c) in
      FStar_Syntax_Print.comp_to_string c1
let normalize_refinement:
  steps ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.typ ->
        (FStar_Syntax_Syntax.term',FStar_Syntax_Syntax.term')
          FStar_Syntax_Syntax.syntax
  =
  fun steps  ->
    fun env  ->
      fun t0  ->
        let t = normalize (FStar_List.append steps [Beta]) env t0 in
        let rec aux t1 =
          let t2 = FStar_Syntax_Subst.compress t1 in
          match t2.FStar_Syntax_Syntax.n with
          | FStar_Syntax_Syntax.Tm_refine (x,phi) ->
              let t01 = aux x.FStar_Syntax_Syntax.sort in
              (match t01.FStar_Syntax_Syntax.n with
               | FStar_Syntax_Syntax.Tm_refine (y,phi1) ->
                   let uu____10271 =
                     let uu____10272 =
                       let uu____10277 = FStar_Syntax_Util.mk_conj phi1 phi in
                       (y, uu____10277) in
                     FStar_Syntax_Syntax.Tm_refine uu____10272 in
                   mk uu____10271 t01.FStar_Syntax_Syntax.pos
               | uu____10282 -> t2)
          | uu____10283 -> t2 in
        aux t
let unfold_whnf:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun env  ->
    fun t  ->
      normalize [WHNF; UnfoldUntil FStar_Syntax_Syntax.Delta_constant; Beta]
        env t
let reduce_uvar_solutions:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun env  ->
    fun t  ->
      normalize
        [Beta;
        NoDeltaSteps;
        CompressUvars;
        Exclude Zeta;
        Exclude Iota;
        NoFullNorm] env t
let eta_expand_with_type:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term
  =
  fun env  ->
    fun e  ->
      fun t_e  ->
        let uu____10312 = FStar_Syntax_Util.arrow_formals_comp t_e in
        match uu____10312 with
        | (formals,c) ->
            (match formals with
             | [] -> e
             | uu____10328 ->
                 let uu____10332 = FStar_Syntax_Util.abs_formals e in
                 (match uu____10332 with
                  | (actuals,uu____10338,uu____10339) ->
                      if
                        (FStar_List.length actuals) =
                          (FStar_List.length formals)
                      then e
                      else
                        (let uu____10355 =
                           FStar_All.pipe_right formals
                             FStar_Syntax_Util.args_of_binders in
                         match uu____10355 with
                         | (binders,args) ->
                             let uu____10365 =
                               FStar_Syntax_Syntax.mk_Tm_app e args None
                                 e.FStar_Syntax_Syntax.pos in
                             FStar_Syntax_Util.abs binders uu____10365
                               (Some
                                  (FStar_Syntax_Util.residual_comp_of_comp c)))))
let eta_expand:
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term
  =
  fun env  ->
    fun t  ->
      let uu____10376 =
        let uu____10380 = FStar_ST.read t.FStar_Syntax_Syntax.tk in
        (uu____10380, (t.FStar_Syntax_Syntax.n)) in
      match uu____10376 with
      | (Some sort,uu____10387) ->
          let uu____10389 = mk sort t.FStar_Syntax_Syntax.pos in
          eta_expand_with_type env t uu____10389
      | (uu____10390,FStar_Syntax_Syntax.Tm_name x) ->
          eta_expand_with_type env t x.FStar_Syntax_Syntax.sort
      | uu____10394 ->
          let uu____10398 = FStar_Syntax_Util.head_and_args t in
          (match uu____10398 with
           | (head1,args) ->
               let uu____10424 =
                 let uu____10425 = FStar_Syntax_Subst.compress head1 in
                 uu____10425.FStar_Syntax_Syntax.n in
               (match uu____10424 with
                | FStar_Syntax_Syntax.Tm_uvar (uu____10428,thead) ->
                    let uu____10442 = FStar_Syntax_Util.arrow_formals thead in
                    (match uu____10442 with
                     | (formals,tres) ->
                         if
                           (FStar_List.length formals) =
                             (FStar_List.length args)
                         then t
                         else
                           (let uu____10477 =
                              env.FStar_TypeChecker_Env.type_of
                                (let uu___210_10481 = env in
                                 {
                                   FStar_TypeChecker_Env.solver =
                                     (uu___210_10481.FStar_TypeChecker_Env.solver);
                                   FStar_TypeChecker_Env.range =
                                     (uu___210_10481.FStar_TypeChecker_Env.range);
                                   FStar_TypeChecker_Env.curmodule =
                                     (uu___210_10481.FStar_TypeChecker_Env.curmodule);
                                   FStar_TypeChecker_Env.gamma =
                                     (uu___210_10481.FStar_TypeChecker_Env.gamma);
                                   FStar_TypeChecker_Env.gamma_cache =
                                     (uu___210_10481.FStar_TypeChecker_Env.gamma_cache);
                                   FStar_TypeChecker_Env.modules =
                                     (uu___210_10481.FStar_TypeChecker_Env.modules);
                                   FStar_TypeChecker_Env.expected_typ = None;
                                   FStar_TypeChecker_Env.sigtab =
                                     (uu___210_10481.FStar_TypeChecker_Env.sigtab);
                                   FStar_TypeChecker_Env.is_pattern =
                                     (uu___210_10481.FStar_TypeChecker_Env.is_pattern);
                                   FStar_TypeChecker_Env.instantiate_imp =
                                     (uu___210_10481.FStar_TypeChecker_Env.instantiate_imp);
                                   FStar_TypeChecker_Env.effects =
                                     (uu___210_10481.FStar_TypeChecker_Env.effects);
                                   FStar_TypeChecker_Env.generalize =
                                     (uu___210_10481.FStar_TypeChecker_Env.generalize);
                                   FStar_TypeChecker_Env.letrecs =
                                     (uu___210_10481.FStar_TypeChecker_Env.letrecs);
                                   FStar_TypeChecker_Env.top_level =
                                     (uu___210_10481.FStar_TypeChecker_Env.top_level);
                                   FStar_TypeChecker_Env.check_uvars =
                                     (uu___210_10481.FStar_TypeChecker_Env.check_uvars);
                                   FStar_TypeChecker_Env.use_eq =
                                     (uu___210_10481.FStar_TypeChecker_Env.use_eq);
                                   FStar_TypeChecker_Env.is_iface =
                                     (uu___210_10481.FStar_TypeChecker_Env.is_iface);
                                   FStar_TypeChecker_Env.admit =
                                     (uu___210_10481.FStar_TypeChecker_Env.admit);
                                   FStar_TypeChecker_Env.lax = true;
                                   FStar_TypeChecker_Env.lax_universes =
                                     (uu___210_10481.FStar_TypeChecker_Env.lax_universes);
                                   FStar_TypeChecker_Env.type_of =
                                     (uu___210_10481.FStar_TypeChecker_Env.type_of);
                                   FStar_TypeChecker_Env.universe_of =
                                     (uu___210_10481.FStar_TypeChecker_Env.universe_of);
                                   FStar_TypeChecker_Env.use_bv_sorts = true;
                                   FStar_TypeChecker_Env.qname_and_index =
                                     (uu___210_10481.FStar_TypeChecker_Env.qname_and_index);
                                   FStar_TypeChecker_Env.proof_ns =
                                     (uu___210_10481.FStar_TypeChecker_Env.proof_ns);
                                   FStar_TypeChecker_Env.synth =
                                     (uu___210_10481.FStar_TypeChecker_Env.synth);
                                   FStar_TypeChecker_Env.is_native_tactic =
                                     (uu___210_10481.FStar_TypeChecker_Env.is_native_tactic)
                                 }) t in
                            match uu____10477 with
                            | (uu____10482,ty,uu____10484) ->
                                eta_expand_with_type env t ty))
                | uu____10485 ->
                    let uu____10486 =
                      env.FStar_TypeChecker_Env.type_of
                        (let uu___211_10490 = env in
                         {
                           FStar_TypeChecker_Env.solver =
                             (uu___211_10490.FStar_TypeChecker_Env.solver);
                           FStar_TypeChecker_Env.range =
                             (uu___211_10490.FStar_TypeChecker_Env.range);
                           FStar_TypeChecker_Env.curmodule =
                             (uu___211_10490.FStar_TypeChecker_Env.curmodule);
                           FStar_TypeChecker_Env.gamma =
                             (uu___211_10490.FStar_TypeChecker_Env.gamma);
                           FStar_TypeChecker_Env.gamma_cache =
                             (uu___211_10490.FStar_TypeChecker_Env.gamma_cache);
                           FStar_TypeChecker_Env.modules =
                             (uu___211_10490.FStar_TypeChecker_Env.modules);
                           FStar_TypeChecker_Env.expected_typ = None;
                           FStar_TypeChecker_Env.sigtab =
                             (uu___211_10490.FStar_TypeChecker_Env.sigtab);
                           FStar_TypeChecker_Env.is_pattern =
                             (uu___211_10490.FStar_TypeChecker_Env.is_pattern);
                           FStar_TypeChecker_Env.instantiate_imp =
                             (uu___211_10490.FStar_TypeChecker_Env.instantiate_imp);
                           FStar_TypeChecker_Env.effects =
                             (uu___211_10490.FStar_TypeChecker_Env.effects);
                           FStar_TypeChecker_Env.generalize =
                             (uu___211_10490.FStar_TypeChecker_Env.generalize);
                           FStar_TypeChecker_Env.letrecs =
                             (uu___211_10490.FStar_TypeChecker_Env.letrecs);
                           FStar_TypeChecker_Env.top_level =
                             (uu___211_10490.FStar_TypeChecker_Env.top_level);
                           FStar_TypeChecker_Env.check_uvars =
                             (uu___211_10490.FStar_TypeChecker_Env.check_uvars);
                           FStar_TypeChecker_Env.use_eq =
                             (uu___211_10490.FStar_TypeChecker_Env.use_eq);
                           FStar_TypeChecker_Env.is_iface =
                             (uu___211_10490.FStar_TypeChecker_Env.is_iface);
                           FStar_TypeChecker_Env.admit =
                             (uu___211_10490.FStar_TypeChecker_Env.admit);
                           FStar_TypeChecker_Env.lax = true;
                           FStar_TypeChecker_Env.lax_universes =
                             (uu___211_10490.FStar_TypeChecker_Env.lax_universes);
                           FStar_TypeChecker_Env.type_of =
                             (uu___211_10490.FStar_TypeChecker_Env.type_of);
                           FStar_TypeChecker_Env.universe_of =
                             (uu___211_10490.FStar_TypeChecker_Env.universe_of);
                           FStar_TypeChecker_Env.use_bv_sorts = true;
                           FStar_TypeChecker_Env.qname_and_index =
                             (uu___211_10490.FStar_TypeChecker_Env.qname_and_index);
                           FStar_TypeChecker_Env.proof_ns =
                             (uu___211_10490.FStar_TypeChecker_Env.proof_ns);
                           FStar_TypeChecker_Env.synth =
                             (uu___211_10490.FStar_TypeChecker_Env.synth);
                           FStar_TypeChecker_Env.is_native_tactic =
                             (uu___211_10490.FStar_TypeChecker_Env.is_native_tactic)
                         }) t in
                    (match uu____10486 with
                     | (uu____10491,ty,uu____10493) ->
                         eta_expand_with_type env t ty)))