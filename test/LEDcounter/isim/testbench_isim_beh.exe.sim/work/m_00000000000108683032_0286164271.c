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
static const char *ng0 = "C:/FPGA101/test/LEDcounter/main.v";
static unsigned int ng1[] = {1U, 0U};
static int ng2[] = {3, 0};
static int ng3[] = {0, 0};
static unsigned int ng4[] = {0U, 0U};
static int ng5[] = {7, 0};
static int ng6[] = {4, 0};



static void Always_39_0(char *t0)
{
    char t4[8];
    char t23[8];
    char t25[8];
    char t26[8];
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
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t24;
    char *t27;
    int t28;
    char *t29;
    int t30;
    int t31;
    char *t32;
    int t33;
    int t34;
    int t35;
    unsigned int t36;
    unsigned int t37;
    int t38;
    int t39;

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

LAB11:    xsi_set_current_line(43, ng0);

LAB16:    xsi_set_current_line(44, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 27, 0LL);
    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB12:    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1928);
    t5 = (t0 + 1928);
    t6 = (t5 + 72U);
    t12 = *((char **)t6);
    t13 = ((char*)((ng5)));
    t19 = ((char*)((ng6)));
    xsi_vlog_convert_partindices(t4, t23, t25, ((int*)(t12)), 2, t13, 32, 1, t19, 32, 1);
    t20 = (t4 + 4);
    t7 = *((unsigned int *)t20);
    t28 = (!(t7));
    t21 = (t23 + 4);
    t8 = *((unsigned int *)t21);
    t30 = (!(t8));
    t31 = (t28 && t30);
    t22 = (t25 + 4);
    t9 = *((unsigned int *)t22);
    t33 = (!(t9));
    t34 = (t31 && t33);
    if (t34 == 1)
        goto LAB17;

LAB18:    goto LAB2;

LAB6:    *((unsigned int *)t4) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(40, ng0);

LAB13:    xsi_set_current_line(41, ng0);
    t19 = (t0 + 2088);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng1)));
    memset(t23, 0, 8);
    xsi_vlog_unsigned_add(t23, 27, t21, 27, t22, 27);
    t24 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t24, t23, 0, 0, 27, 0LL);
    xsi_set_current_line(42, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    memset(t4, 0, 8);
    t6 = (t4 + 4);
    t12 = (t5 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (t7 >> 7);
    *((unsigned int *)t4) = t8;
    t9 = *((unsigned int *)t12);
    t10 = (t9 >> 7);
    *((unsigned int *)t6) = t10;
    t11 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t11 & 15U);
    t14 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t14 & 15U);
    t13 = (t0 + 1928);
    t19 = (t0 + 1928);
    t20 = (t19 + 72U);
    t21 = *((char **)t20);
    t22 = ((char*)((ng2)));
    t24 = ((char*)((ng3)));
    xsi_vlog_convert_partindices(t23, t25, t26, ((int*)(t21)), 2, t22, 32, 1, t24, 32, 1);
    t27 = (t23 + 4);
    t15 = *((unsigned int *)t27);
    t28 = (!(t15));
    t29 = (t25 + 4);
    t16 = *((unsigned int *)t29);
    t30 = (!(t16));
    t31 = (t28 && t30);
    t32 = (t26 + 4);
    t17 = *((unsigned int *)t32);
    t33 = (!(t17));
    t34 = (t31 && t33);
    if (t34 == 1)
        goto LAB14;

LAB15:    goto LAB12;

LAB14:    t18 = *((unsigned int *)t26);
    t35 = (t18 + 0);
    t36 = *((unsigned int *)t23);
    t37 = *((unsigned int *)t25);
    t38 = (t36 - t37);
    t39 = (t38 + 1);
    xsi_vlogvar_wait_assign_value(t13, t4, t35, *((unsigned int *)t25), t39, 0LL);
    goto LAB15;

LAB17:    t10 = *((unsigned int *)t25);
    t35 = (t10 + 0);
    t11 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t23);
    t38 = (t11 - t14);
    t39 = (t38 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, t35, *((unsigned int *)t23), t39, 0LL);
    goto LAB18;

}


extern void work_m_00000000000108683032_0286164271_init()
{
	static char *pe[] = {(void *)Always_39_0};
	xsi_register_didat("work_m_00000000000108683032_0286164271", "isim/testbench_isim_beh.exe.sim/work/m_00000000000108683032_0286164271.didat");
	xsi_register_executes(pe);
}
