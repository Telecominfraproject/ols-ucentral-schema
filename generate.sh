#!/bin/sh

set -e
set -x

./merge-schema.py schema schema ucentral.yml ucentral.schema.json 1 1
./merge-schema.py schema schema ucentral.yml ucentral.schema.pretty.json 0 1
./merge-schema.py schema schema ucentral.yml ucentral.schema.full.json 0 0
./merge-schema.py state state state.yml ucentral.state.pretty.json 0 1
./merge-schema.py capabilities capabilities connect.capabilities.yml ucentral.capabilities.pretty.json 0 1 
#./generate-reader.uc  > schemareader.uc
#./generate-example.uc > input.json
which generate-schema-doc > /dev/null
generate-schema-doc --config expand_buttons=true ucentral.schema.pretty.json docs/ucentral-schema.html
generate-schema-doc --config expand_buttons=true ucentral.state.pretty.json docs/ucentral-state.html
generate-schema-doc --config expand_buttons=true ucentral.capabilities.pretty.json docs/ucentral.capabilities.html
generate-schema-doc --config expand_buttons=true ucentral.lldp-peers.pretty.json docs/ucentral.lldp-peers.html
generate-schema-doc --config expand_buttons=true ucentral.link-state.pretty.json docs/ucentral.link-state.html

