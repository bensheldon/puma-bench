# Puma Bench

Environment variables

- `PUMA_THREADS=3`
- `USE_THRUSTER=1` for thruster+puma or `USE_THRUSTER=0` for puma alone
- Disable Thruster Gzip `THRUSTER_GZIP_COMPRESSION_ENABLED=0`
- Enable puma keepalive: `PUMA_KEEP_ALIVE=1` (disabled by default)
