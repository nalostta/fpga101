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
static const char *ng0 = "C:/FPGA101/test/PISO_register/main.v";
static unsigned int ng1[] = {1U, 0U};
static int ng2[] = {0, 0};
static int ng3[] = {7, 0};
static int ng4[] = {1, 0};
static unsigned int ng5[] = {0U, 0U};



static void Always_47_0(char *t0)
{
    char t4[8];
    char t19[8];
    char t32[8];
    char t54[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t33;
    char *t34;
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
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t55;
    char *t56;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    char *t66;
    char *t67;
    int t68;
    int t69;
    int t70;
    int t71;
    int t72;
    int t73;
    int t74;
    int t75;

LAB0:    t1 = (t0 + 3328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 3648);
    *((int *)t2) = 1;
    t3 = (t0 + 3360);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(47, ng0);

LAB5:    xsi_set_current_line(48, ng0);
    t5 = (t0 + 1208U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t6 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t6);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t5) == 0)
        goto LAB6;

LAB8:    t12 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t12) = 1;

LAB9:    t13 = (t4 + 4);
    t14 = *((unsigned int *)t13);
    t15 = (~(t14));
    t16 = *((unsigned int *)t4);
    t17 = (t16 & t15);
    t18 = (t17 != 0);
    if (t18 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(59, ng0);

LAB33:    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 8);
    xsi_set_current_line(61, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB12:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(48, ng0);

LAB13:    xsi_set_current_line(49, ng0);
    t20 = (t0 + 2088);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memset(t19, 0, 8);
    t23 = (t19 + 4);
    t24 = (t22 + 4);
    t25 = *((unsigned int *)t22);
    t26 = (t25 >> 0);
    *((unsigned int *)t19) = t26;
    t27 = *((unsigned int *)t24);
    t28 = (t27 >> 0);
    *((unsigned int *)t23) = t28;
    t29 = *((unsigned int *)t19);
    *((unsigned int *)t19) = (t29 & 7U);
    t30 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t30 & 7U);
    t31 = ((char*)((ng1)));
    memset(t32, 0, 8);
    t33 = (t19 + 4);
    t34 = (t31 + 4);
    t35 = *((unsigned int *)t19);
    t36 = *((unsigned int *)t31);
    t37 = (t35 ^ t36);
    t38 = *((unsigned int *)t33);
    t39 = *((unsigned int *)t34);
    t40 = (t38 ^ t39);
    t41 = (t37 | t40);
    t42 = *((unsigned int *)t33);
    t43 = *((unsigned int *)t34);
    t44 = (t42 | t43);
    t45 = (~(t44));
    t46 = (t41 & t45);
    if (t46 != 0)
        goto LAB17;

LAB14:    if (t44 != 0)
        goto LAB16;

LAB15:    *((unsigned int *)t32) = 1;

LAB17:    t48 = (t32 + 4);
    t49 = *((unsigned int *)t48);
    t50 = (~(t49));
    t51 = *((unsigned int *)t32);
    t52 = (t51 & t50);
    t53 = (t52 != 0);
    if (t53 > 0)
        goto LAB18;

LAB19:    xsi_set_current_line(51, ng0);

LAB22:    xsi_set_current_line(52, ng0);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2408);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB23:    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t4, 0, 8);
    xsi_vlog_signed_less(t4, 32, t5, 32, t6, 32);
    t12 = (t4 + 4);
    t7 = *((unsigned int *)t12);
    t8 = (~(t7));
    t9 = *((unsigned int *)t4);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB24;

LAB25:
LAB20:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng1)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 3, t5, 3, t6, 3);
    t12 = (t0 + 2088);
    xsi_vlogvar_assign_value(t12, t4, 0, 0, 3);
    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 0);
    t9 = (t8 & 1);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t12);
    t11 = (t10 >> 0);
    t14 = (t11 & 1);
    *((unsigned int *)t6) = t14;
    t13 = (t0 + 1928);
    t20 = (t0 + 1928);
    t21 = (t20 + 72U);
    t22 = *((char **)t21);
    t23 = ((char*)((ng2)));
    xsi_vlog_generic_convert_bit_index(t19, t22, 2, t23, 32, 1);
    t24 = (t19 + 4);
    t15 = *((unsigned int *)t24);
    t68 = (!(t15));
    if (t68 == 1)
        goto LAB29;

