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
static const char *ng0 = "C:/FPGA101/test/LEDcounter39/main.v";
static unsigned int ng1[] = {10U, 0U};
static unsigned int ng2[] = {3U, 0U};
static unsigned int ng3[] = {1U, 0U};
static int ng4[] = {3, 0};
static int ng5[] = {0, 0};
static unsigned int ng6[] = {0U, 0U};
static int ng7[] = {7, 0};
static int ng8[] = {4, 0};



static void Always_39_0(char *t0)
{
    char t4[8];
    char t19[8];
    char t32[8];
    char t56[8];
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
    char *t54;
    char *t55;
    int t57;
    int t58;
    int t59;
    int t60;
    int t61;
    int t62;
    int t63;
    int t64;

LAB0:    t1 = (t0 + 3008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(39, ng0);
    t2 = (t0 + 3328);
    *((int *)t2) = 1;
    t3 = (t0 + 3040);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(39, ng0);

LAB5:    xsi_set_current_line(40, ng0);
    t5 = (t0 + 1528U);
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

LAB11:    xsi_set_current_line(47, ng0);

LAB25:    xsi_set_current_line(48, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB12:    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1928);
    t5 = (t0 + 1928);
    t6 = (t5 + 72U);
    t12 = *((char **)t6);
    t13 = ((char*)((ng7)));
    t20 = ((char*)((ng8)));
    xsi_vlog_convert_partindices(t4, t19, t32, ((int*)(t12)), 2, t13, 32, 1, t20, 32, 1);
    t21 = (t4 + 4);
    t7 = *((unsigned int *)t21);
    t57 = (!(t7));
    t22 = (t19 + 4);
    t8 = *((unsigned int *)t22);
    t58 = (!(t8));
    t59 = (t57 && t58);
    t23 = (t32 + 4);
    t9 = *((unsigned int *)t23);
    t60 = (!(t9));
    t61 = (t59 && t60);
    if (t61 == 1)
        goto LAB26;

LAB27:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(40, ng0);

LAB13:    xsi_set_current_line(41, ng0);
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
    *((unsigned int *)t19) = (t29 & 15U);
    t30 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t30 & 15U);
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

LAB19:    xsi_set_current_line(43, ng0);

LAB22:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t6 = ((char*)((ng3)));
    memset(t4, 0, 8);
    xsi_vlog_unsigned_add(t4, 4, t5, 4, t6, 4);
    t12 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t12, t4, 0, 0, 4, 0LL);

LAB20:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 0);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t12);
    t10 = (t9 >> 0);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 15U);
    t14 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t14 & 15U);
    t13 = (t0 + 1928);
    t20 = (t0 + 1928);
    t21 = (t20 + 72U);
    t22 = *((char **)t21);
    t23 = ((char*)((ng4)));
    t24 = ((char*)((ng5)));
    xsi_vlog_convert_partindices(t19, t32, t56, ((int*)(t22)), 2, t23, 32, 1, t24, 32, 1);
    t31 = (t19 + 4);
    t15 = *((unsigned int *)t31);
    t57 = (!(t15));
    t33 = (t32 + 4);
    t16 = *((unsigned int *)t33);
    t58 = (!(t16));
    t59 = (t57 && t58);
    t34 = (t56 + 4);
    t17 = *((unsigned int *)t34);
    t60 = (!(t17));
    t61 = (t59 && t60);
    if (t61 == 1)
        goto LAB23;

LAB24:    goto LAB12;

LAB16:    t47 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(41, ng0);

LAB21:    xsi_set_current_line(42, ng0);
    t54 = ((char*)((ng2)));
    t55 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t55, t54, 0, 0, 4, 0LL);
    goto LAB20;

LAB23:    t18 = *((unsigned int *)t56);
    t62 = (t18 + 0);
    t25 = *((unsigned int *)t19);
    t26 = *((unsigned int *)t32);
    t63 = (t25 - t26);
    t64 = (t63 + 1);
    xsi_vlogvar_wait_assign_value(t13, t4, t62, *((unsigned int *)t32), t64, 0LL);
    goto LAB24;

LAB26:    t10 = *((unsigned int *)t32);
    t62 = (t10 + 0);
    t11 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t19);
    t63 = (t11 - t14);
    t64 = (t63 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, t62, *((unsigned int *)t19), t64, 0LL);
    goto LAB27;

}


extern void work_m_00000000000108683032_0286164271_init()
{
	static char *pe[] = {(void *)Always_39_0};
	xsi_register_didat("work_m_00000000000108683032_0286164271", "isim/testbench_isim_beh.exe.sim/work/m_00000000000108683032_0286164271.didat");
	xsi_register_executes(pe);
}
