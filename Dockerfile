FROM continuumio/miniconda3:latest
COPY . /root/provision
RUN mkdir -p ~/.local/share ~/.cache ~/.jupyter \
    && conda config --set channel_priority strict \
    && echo "Contents of ~/provision/hpmoc.txt to be installed:" \
    && cat ~/provision/hpmoc.txt \
    && conda install -y --file ~/provision/hpmoc.txt \
    && pip install healpy \
    && echo "Python version: `which python`" \
    && conda clean -y --all \
    && rm -rf /root/provision
WORKDIR /root
