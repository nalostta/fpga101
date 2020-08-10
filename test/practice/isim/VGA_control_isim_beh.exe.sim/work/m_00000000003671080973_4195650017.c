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
static const char *ng0 = "C:/FPGA101/test/practice/VGA_control.v";
static unsigned int ng1[] = {1U, 0U};
static int ng2[] = {0, 0};
static int ng3[] = {656, 0};
static int ng4[] = {752, 0};
static unsigned int ng5[] = {0U, 0U};
static int ng6[] = {800, 0};
static unsigned int ng7[] = {490U, 0U};
static unsigned int ng8[] = {492U, 0U};
static unsigned int ng9[] = {525U, 0U};
static unsigned int ng10[] = {0U, 1U};



static void Always_62_0(char *t0)
{
    char t15[8];
    char t18[8];
    char t19[8];
    char t31[8];
    char t44[8];
    char t48[8];
    char t56[8];
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
    unsigned int t17;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    char *t43;
    char *t45;
    char *t46;
    char *t47;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    char *t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    int t80;
    int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    char *t94;
    char *t95;

LAB0:    t1 = (t0 + 3008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 3328);
    *((int *)t2) = 1;
    t3 = (t0 + 3040);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(62, ng0);

LAB5:    xsi_set_current_line(63, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(87, ng0);

LAB196:    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 10, 0LL);
    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 10, 0LL);
    xsi_set_current_line(91, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    xsi_set_current_line(92, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 2088);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(63, ng0);

LAB9:    xsi_set_current_line(65, ng0);
    t11 = (t0 + 1608);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = ((char*)((ng1)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 10, t13, 10, t14, 10);
    t16 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 10, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t15, 0, 8);
    t5 = (t15 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t15) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 0);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t10 & 1023U);
    t17 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t17 & 1023U);
    t12 = ((char*)((ng2)));
    memset(t18, 0, 8);
    t13 = (t15 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB11;

LAB10:    t14 = (t12 + 4);
    if (*((unsigned int *)t14) != 0)
        goto LAB11;

LAB14:    if (*((unsigned int *)t15) < *((unsigned int *)t12))
        goto LAB13;

LAB12:    *((unsigned int *)t18) = 1;

LAB13:    memset(t19, 0, 8);
    t20 = (t18 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (~(t21));
    t23 = *((unsigned int *)t18);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB15;

LAB16:    if (*((unsigned int *)t20) != 0)
        goto LAB17;

LAB18:    t27 = (t19 + 4);
    t28 = *((unsigned int *)t19);
    t29 = *((unsigned int *)t27);
    t30 = (t28 || t29);
    if (t30 > 0)
        goto LAB19;

LAB20:    memcpy(t56, t19, 8);

LAB21:    t88 = (t56 + 4);
    t89 = *((unsigned int *)t88);
    t90 = (~(t89));
    t91 = *((unsigned int *)t56);
    t92 = (t91 & t90);
    t93 = (t92 != 0);
    if (t93 > 0)
        goto LAB34;

LAB35:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t15, 0, 8);
    t5 = (t15 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t15) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 0);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t10 & 1023U);
    t17 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t17 & 1023U);
    t12 = ((char*)((ng3)));
    memset(t18, 0, 8);
    t13 = (t15 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB39;

LAB38:    t14 = (t12 + 4);
    if (*((unsigned int *)t14) != 0)
        goto LAB39;

LAB42:    if (*((unsigned int *)t15) < *((unsigned int *)t12))
        goto LAB41;

LAB40:    *((unsigned int *)t18) = 1;

LAB41:    memset(t19, 0, 8);
    t20 = (t18 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (~(t21));
    t23 = *((unsigned int *)t18);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB43;

LAB44:    if (*((unsigned int *)t20) != 0)
        goto LAB45;

LAB46:    t27 = (t19 + 4);
    t28 = *((unsigned int *)t19);
    t29 = *((unsigned int *)t27);
    t30 = (t28 || t29);
    if (t30 > 0)
        goto LAB47;

LAB48:    memcpy(t56, t19, 8);

LAB49:    t88 = (t56 + 4);
    t89 = *((unsigned int *)t88);
    t90 = (~(t89));
    t91 = *((unsigned int *)t56);
    t92 = (t91 & t90);
    t93 = (t92 != 0);
    if (t93 > 0)
        goto LAB62;

LAB63:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t15, 0, 8);
    t5 = (t15 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t15) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 0);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t10 & 1023U);
    t17 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t17 & 1023U);
    t12 = ((char*)((ng4)));
    memset(t18, 0, 8);
    t13 = (t15 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB67;

LAB66:    t14 = (t12 + 4);
    if (*((unsigned int *)t14) != 0)
        goto LAB67;

LAB70:    if (*((unsigned int *)t15) < *((unsigned int *)t12))
        goto LAB69;

LAB68:    *((unsigned int *)t18) = 1;

LAB69:    memset(t19, 0, 8);
    t20 = (t18 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (~(t21));
    t23 = *((unsigned int *)t18);
    t24 = (t23 & t22);
    t25 = (t24 & 1U);
    if (t25 != 0)
        goto LAB71;

LAB72:    if (*((unsigned int *)t20) != 0)
        goto LAB73;

LAB74:    t27 = (t19 + 4);
    t28 = *((unsigned int *)t19);
    t29 = *((unsigned int *)t27);
    t30 = (t28 || t29);
    if (t30 > 0)
        goto LAB75;

LAB76:    memcpy(t56, t19, 8);

LAB77:    t88 = (t56 + 4);
    t89 = *((unsigned int *)t88);
    t90 = (~(t89));
    t91 = *((unsigned int *)t56);
    t92 = (t91 & t90);
    t93 = (t92 != 0);
    if (t93 > 0)
        goto LAB90;

LAB91:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1608);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t15, 0, 8);
    t5 = (t15 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t15) = t7;
    t8 = *((unsigned int *)t11);
    t9 = (t8 >> 0);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t10 & 1023U);
    t17 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t17 & 1023U);
    t12 = ((char*)((ng6)));
    memset(t18, 0, 8);
    t13 = (t15 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB95;

LAB94:    t14 = (t12 + 4);
    if (*((unsigned int *)t14) != 0)
        goto LAB95;

LAB98:    if (*((unsigned int *)t15) < *((unsigned int *)t12))
        goto LAB97;

LAB96:    *((unsigned int *)t18) = 1;

LAB97:    t20 = (t18 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (~(t21));
    t23 = *((unsigned int *)t18);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB99;

LAB100:
LAB101:
LAB92:
LAB64:
LAB36:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng7)));
    memset(t15, 0, 8);
    t11 = (t4 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB104;

LAB103:    t12 = (t5 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB104;

LAB107:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB105;

LAB106:    memset(t18, 0, 8);
    t14 = (t15 + 4);
    t6 = *((unsigned int *)t14);
    t7 = (~(t6));
    t8 = *((unsigned int *)t15);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB108;

LAB109:    if (*((unsigned int *)t14) != 0)
        goto LAB110;

LAB111:    t20 = (t18 + 4);
    t17 = *((unsigned int *)t18);
    t21 = *((unsigned int *)t20);
    t22 = (t17 || t21);
    if (t22 > 0)
        goto LAB112;

LAB113:    memcpy(t44, t18, 8);

LAB114:    t61 = (t44 + 4);
    t74 = *((unsigned int *)t61);
    t75 = (~(t74));
    t76 = *((unsigned int *)t44);
    t77 = (t76 & t75);
    t78 = (t77 != 0);
    if (t78 > 0)
        goto LAB127;

LAB128:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng8)));
    memset(t15, 0, 8);
    t11 = (t4 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB132;

LAB131:    t12 = (t5 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB132;

LAB135:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB133;

LAB134:    memset(t18, 0, 8);
    t14 = (t15 + 4);
    t6 = *((unsigned int *)t14);
    t7 = (~(t6));
    t8 = *((unsigned int *)t15);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB136;

LAB137:    if (*((unsigned int *)t14) != 0)
        goto LAB138;

LAB139:    t20 = (t18 + 4);
    t17 = *((unsigned int *)t18);
    t21 = *((unsigned int *)t20);
    t22 = (t17 || t21);
    if (t22 > 0)
        goto LAB140;

LAB141:    memcpy(t44, t18, 8);

LAB142:    t61 = (t44 + 4);
    t74 = *((unsigned int *)t61);
    t75 = (~(t74));
    t76 = *((unsigned int *)t44);
    t77 = (t76 & t75);
    t78 = (t77 != 0);
    if (t78 > 0)
        goto LAB155;

LAB156:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng9)));
    memset(t15, 0, 8);
    t11 = (t4 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB160;

LAB159:    t12 = (t5 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB160;

LAB163:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB161;

LAB162:    memset(t18, 0, 8);
    t14 = (t15 + 4);
    t6 = *((unsigned int *)t14);
    t7 = (~(t6));
    t8 = *((unsigned int *)t15);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB164;

LAB165:    if (*((unsigned int *)t14) != 0)
        goto LAB166;

LAB167:    t20 = (t18 + 4);
    t17 = *((unsigned int *)t18);
    t21 = *((unsigned int *)t20);
    t22 = (t17 || t21);
    if (t22 > 0)
        goto LAB168;

LAB169:    memcpy(t44, t18, 8);

LAB170:    t61 = (t44 + 4);
    t74 = *((unsigned int *)t61);
    t75 = (~(t74));
    t76 = *((unsigned int *)t44);
    t77 = (t76 & t75);
    t78 = (t77 != 0);
    if (t78 > 0)
        goto LAB183;

LAB184:    xsi_set_current_line(83, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng9)));
    memset(t15, 0, 8);
    t11 = (t4 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB188;

LAB187:    t12 = (t5 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB188;

LAB191:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB190;

LAB189:    *((unsigned int *)t15) = 1;

LAB190:    t14 = (t15 + 4);
    t6 = *((unsigned int *)t14);
    t7 = (~(t6));
    t8 = *((unsigned int *)t15);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB192;

LAB193:
LAB194:
LAB185:
LAB157:
LAB129:    goto LAB8;

LAB11:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB13;

LAB15:    *((unsigned int *)t19) = 1;
    goto LAB18;

LAB17:    t26 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB18;

LAB19:    t32 = (t0 + 1608);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memset(t31, 0, 8);
    t35 = (t31 + 4);
    t36 = (t34 + 4);
    t37 = *((unsigned int *)t34);
    t38 = (t37 >> 0);
    *((unsigned int *)t31) = t38;
    t39 = *((unsigned int *)t36);
    t40 = (t39 >> 0);
    *((unsigned int *)t35) = t40;
    t41 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t41 & 1023U);
    t42 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t42 & 1023U);
    t43 = ((char*)((ng3)));
    memset(t44, 0, 8);
    t45 = (t31 + 4);
    if (*((unsigned int *)t45) != 0)
        goto LAB23;

