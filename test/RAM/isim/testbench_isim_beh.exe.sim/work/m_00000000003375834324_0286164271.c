/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/FPGA101/test/RAM/main.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {7, 0};
static int ng3[] = {4, 0};
static unsigned int ng4[] = {15U, 0U};
static int ng5[] = {3, 0};
static int ng6[] = {0, 0};
static unsigned int ng7[] = {1U, 0U};
static unsigned int ng8[] = {2U, 0U};
static unsigned int ng9[] = {170U, 0U};



static void Always_37_0(char *t0)
{
    char t6[8];
    char t7[8];
    char t8[8];
    char t48[8];
    char t49[8];
    char t65[8];
    char t66[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    int t16;
    char *t17;
    unsigned int t18;
    int t19;
    int t20;
    char *t21;
    unsigned int t22;
    int t23;
    int t24;
    unsigned int t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    int t29;
    int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    char *t50;
    char *t51;
    char *t52;
    char *t53;
    unsigned int t54;
    char *t55;
    unsigned int t56;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    char *t62;
    char *t63;
    char *t64;
    char *t67;
    char *t68;
    char *t69;
    char *t70;
    char *t71;
    char *t72;
    unsigned int t73;
    char *t74;
    unsigned int t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;

LAB0:    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 3168);
    *((int *)t2) = 1;
    t3 = (t0 + 2880);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(37, ng0);

LAB5:    xsi_set_current_line(38, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1768);
    t9 = (t0 + 1768);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng2)));
    t13 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t6, t7, t8, ((int*)(t11)), 2, t12, 32, 1, t13, 32, 1);
    t14 = (t6 + 4);
    t15 = *((unsigned int *)t14);
    t16 = (!(t15));
    t17 = (t7 + 4);
    t18 = *((unsigned int *)t17);
    t19 = (!(t18));
    t20 = (t16 && t19);
    t21 = (t8 + 4);
    t22 = *((unsigned int *)t21);
    t23 = (!(t22));
    t24 = (t20 && t23);
    if (t24 == 1)
        goto LAB6;

LAB7:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t15 = *((unsigned int *)t3);
    t18 = (t15 >> 6);
    *((unsigned int *)t6) = t18;
    t22 = *((unsigned int *)t4);
    t25 = (t22 >> 6);
    *((unsigned int *)t2) = t25;
    t27 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t27 & 3U);
    t28 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t28 & 3U);
    t5 = ((char*)((ng1)));
    memset(t7, 0, 8);
    t9 = (t6 + 4);
    t10 = (t5 + 4);
    t31 = *((unsigned int *)t6);
    t32 = *((unsigned int *)t5);
    t33 = (t31 ^ t32);
    t34 = *((unsigned int *)t9);
    t35 = *((unsigned int *)t10);
    t36 = (t34 ^ t35);
    t37 = (t33 | t36);
    t38 = *((unsigned int *)t9);
    t39 = *((unsigned int *)t10);
    t40 = (t38 | t39);
    t41 = (~(t40));
    t42 = (t37 & t41);
    if (t42 != 0)
        goto LAB11;

LAB8:    if (t40 != 0)
        goto LAB10;

LAB9:    *((unsigned int *)t7) = 1;

LAB11:    t12 = (t7 + 4);
    t43 = *((unsigned int *)t12);
    t44 = (~(t43));
    t45 = *((unsigned int *)t7);
    t46 = (t45 & t44);
    t47 = (t46 != 0);
    if (t47 > 0)
        goto LAB12;

LAB13:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t15 = *((unsigned int *)t3);
    t18 = (t15 >> 6);
    *((unsigned int *)t6) = t18;
    t22 = *((unsigned int *)t4);
    t25 = (t22 >> 6);
    *((unsigned int *)t2) = t25;
    t27 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t27 & 3U);
    t28 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t28 & 3U);
    t5 = ((char*)((ng7)));
    memset(t7, 0, 8);
    t9 = (t6 + 4);
    t10 = (t5 + 4);
    t31 = *((unsigned int *)t6);
    t32 = *((unsigned int *)t5);
    t33 = (t31 ^ t32);
    t34 = *((unsigned int *)t9);
    t35 = *((unsigned int *)t10);
    t36 = (t34 ^ t35);
    t37 = (t33 | t36);
    t38 = *((unsigned int *)t9);
    t39 = *((unsigned int *)t10);
    t40 = (t38 | t39);
    t41 = (~(t40));
    t42 = (t37 & t41);
    if (t42 != 0)
        goto LAB21;

LAB18:    if (t40 != 0)
        goto LAB20;

LAB19:    *((unsigned int *)t7) = 1;

LAB21:    t12 = (t7 + 4);
    t43 = *((unsigned int *)t12);
    t44 = (~(t43));
    t45 = *((unsigned int *)t7);
    t46 = (t45 & t44);
    t47 = (t46 != 0);
    if (t47 > 0)
        goto LAB22;

