r=$(hyperion-remote -l | tail -n +7 | jq -r '.effects | length')

r="$(((RANDOM % r) - 3))"

command="hyperion-remote -l | tail -n +5 | jq -r '.effects[$r] | .name'"
effect="$(eval $command)"

hyperion-remote -e "$effect"

# to get the effects array
# hyperion-remote -l | tail -n +5 | jq  '.effects[].name' | jq -s
