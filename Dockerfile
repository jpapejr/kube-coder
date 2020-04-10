
FROM codercom/code-server:3.1.0
LABEL maintainer "John Pape <jpapejr@icloud.com>"

RUN sudo apt update \
 && sudo apt install -y python python3 nodejs golang wget \
 && curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y \ 
 && sudo rm -rf /var/lib/apt/lists/*

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/coder/.cargo/bin:/home/coder/bin
EXPOSE 8080
USER coder
WORKDIR /home/coder
ENTRYPOINT ["dumb-init", "fixuid", "-q", "/usr/local/bin/code-server", "--host", "0.0.0.0", "."]
