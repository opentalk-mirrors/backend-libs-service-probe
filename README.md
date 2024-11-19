# Service Probe

This crate provides an easy way to start a HTTP server that can be used for
making the status of a service transparent to observers. The main use case is
to communicate information about the health status of a service in containerized
environments.

The "main" service does not need to provide a HTTP server on its own, the probe
will spin up its own minimalistic HTTP server.