LAB22:    t46 = (t43 + 4);
    if (*((unsigned int *)t46) != 0)
        goto LAB23;

LAB26:    if (*((unsigned int *)t31) < *((unsigned int *)t43))
        goto LAB24;

LAB25:    memset(t48, 0, 8);
    t49 = (t44 + 4);
    t50 = *((unsigned int *)t49);
    t51 = (~(t50));
    t52 = *((unsigned int *)t44);
    t53 = (t52 & t51);
    t54 = (t53 & 1U);
    if (t54 != 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t49) != 0)
        goto LAB29;

LAB30:    t57 = *((unsigned int *)t19);
    t58 = *((unsigned int *)t48);
    t59 = (t57 & t58);
    *((unsigned int *)t56) = t59;
    t60 = (t19 + 4);
    t61 = (t48 + 4);
    t62 = (t56 + 4);
    t63 = *((unsigned int *)t60);
    t64 = *((unsigned int *)t61);
    t65 = (t63 | t64);
    *((unsigned int *)t62) = t65;
    t66 = *((unsigned int *)t62);
    t67 = (t66 != 0);
    if (t67 == 1)
        goto LAB31;

LAB32:
LAB33:    goto LAB21;

LAB23:    t47 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB25;

LAB24:    *((unsigned int *)t44) = 1;
    goto LAB25;

