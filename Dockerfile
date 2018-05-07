FROM debian:latest
ADD getplastic.py /root/getplastic.py
ADD vimrc /root/.vimrc
RUN apt-get update
RUN apt-get install -y --no-install-recommends git ca-certificates vim-nox python-pip python-sqlalchemy python-html2text python-thrift python-oauth python-setuptools
RUN git clone https://github.com/jeffkowalski/geeknote.git /opt/geeknote 
RUN pip2 install proxyenv markdown2 lxml evernote beautifulsoup4  
RUN cd /opt/geeknote ; python setup.py install 
RUN cd /root ; python /root/getplastic.py 
RUN rm -f /root/getplastic.py 
RUN rm -rf /opt/geeknote 
RUN apt-get remove -y git python-pip 
RUN apt-get autoremove -y 
RUN apt-get clean
ENTRYPOINT ["geeknote"]
