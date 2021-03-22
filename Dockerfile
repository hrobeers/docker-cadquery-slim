# Source container
FROM cadquery/cadquery:latest

# Start from base source container
FROM ubuntu:18.04

# Install runtime dependencies
RUN  set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    swig python3 \
    # TODO replace by so copy
    python3-dev libfreetype6 libfontconfig1 freeglut3-dev \
    # Cleanup apt stuff !!!
    && rm -rf /var/lib/apt/lists/*

# Now copy only the stuff we really need
COPY --from=0 /oce/cmake-build/Unix/x86_64-Release-64/* /usr/lib/x86_64-linux-gnu/
COPY --from=0 /cadquery /cadquery
COPY --from=0 /usr/lib/python3/dist-packages /usr/lib/python3/dist-packages
COPY --from=0 /usr/local/lib/python3.6/dist-packages /usr/local/lib/python3.6/dist-packages