LAB27:    *((unsigned int *)t48) = 1;
    goto LAB30;

LAB29:    t55 = (t48 + 4);
    *((unsigned int *)t48) = 1;
    *((unsigned int *)t55) = 1;
    goto LAB30;

LAB31:    t68 = *((unsigned int *)t56);
    t69 = *((unsigned int *)t62);
    *((unsigned int *)t56) = (t68 | t69);
    t70 = (t19 + 4);
    t71 = (t48 + 4);
    t72 = *((unsigned int *)t19);
    t73 = (~(t72));
    t74 = *((unsigned int *)t70);
    t75 = (~(t74));
    t76 = *((unsigned int *)t48);
    t77 = (~(t76));
    t78 = *((unsigned int *)t71);
    t79 = (~(t78));
    t80 = (t73 & t75);
    t81 = (t77 & t79);
    t82 = (~(t80));
    t83 = (~(t81));
    t84 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t84 & t82);
    t85 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t85 & t83);
    t86 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t86 & t82);
    t87 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t87 & t83);
    goto LAB33;

LAB34:    xsi_set_current_line(66, ng0);

LAB37:    xsi_set_current_line(67, ng0);
    t94 = ((char*)((ng1)));
    t95 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t95, t94, 0, 0, 1, 0LL);
    goto LAB36;

