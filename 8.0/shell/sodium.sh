cd /tmp && tar xvf /tmp/libsodium-${SODIUM_VERSION}.tar.gz && cd /tmp/libsodium-${SODIUM_VERSION} \
&& ./autogen.sh && ./configure && make && make install \
&& pecl install libsodium