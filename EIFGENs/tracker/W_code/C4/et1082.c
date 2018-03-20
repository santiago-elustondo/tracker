/*
 * Code for class ETF_TYPE_CONSTRAINTS
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern EIF_TYPED_VALUE F1082_9262(EIF_REFERENCE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F1082_9263(EIF_REFERENCE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F1082_9264(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1082_9265(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1082_9266(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1082_9267(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1082_9268(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1082_9269(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1082_9270(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1082_9271(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1082_9272(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void EIF_Minit1082(void);

#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif

/* {ETF_TYPE_CONSTRAINTS}.is_material */
EIF_TYPED_VALUE F1082_9262 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "is_material";
	RTEX;
#define arg1 arg1x.it_i8
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_INTEGER_64 ti8_1;
	EIF_INTEGER_32 ti4_1;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	EIF_BOOLEAN tb3;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_i8 = * (EIF_INTEGER_64 *) arg1x.it_r;
	
	RTLI(3);
	RTLR(0,tr1);
	RTLR(1,ur1);
	RTLR(2,Current);
	RTLIU(3);
	RTLU (SK_BOOL, &Result);
	RTLU(SK_INT64,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1081, Current, 0, 1, 15497);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1081, Current, 15497);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT(NULL, EX_PRE);
		tr1 = RTMS_EX_H("etf_v: MATERIAL = {glass, metal, plastic, liquid}",49,928864381);
		ur1 = tr1;
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(7042, dtype))(Current, ur1x)).it_b);
		RTTE(tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	tb1 = '\01';
	tb2 = '\01';
	tb3 = '\01';
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7034, dtype))(Current)).it_i4);
	ti8_1 = (EIF_INTEGER_64) ti4_1;
	if (!((arg1 == ti8_1))) {
		ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7035, dtype))(Current)).it_i4);
		ti8_1 = (EIF_INTEGER_64) ti4_1;
		tb3 = (arg1 == ti8_1);
	}
	if (!tb3) {
		ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7036, dtype))(Current)).it_i4);
		ti8_1 = (EIF_INTEGER_64) ti4_1;
		tb2 = (arg1 == ti8_1);
	}
	if (!tb2) {
		ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7037, dtype))(Current)).it_i4);
		ti8_1 = (EIF_INTEGER_64) ti4_1;
		tb1 = (arg1 == ti8_1);
	}
	Result = (EIF_BOOLEAN) tb1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(3);
		RTCT(NULL, EX_POST);
		tb1 = '\01';
		tb2 = '\01';
		tb3 = '\01';
		ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7034, dtype))(Current)).it_i4);
		ti8_1 = (EIF_INTEGER_64) ti4_1;
		if (!((arg1 == ti8_1))) {
			ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7035, dtype))(Current)).it_i4);
			ti8_1 = (EIF_INTEGER_64) ti4_1;
			tb3 = (arg1 == ti8_1);
		}
		if (!tb3) {
			ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7036, dtype))(Current)).it_i4);
			ti8_1 = (EIF_INTEGER_64) ti4_1;
			tb2 = (arg1 == ti8_1);
		}
		if (!tb2) {
			ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7037, dtype))(Current)).it_i4);
			ti8_1 = (EIF_INTEGER_64) ti4_1;
			tb1 = (arg1 == ti8_1);
		}
		if ((EIF_BOOLEAN)(Result == tb1)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(4);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef ur1
#undef arg1
}

/* {ETF_TYPE_CONSTRAINTS}.is_container */
EIF_TYPED_VALUE F1082_9263 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "is_container";
	RTEX;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ui8_1x = {{0}, SK_INT64};
#define ui8_1 ui8_1x.it_i8
	EIF_REFERENCE tr1 = NULL;
	EIF_INTEGER_64 ti8_1;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(4);
	RTLR(0,arg1);
	RTLR(1,tr1);
	RTLR(2,ur1);
	RTLR(3,Current);
	RTLIU(4);
	RTLU (SK_BOOL, &Result);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1081, Current, 0, 1, 15498);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1081, Current, 15498);
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,0xFFF9,2,185,199,1181,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		RTCC(arg1, 1081, l_feature_name, 1, typres0, 0x01);
	}
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT(NULL, EX_PRE);
		tr1 = RTMS_EX_H("etf_v: CONTAINER = TUPLE[material: MATERIAL = {glass, metal, plastic, liquid}; radioactivity: VALUE]",100,1053806685);
		ur1 = tr1;
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(7042, dtype))(Current, ur1x)).it_b);
		RTTE(tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	ti8_1 = eif_integer_64_item(RTCW(arg1),1);
	ui8_1 = ti8_1;
	Result = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(7032, dtype))(Current, ui8_1x)).it_b);
	if (RTAL & CK_ENSURE) {
		RTHOOK(3);
		RTCT(NULL, EX_POST);
		ti8_1 = eif_integer_64_item(RTCW(arg1),1);
		ui8_1 = ti8_1;
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(7032, dtype))(Current, ui8_1x)).it_b);
		if ((EIF_BOOLEAN)(Result == tb1)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(4);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef ur1
#undef ui8_1
#undef arg1
}

