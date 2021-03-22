# docker-cadquery-slim

Slimmed down docker build of cadquery/cadquery:latest

## Rationale
The official cadquery build still contains all compile time files and dependencies that add a huge amount of dead weight to the container.
cadquery-slim contains only the required run time dependencies resulting in less than a third of the original size.

## Stripping even more
This Dockerfile can serve as the basis to strip even more for specific cadquery or pythonocc script applications. You can obtain a list of specific dependencies by running the following command inside the container.

```
LD_DEBUG=libs <your_python_cmd> 2>&1 | grep "calling fini" | awk '{print $4}' | sed -e 's/$/ \\/'
```
