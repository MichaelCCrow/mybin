select * from data_reception.tape_info where in_system != 'NONE' order by use_status;

select * from data_reception.tape_info where use_status = 'USED' and in_system != 'NONE' order by in_system;