LAB30:    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 1928);
    t5 = (t0 + 1928);
    t6 = (t5 + 72U);
    t12 = *((char **)t6);
    t13 = ((char*)((ng3)));
    t20 = ((char*)((ng4)));
    xsi_vlog_convert_partindices(t4, t19, t32, ((int*)(t12)), 2, t13, 32, 1, t20, 32, 1);
    t21 = (t4 + 4);
    t7 = *((unsigned int *)t21);
    t68 = (!(t7));
    t22 = (t19 + 4);
    t8 = *((unsigned int *)t22);
    t69 = (!(t8));
    t70 = (t68 && t69);
    t23 = (t32 + 4);
    t9 = *((unsigned int *)t23);
    t71 = (!(t9));
    t72 = (t70 && t71);
    if (t72 == 1)
        goto LAB31;

LAB32:    goto LAB12;

LAB16:    t47 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(49, ng0);

LAB21:    xsi_set_current_line(50, ng0);
    t55 = (t0 + 1048U);
    t56 = *((char **)t55);
    memset(t54, 0, 8);
    t55 = (t54 + 4);
    t57 = (t56 + 4);
    t58 = *((unsigned int *)t56);
    t59 = (t58 >> 0);
    *((unsigned int *)t54) = t59;
    t60 = *((unsigned int *)t57);
    t61 = (t60 >> 0);
    *((unsigned int *)t55) = t61;
    t62 = *((unsigned int *)t54);
    *((unsigned int *)t54) = (t62 & 255U);
    t63 = *((unsigned int *)t55);
    *((unsigned int *)t55) = (t63 & 255U);
    t64 = (t0 + 2248);
    xsi_vlogvar_assign_value(t64, t54, 0, 0, 8);
    goto LAB20;

LAB24:    xsi_set_current_line(52, ng0);

LAB26:    xsi_set_current_line(53, ng0);
    t13 = (t0 + 2248);
    t20 = (t13 + 56U);
    t21 = *((char **)t20);
    t22 = (t0 + 2248);
    t23 = (t22 + 72U);
    t24 = *((char **)t23);
    t31 = (t0 + 2408);
    t33 = (t31 + 56U);
    t34 = *((char **)t33);
    t47 = ((char*)((ng4)));
    memset(t32, 0, 8);
    xsi_vlog_signed_add(t32, 32, t34, 32, t47, 32);
    xsi_vlog_generic_get_index_select_value(t19, 1, t21, t24, 2, t32, 32, 1);
    t48 = (t0 + 2248);
    t55 = (t0 + 2248);
    t56 = (t55 + 72U);
    t57 = *((char **)t56);
    t64 = (t0 + 2408);
    t65 = (t64 + 56U);
    t66 = *((char **)t65);
    xsi_vlog_generic_convert_bit_index(t54, t57, 2, t66, 32, 1);
    t67 = (t54 + 4);
    t14 = *((unsigned int *)t67);
    t68 = (!(t14));
    if (t68 == 1)
        goto LAB27;

LAB28:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng4)));
    memset(t4, 0, 8);
    xsi_vlog_signed_add(t4, 32, t5, 32, t6, 32);
    t12 = (t0 + 2408);
    xsi_vlogvar_assign_value(t12, t4, 0, 0, 32);
    goto LAB23;

LAB27:    xsi_vlogvar_assign_value(t48, t19, 0, *((unsigned int *)t54), 1);
    goto LAB28;

LAB29:    xsi_vlogvar_wait_assign_value(t13, t4, 0, *((unsigned int *)t19), 1, 0LL);
    goto LAB30;

LAB31:    t10 = *((unsigned int *)t32);
    t73 = (t10 + 0);
    t11 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t19);
    t74 = (t11 - t14);
    t75 = (t74 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, t73, *((unsigned int *)t19), t75, 0LL);
    goto LAB32;

}


extern void work_m_00000000000755829777_0286164271_init()
{
	static char *pe[] = {(void *)Always_47_0};
	xsi_register_didat("work_m_00000000000755829777_0286164271", "isim/main_isim_beh.exe.sim/work/m_00000000000755829777_0286164271.didat");
	xsi_register_executes(pe);
}
