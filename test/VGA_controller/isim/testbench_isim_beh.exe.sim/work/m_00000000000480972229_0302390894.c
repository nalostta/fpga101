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
static const char *ng0 = "C:/FPGA101/test/VGA_controller/VGA_controller.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {656U, 0U};
static unsigned int ng4[] = {752U, 0U};
static unsigned int ng5[] = {800U, 0U};
static unsigned int ng6[] = {490U, 0U};
static unsigned int ng7[] = {492U, 0U};
static unsigned int ng8[] = {525U, 0U};



static void Always_46_0(char *t0)
{
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t16;
    int t17;

LAB0:    t1 = (t0 + 3008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 3328);
    *((int *)t2) = 1;
    t3 = (t0 + 3040);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(47, ng0);

LAB5:    xsi_set_current_line(48, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(67, ng0);

LAB31:    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 10);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 10);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(49, ng0);

LAB9:    xsi_set_current_line(50, ng0);
    t11 = (t0 + 1928);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = ((char*)((ng1)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 10, t13, 10, t14, 10);
    t16 = (t0 + 1928);
    xsi_vlogvar_assign_value(t16, t15, 0, 0, 10);
    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB10:    t5 = ((char*)((ng2)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 10, t5, 10);
    if (t17 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng3)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 10, t2, 10);
    if (t17 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng4)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 10, t2, 10);
    if (t17 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng5)));
    t17 = xsi_vlog_unsigned_case_compare(t4, 10, t2, 10);
    if (t17 == 1)
        goto LAB17;

LAB18:
LAB19:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);

LAB21:    t11 = ((char*)((ng2)));
    t17 = xsi_vlog_unsigned_case_compare(t5, 10, t11, 10);
    if (t17 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng6)));
    t17 = xsi_vlog_unsigned_case_compare(t5, 10, t2, 10);
    if (t17 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng7)));
    t17 = xsi_vlog_unsigned_case_compare(t5, 10, t2, 10);
    if (t17 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng8)));
    t17 = xsi_vlog_unsigned_case_compare(t5, 10, t2, 10);
    if (t17 == 1)
        goto LAB28;

LAB29:
LAB30:    goto LAB8;

LAB11:    xsi_set_current_line(52, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1608);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 1);
    goto LAB19;

LAB13:    xsi_set_current_line(53, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1608);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    goto LAB19;

LAB15:    xsi_set_current_line(54, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1608);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 1);
    goto LAB19;

LAB17:    xsi_set_current_line(56, ng0);

LAB20:    xsi_set_current_line(57, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1928);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 10);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t5 = *((char **)t3);
    t11 = ((char*)((ng1)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 10, t5, 10, t11, 10);
    t12 = (t0 + 2088);
    xsi_vlogvar_assign_value(t12, t15, 0, 0, 10);
    goto LAB19;

LAB22:    xsi_set_current_line(62, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 1768);
    xsi_vlogvar_assign_value(t13, t12, 0, 0, 1);
    goto LAB30;

LAB24:    xsi_set_current_line(63, ng0);
    t3 = ((char*)((ng2)));
    t11 = (t0 + 1768);
    xsi_vlogvar_assign_value(t11, t3, 0, 0, 1);
    goto LAB30;

LAB26:    xsi_set_current_line(64, ng0);
    t3 = ((char*)((ng1)));
    t11 = (t0 + 1768);
    xsi_vlogvar_assign_value(t11, t3, 0, 0, 1);
    goto LAB30;

LAB28:    xsi_set_current_line(65, ng0);
    t3 = ((char*)((ng2)));
    t11 = (t0 + 2088);
    xsi_vlogvar_assign_value(t11, t3, 0, 0, 10);
    goto LAB30;

}


extern void work_m_00000000000480972229_0302390894_init()
{
	static char *pe[] = {(void *)Always_46_0};
	xsi_register_didat("work_m_00000000000480972229_0302390894", "isim/testbench_isim_beh.exe.sim/work/m_00000000000480972229_0302390894.didat");
	xsi_register_executes(pe);
}