LAB23:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t15 = *((unsigned int *)t3);
    t18 = (t15 >> 6);
    *((unsigned int *)t6) = t18;
    t22 = *((unsigned int *)t4);
    t25 = (t22 >> 6);
    *((unsigned int *)t2) = t25;
    t27 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t27 & 3U);
    t28 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t28 & 3U);
    t5 = ((char*)((ng8)));
    memset(t7, 0, 8);
    t9 = (t6 + 4);
    t10 = (t5 + 4);
    t31 = *((unsigned int *)t6);
    t32 = *((unsigned int *)t5);
    t33 = (t31 ^ t32);
    t34 = *((unsigned int *)t9);
    t35 = *((unsigned int *)t10);
    t36 = (t34 ^ t35);
    t37 = (t33 | t36);
    t38 = *((unsigned int *)t9);
    t39 = *((unsigned int *)t10);
    t40 = (t38 | t39);
    t41 = (~(t40));
    t42 = (t37 & t41);
    if (t42 != 0)
        goto LAB31;

LAB28:    if (t40 != 0)
        goto LAB30;

LAB29:    *((unsigned int *)t7) = 1;

LAB31:    t12 = (t7 + 4);
    t43 = *((unsigned int *)t12);
    t44 = (~(t43));
    t45 = *((unsigned int *)t7);
    t46 = (t45 & t44);
    t47 = (t46 != 0);
    if (t47 > 0)
        goto LAB32;

LAB33:    xsi_set_current_line(51, ng0);

LAB40:    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 8);

LAB34:
LAB24:
LAB14:    goto LAB2;

LAB6:    t25 = *((unsigned int *)t8);
    t26 = (t25 + 0);
    t27 = *((unsigned int *)t6);
    t28 = *((unsigned int *)t7);
    t29 = (t27 - t28);
    t30 = (t29 + 1);
    xsi_vlogvar_assign_value(t5, t4, t26, *((unsigned int *)t7), t30);
    goto LAB7;

LAB10:    t11 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB11;

LAB12:    xsi_set_current_line(39, ng0);

LAB15:    xsi_set_current_line(40, ng0);
    t13 = ((char*)((ng4)));
    t14 = (t0 + 1768);
    t17 = (t0 + 1768);
    t21 = (t17 + 72U);
    t50 = *((char **)t21);
    t51 = ((char*)((ng5)));
    t52 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t8, t48, t49, ((int*)(t50)), 2, t51, 32, 1, t52, 32, 1);
    t53 = (t8 + 4);
    t54 = *((unsigned int *)t53);
    t16 = (!(t54));
    t55 = (t48 + 4);
    t56 = *((unsigned int *)t55);
    t19 = (!(t56));
    t20 = (t16 && t19);
    t57 = (t49 + 4);
    t58 = *((unsigned int *)t57);
    t23 = (!(t58));
    t24 = (t20 && t23);
    if (t24 == 1)
        goto LAB16;

LAB17:    goto LAB14;

LAB16:    t59 = *((unsigned int *)t49);
    t26 = (t59 + 0);
    t60 = *((unsigned int *)t8);
    t61 = *((unsigned int *)t48);
    t29 = (t60 - t61);
    t30 = (t29 + 1);
    xsi_vlogvar_assign_value(t14, t13, t26, *((unsigned int *)t48), t30);
    goto LAB17;

LAB20:    t11 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB21;

LAB22:    xsi_set_current_line(42, ng0);

LAB25:    xsi_set_current_line(43, ng0);
    t13 = (t0 + 1928);
    t14 = (t13 + 56U);
    t17 = *((char **)t14);
    t21 = (t0 + 1928);
    t50 = (t21 + 72U);
    t51 = *((char **)t50);
    t52 = (t0 + 1928);
    t53 = (t52 + 64U);
    t55 = *((char **)t53);
    t57 = (t0 + 1048U);
    t62 = *((char **)t57);
    memset(t48, 0, 8);
    t57 = (t48 + 4);
    t63 = (t62 + 4);
    t54 = *((unsigned int *)t62);
    t56 = (t54 >> 0);
    *((unsigned int *)t48) = t56;
    t58 = *((unsigned int *)t63);
    t59 = (t58 >> 0);
    *((unsigned int *)t57) = t59;
    t60 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t60 & 3U);
    t61 = *((unsigned int *)t57);
    *((unsigned int *)t57) = (t61 & 3U);
    xsi_vlog_generic_get_array_select_value(t8, 4, t17, t51, t55, 2, 1, t48, 2, 2);
    t64 = (t0 + 1768);
    t67 = (t0 + 1768);
    t68 = (t67 + 72U);
    t69 = *((char **)t68);
    t70 = ((char*)((ng5)));
    t71 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t49, t65, t66, ((int*)(t69)), 2, t70, 32, 1, t71, 32, 1);
    t72 = (t49 + 4);
    t73 = *((unsigned int *)t72);
    t16 = (!(t73));
    t74 = (t65 + 4);
    t75 = *((unsigned int *)t74);
    t19 = (!(t75));
    t20 = (t16 && t19);
    t76 = (t66 + 4);
    t77 = *((unsigned int *)t76);
    t23 = (!(t77));
    t24 = (t20 && t23);
    if (t24 == 1)
        goto LAB26;

