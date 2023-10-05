{%
	if (!services.is_present("ieee8021x"))
		return;
	let interfaces = services.lookup_interfaces("ieee8021x");
	let enable = length(interfaces);
	if (ieee8021x.mode == "radius") {
		if (!ieee8021x.radius.auth_server_addr ||
		    !ieee8021x.radius.auth_server_port ||
		    !ieee8021x.radius.auth_server_secret) {
			warn(invalid radius configuration);
			enable = false;
		}
	}
	services.set_enabled("ieee8021x", enable);
	if (!enable)
		return;

	let ports = [];
	for (let p in ieee8021x.port_filter)
		if (ethernet.ports[p])
			push(ports, ethernet.ports[p].netdev);
	cursor.load("system")
	let certs = cursor.get_all("system", "@certificates[-1]")
%}
# IEEE8021x service configuration

add ieee8021x config 
{%	if (ieee8021x.mode == "radius"): %}
add ieee8021x config 
set ieee8021x.@config[-1].nas_identifier={{ s(ieee8021x.radius.nas_identifier) }}
set ieee8021x.@config[-1].auth_server_addr={{ s(ieee8021x.radius.auth_server_addr) }}
set ieee8021x.@config[-1].auth_server_port={{ s(ieee8021x.radius.auth_server_port) }}
set ieee8021x.@config[-1].auth_server_secret={{ s(ieee8021x.radius.auth_server_secret) }}
set ieee8021x.@config[-1].acct_server_addr={{ s(ieee8021x.radius.acct_server_addr) }}
set ieee8021x.@config[-1].acct_server_port={{ s(ieee8021x.radius.acct_server_port) }}
set ieee8021x.@config[-1].acct_server_secret={{ s(ieee8021x.radius.acct_server_secret) }}
set ieee8021x.@config[-1].coa_server_addr={{ s(ieee8021x.radius.coa_server_addr) }}
set ieee8021x.@config[-1].coa_server_port={{ s(ieee8021x.radius.coa_server_port) }}
set ieee8021x.@config[-1].coa_server_secret={{ s(ieee8021x.radius.coa_server_secret) }}
{%	else
		files.add_named("/var/run/hostapd-ieee8021x.eap_user", render("../eap_users.uc", { users: ieee8021x.users })) %}
	endif
%}
set ieee8021x.@config[-1].ca={{ s(certs.ca) }}
set ieee8021x.@config[-1].cert={{ s(certs.cert) }}
set ieee8021x.@config[-1].key={{ s(certs.key) }}

{%	for (let port in ports): %}
add_list ieee8021x.@config[-1].ports={{ s(port) }}
set network.{{ replace(port, '.', '_') }}=device
set network.@device[-1].name={{ s(port) }}
set network.@device[-1].auth='1'
{%	endfor %}
