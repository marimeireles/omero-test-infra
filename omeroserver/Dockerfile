ARG OMEROSERVER_BASE_IMAGE=openmicroscopy/omero-server:latest
FROM $OMEROSERVER_BASE_IMAGE

USER root
RUN dnf install -y -q \
    git && \
    dnf clean all
RUN echo "Omero server is running. 🐖🪽"

RUN dnf update -y && \
    dnf install -y wget bzip2 bash --allowerasing && \
    dnf clean all

RUN wget -qO- https://micro.mamba.pm/api/micromamba/linux-64/latest \
    | tar -xvj -C /usr/local/bin/ --strip-components=1 bin/micromamba && \
    eval "$(micromamba shell hook --shell bash)" && \
    micromamba create -y -n test_env -c conda-forge python=3.9 omero-py rdflib requests pytest && \
    micromamba clean --all --yes && \
    echo "omero-py, rdflib, pytest, and requests installed successfully"


COPY insert_data.sh /opt/insert_data.sh
RUN chmod +x /opt/insert_data.sh
RUN micromamba run -n test_env /opt/insert_data.sh

CMD tail -f /var/log/omero/Blitz-0.log
USER omero-server