LAB27:    goto LAB24;

LAB26:    t78 = *((unsigned int *)t66);
    t26 = (t78 + 0);
    t79 = *((unsigned int *)t49);
    t80 = *((unsigned int *)t65);
    t29 = (t79 - t80);
    t30 = (t29 + 1);
    xsi_vlogvar_assign_value(t64, t8, t26, *((unsigned int *)t65), t30);
    goto LAB27;

LAB30:    t11 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB31;

LAB32:    xsi_set_current_line(46, ng0);

LAB35:    xsi_set_current_line(47, ng0);
    t13 = (t0 + 1048U);
    t14 = *((char **)t13);
    memset(t8, 0, 8);
    t13 = (t8 + 4);
    t17 = (t14 + 4);
    t54 = *((unsigned int *)t14);
    t56 = (t54 >> 2);
    *((unsigned int *)t8) = t56;
    t58 = *((unsigned int *)t17);
    t59 = (t58 >> 2);
    *((unsigned int *)t13) = t59;
    t60 = *((unsigned int *)t8);
    *((unsigned int *)t8) = (t60 & 15U);
    t61 = *((unsigned int *)t13);
    *((unsigned int *)t13) = (t61 & 15U);
    t21 = (t0 + 1928);
    t50 = (t0 + 1928);
    t51 = (t50 + 72U);
    t52 = *((char **)t51);
    t53 = (t0 + 1928);
    t55 = (t53 + 64U);
    t57 = *((char **)t55);
    t62 = (t0 + 1048U);
    t63 = *((char **)t62);
    memset(t65, 0, 8);
    t62 = (t65 + 4);
    t64 = (t63 + 4);
    t73 = *((unsigned int *)t63);
    t75 = (t73 >> 0);
    *((unsigned int *)t65) = t75;
    t77 = *((unsigned int *)t64);
    t78 = (t77 >> 0);
    *((unsigned int *)t62) = t78;
    t79 = *((unsigned int *)t65);
    *((unsigned int *)t65) = (t79 & 3U);
    t80 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t80 & 3U);
    xsi_vlog_generic_convert_array_indices(t48, t49, t52, t57, 2, 1, t65, 2, 2);
    t67 = (t48 + 4);
    t81 = *((unsigned int *)t67);
    t16 = (!(t81));
    t68 = (t49 + 4);
    t82 = *((unsigned int *)t68);
    t19 = (!(t82));
    t20 = (t16 && t19);
    if (t20 == 1)
        goto LAB36;

LAB37:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t15 = *((unsigned int *)t3);
    t18 = (t15 >> 2);
    *((unsigned int *)t6) = t18;
    t22 = *((unsigned int *)t4);
    t25 = (t22 >> 2);
    *((unsigned int *)t2) = t25;
    t27 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t27 & 15U);
    t28 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t28 & 15U);
    t5 = (t0 + 1768);
    t9 = (t0 + 1768);
    t10 = (t9 + 72U);
    t11 = *((char **)t10);
    t12 = ((char*)((ng5)));
    t13 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t7, t8, t48, ((int*)(t11)), 2, t12, 32, 1, t13, 32, 1);
    t14 = (t7 + 4);
    t31 = *((unsigned int *)t14);
    t16 = (!(t31));
    t17 = (t8 + 4);
    t32 = *((unsigned int *)t17);
    t19 = (!(t32));
    t20 = (t16 && t19);
    t21 = (t48 + 4);
    t33 = *((unsigned int *)t21);
    t23 = (!(t33));
    t24 = (t20 && t23);
    if (t24 == 1)
        goto LAB38;

LAB39:    goto LAB34;

LAB36:    t83 = *((unsigned int *)t48);
    t84 = *((unsigned int *)t49);
    t23 = (t83 - t84);
    t24 = (t23 + 1);
    xsi_vlogvar_assign_value(t21, t8, 0, *((unsigned int *)t49), t24);
    goto LAB37;

LAB38:    t34 = *((unsigned int *)t48);
    t26 = (t34 + 0);
    t35 = *((unsigned int *)t7);
    t36 = *((unsigned int *)t8);
    t29 = (t35 - t36);
    t30 = (t29 + 1);
    xsi_vlogvar_assign_value(t5, t6, t26, *((unsigned int *)t8), t30);
    goto LAB39;

}


extern void work_m_00000000003375834324_0286164271_init()
{
	static char *pe[] = {(void *)Always_37_0};
	xsi_register_didat("work_m_00000000003375834324_0286164271", "isim/testbench_isim_beh.exe.sim/work/m_00000000003375834324_0286164271.didat");
	xsi_register_executes(pe);
}
