# The latest dotnet runtime with Alpine Linux
FROM mcr.microsoft.com/dotnet/core/runtime:3.1.9-alpine3.12

# Maintainer label for public images
LABEL maintainer="Sebastien RAILLARD"

# Set the correct local timezone to Europe/Paris
# See https://wiki.alpinelinux.org/wiki/Setting_the_timezone
RUN apk --no-cache add tzdata && \
    cp /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
    echo "Europe/Paris" > /etc/timezone

# Add support for cultures in Alpine Linux
# https://andrewlock.net/dotnet-core-docker-and-cultures-solving-culture-issues-porting-a-net-core-app-from-windows-to-linux/
RUN apk add --no-cache icu-libs
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

# Install bash shell (for entry-point)
RUN apk add --no-cache bash
# Default bash prompt
COPY .bashrc /root/.bashrc

# Create a working directory and use it
RUN mkdir /work
WORKDIR /work

# Add an entry point script using bash
COPY docker-entrypoint.sh /usr/local/bin/
# For permission issue, the /bin/bash command should be added
# By default, the script is copied without exec right, whereas bash is already executable
ENTRYPOINT [ "/bin/bash" , "/usr/local/bin/docker-entrypoint.sh" ]

# Remove default command and just wait to keep the container running
CMD [ "wait-infinite" ]

# Final default command executed will be:
# /bin/bash /usr/local/bin/docker-entrypoint.sh wait-infinite