/* {ETF_TYPE_CONSTRAINTS}.glass */
EIF_TYPED_VALUE F1082_9264 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 1L);
	return r;
}

/* {ETF_TYPE_CONSTRAINTS}.metal */
EIF_TYPED_VALUE F1082_9265 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 2L);
	return r;
}

/* {ETF_TYPE_CONSTRAINTS}.plastic */
EIF_TYPED_VALUE F1082_9266 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 3L);
	return r;
}

/* {ETF_TYPE_CONSTRAINTS}.liquid */
EIF_TYPED_VALUE F1082_9267 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = (EIF_INTEGER_32) ((EIF_INTEGER_32) 4L);
	return r;
}

/* {ETF_TYPE_CONSTRAINTS}.enum_items */
EIF_TYPED_VALUE F1082_9268 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "enum_items";
	RTEX;
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(4);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,Result);
	RTLR(3,ur1);
	RTLIU(4);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1081, Current, 0, 0, 15503);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(1081, Current, 15503);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0xF80003BA, 0,0); /* Result */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,954,217,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3011, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	tr1 = RTMS_EX_H("glass",5,1819116915);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ui4_1x, ur1x);
	RTHOOK(3);
	ui4_1 = ((EIF_INTEGER_32) 2L);
	tr1 = RTMS_EX_H("metal",5,1702963052);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ui4_1x, ur1x);
	RTHOOK(4);
	ui4_1 = ((EIF_INTEGER_32) 3L);
	tr1 = RTMS_EX_H("plastic",7,539581539);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ui4_1x, ur1x);
	RTHOOK(5);
	ui4_1 = ((EIF_INTEGER_32) 4L);
	tr1 = RTMS_EX_H("liquid",6,2116663140);
	ur1 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ui4_1x, ur1x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(6);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef ur1
#undef ui4_1
}

