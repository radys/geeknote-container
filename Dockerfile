FROM python:2
RUN git clone git://github.com/VitaliyRodnenko/geeknote.git /opt/geeknote \
    && cd /opt/geeknote  \
    && python setup.py install \
    && rm -rf /opt/geeknote \
    && apt-get update \
    && apt-get install -y --no-install-recommends vim-tiny
ENTRYPOINT ["geeknote"]    
