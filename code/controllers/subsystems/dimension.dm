SUBSYSTEM_DEF(dimension)
	name = "Dimension"
	wait = 10 SECONDS
	flags = SS_NO_FIRE

	var/list/dim_by_z = list() //list(DIM_REALSPACE, DIM_REALSPACE, DIM_REALSPACE, DIM_REALSPACE, DIM_REALSPACE)
	var/list/vs_control/zas_by_dim = list()

/datum/controller/subsystem/dimension/Initialize(start_timeofday)
	. = ..()
	zas_by_dim += DIM_REALSPACE
	zas_by_dim[DIM_REALSPACE] = vsc

	var/vs_control/zas_config_alt = new
	zas_by_dim += DIM_PLACEHOLDER
	zas_by_dim[DIM_PLACEHOLDER] = zas_config_alt
	zas_by_dim[DIM_PLACEHOLDER].plc.EYE_BURNS = FALSE

	for(var/level in GLOB.using_map.station_levels)
		dim_by_z += DIM_REALSPACE

/datum/controller/subsystem/dimension/proc/shift_z_dimension(z_level, dimension)
	if(dim_by_z[z_level] == dimension)
		return

	dim_by_z[z_level] = dimension
	for(var/zone/atmos_zone in SSair.zones)
		SEND_SIGNAL(atmos_zone, COMSIG_DIMENSION_SHIFT, z_level, dimension)