/* {ETF_TYPE_CONSTRAINTS}.enum_items_inverse */
EIF_TYPED_VALUE F1082_9269 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "enum_items_inverse";
	RTEX;
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ui8_1x = {{0}, SK_INT64};
#define ui8_1 ui8_1x.it_i8
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(4);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,Result);
	RTLR(3,ur1);
	RTLIU(4);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1081, Current, 0, 0, 15493);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(1081, Current, 15493);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0xF800064F, 0,0); /* Result */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,1615,0xFF01,231,199,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(Dftype(Current), typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3011, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	tr1 = RTMS_EX_H("glass",5,1819116915);
	ur1 = tr1;
	ui8_1 = (EIF_INTEGER_64) ((EIF_INTEGER_32) 1L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ui8_1x);
	RTHOOK(3);
	tr1 = RTMS_EX_H("metal",5,1702963052);
	ur1 = tr1;
	ui8_1 = (EIF_INTEGER_64) ((EIF_INTEGER_32) 2L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ui8_1x);
	RTHOOK(4);
	tr1 = RTMS_EX_H("plastic",7,539581539);
	ur1 = tr1;
	ui8_1 = (EIF_INTEGER_64) ((EIF_INTEGER_32) 3L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ui8_1x);
	RTHOOK(5);
	tr1 = RTMS_EX_H("liquid",6,2116663140);
	ur1 = tr1;
	ui8_1 = (EIF_INTEGER_64) ((EIF_INTEGER_32) 4L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ui8_1x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(6);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef ur1
#undef ui8_1
#undef ui4_1
}

/* {ETF_TYPE_CONSTRAINTS}.evt_param_types_table */
EIF_TYPED_VALUE F1082_9270 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "evt_param_types_table";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc2 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc3 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc4 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc5 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc6 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc7 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc8 = (EIF_REFERENCE) 0;
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_TYPED_VALUE ur3x = {{0}, SK_REF};
#define ur3 ur3x.it_r
	EIF_TYPED_VALUE ur4x = {{0}, SK_REF};
#define ur4 ur4x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_REFERENCE tr4 = NULL;
	EIF_REFERENCE tr5 = NULL;
	EIF_REFERENCE tr6 = NULL;
	EIF_REFERENCE tr7 = NULL;
	EIF_REFERENCE tr8 = NULL;
	EIF_REFERENCE tr9 = NULL;
	EIF_REFERENCE tr10 = NULL;
	EIF_REFERENCE tr11 = NULL;
	EIF_REFERENCE tr12 = NULL;
	EIF_REFERENCE tr13 = NULL;
	EIF_REFERENCE tr14 = NULL;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTCFDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(28);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,Result);
	RTLR(3,loc1);
	RTLR(4,ur1);
	RTLR(5,tr2);
	RTLR(6,ur2);
	RTLR(7,loc2);
	RTLR(8,tr3);
	RTLR(9,tr4);
	RTLR(10,tr5);
	RTLR(11,tr6);
	RTLR(12,tr7);
	RTLR(13,loc3);
	RTLR(14,loc4);
	RTLR(15,tr8);
	RTLR(16,tr9);
	RTLR(17,tr10);
	RTLR(18,ur3);
	RTLR(19,tr11);
	RTLR(20,tr12);
	RTLR(21,tr13);
	RTLR(22,tr14);
	RTLR(23,ur4);
	RTLR(24,loc5);
	RTLR(25,loc6);
	RTLR(26,loc7);
	RTLR(27,loc8);
	RTLIU(28);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	RTLU(SK_REF, &loc2);
	RTLU(SK_REF, &loc3);
	RTLU(SK_REF, &loc4);
	RTLU(SK_REF, &loc5);
	RTLU(SK_REF, &loc6);
	RTLU(SK_REF, &loc7);
	RTLU(SK_REF, &loc8);
	
	RTEAA(l_feature_name, 1081, Current, 8, 0, 15494);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(1081, Current, 15494);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0xF8000167, 0,0); /* Result */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,359,0xFF01,359,0xFF01,1067,0xFF01,231,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3011, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", Result))(Result);
	RTHOOK(3);
	RTDBGAL(Current, 1, 0xF8000167, 0, 0); /* loc1 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,359,0xFF01,1067,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3011, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(3,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(4);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc1))(loc1);
	RTHOOK(5);
	tr1 = RTLN(eif_new_type(1079, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
	RTNHOOK(5,1);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("max_phase_radiation",19,1378918510);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", loc1))(loc1, ur1x, ur2x);
	RTHOOK(6);
	tr1 = RTLN(eif_new_type(1079, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
	RTNHOOK(6,1);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("max_container_radiation",23,1393213294);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", loc1))(loc1, ur1x, ur2x);
	RTHOOK(7);
	ur1 = RTCCL(loc1);
	tr1 = RTMS_EX_H("new_tracker",11,1845082738);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(8);
	RTDBGAL(Current, 2, 0xF8000167, 0, 0); /* loc2 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,359,0xFF01,1067,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3011, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(8,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(9);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc2))(loc2);
	RTHOOK(10);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("PID",3,5261636);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(10,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(10,2);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("pid",3,7367012);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", loc2))(loc2, ur1x, ur2x);
	RTHOOK(11);
	tr1 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
	RTNHOOK(11,1);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("phase_name",10,593985893);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", loc2))(loc2, ur1x, ur2x);
	RTHOOK(12);
	tr1 = RTLN(eif_new_type(1074, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
	RTNHOOK(12,1);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("capacity",8,1341273977);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", loc2))(loc2, ur1x, ur2x);
	RTHOOK(13);
	tr1 = RTLN(eif_new_type(1069, 0x01).id);
	tr2 = RTLN(eif_new_type(1075, 0x01).id);
	tr3 = RTMS_EX_H("MATERIAL",8,2067328076);
	ur1 = tr3;
	tr4 = RTLN(eif_new_type(1076, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 4L);
	{
		static EIF_TYPE_INDEX typarr0[] = {250,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr6 = RTLNSP2(typres0.id,EO_REF,ui4_1,sizeof(EIF_REFERENCE), EIF_FALSE);
		RT_SPECIAL_COUNT(tr6) = 4L;
		memset(tr6, 0, RT_SPECIAL_VISIBLE_SIZE(tr6));
	}
	tr7 = RTMS_EX_H("glass",5,1819116915);
	*((EIF_REFERENCE *)tr6+0) = (EIF_REFERENCE) tr7;
	RTAR(tr6,tr7);
	tr7 = RTMS_EX_H("metal",5,1702963052);
	*((EIF_REFERENCE *)tr6+1) = (EIF_REFERENCE) tr7;
	RTAR(tr6,tr7);
	tr7 = RTMS_EX_H("plastic",7,539581539);
	*((EIF_REFERENCE *)tr6+2) = (EIF_REFERENCE) tr7;
	RTAR(tr6,tr7);
	tr7 = RTMS_EX_H("liquid",6,2116663140);
	*((EIF_REFERENCE *)tr6+3) = (EIF_REFERENCE) tr7;
	RTAR(tr6,tr7);
	tr5 = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE))  RTWF(2610, Dtype(tr6)))(tr6).it_r;
	ur2 = tr5;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(7028, Dtype(tr4)))(tr4, ur2x);
	RTNHOOK(13,1);
	ur2 = RTCCL(tr4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr2)))(tr2, ur1x, ur2x);
	RTNHOOK(13,2);
	ur1 = RTCCL(tr2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(7020, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(13,3);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("expected_materials",18,1997513075);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", loc2))(loc2, ur1x, ur2x);
	RTHOOK(14);
	ur1 = RTCCL(loc2);
	tr1 = RTMS_EX_H("new_phase",9,1772976229);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(15);
	RTDBGAL(Current, 3, 0xF8000167, 0, 0); /* loc3 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,359,0xFF01,1067,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3011, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(15,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(16);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc3))(loc3);
	RTHOOK(17);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("PID",3,5261636);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(17,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(17,2);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("pid",3,7367012);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", loc3))(loc3, ur1x, ur2x);
	RTHOOK(18);
	ur1 = RTCCL(loc3);
	tr1 = RTMS_EX_H("remove_phase",12,648792933);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(19);
	RTDBGAL(Current, 4, 0xF8000167, 0, 0); /* loc4 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,359,0xFF01,1067,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3011, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(19,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(20);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc4))(loc4);
	RTHOOK(21);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("CID",3,4409668);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(21,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(21,2);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("cid",3,6515044);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", loc4))(loc4, ur1x, ur2x);
	RTHOOK(22);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("CONTAINER",9,1674627922);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1078, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 2L);
	{
		static EIF_TYPE_INDEX typarr0[] = {250,0xFF01,974,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr5 = RTLNSP2(typres0.id,EO_REF,ui4_1,sizeof(EIF_REFERENCE), EIF_FALSE);
		RT_SPECIAL_COUNT(tr5) = 2L;
		memset(tr5, 0, RT_SPECIAL_VISIBLE_SIZE(tr5));
	}
	tr7 = RTLN(eif_new_type(974, 0x01).id);
	tr8 = RTMS_EX_H("material",8,1603126380);
	ur2 = tr8;
	tr9 = RTLN(eif_new_type(1075, 0x01).id);
	tr10 = RTMS_EX_H("MATERIAL",8,2067328076);
	ur3 = tr10;
	tr11 = RTLN(eif_new_type(1076, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 4L);
	{
		static EIF_TYPE_INDEX typarr0[] = {250,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr13 = RTLNSP2(typres0.id,EO_REF,ui4_1,sizeof(EIF_REFERENCE), EIF_FALSE);
		RT_SPECIAL_COUNT(tr13) = 4L;
		memset(tr13, 0, RT_SPECIAL_VISIBLE_SIZE(tr13));
	}
	tr14 = RTMS_EX_H("glass",5,1819116915);
	*((EIF_REFERENCE *)tr13+0) = (EIF_REFERENCE) tr14;
	RTAR(tr13,tr14);
	tr14 = RTMS_EX_H("metal",5,1702963052);
	*((EIF_REFERENCE *)tr13+1) = (EIF_REFERENCE) tr14;
	RTAR(tr13,tr14);
	tr14 = RTMS_EX_H("plastic",7,539581539);
	*((EIF_REFERENCE *)tr13+2) = (EIF_REFERENCE) tr14;
	RTAR(tr13,tr14);
	tr14 = RTMS_EX_H("liquid",6,2116663140);
	*((EIF_REFERENCE *)tr13+3) = (EIF_REFERENCE) tr14;
	RTAR(tr13,tr14);
	tr12 = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE))  RTWF(2610, Dtype(tr13)))(tr13).it_r;
	ur4 = tr12;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(7028, Dtype(tr11)))(tr11, ur4x);
	RTNHOOK(22,1);
	ur4 = RTCCL(tr11);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr9)))(tr9, ur3x, ur4x);
	RTNHOOK(22,2);
	ur3 = RTCCL(tr9);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(6164, Dtype(tr7)))(tr7, ur2x, ur3x);
	RTNHOOK(22,3);
	tr6 = RTCCL(tr7);
	*((EIF_REFERENCE *)tr5+0) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr7 = RTLN(eif_new_type(974, 0x01).id);
	tr8 = RTMS_EX_H("radioactivity",13,1593584249);
	ur2 = tr8;
	tr9 = RTLN(eif_new_type(1079, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr9)))(tr9);
	RTNHOOK(22,4);
	ur3 = RTCCL(tr9);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(6164, Dtype(tr7)))(tr7, ur2x, ur3x);
	RTNHOOK(22,5);
	tr6 = RTCCL(tr7);
	*((EIF_REFERENCE *)tr5+1) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr4 = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE))  RTWF(2610, Dtype(tr5)))(tr5).it_r;
	ur2 = RTCCL(tr4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(7030, Dtype(tr3)))(tr3, ur2x);
	RTNHOOK(22,6);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(22,7);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("c",1,99);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", loc4))(loc4, ur1x, ur2x);
	RTHOOK(23);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("PID",3,5261636);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(23,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(23,2);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("pid",3,7367012);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", loc4))(loc4, ur1x, ur2x);
	RTHOOK(24);
	ur1 = RTCCL(loc4);
	tr1 = RTMS_EX_H("new_container",13,394270578);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(25);
	RTDBGAL(Current, 5, 0xF8000167, 0, 0); /* loc5 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,359,0xFF01,1067,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3011, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(25,1);
	loc5 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(26);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc5))(loc5);
	RTHOOK(27);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("CID",3,4409668);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(27,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(27,2);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("cid",3,6515044);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", loc5))(loc5, ur1x, ur2x);
	RTHOOK(28);
	ur1 = RTCCL(loc5);
	tr1 = RTMS_EX_H("remove_container",16,1682865266);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(29);
	RTDBGAL(Current, 6, 0xF8000167, 0, 0); /* loc6 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,359,0xFF01,1067,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3011, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(29,1);
	loc6 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(30);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc6))(loc6);
	RTHOOK(31);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("CID",3,4409668);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(31,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(31,2);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("cid",3,6515044);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", loc6))(loc6, ur1x, ur2x);
	RTHOOK(32);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("PID",3,5261636);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(32,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(32,2);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("pid1",4,1885955121);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", loc6))(loc6, ur1x, ur2x);
	RTHOOK(33);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("PID",3,5261636);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(33,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(33,2);
	ur1 = RTCCL(tr1);
	tr2 = RTMS_EX_H("pid2",4,1885955122);
	ur2 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", loc6))(loc6, ur1x, ur2x);
	RTHOOK(34);
	ur1 = RTCCL(loc6);
	tr1 = RTMS_EX_H("move_container",14,1280195698);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(35);
	RTDBGAL(Current, 7, 0xF8000167, 0, 0); /* loc7 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,359,0xFF01,1067,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3011, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(35,1);
	loc7 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(36);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc7))(loc7);
	RTHOOK(37);
	ur1 = RTCCL(loc7);
	tr1 = RTMS_EX_H("undo",4,1970168943);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(38);
	RTDBGAL(Current, 8, 0xF8000167, 0, 0); /* loc8 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,359,0xFF01,1067,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3011, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(38,1);
	loc8 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(39);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc8))(loc8);
	RTHOOK(40);
	ur1 = RTCCL(loc8);
	tr1 = RTMS_EX_H("redo",4,1919247471);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(41);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(10);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef ur1
#undef ur2
#undef ur3
#undef ur4
#undef ui4_1
}

/* {ETF_TYPE_CONSTRAINTS}.evt_param_types_list */
EIF_TYPED_VALUE F1082_9271 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "evt_param_types_list";
	RTEX;
	EIF_REFERENCE loc1 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc2 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc3 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc4 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc5 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc6 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc7 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc8 = (EIF_REFERENCE) 0;
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_TYPED_VALUE ur3x = {{0}, SK_REF};
#define ur3 ur3x.it_r
	EIF_TYPED_VALUE ur4x = {{0}, SK_REF};