LAB39:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB41;

LAB43:    *((unsigned int *)t19) = 1;
    goto LAB46;

LAB45:    t26 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB46;

LAB47:    t32 = (t0 + 1608);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memset(t31, 0, 8);
    t35 = (t31 + 4);
    t36 = (t34 + 4);
    t37 = *((unsigned int *)t34);
    t38 = (t37 >> 0);
    *((unsigned int *)t31) = t38;
    t39 = *((unsigned int *)t36);
    t40 = (t39 >> 0);
    *((unsigned int *)t35) = t40;
    t41 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t41 & 1023U);
    t42 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t42 & 1023U);
    t43 = ((char*)((ng4)));
    memset(t44, 0, 8);
    t45 = (t31 + 4);
    if (*((unsigned int *)t45) != 0)
        goto LAB51;

LAB50:    t46 = (t43 + 4);
    if (*((unsigned int *)t46) != 0)
        goto LAB51;

LAB54:    if (*((unsigned int *)t31) < *((unsigned int *)t43))
        goto LAB52;

LAB53:    memset(t48, 0, 8);
    t49 = (t44 + 4);
    t50 = *((unsigned int *)t49);
    t51 = (~(t50));
    t52 = *((unsigned int *)t44);
    t53 = (t52 & t51);
    t54 = (t53 & 1U);
    if (t54 != 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t49) != 0)
        goto LAB57;

LAB58:    t57 = *((unsigned int *)t19);
    t58 = *((unsigned int *)t48);
    t59 = (t57 & t58);
    *((unsigned int *)t56) = t59;
    t60 = (t19 + 4);
    t61 = (t48 + 4);
    t62 = (t56 + 4);
    t63 = *((unsigned int *)t60);
    t64 = *((unsigned int *)t61);
    t65 = (t63 | t64);
    *((unsigned int *)t62) = t65;
    t66 = *((unsigned int *)t62);
    t67 = (t66 != 0);
    if (t67 == 1)
        goto LAB59;

