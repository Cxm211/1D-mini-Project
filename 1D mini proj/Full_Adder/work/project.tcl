set projDir "C:/Users/Xuemeng/Desktop/1D\ mini\ proj/Full_Adder/work/vivado"
set projName "Full_Adder"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/Xuemeng/Desktop/1D\ mini\ proj/Full_Adder/work/verilog/au_top_0.v" "C:/Users/Xuemeng/Desktop/1D\ mini\ proj/Full_Adder/work/verilog/reset_conditioner_1.v" "C:/Users/Xuemeng/Desktop/1D\ mini\ proj/Full_Adder/work/verilog/fsmFA_2.v" "C:/Users/Xuemeng/Desktop/1D\ mini\ proj/Full_Adder/work/verilog/counter_3.v" "C:/Users/Xuemeng/Desktop/1D\ mini\ proj/Full_Adder/work/verilog/edge_detector_4.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/Xuemeng/Desktop/1D\ mini\ proj/Full_Adder/constraint/cutomised.xdc" "C:/Users/Xuemeng/Desktop/1D\ mini\ proj/Full_Adder/work/constraint/custom.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1
