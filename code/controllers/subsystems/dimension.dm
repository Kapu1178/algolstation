SUBSYSTEM_DEF(dimension)
	name = "Dimension"
	wait = 10 SECONDS
	flags = SS_NO_FIRE

	var/list/dim_by_z = list()
	var/list/zas_by_dim = list()

/datum/controller/subsystem/dimension/Initialize(start_timeofday)
	. = ..()
	zas_by_dim += DIM_REALSPACE
	zas_by_dim[DIM_REALSPACE] = vsc

	var/vs_control/zas_config_alt = new
	zas_by_dim += num2text(DIM_PLACEHOLDER)
	zas_by_dim[DIM_PLACEHOLDER] = zas_config_alt

/datum/controller/subsystem/dimension/proc/set_dimension_atmos(dimension)
	//zas_by_dim[dimension].vars = vsc.vars.Copy()