#define ur4 ur4x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_REFERENCE tr4 = NULL;
	EIF_REFERENCE tr5 = NULL;
	EIF_REFERENCE tr6 = NULL;
	EIF_REFERENCE tr7 = NULL;
	EIF_REFERENCE tr8 = NULL;
	EIF_REFERENCE tr9 = NULL;
	EIF_REFERENCE tr10 = NULL;
	EIF_REFERENCE tr11 = NULL;
	EIF_REFERENCE tr12 = NULL;
	EIF_REFERENCE tr13 = NULL;
	EIF_REFERENCE tr14 = NULL;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTCFDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(28);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,Result);
	RTLR(3,loc1);
	RTLR(4,ur1);
	RTLR(5,ur2);
	RTLR(6,loc2);
	RTLR(7,tr2);
	RTLR(8,tr3);
	RTLR(9,tr4);
	RTLR(10,tr5);
	RTLR(11,tr6);
	RTLR(12,tr7);
	RTLR(13,loc3);
	RTLR(14,loc4);
	RTLR(15,tr8);
	RTLR(16,tr9);
	RTLR(17,tr10);
	RTLR(18,ur3);
	RTLR(19,tr11);
	RTLR(20,tr12);
	RTLR(21,tr13);
	RTLR(22,tr14);
	RTLR(23,ur4);
	RTLR(24,loc5);
	RTLR(25,loc6);
	RTLR(26,loc7);
	RTLR(27,loc8);
	RTLIU(28);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	RTLU(SK_REF, &loc1);
	RTLU(SK_REF, &loc2);
	RTLU(SK_REF, &loc3);
	RTLU(SK_REF, &loc4);
	RTLU(SK_REF, &loc5);
	RTLU(SK_REF, &loc6);
	RTLU(SK_REF, &loc7);
	RTLU(SK_REF, &loc8);
	
	RTEAA(l_feature_name, 1081, Current, 8, 0, 15495);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(1081, Current, 15495);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0xF8000167, 0,0); /* Result */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,359,0xFF01,465,0xFF01,1067,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	ui4_1 = ((EIF_INTEGER_32) 10L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(3011, Dtype(tr1)))(tr1, ui4_1x);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", Result))(Result);
	RTHOOK(3);
	RTDBGAL(Current, 1, 0xF80001D1, 0, 0); /* loc1 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,465,0xFF01,1067,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2753, Dtype(tr1)))(tr1);
	RTNHOOK(3,1);
	loc1 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(4);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc1))(loc1);
	RTHOOK(5);
	tr1 = RTLN(eif_new_type(1079, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
	RTNHOOK(5,1);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1711, "extend", loc1))(loc1, ur1x);
	RTHOOK(6);
	tr1 = RTLN(eif_new_type(1079, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
	RTNHOOK(6,1);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1711, "extend", loc1))(loc1, ur1x);
	RTHOOK(7);
	ur1 = RTCCL(loc1);
	tr1 = RTMS_EX_H("new_tracker",11,1845082738);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(8);
	RTDBGAL(Current, 2, 0xF80001D1, 0, 0); /* loc2 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,465,0xFF01,1067,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2753, Dtype(tr1)))(tr1);
	RTNHOOK(8,1);
	loc2 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(9);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc2))(loc2);
	RTHOOK(10);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("PID",3,5261636);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(10,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(10,2);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1711, "extend", loc2))(loc2, ur1x);
	RTHOOK(11);
	tr1 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
	RTNHOOK(11,1);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1711, "extend", loc2))(loc2, ur1x);
	RTHOOK(12);
	tr1 = RTLN(eif_new_type(1074, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
	RTNHOOK(12,1);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1711, "extend", loc2))(loc2, ur1x);
	RTHOOK(13);
	tr1 = RTLN(eif_new_type(1069, 0x01).id);
	tr2 = RTLN(eif_new_type(1075, 0x01).id);
	tr3 = RTMS_EX_H("MATERIAL",8,2067328076);
	ur1 = tr3;
	tr4 = RTLN(eif_new_type(1076, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 4L);
	{
		static EIF_TYPE_INDEX typarr0[] = {250,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr6 = RTLNSP2(typres0.id,EO_REF,ui4_1,sizeof(EIF_REFERENCE), EIF_FALSE);
		RT_SPECIAL_COUNT(tr6) = 4L;
		memset(tr6, 0, RT_SPECIAL_VISIBLE_SIZE(tr6));
	}
	tr7 = RTMS_EX_H("glass",5,1819116915);
	*((EIF_REFERENCE *)tr6+0) = (EIF_REFERENCE) tr7;
	RTAR(tr6,tr7);
	tr7 = RTMS_EX_H("metal",5,1702963052);
	*((EIF_REFERENCE *)tr6+1) = (EIF_REFERENCE) tr7;
	RTAR(tr6,tr7);
	tr7 = RTMS_EX_H("plastic",7,539581539);
	*((EIF_REFERENCE *)tr6+2) = (EIF_REFERENCE) tr7;
	RTAR(tr6,tr7);
	tr7 = RTMS_EX_H("liquid",6,2116663140);
	*((EIF_REFERENCE *)tr6+3) = (EIF_REFERENCE) tr7;
	RTAR(tr6,tr7);
	tr5 = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE))  RTWF(2610, Dtype(tr6)))(tr6).it_r;
	ur2 = tr5;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(7028, Dtype(tr4)))(tr4, ur2x);
	RTNHOOK(13,1);
	ur2 = RTCCL(tr4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr2)))(tr2, ur1x, ur2x);
	RTNHOOK(13,2);
	ur1 = RTCCL(tr2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(7020, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(13,3);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1711, "extend", loc2))(loc2, ur1x);
	RTHOOK(14);
	ur1 = RTCCL(loc2);
	tr1 = RTMS_EX_H("new_phase",9,1772976229);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(15);
	RTDBGAL(Current, 3, 0xF80001D1, 0, 0); /* loc3 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,465,0xFF01,1067,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2753, Dtype(tr1)))(tr1);
	RTNHOOK(15,1);
	loc3 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(16);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc3))(loc3);
	RTHOOK(17);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("PID",3,5261636);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(17,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(17,2);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1711, "extend", loc3))(loc3, ur1x);
	RTHOOK(18);
	ur1 = RTCCL(loc3);
	tr1 = RTMS_EX_H("remove_phase",12,648792933);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(19);
	RTDBGAL(Current, 4, 0xF80001D1, 0, 0); /* loc4 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,465,0xFF01,1067,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2753, Dtype(tr1)))(tr1);
	RTNHOOK(19,1);
	loc4 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(20);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc4))(loc4);
	RTHOOK(21);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("CID",3,4409668);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(21,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(21,2);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1711, "extend", loc4))(loc4, ur1x);
	RTHOOK(22);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("CONTAINER",9,1674627922);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1078, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 2L);
	{
		static EIF_TYPE_INDEX typarr0[] = {250,0xFF01,974,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr5 = RTLNSP2(typres0.id,EO_REF,ui4_1,sizeof(EIF_REFERENCE), EIF_FALSE);
		RT_SPECIAL_COUNT(tr5) = 2L;
		memset(tr5, 0, RT_SPECIAL_VISIBLE_SIZE(tr5));
	}
	tr7 = RTLN(eif_new_type(974, 0x01).id);
	tr8 = RTMS_EX_H("material",8,1603126380);
	ur2 = tr8;
	tr9 = RTLN(eif_new_type(1075, 0x01).id);
	tr10 = RTMS_EX_H("MATERIAL",8,2067328076);
	ur3 = tr10;
	tr11 = RTLN(eif_new_type(1076, 0x01).id);
	ui4_1 = ((EIF_INTEGER_32) 4L);
	{
		static EIF_TYPE_INDEX typarr0[] = {250,0xFF01,231,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr13 = RTLNSP2(typres0.id,EO_REF,ui4_1,sizeof(EIF_REFERENCE), EIF_FALSE);
		RT_SPECIAL_COUNT(tr13) = 4L;
		memset(tr13, 0, RT_SPECIAL_VISIBLE_SIZE(tr13));
	}
	tr14 = RTMS_EX_H("glass",5,1819116915);
	*((EIF_REFERENCE *)tr13+0) = (EIF_REFERENCE) tr14;
	RTAR(tr13,tr14);
	tr14 = RTMS_EX_H("metal",5,1702963052);
	*((EIF_REFERENCE *)tr13+1) = (EIF_REFERENCE) tr14;
	RTAR(tr13,tr14);
	tr14 = RTMS_EX_H("plastic",7,539581539);
	*((EIF_REFERENCE *)tr13+2) = (EIF_REFERENCE) tr14;
	RTAR(tr13,tr14);
	tr14 = RTMS_EX_H("liquid",6,2116663140);
	*((EIF_REFERENCE *)tr13+3) = (EIF_REFERENCE) tr14;
	RTAR(tr13,tr14);
	tr12 = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE))  RTWF(2610, Dtype(tr13)))(tr13).it_r;
	ur4 = tr12;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(7028, Dtype(tr11)))(tr11, ur4x);
	RTNHOOK(22,1);
	ur4 = RTCCL(tr11);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr9)))(tr9, ur3x, ur4x);
	RTNHOOK(22,2);
	ur3 = RTCCL(tr9);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(6164, Dtype(tr7)))(tr7, ur2x, ur3x);
	RTNHOOK(22,3);
	tr6 = RTCCL(tr7);
	*((EIF_REFERENCE *)tr5+0) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr7 = RTLN(eif_new_type(974, 0x01).id);
	tr8 = RTMS_EX_H("radioactivity",13,1593584249);
	ur2 = tr8;
	tr9 = RTLN(eif_new_type(1079, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr9)))(tr9);
	RTNHOOK(22,4);
	ur3 = RTCCL(tr9);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(6164, Dtype(tr7)))(tr7, ur2x, ur3x);
	RTNHOOK(22,5);
	tr6 = RTCCL(tr7);
	*((EIF_REFERENCE *)tr5+1) = (EIF_REFERENCE) tr6;
	RTAR(tr5,tr6);
	tr4 = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE))  RTWF(2610, Dtype(tr5)))(tr5).it_r;
	ur2 = RTCCL(tr4);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(7030, Dtype(tr3)))(tr3, ur2x);
	RTNHOOK(22,6);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(22,7);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1711, "extend", loc4))(loc4, ur1x);
	RTHOOK(23);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("PID",3,5261636);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(23,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(23,2);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1711, "extend", loc4))(loc4, ur1x);
	RTHOOK(24);
	ur1 = RTCCL(loc4);
	tr1 = RTMS_EX_H("new_container",13,394270578);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(25);
	RTDBGAL(Current, 5, 0xF80001D1, 0, 0); /* loc5 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,465,0xFF01,1067,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2753, Dtype(tr1)))(tr1);
	RTNHOOK(25,1);
	loc5 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(26);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc5))(loc5);
	RTHOOK(27);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("CID",3,4409668);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(27,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(27,2);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1711, "extend", loc5))(loc5, ur1x);
	RTHOOK(28);
	ur1 = RTCCL(loc5);
	tr1 = RTMS_EX_H("remove_container",16,1682865266);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(29);
	RTDBGAL(Current, 6, 0xF80001D1, 0, 0); /* loc6 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,465,0xFF01,1067,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2753, Dtype(tr1)))(tr1);
	RTNHOOK(29,1);
	loc6 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(30);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc6))(loc6);
	RTHOOK(31);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("CID",3,4409668);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(31,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(31,2);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1711, "extend", loc6))(loc6, ur1x);
	RTHOOK(32);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("PID",3,5261636);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(32,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(32,2);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1711, "extend", loc6))(loc6, ur1x);
	RTHOOK(33);
	tr1 = RTLN(eif_new_type(1075, 0x01).id);
	tr2 = RTMS_EX_H("PID",3,5261636);
	ur1 = tr2;
	tr3 = RTLN(eif_new_type(1080, 0x01).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr3)))(tr3);
	RTNHOOK(33,1);
	ur2 = RTCCL(tr3);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWC(7025, Dtype(tr1)))(tr1, ur1x, ur2x);
	RTNHOOK(33,2);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(1711, "extend", loc6))(loc6, ur1x);
	RTHOOK(34);
	ur1 = RTCCL(loc6);
	tr1 = RTMS_EX_H("move_container",14,1280195698);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(35);
	RTDBGAL(Current, 7, 0xF80001D1, 0, 0); /* loc7 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,465,0xFF01,1067,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2753, Dtype(tr1)))(tr1);
	RTNHOOK(35,1);
	loc7 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(36);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc7))(loc7);
	RTHOOK(37);
	ur1 = RTCCL(loc7);
	tr1 = RTMS_EX_H("undo",4,1970168943);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTHOOK(38);
	RTDBGAL(Current, 8, 0xF80001D1, 0, 0); /* loc8 */
	{
		static EIF_TYPE_INDEX typarr0[] = {0xFF01,465,0xFF01,1067,0xFFFF};
		EIF_TYPE typres0;
		static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
		
		typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
		tr1 = RTLN(typres0.id);
	}
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2753, Dtype(tr1)))(tr1);
	RTNHOOK(38,1);
	loc8 = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(39);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(1703, "compare_objects", loc8))(loc8);
	RTHOOK(40);
	ur1 = RTCCL(loc8);
	tr1 = RTMS_EX_H("redo",4,1919247471);
	ur2 = tr1;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(3041, "extend", Result))(Result, ur1x, ur2x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(41);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(10);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef ur1
#undef ur2
#undef ur3
#undef ur4
#undef ui4_1
}

/* {ETF_TYPE_CONSTRAINTS}.comment */
EIF_TYPED_VALUE F1082_9272 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "comment";
	RTEX;
#define arg1 arg1x.it_r
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(2);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLIU(2);
	RTLU (SK_BOOL, &Result);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1081, Current, 0, 1, 15496);
	RTSA(Dtype(Current));
	RTSC;
	RTME(Dtype(Current), 0);
	RTGC;
	RTDBGEAA(1081, Current, 15496);
	RTCC(arg1, 1081, l_feature_name, 1, eif_new_type(231, 0x01), 0x01);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(Current, 0, 0x04000000, 1,0); /* Result */
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef arg1
}

void EIF_Minit1082 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