LAB60:
LAB61:    goto LAB49;

LAB51:    t47 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB53;

LAB52:    *((unsigned int *)t44) = 1;
    goto LAB53;

LAB55:    *((unsigned int *)t48) = 1;
    goto LAB58;

LAB57:    t55 = (t48 + 4);
    *((unsigned int *)t48) = 1;
    *((unsigned int *)t55) = 1;
    goto LAB58;

LAB59:    t68 = *((unsigned int *)t56);
    t69 = *((unsigned int *)t62);
    *((unsigned int *)t56) = (t68 | t69);
    t70 = (t19 + 4);
    t71 = (t48 + 4);
    t72 = *((unsigned int *)t19);
    t73 = (~(t72));
    t74 = *((unsigned int *)t70);
    t75 = (~(t74));
    t76 = *((unsigned int *)t48);
    t77 = (~(t76));
    t78 = *((unsigned int *)t71);
    t79 = (~(t78));
    t80 = (t73 & t75);
    t81 = (t77 & t79);
    t82 = (~(t80));
    t83 = (~(t81));
    t84 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t84 & t82);
    t85 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t85 & t83);
    t86 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t86 & t82);
    t87 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t87 & t83);
    goto LAB61;

LAB62:    xsi_set_current_line(68, ng0);

LAB65:    xsi_set_current_line(69, ng0);
    t94 = ((char*)((ng5)));
    t95 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t95, t94, 0, 0, 1, 0LL);
    goto LAB64;

LAB67:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB69;

LAB71:    *((unsigned int *)t19) = 1;
    goto LAB74;

LAB73:    t26 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB74;

LAB75:    t32 = (t0 + 1608);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memset(t31, 0, 8);
    t35 = (t31 + 4);
    t36 = (t34 + 4);
    t37 = *((unsigned int *)t34);
    t38 = (t37 >> 0);
    *((unsigned int *)t31) = t38;
    t39 = *((unsigned int *)t36);
    t40 = (t39 >> 0);
    *((unsigned int *)t35) = t40;
    t41 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t41 & 1023U);
    t42 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t42 & 1023U);
    t43 = ((char*)((ng6)));
    memset(t44, 0, 8);
    t45 = (t31 + 4);
    if (*((unsigned int *)t45) != 0)
        goto LAB79;

LAB78:    t46 = (t43 + 4);
    if (*((unsigned int *)t46) != 0)
        goto LAB79;

LAB82:    if (*((unsigned int *)t31) < *((unsigned int *)t43))
        goto LAB80;

LAB81:    memset(t48, 0, 8);
    t49 = (t44 + 4);
    t50 = *((unsigned int *)t49);
    t51 = (~(t50));
    t52 = *((unsigned int *)t44);
    t53 = (t52 & t51);
    t54 = (t53 & 1U);
    if (t54 != 0)
        goto LAB83;

LAB84:    if (*((unsigned int *)t49) != 0)
        goto LAB85;

LAB86:    t57 = *((unsigned int *)t19);
    t58 = *((unsigned int *)t48);
    t59 = (t57 & t58);
    *((unsigned int *)t56) = t59;
    t60 = (t19 + 4);
    t61 = (t48 + 4);
    t62 = (t56 + 4);
    t63 = *((unsigned int *)t60);
    t64 = *((unsigned int *)t61);
    t65 = (t63 | t64);
    *((unsigned int *)t62) = t65;
    t66 = *((unsigned int *)t62);
    t67 = (t66 != 0);
    if (t67 == 1)
        goto LAB87;

LAB88:
LAB89:    goto LAB77;

LAB79:    t47 = (t44 + 4);
    *((unsigned int *)t44) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB81;

LAB80:    *((unsigned int *)t44) = 1;
    goto LAB81;

