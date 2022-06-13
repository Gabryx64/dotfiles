#!/usr/bin/sh

export SEARX_PORT=727
pushd /home/gabry/insts/searxng
docker run --rm \
	-d -p ${SEARX_PORT}:8080 \
	-v "${PWD}/searxng:/etc/searxng" \
	-e "BASE_URL=http://localhost:$SEARX_PORT/" \
	-e "INSTANCE_NAME=SearXNG" \
	searxng/searxng
popd

