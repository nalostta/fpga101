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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    xilinxcorelib_ver_m_00000000001358910285_2782444308_init();
    xilinxcorelib_ver_m_00000000001358910285_2899632636_init();
    xilinxcorelib_ver_m_00000000001687936702_0968420820_init();
    xilinxcorelib_ver_m_00000000000277421008_1461238772_init();
    xilinxcorelib_ver_m_00000000001603977570_0608931158_init();
    work_m_00000000002485044841_0450250084_init();
    work_m_00000000003063665272_0286164271_init();
    work_m_00000000003081973520_1949178628_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003081973520_1949178628");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