LAB83:    *((unsigned int *)t48) = 1;
    goto LAB86;

LAB85:    t55 = (t48 + 4);
    *((unsigned int *)t48) = 1;
    *((unsigned int *)t55) = 1;
    goto LAB86;

LAB87:    t68 = *((unsigned int *)t56);
    t69 = *((unsigned int *)t62);
    *((unsigned int *)t56) = (t68 | t69);
    t70 = (t19 + 4);
    t71 = (t48 + 4);
    t72 = *((unsigned int *)t19);
    t73 = (~(t72));
    t74 = *((unsigned int *)t70);
    t75 = (~(t74));
    t76 = *((unsigned int *)t48);
    t77 = (~(t76));
    t78 = *((unsigned int *)t71);
    t79 = (~(t78));
    t80 = (t73 & t75);
    t81 = (t77 & t79);
    t82 = (~(t80));
    t83 = (~(t81));
    t84 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t84 & t82);
    t85 = *((unsigned int *)t62);
    *((unsigned int *)t62) = (t85 & t83);
    t86 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t86 & t82);
    t87 = *((unsigned int *)t56);
    *((unsigned int *)t56) = (t87 & t83);
    goto LAB89;

LAB90:    xsi_set_current_line(70, ng0);

LAB93:    xsi_set_current_line(71, ng0);
    t94 = ((char*)((ng1)));
    t95 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t95, t94, 0, 0, 1, 0LL);
    goto LAB92;

LAB95:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB97;

LAB99:    xsi_set_current_line(72, ng0);

LAB102:    xsi_set_current_line(73, ng0);
    t26 = ((char*)((ng5)));
    t27 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t27, t26, 0, 0, 10, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 10, t4, 10, t5, 10);
    t11 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t11, t15, 0, 0, 10, 0LL);
    goto LAB101;

LAB104:    t13 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB106;

LAB105:    *((unsigned int *)t15) = 1;
    goto LAB106;

LAB108:    *((unsigned int *)t18) = 1;
    goto LAB111;

LAB110:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB111;

LAB112:    t26 = (t0 + 1768);
    t27 = (t26 + 56U);
    t32 = *((char **)t27);
    t33 = ((char*)((ng5)));
    memset(t19, 0, 8);
    t34 = (t32 + 4);
    if (*((unsigned int *)t34) != 0)
        goto LAB116;

LAB115:    t35 = (t33 + 4);
    if (*((unsigned int *)t35) != 0)
        goto LAB116;

LAB119:    if (*((unsigned int *)t32) < *((unsigned int *)t33))
        goto LAB118;

LAB117:    *((unsigned int *)t19) = 1;

LAB118:    memset(t31, 0, 8);
    t43 = (t19 + 4);
    t23 = *((unsigned int *)t43);
    t24 = (~(t23));
    t25 = *((unsigned int *)t19);
    t28 = (t25 & t24);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB120;

LAB121:    if (*((unsigned int *)t43) != 0)
        goto LAB122;

LAB123:    t30 = *((unsigned int *)t18);
    t37 = *((unsigned int *)t31);
    t38 = (t30 & t37);
    *((unsigned int *)t44) = t38;
    t46 = (t18 + 4);
    t47 = (t31 + 4);
    t49 = (t44 + 4);
    t39 = *((unsigned int *)t46);
    t40 = *((unsigned int *)t47);
    t41 = (t39 | t40);
    *((unsigned int *)t49) = t41;
    t42 = *((unsigned int *)t49);
    t50 = (t42 != 0);
    if (t50 == 1)
        goto LAB124;

LAB125:
LAB126:    goto LAB114;

LAB116:    t36 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB118;

LAB120:    *((unsigned int *)t31) = 1;
    goto LAB123;

LAB122:    t45 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB123;

