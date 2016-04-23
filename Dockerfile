FROM debian:testing
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
	git \
        ca-certificates \
        vim-nox \
	python-pip \
	python-sqlalchemy \
	python-html2text \
	python-thrift \
	python-oauth \
    && git clone git://github.com/VitaliyRodnenko/geeknote.git /opt/geeknote \
    && cd /opt/geeknote  \
    && python setup.py install \
    && rm -rf /opt/geeknote \
    && apt-get remove -y git python-pip \
    && apt-get autoremove -y
ENTRYPOINT ["geeknote"]
