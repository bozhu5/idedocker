# FROM phusion/baseimage
#ARG cuda_version=9.0
#ARG cudnn_version=7
#FROM nvidia/cuda:${cuda_version}-cudnn${cudnn_version}-devel
FROM tensorflow/tensorflow:1.12.0

RUN mkdir /workspace 
WORKDIR /workspace 
RUN add-apt-repository ppa:jonathonf/vim
RUN apt-get update
RUN apt-get install -y vim \
                        git
RUN git clone --depth=1 https://github.com/amix/vimrc.git /root/.vim_runtime
RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
# COPY ./requirements.txt .
# RUN pip install -r requirements.txt

RUN sh ~/.vim_runtime/install_awesome_vimrc.sh
COPY .vimrc /root/.vimrc
COPY my_configs.vim /root/.vim_runtime/my_configs.vim

#Install YouCompleteMe Vim Plugin
RUN apt install -y build-essential cmake python3-dev
RUN vim +PluginInstall +qall

#RUN cd ~/.vim/bundle/YouCompleteMe
RUN python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer
# RUN vim +PluginInstall +qall

COPY ./requirements.txt /workspace/requirements.txt
RUN pip install -r /workspace/requirements.txt


ENV TERM=screen-256color
#COPY . .