LAB124:    t51 = *((unsigned int *)t44);
    t52 = *((unsigned int *)t49);
    *((unsigned int *)t44) = (t51 | t52);
    t55 = (t18 + 4);
    t60 = (t31 + 4);
    t53 = *((unsigned int *)t18);
    t54 = (~(t53));
    t57 = *((unsigned int *)t55);
    t58 = (~(t57));
    t59 = *((unsigned int *)t31);
    t63 = (~(t59));
    t64 = *((unsigned int *)t60);
    t65 = (~(t64));
    t80 = (t54 & t58);
    t81 = (t63 & t65);
    t66 = (~(t80));
    t67 = (~(t81));
    t68 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t68 & t66);
    t69 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t69 & t67);
    t72 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t72 & t66);
    t73 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t73 & t67);
    goto LAB126;

LAB127:    xsi_set_current_line(77, ng0);

LAB130:    xsi_set_current_line(78, ng0);
    t62 = ((char*)((ng1)));
    t70 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t70, t62, 0, 0, 1, 0LL);
    goto LAB129;

LAB132:    t13 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB134;

LAB133:    *((unsigned int *)t15) = 1;
    goto LAB134;

LAB136:    *((unsigned int *)t18) = 1;
    goto LAB139;

LAB138:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB139;

LAB140:    t26 = (t0 + 1768);
    t27 = (t26 + 56U);
    t32 = *((char **)t27);
    t33 = ((char*)((ng7)));
    memset(t19, 0, 8);
    t34 = (t32 + 4);
    if (*((unsigned int *)t34) != 0)
        goto LAB144;

LAB143:    t35 = (t33 + 4);
    if (*((unsigned int *)t35) != 0)
        goto LAB144;

LAB147:    if (*((unsigned int *)t32) < *((unsigned int *)t33))
        goto LAB146;

LAB145:    *((unsigned int *)t19) = 1;

LAB146:    memset(t31, 0, 8);
    t43 = (t19 + 4);
    t23 = *((unsigned int *)t43);
    t24 = (~(t23));
    t25 = *((unsigned int *)t19);
    t28 = (t25 & t24);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB148;

LAB149:    if (*((unsigned int *)t43) != 0)
        goto LAB150;

LAB151:    t30 = *((unsigned int *)t18);
    t37 = *((unsigned int *)t31);
    t38 = (t30 & t37);
    *((unsigned int *)t44) = t38;
    t46 = (t18 + 4);
    t47 = (t31 + 4);
    t49 = (t44 + 4);
    t39 = *((unsigned int *)t46);
    t40 = *((unsigned int *)t47);
    t41 = (t39 | t40);
    *((unsigned int *)t49) = t41;
    t42 = *((unsigned int *)t49);
    t50 = (t42 != 0);
    if (t50 == 1)
        goto LAB152;

LAB153:
LAB154:    goto LAB142;

LAB144:    t36 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB146;

LAB148:    *((unsigned int *)t31) = 1;
    goto LAB151;

LAB150:    t45 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB151;

LAB152:    t51 = *((unsigned int *)t44);
    t52 = *((unsigned int *)t49);
    *((unsigned int *)t44) = (t51 | t52);
    t55 = (t18 + 4);
    t60 = (t31 + 4);
    t53 = *((unsigned int *)t18);
    t54 = (~(t53));
    t57 = *((unsigned int *)t55);
    t58 = (~(t57));
    t59 = *((unsigned int *)t31);
    t63 = (~(t59));
    t64 = *((unsigned int *)t60);
    t65 = (~(t64));
    t80 = (t54 & t58);
    t81 = (t63 & t65);
    t66 = (~(t80));
    t67 = (~(t81));
    t68 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t68 & t66);
    t69 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t69 & t67);
    t72 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t72 & t66);
    t73 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t73 & t67);
    goto LAB154;

LAB155:    xsi_set_current_line(79, ng0);

LAB158:    xsi_set_current_line(80, ng0);
    t62 = ((char*)((ng5)));
    t70 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t70, t62, 0, 0, 1, 0LL);
    goto LAB157;

