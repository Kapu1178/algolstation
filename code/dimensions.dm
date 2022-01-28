#define DIM_REALSPACE 1
#define DIM_PLACEHOLDER 2

///Returns a /vs_control datum based on the the Z level it is passed. If players shouldn't be on the Z-level, it returns the DIM_REALSPACE config
#define RESOLVE_DIMZAS_ZONE_CONFIG(_z_level) (SSdimension.zas_by_dim[SSdimension.dim_by_z[SSmapping.map_sectors?[num2text(_z_level)] ? _z_level : 1]])
///Returns the /vs_control of the zone of which the atom is in. Why is this get_step and not get_turf? BYOND. FIX ME
#define RESOLVE_DIMZAS_TURF_CONFIG get_step(src, 0).zone.config

///Overwrites the local VSC variable with what it should be. This belongs anywhere that vsc is touched, with the exception of /turf, where you use turf.zone.config
#define GET_LOCAL_VSC var/vs_control/vsc = RESOLVE_DIMZAS_TURF_CONFIG
