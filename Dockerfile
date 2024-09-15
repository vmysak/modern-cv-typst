FROM rust:1.81

WORKDIR /opt/cv

ENV CV_NAME="cv"

RUN cargo install typst-cli@0.11.1; \
    apt-get update; \ 
    apt-get install -y fonts-font-awesome

CMD /bin/bash -c 'typst watch --root="/opt/cv" ./src/my-cv.typ "./target/${CV_NAME}.pdf"; /bin/bash'