LAB160:    t13 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB162;

LAB161:    *((unsigned int *)t15) = 1;
    goto LAB162;

LAB164:    *((unsigned int *)t18) = 1;
    goto LAB167;

LAB166:    t16 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t16) = 1;
    goto LAB167;

LAB168:    t26 = (t0 + 1768);
    t27 = (t26 + 56U);
    t32 = *((char **)t27);
    t33 = ((char*)((ng8)));
    memset(t19, 0, 8);
    t34 = (t32 + 4);
    if (*((unsigned int *)t34) != 0)
        goto LAB172;

LAB171:    t35 = (t33 + 4);
    if (*((unsigned int *)t35) != 0)
        goto LAB172;

LAB175:    if (*((unsigned int *)t32) < *((unsigned int *)t33))
        goto LAB174;

LAB173:    *((unsigned int *)t19) = 1;

LAB174:    memset(t31, 0, 8);
    t43 = (t19 + 4);
    t23 = *((unsigned int *)t43);
    t24 = (~(t23));
    t25 = *((unsigned int *)t19);
    t28 = (t25 & t24);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB176;

LAB177:    if (*((unsigned int *)t43) != 0)
        goto LAB178;

LAB179:    t30 = *((unsigned int *)t18);
    t37 = *((unsigned int *)t31);
    t38 = (t30 & t37);
    *((unsigned int *)t44) = t38;
    t46 = (t18 + 4);
    t47 = (t31 + 4);
    t49 = (t44 + 4);
    t39 = *((unsigned int *)t46);
    t40 = *((unsigned int *)t47);
    t41 = (t39 | t40);
    *((unsigned int *)t49) = t41;
    t42 = *((unsigned int *)t49);
    t50 = (t42 != 0);
    if (t50 == 1)
        goto LAB180;

LAB181:
LAB182:    goto LAB170;

LAB172:    t36 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t36) = 1;
    goto LAB174;

LAB176:    *((unsigned int *)t31) = 1;
    goto LAB179;

LAB178:    t45 = (t31 + 4);
    *((unsigned int *)t31) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB179;

LAB180:    t51 = *((unsigned int *)t44);
    t52 = *((unsigned int *)t49);
    *((unsigned int *)t44) = (t51 | t52);
    t55 = (t18 + 4);
    t60 = (t31 + 4);
    t53 = *((unsigned int *)t18);
    t54 = (~(t53));
    t57 = *((unsigned int *)t55);
    t58 = (~(t57));
    t59 = *((unsigned int *)t31);
    t63 = (~(t59));
    t64 = *((unsigned int *)t60);
    t65 = (~(t64));
    t80 = (t54 & t58);
    t81 = (t63 & t65);
    t66 = (~(t80));
    t67 = (~(t81));
    t68 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t68 & t66);
    t69 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t69 & t67);
    t72 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t72 & t66);
    t73 = *((unsigned int *)t44);
    *((unsigned int *)t44) = (t73 & t67);
    goto LAB182;

LAB183:    xsi_set_current_line(81, ng0);

LAB186:    xsi_set_current_line(82, ng0);
    t62 = ((char*)((ng1)));
    t70 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t70, t62, 0, 0, 1, 0LL);
    goto LAB185;

LAB188:    t13 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB190;

LAB192:    xsi_set_current_line(83, ng0);

LAB195:    xsi_set_current_line(84, ng0);
    t16 = ((char*)((ng5)));
    t20 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t20, t16, 0, 0, 10, 0LL);
    goto LAB194;

}


extern void work_m_00000000003671080973_4195650017_init()
{
	static char *pe[] = {(void *)Always_62_0};
	xsi_register_didat("work_m_00000000003671080973_4195650017", "isim/VGA_control_isim_beh.exe.sim/work/m_00000000003671080973_4195650017.didat");
	xsi_register_executes(pe);
}
