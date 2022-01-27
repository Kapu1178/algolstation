#define DIM_REALSPACE 1
#define DIM_PLACEHOLDER 2

#define RESOLVE_DIMZAS_ZONE_CONFIG (SSmapping.map_sectors?[src.loc.z] ? SSdimension.zas_by_dim[SSdimension.dim_by_z[SSmapping.map_sectors[src.loc.z]]] : vsc)
