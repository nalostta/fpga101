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
    unisims_ver_m_00000000003266096158_2593380106_init();
    unisims_ver_m_00000000001946988858_2297623829_init();
    unisims_ver_m_00000000002399568039_2282143210_init();
    unisims_ver_m_00000000000740258969_3897995058_init();
    unisims_ver_m_00000000000740258969_1625843133_init();
    unisims_ver_m_00000000003131622635_0225263307_init();
    unisims_ver_m_00000000002922998384_0078021745_init();
    work_m_00000000003750688738_0398752447_init();
    work_m_00000000001869546112_1718534523_init();
    work_m_00000000002360659931_2192646812_init();
    work_m_00000000000411521126_0286164271_init();
    work_m_00000000001256443354_1985558087_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001256443354_1985558087");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
