// Automatically generated from ./ucentral.schema.pretty.json - do not edit!
"use strict";

function matchUcCidr4(value) {
	let m = match(value, /^(auto|[0-9.]+)\/([0-9]+)$/);
	return m ? ((m[1] == "auto" || length(iptoarr(m[1])) == 4) && +m[2] <= 32) : false;
}

function matchUcCidr6(value) {
	let m = match(value, /^(auto|[0-9a-fA-F:.]+)\/([0-9]+)$/);
	return m ? ((m[1] == "auto" || length(iptoarr(m[1])) == 16) && +m[2] <= 128) : false;
}

function matchUcCidr(value) {
	let m = match(value, /^(auto|[0-9a-fA-F:.]+)\/([0-9]+)$/);
	if (!m) return false;
	let l = (m[1] == "auto") ? 16 : length(iptoarr(m[1]));
	return (l > 0 && +m[2] <= (l * 8));
}

function matchUcMac(value) {
	return match(value, /^[0-9a-f][0-9a-f]:[0-9a-f][0-9a-f]:[0-9a-f][0-9a-f]:[0-9a-f][0-9a-f]:[0-9a-f][0-9a-f]:[0-9a-f][0-9a-f]$/i);
}

function matchUcHost(value) {
	if (length(iptoarr(value)) != 0) return true;
	if (length(value) > 255) return false;
	let labels = split(value, ".");
	return (length(filter(labels, label => !match(label, /^([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9])$/))) == 0 && length(labels) > 0);
}

function matchUcTimeout(value) {
	return match(value, /^[0-9]+[smhdw]$/);
}

function matchUcBase64(value) {
	return b64dec(value) != null;
}

function matchUcPortrange(value) {
	let ports = match(value, /^([0-9]|[1-9][0-9]*)(-([0-9]|[1-9][0-9]*))?$/);
	if (!ports) return false;
	let min = +ports[1], max = ports[2] ? +ports[3] : min;
	return (min <= 65535 && max <= 65535 && max >= min);
}

function matchHostname(value) {
	if (length(value) > 255) return false;
	let labels = split(value, ".");
	return (length(filter(labels, label => !match(label, /^([a-zA-Z0-9]{1,2}|[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9])$/))) == 0 && length(labels) > 0);
}

function matchUcFqdn(value) {
	if (length(value) > 255) return false;
	let labels = split(value, ".");
	return (length(filter(labels, label => !match(label, /^([a-zA-Z0-9]{1,2}|[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9])$/))) == 0 && length(labels) > 1);
}

function matchUcIp(value) {
	return (length(iptoarr(value)) == 4 || length(iptoarr(value)) == 16);
}

function matchIpv4(value) {
	return (length(iptoarr(value)) == 4);
}

function matchIpv6(value) {
	return (length(iptoarr(value)) == 16);
}

function matchUri(value) {
	if (index(value, "data:") == 0) return true;
	let m = match(value, /^[a-z+-]+:\/\/([^\/]+).*$/);
	if (!m) return false;
	if (length(iptoarr(m[1])) != 0) return true;
	if (length(m[1]) > 255) return false;
	let labels = split(m[1], ".");
	return (length(filter(labels, label => !match(label, /^([a-zA-Z0-9]|[a-zA-Z0-9][a-zA-Z0-9-]{0,61}[a-zA-Z0-9])$/))) == 0 && length(labels) > 0);
}

function instantiateUnit(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseName(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "name")) {
			obj.name = parseName(location + "/name", value["name"], errors);
		}

		function parseHostname(location, value, errors) {
			if (type(value) == "string") {
				if (!matchHostname(value))
					push(errors, [ location, "must be a valid hostname" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "hostname")) {
			obj.hostname = parseHostname(location + "/hostname", value["hostname"], errors);
		}

		function parseLocation(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "location")) {
			obj.location = parseLocation(location + "/location", value["location"], errors);
		}

		function parseTimezone(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "timezone")) {
			obj.timezone = parseTimezone(location + "/timezone", value["timezone"], errors);
		}

		function parseLedsActive(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "leds-active")) {
			obj.leds_active = parseLedsActive(location + "/leds-active", value["leds-active"], errors);
		}
		else {
			obj.leds_active = true;
		}

		function parseRandomPassword(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "random-password")) {
			obj.random_password = parseRandomPassword(location + "/random-password", value["random-password"], errors);
		}
		else {
			obj.random_password = false;
		}

		function parseSystemPassword(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "system-password")) {
			obj.system_password = parseSystemPassword(location + "/system-password", value["system-password"], errors);
		}

		function parseBeaconAdvertisement(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseDeviceName(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "device-name")) {
					obj.device_name = parseDeviceName(location + "/device-name", value["device-name"], errors);
				}

				function parseDeviceSerial(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "device-serial")) {
					obj.device_serial = parseDeviceSerial(location + "/device-serial", value["device-serial"], errors);
				}

				function parseNetworkId(location, value, errors) {
					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "network-id")) {
					obj.network_id = parseNetworkId(location + "/network-id", value["network-id"], errors);
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "beacon-advertisement")) {
			obj.beacon_advertisement = parseBeaconAdvertisement(location + "/beacon-advertisement", value["beacon-advertisement"], errors);
		}

		function parsePoe(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parsePowerManagement(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				if (exists(value, "power-management")) {
					obj.power_management = parsePowerManagement(location + "/power-management", value["power-management"], errors);
				}

				function parseUsageThreshold(location, value, errors) {
					if (!(type(value) in [ "int", "double" ]))
						push(errors, [ location, "must be of type number" ]);

					return value;
				}

				if (exists(value, "usage-threshold")) {
					obj.usage_threshold = parseUsageThreshold(location + "/usage-threshold", value["usage-threshold"], errors);
				}
				else {
					obj.usage_threshold = 90;
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "poe")) {
			obj.poe = parsePoe(location + "/poe", value["poe"], errors);
		}

		function parseMulticast(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseIgmpSnoopingEnable(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "igmp-snooping-enable")) {
					obj.igmp_snooping_enable = parseIgmpSnoopingEnable(location + "/igmp-snooping-enable", value["igmp-snooping-enable"], errors);
				}
				else {
					obj.igmp_snooping_enable = true;
				}

				function parseMldSnoopingEnable(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "mld-snooping-enable")) {
					obj.mld_snooping_enable = parseMldSnoopingEnable(location + "/mld-snooping-enable", value["mld-snooping-enable"], errors);
				}
				else {
					obj.mld_snooping_enable = true;
				}

				function parseUnknownMulticastFloodControl(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "unknown-multicast-flood-control")) {
					obj.unknown_multicast_flood_control = parseUnknownMulticastFloodControl(location + "/unknown-multicast-flood-control", value["unknown-multicast-flood-control"], errors);
				}
				else {
					obj.unknown_multicast_flood_control = false;
				}

				function parseQuerierEnable(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "querier-enable")) {
					obj.querier_enable = parseQuerierEnable(location + "/querier-enable", value["querier-enable"], errors);
				}
				else {
					obj.querier_enable = false;
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "multicast")) {
			obj.multicast = parseMulticast(location + "/multicast", value["multicast"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateGlobals(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseIpv4Network(location, value, errors) {
			if (type(value) == "string") {
				if (!matchUcCidr4(value))
					push(errors, [ location, "must be a valid IPv4 CIDR" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "ipv4-network")) {
			obj.ipv4_network = parseIpv4Network(location + "/ipv4-network", value["ipv4-network"], errors);
		}

		function parseIpv6Network(location, value, errors) {
			if (type(value) == "string") {
				if (!matchUcCidr6(value))
					push(errors, [ location, "must be a valid IPv6 CIDR" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "ipv6-network")) {
			obj.ipv6_network = parseIpv6Network(location + "/ipv6-network", value["ipv6-network"], errors);
		}

		function parseIpv4Blackhole(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parsePrefix(location, value, errors) {
							if (type(value) == "string") {
								if (!matchUcCidr4(value))
									push(errors, [ location, "must be a valid IPv4 CIDR" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "prefix")) {
							obj.prefix = parsePrefix(location + "/prefix", value["prefix"], errors);
						}

						function parseVrf(location, value, errors) {
							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "vrf")) {
							obj.vrf = parseVrf(location + "/vrf", value["vrf"], errors);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "ipv4-blackhole")) {
			obj.ipv4_blackhole = parseIpv4Blackhole(location + "/ipv4-blackhole", value["ipv4-blackhole"], errors);
		}

		function parseIpv4Unreachable(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parsePrefix(location, value, errors) {
							if (type(value) == "string") {
								if (!matchUcCidr4(value))
									push(errors, [ location, "must be a valid IPv4 CIDR" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "prefix")) {
							obj.prefix = parsePrefix(location + "/prefix", value["prefix"], errors);
						}

						function parseVrf(location, value, errors) {
							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "vrf")) {
							obj.vrf = parseVrf(location + "/vrf", value["vrf"], errors);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "ipv4-unreachable")) {
			obj.ipv4_unreachable = parseIpv4Unreachable(location + "/ipv4-unreachable", value["ipv4-unreachable"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateEthernet(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseSelectPorts(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "select-ports")) {
			obj.select_ports = parseSelectPorts(location + "/select-ports", value["select-ports"], errors);
		}

		function parseName(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "name")) {
			obj.name = parseName(location + "/name", value["name"], errors);
		}

		function parseSpeed(location, value, errors) {
			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			if (!(value in [ 10, 100, 1000, 2500, 5000, 10000, 25000, 40000, 50000, 100000, 200000 ]))
				push(errors, [ location, "must be one of 10, 100, 1000, 2500, 5000, 10000, 25000, 40000, 50000, 100000 or 200000" ]);

			return value;
		}

		if (exists(value, "speed")) {
			obj.speed = parseSpeed(location + "/speed", value["speed"], errors);
		}
		else {
			obj.speed = 1000;
		}

		function parseDuplex(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (!(value in [ "half", "full" ]))
				push(errors, [ location, "must be one of \"half\" or \"full\"" ]);

			return value;
		}

		if (exists(value, "duplex")) {
			obj.duplex = parseDuplex(location + "/duplex", value["duplex"], errors);
		}
		else {
			obj.duplex = "full";
		}

		function parseEnabled(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "enabled")) {
			obj.enabled = parseEnabled(location + "/enabled", value["enabled"], errors);
		}
		else {
			obj.enabled = true;
		}

		function parseServices(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "services")) {
			obj.services = parseServices(location + "/services", value["services"], errors);
		}

		function parsePoe(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseAdminMode(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "admin-mode")) {
					obj.admin_mode = parseAdminMode(location + "/admin-mode", value["admin-mode"], errors);
				}
				else {
					obj.admin_mode = false;
				}

				function parseDoReset(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "do-reset")) {
					obj.do_reset = parseDoReset(location + "/do-reset", value["do-reset"], errors);
				}

				function parseDetection(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				if (exists(value, "detection")) {
					obj.detection = parseDetection(location + "/detection", value["detection"], errors);
				}
				else {
					obj.detection = "dot3bt";
				}

				function parsePowerLimit(location, value, errors) {
					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "power-limit")) {
					obj.power_limit = parsePowerLimit(location + "/power-limit", value["power-limit"], errors);
				}
				else {
					obj.power_limit = 99900;
				}

				function parsePriority(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				if (exists(value, "priority")) {
					obj.priority = parsePriority(location + "/priority", value["priority"], errors);
				}
				else {
					obj.priority = "low";
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "poe")) {
			obj.poe = parsePoe(location + "/poe", value["poe"], errors);
		}

		function parseIeee8021x(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseIsAuthenticator(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "is-authenticator")) {
					obj.is_authenticator = parseIsAuthenticator(location + "/is-authenticator", value["is-authenticator"], errors);
				}
				else {
					obj.is_authenticator = false;
				}

				function parseAuthenticationMode(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "force-authorized", "force-unauthorized", "auto" ]))
						push(errors, [ location, "must be one of \"force-authorized\", \"force-unauthorized\" or \"auto\"" ]);

					return value;
				}

				if (exists(value, "authentication-mode")) {
					obj.authentication_mode = parseAuthenticationMode(location + "/authentication-mode", value["authentication-mode"], errors);
				}
				else {
					obj.authentication_mode = "force-authorized";
				}

				function parseHostMode(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "multi-auth", "multi-domain", "multi-host", "single-host" ]))
						push(errors, [ location, "must be one of \"multi-auth\", \"multi-domain\", \"multi-host\" or \"single-host\"" ]);

					return value;
				}

				if (exists(value, "host-mode")) {
					obj.host_mode = parseHostMode(location + "/host-mode", value["host-mode"], errors);
				}
				else {
					obj.host_mode = "multi-auth";
				}

				function parseGuestVlan(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 4094)
							push(errors, [ location, "must be lower than or equal to 4094" ]);

						if (value < 1)
							push(errors, [ location, "must be bigger than or equal to 1" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "guest-vlan")) {
					obj.guest_vlan = parseGuestVlan(location + "/guest-vlan", value["guest-vlan"], errors);
				}

				function parseUnauthenticatedVlan(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 4094)
							push(errors, [ location, "must be lower than or equal to 4094" ]);

						if (value < 1)
							push(errors, [ location, "must be bigger than or equal to 1" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "unauthenticated-vlan")) {
					obj.unauthenticated_vlan = parseUnauthenticatedVlan(location + "/unauthenticated-vlan", value["unauthenticated-vlan"], errors);
				}

				function parseMacAddressBypass(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "mac-address-bypass")) {
					obj.mac_address_bypass = parseMacAddressBypass(location + "/mac-address-bypass", value["mac-address-bypass"], errors);
				}

				function parseMacAddressBypassTimeoutMinutes(location, value, errors) {
					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "mac-address-bypass-timeout-minutes")) {
					obj.mac_address_bypass_timeout_minutes = parseMacAddressBypassTimeoutMinutes(location + "/mac-address-bypass-timeout-minutes", value["mac-address-bypass-timeout-minutes"], errors);
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "ieee8021x")) {
			obj.ieee8021x = parseIeee8021x(location + "/ieee8021x", value["ieee8021x"], errors);
		}

		function parseTrunkGroup(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 64)
					push(errors, [ location, "must be lower than or equal to 64" ]);

				if (value < 1)
					push(errors, [ location, "must be bigger than or equal to 1" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "trunk-group")) {
			obj.trunk_group = parseTrunkGroup(location + "/trunk-group", value["trunk-group"], errors);
		}

		function parseLacpConfig(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseLacpEnable(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lacp-enable")) {
					obj.lacp_enable = parseLacpEnable(location + "/lacp-enable", value["lacp-enable"], errors);
				}
				else {
					obj.lacp_enable = false;
				}

				function parseLacpRole(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "actor", "partner" ]))
						push(errors, [ location, "must be one of \"actor\" or \"partner\"" ]);

					return value;
				}

				if (exists(value, "lacp-role")) {
					obj.lacp_role = parseLacpRole(location + "/lacp-role", value["lacp-role"], errors);
				}
				else {
					obj.lacp_role = "actor";
				}

				function parseLacpMode(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "active", "passive" ]))
						push(errors, [ location, "must be one of \"active\" or \"passive\"" ]);

					return value;
				}

				if (exists(value, "lacp-mode")) {
					obj.lacp_mode = parseLacpMode(location + "/lacp-mode", value["lacp-mode"], errors);
				}
				else {
					obj.lacp_mode = "passive";
				}

				function parseLacpPortAdminKey(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 65535)
							push(errors, [ location, "must be lower than or equal to 65535" ]);

						if (value < 1)
							push(errors, [ location, "must be bigger than or equal to 1" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "lacp-port-admin-key")) {
					obj.lacp_port_admin_key = parseLacpPortAdminKey(location + "/lacp-port-admin-key", value["lacp-port-admin-key"], errors);
				}
				else {
					obj.lacp_port_admin_key = 1;
				}

				function parseLacpPortPriority(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 65535)
							push(errors, [ location, "must be lower than or equal to 65535" ]);

						if (value < 1)
							push(errors, [ location, "must be bigger than or equal to 1" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "lacp-port-priority")) {
					obj.lacp_port_priority = parseLacpPortPriority(location + "/lacp-port-priority", value["lacp-port-priority"], errors);
				}
				else {
					obj.lacp_port_priority = 32768;
				}

				function parseLacpSystemPriority(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 65535)
							push(errors, [ location, "must be lower than or equal to 65535" ]);

						if (value < 1)
							push(errors, [ location, "must be bigger than or equal to 1" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "lacp-system-priority")) {
					obj.lacp_system_priority = parseLacpSystemPriority(location + "/lacp-system-priority", value["lacp-system-priority"], errors);
				}
				else {
					obj.lacp_system_priority = 32768;
				}

				function parseLacpPchanAdminKey(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 65535)
							push(errors, [ location, "must be lower than or equal to 65535" ]);

						if (value < 1)
							push(errors, [ location, "must be bigger than or equal to 1" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "lacp-pchan-admin-key")) {
					obj.lacp_pchan_admin_key = parseLacpPchanAdminKey(location + "/lacp-pchan-admin-key", value["lacp-pchan-admin-key"], errors);
				}

				function parseLacpTimeout(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "short", "long" ]))
						push(errors, [ location, "must be one of \"short\" or \"long\"" ]);

					return value;
				}

				if (exists(value, "lacp-timeout")) {
					obj.lacp_timeout = parseLacpTimeout(location + "/lacp-timeout", value["lacp-timeout"], errors);
				}
				else {
					obj.lacp_timeout = "long";
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "lacp-config")) {
			obj.lacp_config = parseLacpConfig(location + "/lacp-config", value["lacp-config"], errors);
		}

		function parseLldpInterfaceConfig(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseLldpAdminStatus(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "rx", "tx", "rx-tx" ]))
						push(errors, [ location, "must be one of \"rx\", \"tx\" or \"rx-tx\"" ]);

					return value;
				}

				if (exists(value, "lldp-admin-status")) {
					obj.lldp_admin_status = parseLldpAdminStatus(location + "/lldp-admin-status", value["lldp-admin-status"], errors);
				}

				function parseLldpBasicTlvMgmtIpV4(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-basic-tlv-mgmt-ip-v4")) {
					obj.lldp_basic_tlv_mgmt_ip_v4 = parseLldpBasicTlvMgmtIpV4(location + "/lldp-basic-tlv-mgmt-ip-v4", value["lldp-basic-tlv-mgmt-ip-v4"], errors);
				}
				else {
					obj.lldp_basic_tlv_mgmt_ip_v4 = true;
				}

				function parseLldpBasicTlvMgmtIpV6(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-basic-tlv-mgmt-ip-v6")) {
					obj.lldp_basic_tlv_mgmt_ip_v6 = parseLldpBasicTlvMgmtIpV6(location + "/lldp-basic-tlv-mgmt-ip-v6", value["lldp-basic-tlv-mgmt-ip-v6"], errors);
				}
				else {
					obj.lldp_basic_tlv_mgmt_ip_v6 = false;
				}

				function parseLldpBasicTlvPortDescr(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-basic-tlv-port-descr")) {
					obj.lldp_basic_tlv_port_descr = parseLldpBasicTlvPortDescr(location + "/lldp-basic-tlv-port-descr", value["lldp-basic-tlv-port-descr"], errors);
				}
				else {
					obj.lldp_basic_tlv_port_descr = true;
				}

				function parseLldpBasicTlvSysCapab(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-basic-tlv-sys-capab")) {
					obj.lldp_basic_tlv_sys_capab = parseLldpBasicTlvSysCapab(location + "/lldp-basic-tlv-sys-capab", value["lldp-basic-tlv-sys-capab"], errors);
				}
				else {
					obj.lldp_basic_tlv_sys_capab = true;
				}

				function parseLldpBasicTlvSysDescr(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-basic-tlv-sys-descr")) {
					obj.lldp_basic_tlv_sys_descr = parseLldpBasicTlvSysDescr(location + "/lldp-basic-tlv-sys-descr", value["lldp-basic-tlv-sys-descr"], errors);
				}
				else {
					obj.lldp_basic_tlv_sys_descr = true;
				}

				function parseLldpBasicTlvSysName(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-basic-tlv-sys-name")) {
					obj.lldp_basic_tlv_sys_name = parseLldpBasicTlvSysName(location + "/lldp-basic-tlv-sys-name", value["lldp-basic-tlv-sys-name"], errors);
				}
				else {
					obj.lldp_basic_tlv_sys_name = true;
				}

				function parseLldpDot1TlvProtoIdent(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-dot1-tlv-proto-ident")) {
					obj.lldp_dot1_tlv_proto_ident = parseLldpDot1TlvProtoIdent(location + "/lldp-dot1-tlv-proto-ident", value["lldp-dot1-tlv-proto-ident"], errors);
				}
				else {
					obj.lldp_dot1_tlv_proto_ident = true;
				}

				function parseLldpDot1TlvProtoVid(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-dot1-tlv-proto-vid")) {
					obj.lldp_dot1_tlv_proto_vid = parseLldpDot1TlvProtoVid(location + "/lldp-dot1-tlv-proto-vid", value["lldp-dot1-tlv-proto-vid"], errors);
				}
				else {
					obj.lldp_dot1_tlv_proto_vid = true;
				}

				function parseLldpDot1TlvPvid(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-dot1-tlv-pvid")) {
					obj.lldp_dot1_tlv_pvid = parseLldpDot1TlvPvid(location + "/lldp-dot1-tlv-pvid", value["lldp-dot1-tlv-pvid"], errors);
				}
				else {
					obj.lldp_dot1_tlv_pvid = true;
				}

				function parseLldpDot1TlvVlanName(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-dot1-tlv-vlan-name")) {
					obj.lldp_dot1_tlv_vlan_name = parseLldpDot1TlvVlanName(location + "/lldp-dot1-tlv-vlan-name", value["lldp-dot1-tlv-vlan-name"], errors);
				}
				else {
					obj.lldp_dot1_tlv_vlan_name = true;
				}

				function parseLldpDot3TlvLinkAgg(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-dot3-tlv-link-agg")) {
					obj.lldp_dot3_tlv_link_agg = parseLldpDot3TlvLinkAgg(location + "/lldp-dot3-tlv-link-agg", value["lldp-dot3-tlv-link-agg"], errors);
				}
				else {
					obj.lldp_dot3_tlv_link_agg = true;
				}

				function parseLldpDot3TlvMacPhy(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-dot3-tlv-mac-phy")) {
					obj.lldp_dot3_tlv_mac_phy = parseLldpDot3TlvMacPhy(location + "/lldp-dot3-tlv-mac-phy", value["lldp-dot3-tlv-mac-phy"], errors);
				}
				else {
					obj.lldp_dot3_tlv_mac_phy = true;
				}

				function parseLldpDot3TlvMaxFrame(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-dot3-tlv-max-frame")) {
					obj.lldp_dot3_tlv_max_frame = parseLldpDot3TlvMaxFrame(location + "/lldp-dot3-tlv-max-frame", value["lldp-dot3-tlv-max-frame"], errors);
				}
				else {
					obj.lldp_dot3_tlv_max_frame = true;
				}

				function parseLldpDot3TlvPoe(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-dot3-tlv-poe")) {
					obj.lldp_dot3_tlv_poe = parseLldpDot3TlvPoe(location + "/lldp-dot3-tlv-poe", value["lldp-dot3-tlv-poe"], errors);
				}
				else {
					obj.lldp_dot3_tlv_poe = true;
				}

				function parseLldpMedLocationCivicAddr(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parseLldpMedLocationCivicAddrAdminStatus(location, value, errors) {
							if (type(value) != "bool")
								push(errors, [ location, "must be of type boolean" ]);

							return value;
						}

						if (exists(value, "lldp-med-location-civic-addr-admin-status")) {
							obj.lldp_med_location_civic_addr_admin_status = parseLldpMedLocationCivicAddrAdminStatus(location + "/lldp-med-location-civic-addr-admin-status", value["lldp-med-location-civic-addr-admin-status"], errors);
						}
						else {
							obj.lldp_med_location_civic_addr_admin_status = false;
						}

						function parseLldpMedLocationCivicCountryCode(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "lldp-med-location-civic-country-code")) {
							obj.lldp_med_location_civic_country_code = parseLldpMedLocationCivicCountryCode(location + "/lldp-med-location-civic-country-code", value["lldp-med-location-civic-country-code"], errors);
						}

						function parseLldpMedLocationCivicDeviceType(location, value, errors) {
							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "lldp-med-location-civic-device-type")) {
							obj.lldp_med_location_civic_device_type = parseLldpMedLocationCivicDeviceType(location + "/lldp-med-location-civic-device-type", value["lldp-med-location-civic-device-type"], errors);
						}

						function parseLldpMedLocationCivicCa(location, value, errors) {
							if (type(value) == "array") {
								function parseItem(location, value, errors) {
									if (type(value) == "object") {
										let obj = {};

										function parseLldpMedLocationCivicCaType(location, value, errors) {
											if (type(value) in [ "int", "double" ]) {
												if (value > 255)
													push(errors, [ location, "must be lower than or equal to 255" ]);

												if (value < 0)
													push(errors, [ location, "must be bigger than or equal to 0" ]);

											}

											if (type(value) != "int")
												push(errors, [ location, "must be of type integer" ]);

											return value;
										}

										if (exists(value, "lldp-med-location-civic-ca-type")) {
											obj.lldp_med_location_civic_ca_type = parseLldpMedLocationCivicCaType(location + "/lldp-med-location-civic-ca-type", value["lldp-med-location-civic-ca-type"], errors);
										}

										function parseLldpMedLocationCivicCaValue(location, value, errors) {
											if (type(value) == "string") {
												if (length(value) > 32)
													push(errors, [ location, "must be at most 32 characters long" ]);

												if (length(value) < 1)
													push(errors, [ location, "must be at least 1 characters long" ]);

											}

											if (type(value) != "string")
												push(errors, [ location, "must be of type string" ]);

											return value;
										}

										if (exists(value, "lldp-med-location-civic-ca-value")) {
											obj.lldp_med_location_civic_ca_value = parseLldpMedLocationCivicCaValue(location + "/lldp-med-location-civic-ca-value", value["lldp-med-location-civic-ca-value"], errors);
										}

										return obj;
									}

									if (type(value) != "object")
										push(errors, [ location, "must be of type object" ]);

									return value;
								}

								return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
							}

							if (type(value) != "array")
								push(errors, [ location, "must be of type array" ]);

							return value;
						}

						if (exists(value, "lldp-med-location-civic-ca")) {
							obj.lldp_med_location_civic_ca = parseLldpMedLocationCivicCa(location + "/lldp-med-location-civic-ca", value["lldp-med-location-civic-ca"], errors);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				if (exists(value, "lldp-med-location-civic-addr")) {
					obj.lldp_med_location_civic_addr = parseLldpMedLocationCivicAddr(location + "/lldp-med-location-civic-addr", value["lldp-med-location-civic-addr"], errors);
				}

				function parseLldpMedNotification(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-med-notification")) {
					obj.lldp_med_notification = parseLldpMedNotification(location + "/lldp-med-notification", value["lldp-med-notification"], errors);
				}
				else {
					obj.lldp_med_notification = false;
				}

				function parseLldpMedTlvExtPoe(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-med-tlv-ext-poe")) {
					obj.lldp_med_tlv_ext_poe = parseLldpMedTlvExtPoe(location + "/lldp-med-tlv-ext-poe", value["lldp-med-tlv-ext-poe"], errors);
				}
				else {
					obj.lldp_med_tlv_ext_poe = true;
				}

				function parseLldpMedTlvInventory(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-med-tlv-inventory")) {
					obj.lldp_med_tlv_inventory = parseLldpMedTlvInventory(location + "/lldp-med-tlv-inventory", value["lldp-med-tlv-inventory"], errors);
				}
				else {
					obj.lldp_med_tlv_inventory = true;
				}

				function parseLldpMedTlvLocation(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-med-tlv-location")) {
					obj.lldp_med_tlv_location = parseLldpMedTlvLocation(location + "/lldp-med-tlv-location", value["lldp-med-tlv-location"], errors);
				}
				else {
					obj.lldp_med_tlv_location = true;
				}

				function parseLldpMedTlvMedCap(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-med-tlv-med-cap")) {
					obj.lldp_med_tlv_med_cap = parseLldpMedTlvMedCap(location + "/lldp-med-tlv-med-cap", value["lldp-med-tlv-med-cap"], errors);
				}
				else {
					obj.lldp_med_tlv_med_cap = true;
				}

				function parseLldpMedTlvNetworkPolicy(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-med-tlv-network-policy")) {
					obj.lldp_med_tlv_network_policy = parseLldpMedTlvNetworkPolicy(location + "/lldp-med-tlv-network-policy", value["lldp-med-tlv-network-policy"], errors);
				}
				else {
					obj.lldp_med_tlv_network_policy = true;
				}

				function parseLldpNotification(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-notification")) {
					obj.lldp_notification = parseLldpNotification(location + "/lldp-notification", value["lldp-notification"], errors);
				}
				else {
					obj.lldp_notification = false;
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "lldp-interface-config")) {
			obj.lldp_interface_config = parseLldpInterfaceConfig(location + "/lldp-interface-config", value["lldp-interface-config"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateSwitch(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parsePortMirror(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parseMonitorPorts(location, value, errors) {
							if (type(value) == "array") {
								function parseItem(location, value, errors) {
									if (type(value) != "string")
										push(errors, [ location, "must be of type string" ]);

									return value;
								}

								return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
							}

							if (type(value) != "array")
								push(errors, [ location, "must be of type array" ]);

							return value;
						}

						if (exists(value, "monitor-ports")) {
							obj.monitor_ports = parseMonitorPorts(location + "/monitor-ports", value["monitor-ports"], errors);
						}

						function parseAnalysisPort(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "analysis-port")) {
							obj.analysis_port = parseAnalysisPort(location + "/analysis-port", value["analysis-port"], errors);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "port-mirror")) {
			obj.port_mirror = parsePortMirror(location + "/port-mirror", value["port-mirror"], errors);
		}

		function parseLoopDetection(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseProtocol(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "none", "stp", "rstp", "mstp", "pvstp", "rpvstp" ]))
						push(errors, [ location, "must be one of \"none\", \"stp\", \"rstp\", \"mstp\", \"pvstp\" or \"rpvstp\"" ]);

					return value;
				}

				if (exists(value, "protocol")) {
					obj.protocol = parseProtocol(location + "/protocol", value["protocol"], errors);
				}
				else {
					obj.protocol = "rstp";
				}

				function parseRoles(location, value, errors) {
					if (type(value) == "array") {
						function parseItem(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							if (!(value in [ "upstream", "downstream" ]))
								push(errors, [ location, "must be one of \"upstream\" or \"downstream\"" ]);

							return value;
						}

						return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
					}

					if (type(value) != "array")
						push(errors, [ location, "must be of type array" ]);

					return value;
				}

				if (exists(value, "roles")) {
					obj.roles = parseRoles(location + "/roles", value["roles"], errors);
				}

				function parseInstances(location, value, errors) {
					if (type(value) == "array") {
						function parseItem(location, value, errors) {
							if (type(value) == "object") {
								let obj = {};

								function parseId(location, value, errors) {
									if (type(value) != "int")
										push(errors, [ location, "must be of type integer" ]);

									return value;
								}

								if (exists(value, "id")) {
									obj.id = parseId(location + "/id", value["id"], errors);
								}

								function parseEnabled(location, value, errors) {
									if (type(value) != "bool")
										push(errors, [ location, "must be of type boolean" ]);

									return value;
								}

								if (exists(value, "enabled")) {
									obj.enabled = parseEnabled(location + "/enabled", value["enabled"], errors);
								}
								else {
									obj.enabled = true;
								}

								function parsePriority(location, value, errors) {
									if (type(value) != "int")
										push(errors, [ location, "must be of type integer" ]);

									return value;
								}

								if (exists(value, "priority")) {
									obj.priority = parsePriority(location + "/priority", value["priority"], errors);
								}
								else {
									obj.priority = 32768;
								}

								function parseForward_delay(location, value, errors) {
									if (type(value) != "int")
										push(errors, [ location, "must be of type integer" ]);

									return value;
								}

								if (exists(value, "forward_delay")) {
									obj.forward_delay = parseForward_delay(location + "/forward_delay", value["forward_delay"], errors);
								}
								else {
									obj.forward_delay = 15;
								}

								function parseHello_time(location, value, errors) {
									if (type(value) != "int")
										push(errors, [ location, "must be of type integer" ]);

									return value;
								}

								if (exists(value, "hello_time")) {
									obj.hello_time = parseHello_time(location + "/hello_time", value["hello_time"], errors);
								}
								else {
									obj.hello_time = 2;
								}

								function parseMax_age(location, value, errors) {
									if (type(value) != "int")
										push(errors, [ location, "must be of type integer" ]);

									return value;
								}

								if (exists(value, "max_age")) {
									obj.max_age = parseMax_age(location + "/max_age", value["max_age"], errors);
								}
								else {
									obj.max_age = 20;
								}

								return obj;
							}

							if (type(value) != "object")
								push(errors, [ location, "must be of type object" ]);

							return value;
						}

						return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
					}

					if (type(value) != "array")
						push(errors, [ location, "must be of type array" ]);

					return value;
				}

				if (exists(value, "instances")) {
					obj.instances = parseInstances(location + "/instances", value["instances"], errors);
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "loop-detection")) {
			obj.loop_detection = parseLoopDetection(location + "/loop-detection", value["loop-detection"], errors);
		}

		function parseIeee8021x(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseAuthControlEnable(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "auth-control-enable")) {
					obj.auth_control_enable = parseAuthControlEnable(location + "/auth-control-enable", value["auth-control-enable"], errors);
				}
				else {
					obj.auth_control_enable = false;
				}

				function parseRadius(location, value, errors) {
					if (type(value) == "array") {
						function parseItem(location, value, errors) {
							if (type(value) == "object") {
								let obj = {};

								function parseServerHost(location, value, errors) {
									if (type(value) != "string")
										push(errors, [ location, "must be of type string" ]);

									return value;
								}

								if (exists(value, "server-host")) {
									obj.server_host = parseServerHost(location + "/server-host", value["server-host"], errors);
								}

								function parseServerAuthenticationPort(location, value, errors) {
									if (type(value) in [ "int", "double" ]) {
										if (value > 65535)
											push(errors, [ location, "must be lower than or equal to 65535" ]);

										if (value < 1)
											push(errors, [ location, "must be bigger than or equal to 1" ]);

									}

									if (type(value) != "int")
										push(errors, [ location, "must be of type integer" ]);

									return value;
								}

								if (exists(value, "server-authentication-port")) {
									obj.server_authentication_port = parseServerAuthenticationPort(location + "/server-authentication-port", value["server-authentication-port"], errors);
								}

								function parseServerKey(location, value, errors) {
									if (type(value) != "string")
										push(errors, [ location, "must be of type string" ]);

									return value;
								}

								if (exists(value, "server-key")) {
									obj.server_key = parseServerKey(location + "/server-key", value["server-key"], errors);
								}

								function parseServerPriority(location, value, errors) {
									if (type(value) in [ "int", "double" ]) {
										if (value > 64)
											push(errors, [ location, "must be lower than or equal to 64" ]);

										if (value < 1)
											push(errors, [ location, "must be bigger than or equal to 1" ]);

									}

									if (type(value) != "int")
										push(errors, [ location, "must be of type integer" ]);

									return value;
								}

								if (exists(value, "server-priority")) {
									obj.server_priority = parseServerPriority(location + "/server-priority", value["server-priority"], errors);
								}

								return obj;
							}

							if (type(value) != "object")
								push(errors, [ location, "must be of type object" ]);

							return value;
						}

						return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
					}

					if (type(value) != "array")
						push(errors, [ location, "must be of type array" ]);

					return value;
				}

				if (exists(value, "radius")) {
					obj.radius = parseRadius(location + "/radius", value["radius"], errors);
				}

				function parseDynamicAuthorization(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parseAuthType(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							if (!(value in [ "all", "any", "session-key" ]))
								push(errors, [ location, "must be one of \"all\", \"any\" or \"session-key\"" ]);

							return value;
						}

						if (exists(value, "auth-type")) {
							obj.auth_type = parseAuthType(location + "/auth-type", value["auth-type"], errors);
						}

						function parseBouncePortIgnore(location, value, errors) {
							if (type(value) != "bool")
								push(errors, [ location, "must be of type boolean" ]);

							return value;
						}

						if (exists(value, "bounce-port-ignore")) {
							obj.bounce_port_ignore = parseBouncePortIgnore(location + "/bounce-port-ignore", value["bounce-port-ignore"], errors);
						}
						else {
							obj.bounce_port_ignore = false;
						}

						function parseDisablePortIgnore(location, value, errors) {
							if (type(value) != "bool")
								push(errors, [ location, "must be of type boolean" ]);

							return value;
						}

						if (exists(value, "disable-port-ignore")) {
							obj.disable_port_ignore = parseDisablePortIgnore(location + "/disable-port-ignore", value["disable-port-ignore"], errors);
						}
						else {
							obj.disable_port_ignore = false;
						}

						function parseIgnoreServerKey(location, value, errors) {
							if (type(value) != "bool")
								push(errors, [ location, "must be of type boolean" ]);

							return value;
						}

						if (exists(value, "ignore-server-key")) {
							obj.ignore_server_key = parseIgnoreServerKey(location + "/ignore-server-key", value["ignore-server-key"], errors);
						}
						else {
							obj.ignore_server_key = false;
						}

						function parseIgnoreSessionKey(location, value, errors) {
							if (type(value) != "bool")
								push(errors, [ location, "must be of type boolean" ]);

							return value;
						}

						if (exists(value, "ignore-session-key")) {
							obj.ignore_session_key = parseIgnoreSessionKey(location + "/ignore-session-key", value["ignore-session-key"], errors);
						}
						else {
							obj.ignore_session_key = false;
						}

						function parseServerKey(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "server-key")) {
							obj.server_key = parseServerKey(location + "/server-key", value["server-key"], errors);
						}

						function parseClient(location, value, errors) {
							if (type(value) == "array") {
								function parseItem(location, value, errors) {
									if (type(value) == "object") {
										let obj = {};

										function parseAddress(location, value, errors) {
											if (type(value) != "string")
												push(errors, [ location, "must be of type string" ]);

											return value;
										}

										if (exists(value, "address")) {
											obj.address = parseAddress(location + "/address", value["address"], errors);
										}

										function parseServerKey(location, value, errors) {
											if (type(value) != "string")
												push(errors, [ location, "must be of type string" ]);

											return value;
										}

										if (exists(value, "server-key")) {
											obj.server_key = parseServerKey(location + "/server-key", value["server-key"], errors);
										}

										return obj;
									}

									if (type(value) != "object")
										push(errors, [ location, "must be of type object" ]);

									return value;
								}

								return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
							}

							if (type(value) != "array")
								push(errors, [ location, "must be of type array" ]);

							return value;
						}

						if (exists(value, "client")) {
							obj.client = parseClient(location + "/client", value["client"], errors);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				if (exists(value, "dynamic-authorization")) {
					obj.dynamic_authorization = parseDynamicAuthorization(location + "/dynamic-authorization", value["dynamic-authorization"], errors);
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "ieee8021x")) {
			obj.ieee8021x = parseIeee8021x(location + "/ieee8021x", value["ieee8021x"], errors);
		}

		function parsePortIsolation(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseSessions(location, value, errors) {
					if (type(value) == "array") {
						function parseItem(location, value, errors) {
							if (type(value) == "object") {
								let obj = {};

								function parseId(location, value, errors) {
									if (type(value) != "int")
										push(errors, [ location, "must be of type integer" ]);

									return value;
								}

								if (exists(value, "id")) {
									obj.id = parseId(location + "/id", value["id"], errors);
								}

								function parseUplink(location, value, errors) {
									if (type(value) == "object") {
										let obj = {};

										function parseInterfaceList(location, value, errors) {
											if (type(value) == "array") {
												function parseItem(location, value, errors) {
													if (type(value) != "string")
														push(errors, [ location, "must be of type string" ]);

													return value;
												}

												return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
											}

											if (type(value) != "array")
												push(errors, [ location, "must be of type array" ]);

											return value;
										}

										if (exists(value, "interface-list")) {
											obj.interface_list = parseInterfaceList(location + "/interface-list", value["interface-list"], errors);
										}

										return obj;
									}

									if (type(value) != "object")
										push(errors, [ location, "must be of type object" ]);

									return value;
								}

								if (exists(value, "uplink")) {
									obj.uplink = parseUplink(location + "/uplink", value["uplink"], errors);
								}

								function parseDownlink(location, value, errors) {
									if (type(value) == "object") {
										let obj = {};

										function parseInterfaceList(location, value, errors) {
											if (type(value) == "array") {
												function parseItem(location, value, errors) {
													if (type(value) != "string")
														push(errors, [ location, "must be of type string" ]);

													return value;
												}

												return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
											}

											if (type(value) != "array")
												push(errors, [ location, "must be of type array" ]);

											return value;
										}

										if (exists(value, "interface-list")) {
											obj.interface_list = parseInterfaceList(location + "/interface-list", value["interface-list"], errors);
										}

										return obj;
									}

									if (type(value) != "object")
										push(errors, [ location, "must be of type object" ]);

									return value;
								}

								if (exists(value, "downlink")) {
									obj.downlink = parseDownlink(location + "/downlink", value["downlink"], errors);
								}

								return obj;
							}

							if (type(value) != "object")
								push(errors, [ location, "must be of type object" ]);

							return value;
						}

						return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
					}

					if (type(value) != "array")
						push(errors, [ location, "must be of type array" ]);

					return value;
				}

				if (exists(value, "sessions")) {
					obj.sessions = parseSessions(location + "/sessions", value["sessions"], errors);
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "port-isolation")) {
			obj.port_isolation = parsePortIsolation(location + "/port-isolation", value["port-isolation"], errors);
		}

		function parseTrunkBalanceMethod(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (!(value in [ "dst-ip", "dst-mac", "src-dst-ip", "src-dst-mac", "src-ip", "src-mac" ]))
				push(errors, [ location, "must be one of \"dst-ip\", \"dst-mac\", \"src-dst-ip\", \"src-dst-mac\", \"src-ip\" or \"src-mac\"" ]);

			return value;
		}

		if (exists(value, "trunk-balance-method")) {
			obj.trunk_balance_method = parseTrunkBalanceMethod(location + "/trunk-balance-method", value["trunk-balance-method"], errors);
		}
		else {
			obj.trunk_balance_method = "src-dst-mac";
		}

		function parseJumboFrames(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "jumbo-frames")) {
			obj.jumbo_frames = parseJumboFrames(location + "/jumbo-frames", value["jumbo-frames"], errors);
		}
		else {
			obj.jumbo_frames = false;
		}

		function parseDhcpSnooping(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseDhcpSnoopEnable(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "dhcp-snoop-enable")) {
					obj.dhcp_snoop_enable = parseDhcpSnoopEnable(location + "/dhcp-snoop-enable", value["dhcp-snoop-enable"], errors);
				}
				else {
					obj.dhcp_snoop_enable = false;
				}

				function parseDhcpSnoopRateLimit(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 2048)
							push(errors, [ location, "must be lower than or equal to 2048" ]);

						if (value < 1)
							push(errors, [ location, "must be bigger than or equal to 1" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "dhcp-snoop-rate-limit")) {
					obj.dhcp_snoop_rate_limit = parseDhcpSnoopRateLimit(location + "/dhcp-snoop-rate-limit", value["dhcp-snoop-rate-limit"], errors);
				}

				function parseDhcpSnoopMacVerify(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "dhcp-snoop-mac-verify")) {
					obj.dhcp_snoop_mac_verify = parseDhcpSnoopMacVerify(location + "/dhcp-snoop-mac-verify", value["dhcp-snoop-mac-verify"], errors);
				}
				else {
					obj.dhcp_snoop_mac_verify = false;
				}

				function parseDhcpSnoopInfOpt82(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "dhcp-snoop-inf-opt-82")) {
					obj.dhcp_snoop_inf_opt_82 = parseDhcpSnoopInfOpt82(location + "/dhcp-snoop-inf-opt-82", value["dhcp-snoop-inf-opt-82"], errors);
				}
				else {
					obj.dhcp_snoop_inf_opt_82 = false;
				}

				function parseDhcpSnoopInfOptEncodeSubopt(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "dhcp-snoop-inf-opt-encode-subopt")) {
					obj.dhcp_snoop_inf_opt_encode_subopt = parseDhcpSnoopInfOptEncodeSubopt(location + "/dhcp-snoop-inf-opt-encode-subopt", value["dhcp-snoop-inf-opt-encode-subopt"], errors);
				}
				else {
					obj.dhcp_snoop_inf_opt_encode_subopt = false;
				}

				function parseDhcpSnoopInfOptRemoteid(location, value, errors) {
					if (type(value) == "string") {
						if (length(value) > 32)
							push(errors, [ location, "must be at most 32 characters long" ]);

						if (length(value) < 1)
							push(errors, [ location, "must be at least 1 characters long" ]);

					}

					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				if (exists(value, "dhcp-snoop-inf-opt-remoteid")) {
					obj.dhcp_snoop_inf_opt_remoteid = parseDhcpSnoopInfOptRemoteid(location + "/dhcp-snoop-inf-opt-remoteid", value["dhcp-snoop-inf-opt-remoteid"], errors);
				}

				function parseDhcpSnoopInfOptPolicy(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "drop", "keep", "replace" ]))
						push(errors, [ location, "must be one of \"drop\", \"keep\" or \"replace\"" ]);

					return value;
				}

				if (exists(value, "dhcp-snoop-inf-opt-policy")) {
					obj.dhcp_snoop_inf_opt_policy = parseDhcpSnoopInfOptPolicy(location + "/dhcp-snoop-inf-opt-policy", value["dhcp-snoop-inf-opt-policy"], errors);
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "dhcp-snooping")) {
			obj.dhcp_snooping = parseDhcpSnooping(location + "/dhcp-snooping", value["dhcp-snooping"], errors);
		}

		function parseAcl(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parseAclType(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							if (!(value in [ "ipv4", "ipv6", "ipv4Ext", "ipv6Ext", "mac", "arp" ]))
								push(errors, [ location, "must be one of \"ipv4\", \"ipv6\", \"ipv4Ext\", \"ipv6Ext\", \"mac\" or \"arp\"" ]);

							return value;
						}

						if (exists(value, "acl-type")) {
							obj.acl_type = parseAclType(location + "/acl-type", value["acl-type"], errors);
						}

						function parseAclName(location, value, errors) {
							if (type(value) == "string") {
								if (length(value) > 32)
									push(errors, [ location, "must be at most 32 characters long" ]);

								if (length(value) < 1)
									push(errors, [ location, "must be at least 1 characters long" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "acl-name")) {
							obj.acl_name = parseAclName(location + "/acl-name", value["acl-name"], errors);
						}

						function parseAclRuleAction(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							if (!(value in [ "permit", "deny" ]))
								push(errors, [ location, "must be one of \"permit\" or \"deny\"" ]);

							return value;
						}

						if (exists(value, "acl-rule-action")) {
							obj.acl_rule_action = parseAclRuleAction(location + "/acl-rule-action", value["acl-rule-action"], errors);
						}

						function parseAclSourceMacaddress(location, value, errors) {
							if (type(value) == "string") {
								if (!matchUcMac(value))
									push(errors, [ location, "must be a valid MAC address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "acl-source-macaddress")) {
							obj.acl_source_macaddress = parseAclSourceMacaddress(location + "/acl-source-macaddress", value["acl-source-macaddress"], errors);
						}

						function parseAclSourceMacbitmask(location, value, errors) {
							if (type(value) == "string") {
								if (!matchUcMac(value))
									push(errors, [ location, "must be a valid MAC address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "acl-source-macbitmask")) {
							obj.acl_source_macbitmask = parseAclSourceMacbitmask(location + "/acl-source-macbitmask", value["acl-source-macbitmask"], errors);
						}

						function parseAclDestMacaddress(location, value, errors) {
							if (type(value) == "string") {
								if (!matchUcMac(value))
									push(errors, [ location, "must be a valid MAC address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "acl-dest-macaddress")) {
							obj.acl_dest_macaddress = parseAclDestMacaddress(location + "/acl-dest-macaddress", value["acl-dest-macaddress"], errors);
						}

						function parseAclDestMacbitmask(location, value, errors) {
							if (type(value) == "string") {
								if (!matchUcMac(value))
									push(errors, [ location, "must be a valid MAC address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "acl-dest-macbitmask")) {
							obj.acl_dest_macbitmask = parseAclDestMacbitmask(location + "/acl-dest-macbitmask", value["acl-dest-macbitmask"], errors);
						}

						function parseAclPacketFormat(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							if (!(value in [ "any", "untagged-eth2", "untagged-802.3", "tagged-eth2", "tagged-802.3" ]))
								push(errors, [ location, "must be one of \"any\", \"untagged-eth2\", \"untagged-802.3\", \"tagged-eth2\" or \"tagged-802.3\"" ]);

							return value;
						}

						if (exists(value, "acl-packet-format")) {
							obj.acl_packet_format = parseAclPacketFormat(location + "/acl-packet-format", value["acl-packet-format"], errors);
						}

						function parseAclVlanid(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 4094)
									push(errors, [ location, "must be lower than or equal to 4094" ]);

								if (value < 1)
									push(errors, [ location, "must be bigger than or equal to 1" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-vlanid")) {
							obj.acl_vlanid = parseAclVlanid(location + "/acl-vlanid", value["acl-vlanid"], errors);
						}

						function parseAclVidBitmask(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 4095)
									push(errors, [ location, "must be lower than or equal to 4095" ]);

								if (value < 1)
									push(errors, [ location, "must be bigger than or equal to 1" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-vid-bitmask")) {
							obj.acl_vid_bitmask = parseAclVidBitmask(location + "/acl-vid-bitmask", value["acl-vid-bitmask"], errors);
						}

						function parseAclEthertype(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "acl-ethertype")) {
							obj.acl_ethertype = parseAclEthertype(location + "/acl-ethertype", value["acl-ethertype"], errors);
						}
						else {
							obj.acl_ethertype = "800";
						}

						function parseAclEthertypeBitmask(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "acl-ethertype-bitmask")) {
							obj.acl_ethertype_bitmask = parseAclEthertypeBitmask(location + "/acl-ethertype-bitmask", value["acl-ethertype-bitmask"], errors);
						}
						else {
							obj.acl_ethertype_bitmask = "FFFF";
						}

						function parseAclCos(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 7)
									push(errors, [ location, "must be lower than or equal to 7" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-cos")) {
							obj.acl_cos = parseAclCos(location + "/acl-cos", value["acl-cos"], errors);
						}

						function parseAclCosBitmask(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 7)
									push(errors, [ location, "must be lower than or equal to 7" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-cos-bitmask")) {
							obj.acl_cos_bitmask = parseAclCosBitmask(location + "/acl-cos-bitmask", value["acl-cos-bitmask"], errors);
						}

						function parseAclIpv4SourceAddress(location, value, errors) {
							if (type(value) == "string") {
								if (!matchIpv4(value))
									push(errors, [ location, "must be a valid IPv4 address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "acl-ipv4-source-address")) {
							obj.acl_ipv4_source_address = parseAclIpv4SourceAddress(location + "/acl-ipv4-source-address", value["acl-ipv4-source-address"], errors);
						}

						function parseAclIpv4SourceSubnetmask(location, value, errors) {
							if (type(value) == "string") {
								if (!matchIpv4(value))
									push(errors, [ location, "must be a valid IPv4 address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "acl-ipv4-source-subnetmask")) {
							obj.acl_ipv4_source_subnetmask = parseAclIpv4SourceSubnetmask(location + "/acl-ipv4-source-subnetmask", value["acl-ipv4-source-subnetmask"], errors);
						}

						function parseAclIpv4DestAddress(location, value, errors) {
							if (type(value) == "string") {
								if (!matchIpv4(value))
									push(errors, [ location, "must be a valid IPv4 address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "acl-ipv4-dest-address")) {
							obj.acl_ipv4_dest_address = parseAclIpv4DestAddress(location + "/acl-ipv4-dest-address", value["acl-ipv4-dest-address"], errors);
						}

						function parseAclIpv4DestSubnetmask(location, value, errors) {
							if (type(value) == "string") {
								if (!matchIpv4(value))
									push(errors, [ location, "must be a valid IPv4 address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "acl-ipv4-dest-subnetmask")) {
							obj.acl_ipv4_dest_subnetmask = parseAclIpv4DestSubnetmask(location + "/acl-ipv4-dest-subnetmask", value["acl-ipv4-dest-subnetmask"], errors);
						}

						function parseAclIpv6SourceAddress(location, value, errors) {
							if (type(value) == "string") {
								if (!matchIpv6(value))
									push(errors, [ location, "must be a valid IPv6 address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "acl-ipv6-source-address")) {
							obj.acl_ipv6_source_address = parseAclIpv6SourceAddress(location + "/acl-ipv6-source-address", value["acl-ipv6-source-address"], errors);
						}

						function parseAclIpv6SourcePrefixLength(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 128)
									push(errors, [ location, "must be lower than or equal to 128" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-ipv6-source-prefix-length")) {
							obj.acl_ipv6_source_prefix_length = parseAclIpv6SourcePrefixLength(location + "/acl-ipv6-source-prefix-length", value["acl-ipv6-source-prefix-length"], errors);
						}

						function parseAclIpv6DestAddress(location, value, errors) {
							if (type(value) == "string") {
								if (!matchIpv6(value))
									push(errors, [ location, "must be a valid IPv6 address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "acl-ipv6-dest-address")) {
							obj.acl_ipv6_dest_address = parseAclIpv6DestAddress(location + "/acl-ipv6-dest-address", value["acl-ipv6-dest-address"], errors);
						}

						function parseAclIpv6DestPrefixLength(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 128)
									push(errors, [ location, "must be lower than or equal to 128" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-ipv6-dest-prefix-length")) {
							obj.acl_ipv6_dest_prefix_length = parseAclIpv6DestPrefixLength(location + "/acl-ipv6-dest-prefix-length", value["acl-ipv6-dest-prefix-length"], errors);
						}

						function parseAclIpProto(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 255)
									push(errors, [ location, "must be lower than or equal to 255" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-ip-proto")) {
							obj.acl_ip_proto = parseAclIpProto(location + "/acl-ip-proto", value["acl-ip-proto"], errors);
						}

						function parseAclIpv6NextHeader(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 255)
									push(errors, [ location, "must be lower than or equal to 255" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-ipv6-next-header")) {
							obj.acl_ipv6_next_header = parseAclIpv6NextHeader(location + "/acl-ipv6-next-header", value["acl-ipv6-next-header"], errors);
						}

						function parseAclIpv6FlowLabel(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 1048575)
									push(errors, [ location, "must be lower than or equal to 1048575" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-ipv6-flow-label")) {
							obj.acl_ipv6_flow_label = parseAclIpv6FlowLabel(location + "/acl-ipv6-flow-label", value["acl-ipv6-flow-label"], errors);
						}

						function parseAclIpSourcePort(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 65535)
									push(errors, [ location, "must be lower than or equal to 65535" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-ip-source-port")) {
							obj.acl_ip_source_port = parseAclIpSourcePort(location + "/acl-ip-source-port", value["acl-ip-source-port"], errors);
						}

						function parseAclIpSourcePortBitmask(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 65535)
									push(errors, [ location, "must be lower than or equal to 65535" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-ip-source-port-bitmask")) {
							obj.acl_ip_source_port_bitmask = parseAclIpSourcePortBitmask(location + "/acl-ip-source-port-bitmask", value["acl-ip-source-port-bitmask"], errors);
						}

						function parseAclIpDestPort(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 65535)
									push(errors, [ location, "must be lower than or equal to 65535" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-ip-dest-port")) {
							obj.acl_ip_dest_port = parseAclIpDestPort(location + "/acl-ip-dest-port", value["acl-ip-dest-port"], errors);
						}

						function parseAclIpDestPortBitmask(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 65535)
									push(errors, [ location, "must be lower than or equal to 65535" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-ip-dest-port-bitmask")) {
							obj.acl_ip_dest_port_bitmask = parseAclIpDestPortBitmask(location + "/acl-ip-dest-port-bitmask", value["acl-ip-dest-port-bitmask"], errors);
						}

						function parseAclIpv4FragmentOffset(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 8191)
									push(errors, [ location, "must be lower than or equal to 8191" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-ipv4-fragment-offset")) {
							obj.acl_ipv4_fragment_offset = parseAclIpv4FragmentOffset(location + "/acl-ipv4-fragment-offset", value["acl-ipv4-fragment-offset"], errors);
						}

						function parseAclIpv6FragmentOffset(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 8191)
									push(errors, [ location, "must be lower than or equal to 8191" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-ipv6-fragment-offset")) {
							obj.acl_ipv6_fragment_offset = parseAclIpv6FragmentOffset(location + "/acl-ipv6-fragment-offset", value["acl-ipv6-fragment-offset"], errors);
						}

						function parseAclIpTtl(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 255)
									push(errors, [ location, "must be lower than or equal to 255" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-ip-ttl")) {
							obj.acl_ip_ttl = parseAclIpTtl(location + "/acl-ip-ttl", value["acl-ip-ttl"], errors);
						}

						function parseAclIpv6HopLimit(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 255)
									push(errors, [ location, "must be lower than or equal to 255" ]);

								if (value < 0)
									push(errors, [ location, "must be bigger than or equal to 0" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "acl-ipv6-hop-limit")) {
							obj.acl_ipv6_hop_limit = parseAclIpv6HopLimit(location + "/acl-ipv6-hop-limit", value["acl-ipv6-hop-limit"], errors);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "acl")) {
			obj.acl = parseAcl(location + "/acl", value["acl"], errors);
		}

		function parseMvrConfig(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseMvrEnable(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "mvr-enable")) {
					obj.mvr_enable = parseMvrEnable(location + "/mvr-enable", value["mvr-enable"], errors);
				}
				else {
					obj.mvr_enable = false;
				}

				function parseMvrProxyQueryIntvl(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 43200)
							push(errors, [ location, "must be lower than or equal to 43200" ]);

						if (value < 1)
							push(errors, [ location, "must be bigger than or equal to 1" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "mvr-proxy-query-intvl")) {
					obj.mvr_proxy_query_intvl = parseMvrProxyQueryIntvl(location + "/mvr-proxy-query-intvl", value["mvr-proxy-query-intvl"], errors);
				}
				else {
					obj.mvr_proxy_query_intvl = 125;
				}

				function parseMvrProxySwitching(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "mvr-proxy-switching")) {
					obj.mvr_proxy_switching = parseMvrProxySwitching(location + "/mvr-proxy-switching", value["mvr-proxy-switching"], errors);
				}
				else {
					obj.mvr_proxy_switching = false;
				}

				function parseMvrRobustnessVal(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 255)
							push(errors, [ location, "must be lower than or equal to 255" ]);

						if (value < 1)
							push(errors, [ location, "must be bigger than or equal to 1" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "mvr-robustness-val")) {
					obj.mvr_robustness_val = parseMvrRobustnessVal(location + "/mvr-robustness-val", value["mvr-robustness-val"], errors);
				}
				else {
					obj.mvr_robustness_val = 2;
				}

				function parseMvrSourcePortMode(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "dynamic", "forward" ]))
						push(errors, [ location, "must be one of \"dynamic\" or \"forward\"" ]);

					return value;
				}

				if (exists(value, "mvr-source-port-mode")) {
					obj.mvr_source_port_mode = parseMvrSourcePortMode(location + "/mvr-source-port-mode", value["mvr-source-port-mode"], errors);
				}
				else {
					obj.mvr_source_port_mode = "forward";
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "mvr-config")) {
			obj.mvr_config = parseMvrConfig(location + "/mvr-config", value["mvr-config"], errors);
		}

		function parseMvrDomainConfig(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parseMvrDomainId(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 10)
									push(errors, [ location, "must be lower than or equal to 10" ]);

								if (value < 1)
									push(errors, [ location, "must be bigger than or equal to 1" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "mvr-domain-id")) {
							obj.mvr_domain_id = parseMvrDomainId(location + "/mvr-domain-id", value["mvr-domain-id"], errors);
						}
						else {
							obj.mvr_domain_id = 1;
						}

						function parseMvrDomainEnable(location, value, errors) {
							if (type(value) != "bool")
								push(errors, [ location, "must be of type boolean" ]);

							return value;
						}

						if (exists(value, "mvr-domain-enable")) {
							obj.mvr_domain_enable = parseMvrDomainEnable(location + "/mvr-domain-enable", value["mvr-domain-enable"], errors);
						}
						else {
							obj.mvr_domain_enable = false;
						}

						function parseMvrDomainVlanId(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 4094)
									push(errors, [ location, "must be lower than or equal to 4094" ]);

								if (value < 1)
									push(errors, [ location, "must be bigger than or equal to 1" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "mvr-domain-vlan-id")) {
							obj.mvr_domain_vlan_id = parseMvrDomainVlanId(location + "/mvr-domain-vlan-id", value["mvr-domain-vlan-id"], errors);
						}
						else {
							obj.mvr_domain_vlan_id = 1;
						}

						function parseMvrDomainUpstreamSip(location, value, errors) {
							if (type(value) == "string") {
								if (!matchIpv4(value))
									push(errors, [ location, "must be a valid IPv4 address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "mvr-domain-upstream-sip")) {
							obj.mvr_domain_upstream_sip = parseMvrDomainUpstreamSip(location + "/mvr-domain-upstream-sip", value["mvr-domain-upstream-sip"], errors);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "mvr-domain-config")) {
			obj.mvr_domain_config = parseMvrDomainConfig(location + "/mvr-domain-config", value["mvr-domain-config"], errors);
		}

		function parseMvrGroupConfig(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parseMvrGroupName(location, value, errors) {
							if (type(value) == "string") {
								if (length(value) > 16)
									push(errors, [ location, "must be at most 16 characters long" ]);

								if (length(value) < 1)
									push(errors, [ location, "must be at least 1 characters long" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "mvr-group-name")) {
							obj.mvr_group_name = parseMvrGroupName(location + "/mvr-group-name", value["mvr-group-name"], errors);
						}
						else {
							push(errors, [ location, "is required" ]);
						}

						function parseMvrGroupRangeStart(location, value, errors) {
							if (type(value) == "string") {
								if (!matchIpv4(value))
									push(errors, [ location, "must be a valid IPv4 address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "mvr-group-range-start")) {
							obj.mvr_group_range_start = parseMvrGroupRangeStart(location + "/mvr-group-range-start", value["mvr-group-range-start"], errors);
						}
						else {
							push(errors, [ location, "is required" ]);
						}

						function parseMvrGroupRangeEnd(location, value, errors) {
							if (type(value) == "string") {
								if (!matchIpv4(value))
									push(errors, [ location, "must be a valid IPv4 address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "mvr-group-range-end")) {
							obj.mvr_group_range_end = parseMvrGroupRangeEnd(location + "/mvr-group-range-end", value["mvr-group-range-end"], errors);
						}
						else {
							push(errors, [ location, "is required" ]);
						}

						function parseMvrGroupAssocDomain(location, value, errors) {
							if (type(value) == "array") {
								function parseItem(location, value, errors) {
									if (type(value) in [ "int", "double" ]) {
										if (value > 10)
											push(errors, [ location, "must be lower than or equal to 10" ]);

										if (value < 1)
											push(errors, [ location, "must be bigger than or equal to 1" ]);

									}

									if (type(value) != "int")
										push(errors, [ location, "must be of type integer" ]);

									return value;
								}

								return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
							}

							if (type(value) != "array")
								push(errors, [ location, "must be of type array" ]);

							return value;
						}

						if (exists(value, "mvr-group-assoc-domain")) {
							obj.mvr_group_assoc_domain = parseMvrGroupAssocDomain(location + "/mvr-group-assoc-domain", value["mvr-group-assoc-domain"], errors);
						}
						else {
							push(errors, [ location, "is required" ]);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "mvr-group-config")) {
			obj.mvr_group_config = parseMvrGroupConfig(location + "/mvr-group-config", value["mvr-group-config"], errors);
		}

		function parseLldpGlobalConfig(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseLldpEnable(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "lldp-enable")) {
					obj.lldp_enable = parseLldpEnable(location + "/lldp-enable", value["lldp-enable"], errors);
				}
				else {
					obj.lldp_enable = true;
				}

				function parseLldpHoldtimeMultiplier(location, value, errors) {
					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "lldp-holdtime-multiplier")) {
					obj.lldp_holdtime_multiplier = parseLldpHoldtimeMultiplier(location + "/lldp-holdtime-multiplier", value["lldp-holdtime-multiplier"], errors);
				}
				else {
					obj.lldp_holdtime_multiplier = 4;
				}

				function parseLldpMedFastStartCount(location, value, errors) {
					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "lldp-med-fast-start-count")) {
					obj.lldp_med_fast_start_count = parseLldpMedFastStartCount(location + "/lldp-med-fast-start-count", value["lldp-med-fast-start-count"], errors);
				}
				else {
					obj.lldp_med_fast_start_count = 4;
				}

				function parseLldpRefreshInterval(location, value, errors) {
					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "lldp-refresh-interval")) {
					obj.lldp_refresh_interval = parseLldpRefreshInterval(location + "/lldp-refresh-interval", value["lldp-refresh-interval"], errors);
				}
				else {
					obj.lldp_refresh_interval = 30;
				}

				function parseLldpReinitDelay(location, value, errors) {
					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "lldp-reinit-delay")) {
					obj.lldp_reinit_delay = parseLldpReinitDelay(location + "/lldp-reinit-delay", value["lldp-reinit-delay"], errors);
				}
				else {
					obj.lldp_reinit_delay = 2;
				}

				function parseLldpTxDelay(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 8192)
							push(errors, [ location, "must be lower than or equal to 8192" ]);

						if (value < 1)
							push(errors, [ location, "must be bigger than or equal to 1" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "lldp-tx-delay")) {
					obj.lldp_tx_delay = parseLldpTxDelay(location + "/lldp-tx-delay", value["lldp-tx-delay"], errors);
				}

				function parseLldpNotificationInterval(location, value, errors) {
					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "lldp-notification-interval")) {
					obj.lldp_notification_interval = parseLldpNotificationInterval(location + "/lldp-notification-interval", value["lldp-notification-interval"], errors);
				}
				else {
					obj.lldp_notification_interval = 5;
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "lldp-global-config")) {
			obj.lldp_global_config = parseLldpGlobalConfig(location + "/lldp-global-config", value["lldp-global-config"], errors);
		}

		function parseMcLag(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "mc-lag")) {
			obj.mc_lag = parseMcLag(location + "/mc-lag", value["mc-lag"], errors);
		}
		else {
			obj.mc_lag = false;
		}

		function parseMclagConfig(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseMclagDomains(location, value, errors) {
					if (type(value) == "array") {
						function parseItem(location, value, errors) {
							if (type(value) == "object") {
								let obj = {};

								function parseMclagDomain(location, value, errors) {
									if (type(value) in [ "int", "double" ]) {
										if (value > 1024)
											push(errors, [ location, "must be lower than or equal to 1024" ]);

										if (value < 1)
											push(errors, [ location, "must be bigger than or equal to 1" ]);

									}

									if (type(value) != "int")
										push(errors, [ location, "must be of type integer" ]);

									return value;
								}

								if (exists(value, "mclag-domain")) {
									obj.mclag_domain = parseMclagDomain(location + "/mclag-domain", value["mclag-domain"], errors);
								}
								else {
									obj.mclag_domain = 1;
								}

								function parsePeerLink(location, value, errors) {
									if (type(value) == "object") {
										let obj = {};

										function parseType(location, value, errors) {
											if (type(value) != "string")
												push(errors, [ location, "must be of type string" ]);

											if (!(value in [ "port", "trunk-group" ]))
												push(errors, [ location, "must be one of \"port\" or \"trunk-group\"" ]);

											return value;
										}

										if (exists(value, "type")) {
											obj.type = parseType(location + "/type", value["type"], errors);
										}
										else {
											obj.type = "trunk-group";
										}

										function parseValue(location, value, errors) {
											if (type(value) in [ "int", "double" ]) {
												if (value > 64)
													push(errors, [ location, "must be lower than or equal to 64" ]);

												if (value < 1)
													push(errors, [ location, "must be bigger than or equal to 1" ]);

											}

											if (type(value) != "int")
												push(errors, [ location, "must be of type integer" ]);

											return value;
										}

										if (exists(value, "value")) {
											obj.value = parseValue(location + "/value", value["value"], errors);
										}

										return obj;
									}

									if (type(value) != "object")
										push(errors, [ location, "must be of type object" ]);

									return value;
								}

								if (exists(value, "peer-link")) {
									obj.peer_link = parsePeerLink(location + "/peer-link", value["peer-link"], errors);
								}

								function parseMclagGroup(location, value, errors) {
									if (type(value) == "object") {
										let obj = {};

										function parseGroupId(location, value, errors) {
											if (type(value) in [ "int", "double" ]) {
												if (value > 128)
													push(errors, [ location, "must be lower than or equal to 128" ]);

												if (value < 1)
													push(errors, [ location, "must be bigger than or equal to 1" ]);

											}

											if (type(value) != "int")
												push(errors, [ location, "must be of type integer" ]);

											return value;
										}

										if (exists(value, "group-id")) {
											obj.group_id = parseGroupId(location + "/group-id", value["group-id"], errors);
										}

										function parseMembers(location, value, errors) {
											if (type(value) == "array") {
												function parseItem(location, value, errors) {
													if (type(value) != "string")
														push(errors, [ location, "must be of type string" ]);

													return value;
												}

												return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
											}

											if (type(value) != "array")
												push(errors, [ location, "must be of type array" ]);

											return value;
										}

										if (exists(value, "members")) {
											obj.members = parseMembers(location + "/members", value["members"], errors);
										}

										function parseLacpConfig(location, value, errors) {
											if (type(value) == "object") {
												let obj = {};

												function parseLacpEnable(location, value, errors) {
													if (type(value) != "bool")
														push(errors, [ location, "must be of type boolean" ]);

													return value;
												}

												if (exists(value, "lacp-enable")) {
													obj.lacp_enable = parseLacpEnable(location + "/lacp-enable", value["lacp-enable"], errors);
												}
												else {
													obj.lacp_enable = true;
												}

												function parseLacpRole(location, value, errors) {
													if (type(value) != "string")
														push(errors, [ location, "must be of type string" ]);

													if (!(value in [ "actor", "partner" ]))
														push(errors, [ location, "must be one of \"actor\" or \"partner\"" ]);

													return value;
												}

												if (exists(value, "lacp-role")) {
													obj.lacp_role = parseLacpRole(location + "/lacp-role", value["lacp-role"], errors);
												}
												else {
													obj.lacp_role = "actor";
												}

												function parseLacpTimeout(location, value, errors) {
													if (type(value) != "string")
														push(errors, [ location, "must be of type string" ]);

													if (!(value in [ "short", "long" ]))
														push(errors, [ location, "must be one of \"short\" or \"long\"" ]);

													return value;
												}

												if (exists(value, "lacp-timeout")) {
													obj.lacp_timeout = parseLacpTimeout(location + "/lacp-timeout", value["lacp-timeout"], errors);
												}
												else {
													obj.lacp_timeout = "long";
												}

												return obj;
											}

											if (type(value) != "object")
												push(errors, [ location, "must be of type object" ]);

											return value;
										}

										if (exists(value, "lacp-config")) {
											obj.lacp_config = parseLacpConfig(location + "/lacp-config", value["lacp-config"], errors);
										}

										return obj;
									}

									if (type(value) != "object")
										push(errors, [ location, "must be of type object" ]);

									return value;
								}

								if (exists(value, "mclag-group")) {
									obj.mclag_group = parseMclagGroup(location + "/mclag-group", value["mclag-group"], errors);
								}

								function parseSystemPriority(location, value, errors) {
									if (type(value) in [ "int", "double" ]) {
										if (value > 65535)
											push(errors, [ location, "must be lower than or equal to 65535" ]);

										if (value < 1)
											push(errors, [ location, "must be bigger than or equal to 1" ]);

									}

									if (type(value) != "int")
										push(errors, [ location, "must be of type integer" ]);

									return value;
								}

								if (exists(value, "system-priority")) {
									obj.system_priority = parseSystemPriority(location + "/system-priority", value["system-priority"], errors);
								}
								else {
									obj.system_priority = 32768;
								}

								function parseDualActiveDetection(location, value, errors) {
									if (type(value) != "bool")
										push(errors, [ location, "must be of type boolean" ]);

									return value;
								}

								if (exists(value, "dual-active-detection")) {
									obj.dual_active_detection = parseDualActiveDetection(location + "/dual-active-detection", value["dual-active-detection"], errors);
								}
								else {
									obj.dual_active_detection = true;
								}

								return obj;
							}

							if (type(value) != "object")
								push(errors, [ location, "must be of type object" ]);

							return value;
						}

						return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
					}

					if (type(value) != "array")
						push(errors, [ location, "must be of type array" ]);

					return value;
				}

				if (exists(value, "mclag-domains")) {
					obj.mclag_domains = parseMclagDomains(location + "/mclag-domains", value["mclag-domains"], errors);
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "mclag-config")) {
			obj.mclag_config = parseMclagConfig(location + "/mclag-config", value["mclag-config"], errors);
		}

		function parseVoiceVlanConfig(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseVoiceVlanId(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 4094)
							push(errors, [ location, "must be lower than or equal to 4094" ]);

						if (value < 1)
							push(errors, [ location, "must be bigger than or equal to 1" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "voice-vlan-id")) {
					obj.voice_vlan_id = parseVoiceVlanId(location + "/voice-vlan-id", value["voice-vlan-id"], errors);
				}

				function parseVoiceVlanAgeingTime(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 43200)
							push(errors, [ location, "must be lower than or equal to 43200" ]);

						if (value < 5)
							push(errors, [ location, "must be bigger than or equal to 5" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "voice-vlan-ageing-time")) {
					obj.voice_vlan_ageing_time = parseVoiceVlanAgeingTime(location + "/voice-vlan-ageing-time", value["voice-vlan-ageing-time"], errors);
				}
				else {
					obj.voice_vlan_ageing_time = 1440;
				}

				function parseVoiceVlanOuiConfig(location, value, errors) {
					if (type(value) == "array") {
						function parseItem(location, value, errors) {
							if (type(value) == "object") {
								let obj = {};

								function parseVoiceVlanOuiMac(location, value, errors) {
									if (type(value) == "string") {
										if (!matchUcMac(value))
											push(errors, [ location, "must be a valid MAC address" ]);

									}

									if (type(value) != "string")
										push(errors, [ location, "must be of type string" ]);

									return value;
								}

								if (exists(value, "voice-vlan-oui-mac")) {
									obj.voice_vlan_oui_mac = parseVoiceVlanOuiMac(location + "/voice-vlan-oui-mac", value["voice-vlan-oui-mac"], errors);
								}

								function parseVoiceVlanOuiMask(location, value, errors) {
									if (type(value) == "string") {
										if (!matchUcMac(value))
											push(errors, [ location, "must be a valid MAC address" ]);

									}

									if (type(value) != "string")
										push(errors, [ location, "must be of type string" ]);

									return value;
								}

								if (exists(value, "voice-vlan-oui-mask")) {
									obj.voice_vlan_oui_mask = parseVoiceVlanOuiMask(location + "/voice-vlan-oui-mask", value["voice-vlan-oui-mask"], errors);
								}

								function parseVoiceVlanOuiDescription(location, value, errors) {
									if (type(value) == "string") {
										if (length(value) > 32)
											push(errors, [ location, "must be at most 32 characters long" ]);

										if (length(value) < 1)
											push(errors, [ location, "must be at least 1 characters long" ]);

									}

									if (type(value) != "string")
										push(errors, [ location, "must be of type string" ]);

									return value;
								}

								if (exists(value, "voice-vlan-oui-description")) {
									obj.voice_vlan_oui_description = parseVoiceVlanOuiDescription(location + "/voice-vlan-oui-description", value["voice-vlan-oui-description"], errors);
								}

								return obj;
							}

							if (type(value) != "object")
								push(errors, [ location, "must be of type object" ]);

							return value;
						}

						return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
					}

					if (type(value) != "array")
						push(errors, [ location, "must be of type array" ]);

					return value;
				}

				if (exists(value, "voice-vlan-oui-config")) {
					obj.voice_vlan_oui_config = parseVoiceVlanOuiConfig(location + "/voice-vlan-oui-config", value["voice-vlan-oui-config"], errors);
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "voice-vlan-config")) {
			obj.voice_vlan_config = parseVoiceVlanConfig(location + "/voice-vlan-config", value["voice-vlan-config"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceVlan(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseId(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 4050)
					push(errors, [ location, "must be lower than or equal to 4050" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "id")) {
			obj.id = parseId(location + "/id", value["id"], errors);
		}

		function parseProto(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (!(value in [ "802.1ad", "802.1q" ]))
				push(errors, [ location, "must be one of \"802.1ad\" or \"802.1q\"" ]);

			return value;
		}

		if (exists(value, "proto")) {
			obj.proto = parseProto(location + "/proto", value["proto"], errors);
		}
		else {
			obj.proto = "802.1q";
		}

		function parseStpInstance(location, value, errors) {
			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "stp-instance")) {
			obj.stp_instance = parseStpInstance(location + "/stp-instance", value["stp-instance"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceBridge(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseMtu(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 65535)
					push(errors, [ location, "must be lower than or equal to 65535" ]);

				if (value < 256)
					push(errors, [ location, "must be bigger than or equal to 256" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "mtu")) {
			obj.mtu = parseMtu(location + "/mtu", value["mtu"], errors);
		}

		function parseTxQueueLen(location, value, errors) {
			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "tx-queue-len")) {
			obj.tx_queue_len = parseTxQueueLen(location + "/tx-queue-len", value["tx-queue-len"], errors);
		}

		function parseIsolatePorts(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "isolate-ports")) {
			obj.isolate_ports = parseIsolatePorts(location + "/isolate-ports", value["isolate-ports"], errors);
		}
		else {
			obj.isolate_ports = false;
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceEthernet(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseSelectPorts(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "select-ports")) {
			obj.select_ports = parseSelectPorts(location + "/select-ports", value["select-ports"], errors);
		}

		function parseMulticast(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "multicast")) {
			obj.multicast = parseMulticast(location + "/multicast", value["multicast"], errors);
		}
		else {
			obj.multicast = true;
		}

		function parseLearning(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "learning")) {
			obj.learning = parseLearning(location + "/learning", value["learning"], errors);
		}
		else {
			obj.learning = true;
		}

		function parseIsolate(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "isolate")) {
			obj.isolate = parseIsolate(location + "/isolate", value["isolate"], errors);
		}
		else {
			obj.isolate = false;
		}

		function parseMacaddr(location, value, errors) {
			if (type(value) == "string") {
				if (!matchUcMac(value))
					push(errors, [ location, "must be a valid MAC address" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "macaddr")) {
			obj.macaddr = parseMacaddr(location + "/macaddr", value["macaddr"], errors);
		}

		function parseReversePathFilter(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "reverse-path-filter")) {
			obj.reverse_path_filter = parseReversePathFilter(location + "/reverse-path-filter", value["reverse-path-filter"], errors);
		}
		else {
			obj.reverse_path_filter = false;
		}

		function parseVlanTag(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (!(value in [ "tagged", "un-tagged", "auto" ]))
				push(errors, [ location, "must be one of \"tagged\", \"un-tagged\" or \"auto\"" ]);

			return value;
		}

		if (exists(value, "vlan-tag")) {
			obj.vlan_tag = parseVlanTag(location + "/vlan-tag", value["vlan-tag"], errors);
		}
		else {
			obj.vlan_tag = "auto";
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceIpv4Dhcp(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseLeaseFirst(location, value, errors) {
			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "lease-first")) {
			obj.lease_first = parseLeaseFirst(location + "/lease-first", value["lease-first"], errors);
		}

		function parseLeaseCount(location, value, errors) {
			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "lease-count")) {
			obj.lease_count = parseLeaseCount(location + "/lease-count", value["lease-count"], errors);
		}

		function parseLeaseTime(location, value, errors) {
			if (type(value) == "string") {
				if (!matchUcTimeout(value))
					push(errors, [ location, "must be a valid timeout value" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "lease-time")) {
			obj.lease_time = parseLeaseTime(location + "/lease-time", value["lease-time"], errors);
		}
		else {
			obj.lease_time = "6h";
		}

		function parseRelayServer(location, value, errors) {
			if (type(value) == "string") {
				if (!matchIpv4(value))
					push(errors, [ location, "must be a valid IPv4 address" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "relay-server")) {
			obj.relay_server = parseRelayServer(location + "/relay-server", value["relay-server"], errors);
		}

		function parseCircuitIdFormat(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "circuit-id-format")) {
			obj.circuit_id_format = parseCircuitIdFormat(location + "/circuit-id-format", value["circuit-id-format"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceIpv4DhcpLease(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseMacaddr(location, value, errors) {
			if (type(value) == "string") {
				if (!matchUcMac(value))
					push(errors, [ location, "must be a valid MAC address" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "macaddr")) {
			obj.macaddr = parseMacaddr(location + "/macaddr", value["macaddr"], errors);
		}

		function parseStaticLeaseOffset(location, value, errors) {
			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "static-lease-offset")) {
			obj.static_lease_offset = parseStaticLeaseOffset(location + "/static-lease-offset", value["static-lease-offset"], errors);
		}

		function parseLeaseTime(location, value, errors) {
			if (type(value) == "string") {
				if (!matchUcTimeout(value))
					push(errors, [ location, "must be a valid timeout value" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "lease-time")) {
			obj.lease_time = parseLeaseTime(location + "/lease-time", value["lease-time"], errors);
		}
		else {
			obj.lease_time = "6h";
		}

		function parsePublishHostname(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "publish-hostname")) {
			obj.publish_hostname = parsePublishHostname(location + "/publish-hostname", value["publish-hostname"], errors);
		}
		else {
			obj.publish_hostname = true;
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceIpv4PortForward(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseProtocol(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (!(value in [ "tcp", "udp", "any" ]))
				push(errors, [ location, "must be one of \"tcp\", \"udp\" or \"any\"" ]);

			return value;
		}

		if (exists(value, "protocol")) {
			obj.protocol = parseProtocol(location + "/protocol", value["protocol"], errors);
		}
		else {
			obj.protocol = "any";
		}

		function parseExternalPort(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 65535)
					push(errors, [ location, "must be lower than or equal to 65535" ]);

				if (value < 0)
					push(errors, [ location, "must be bigger than or equal to 0" ]);

			}

			if (type(value) == "string") {
				if (!matchUcPortrange(value))
					push(errors, [ location, "must be a valid network port range" ]);

			}

			if (type(value) != "int" && type(value) != "string")
				push(errors, [ location, "must be of type integer or string" ]);

			return value;
		}

		if (exists(value, "external-port")) {
			obj.external_port = parseExternalPort(location + "/external-port", value["external-port"], errors);
		}
		else {
			push(errors, [ location, "is required" ]);
		}

		function parseInternalAddress(location, value, errors) {
			if (type(value) == "string") {
				if (!matchIpv4(value))
					push(errors, [ location, "must be a valid IPv4 address" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "internal-address")) {
			obj.internal_address = parseInternalAddress(location + "/internal-address", value["internal-address"], errors);
		}
		else {
			push(errors, [ location, "is required" ]);
		}

		function parseInternalPort(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 65535)
					push(errors, [ location, "must be lower than or equal to 65535" ]);

				if (value < 0)
					push(errors, [ location, "must be bigger than or equal to 0" ]);

			}

			if (type(value) == "string") {
				if (!matchUcPortrange(value))
					push(errors, [ location, "must be a valid network port range" ]);

			}

			if (type(value) != "int" && type(value) != "string")
				push(errors, [ location, "must be of type integer or string" ]);

			return value;
		}

		if (exists(value, "internal-port")) {
			obj.internal_port = parseInternalPort(location + "/internal-port", value["internal-port"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceIpv4(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseAddressing(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (!(value in [ "dynamic", "static", "none" ]))
				push(errors, [ location, "must be one of \"dynamic\", \"static\" or \"none\"" ]);

			return value;
		}

		if (exists(value, "addressing")) {
			obj.addressing = parseAddressing(location + "/addressing", value["addressing"], errors);
		}

		function parseSubnet(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parsePrefix(location, value, errors) {
							if (type(value) == "string") {
								if (!matchUcCidr4(value))
									push(errors, [ location, "must be a valid IPv4 CIDR" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "prefix")) {
							obj.prefix = parsePrefix(location + "/prefix", value["prefix"], errors);
						}

						function parseVrf(location, value, errors) {
							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "vrf")) {
							obj.vrf = parseVrf(location + "/vrf", value["vrf"], errors);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "subnet")) {
			obj.subnet = parseSubnet(location + "/subnet", value["subnet"], errors);
		}

		function parseGateway(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parsePrefix(location, value, errors) {
							if (type(value) == "string") {
								if (!matchUcCidr4(value))
									push(errors, [ location, "must be a valid IPv4 CIDR" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "prefix")) {
							obj.prefix = parsePrefix(location + "/prefix", value["prefix"], errors);
						}

						function parseNexthop(location, value, errors) {
							if (type(value) == "string") {
								if (!matchIpv4(value))
									push(errors, [ location, "must be a valid IPv4 address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "nexthop")) {
							obj.nexthop = parseNexthop(location + "/nexthop", value["nexthop"], errors);
						}

						function parseVrf(location, value, errors) {
							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "vrf")) {
							obj.vrf = parseVrf(location + "/vrf", value["vrf"], errors);
						}

						function parseMetric(location, value, errors) {
							if (!(type(value) in [ "int", "double" ]))
								push(errors, [ location, "must be of type number" ]);

							return value;
						}

						if (exists(value, "metric")) {
							obj.metric = parseMetric(location + "/metric", value["metric"], errors);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "gateway")) {
			obj.gateway = parseGateway(location + "/gateway", value["gateway"], errors);
		}

		function parseBroadcast(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parsePrefix(location, value, errors) {
							if (type(value) == "string") {
								if (!matchUcCidr4(value))
									push(errors, [ location, "must be a valid IPv4 CIDR" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "prefix")) {
							obj.prefix = parsePrefix(location + "/prefix", value["prefix"], errors);
						}

						function parseVrf(location, value, errors) {
							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "vrf")) {
							obj.vrf = parseVrf(location + "/vrf", value["vrf"], errors);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "broadcast")) {
			obj.broadcast = parseBroadcast(location + "/broadcast", value["broadcast"], errors);
		}

		function parseMulticast(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseUnknownMulticastFloodControl(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "unknown-multicast-flood-control")) {
					obj.unknown_multicast_flood_control = parseUnknownMulticastFloodControl(location + "/unknown-multicast-flood-control", value["unknown-multicast-flood-control"], errors);
				}
				else {
					obj.unknown_multicast_flood_control = true;
				}

				function parseIgmp(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parseSnoopingEnable(location, value, errors) {
							if (type(value) != "bool")
								push(errors, [ location, "must be of type boolean" ]);

							return value;
						}

						if (exists(value, "snooping-enable")) {
							obj.snooping_enable = parseSnoopingEnable(location + "/snooping-enable", value["snooping-enable"], errors);
						}
						else {
							obj.snooping_enable = true;
						}

						function parseVersion(location, value, errors) {
							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							if (!(value in [ 1, 2, 3 ]))
								push(errors, [ location, "must be one of 1, 2 or 3" ]);

							return value;
						}

						if (exists(value, "version")) {
							obj.version = parseVersion(location + "/version", value["version"], errors);
						}
						else {
							obj.version = 3;
						}

						function parseQuerierEnable(location, value, errors) {
							if (type(value) != "bool")
								push(errors, [ location, "must be of type boolean" ]);

							return value;
						}

						if (exists(value, "querier-enable")) {
							obj.querier_enable = parseQuerierEnable(location + "/querier-enable", value["querier-enable"], errors);
						}
						else {
							obj.querier_enable = false;
						}

						function parseFastLeaveEnable(location, value, errors) {
							if (type(value) != "bool")
								push(errors, [ location, "must be of type boolean" ]);

							return value;
						}

						if (exists(value, "fast-leave-enable")) {
							obj.fast_leave_enable = parseFastLeaveEnable(location + "/fast-leave-enable", value["fast-leave-enable"], errors);
						}
						else {
							obj.fast_leave_enable = false;
						}

						function parseQueryInterval(location, value, errors) {
							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "query-interval")) {
							obj.query_interval = parseQueryInterval(location + "/query-interval", value["query-interval"], errors);
						}
						else {
							obj.query_interval = 1000;
						}

						function parseLastMemberQueryInterval(location, value, errors) {
							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "last-member-query-interval")) {
							obj.last_member_query_interval = parseLastMemberQueryInterval(location + "/last-member-query-interval", value["last-member-query-interval"], errors);
						}
						else {
							obj.last_member_query_interval = 1000;
						}

						function parseMaxResponseTime(location, value, errors) {
							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "max-response-time")) {
							obj.max_response_time = parseMaxResponseTime(location + "/max-response-time", value["max-response-time"], errors);
						}
						else {
							obj.max_response_time = 10;
						}

						function parseStaticMcastGroups(location, value, errors) {
							if (type(value) == "array") {
								function parseItem(location, value, errors) {
									if (type(value) == "object") {
										let obj = {};

										function parseEgressPorts(location, value, errors) {
											if (type(value) == "array") {
												function parseItem(location, value, errors) {
													if (type(value) != "string")
														push(errors, [ location, "must be of type string" ]);

													return value;
												}

												return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
											}

											if (type(value) != "array")
												push(errors, [ location, "must be of type array" ]);

											return value;
										}

										if (exists(value, "egress-ports")) {
											obj.egress_ports = parseEgressPorts(location + "/egress-ports", value["egress-ports"], errors);
										}

										function parseAddress(location, value, errors) {
											if (type(value) == "string") {
												if (!matchIpv4(value))
													push(errors, [ location, "must be a valid IPv4 address" ]);

											}

											if (type(value) != "string")
												push(errors, [ location, "must be of type string" ]);

											return value;
										}

										if (exists(value, "address")) {
											obj.address = parseAddress(location + "/address", value["address"], errors);
										}

										return obj;
									}

									if (type(value) != "object")
										push(errors, [ location, "must be of type object" ]);

									return value;
								}

								return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
							}

							if (type(value) != "array")
								push(errors, [ location, "must be of type array" ]);

							return value;
						}

						if (exists(value, "static-mcast-groups")) {
							obj.static_mcast_groups = parseStaticMcastGroups(location + "/static-mcast-groups", value["static-mcast-groups"], errors);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				if (exists(value, "igmp")) {
					obj.igmp = parseIgmp(location + "/igmp", value["igmp"], errors);
				}

				function parseMvr(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parseMvrIntfMvrRole(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							if (!(value in [ "none", "source", "receiver" ]))
								push(errors, [ location, "must be one of \"none\", \"source\" or \"receiver\"" ]);

							return value;
						}

						if (exists(value, "mvr-intf-mvr-role")) {
							obj.mvr_intf_mvr_role = parseMvrIntfMvrRole(location + "/mvr-intf-mvr-role", value["mvr-intf-mvr-role"], errors);
						}
						else {
							push(errors, [ location, "is required" ]);
						}

						function parseMvrIntfImmedLeave(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							if (!(value in [ "none", "by-host-ip", "by-group" ]))
								push(errors, [ location, "must be one of \"none\", \"by-host-ip\" or \"by-group\"" ]);

							return value;
						}

						if (exists(value, "mvr-intf-immed-leave")) {
							obj.mvr_intf_immed_leave = parseMvrIntfImmedLeave(location + "/mvr-intf-immed-leave", value["mvr-intf-immed-leave"], errors);
						}
						else {
							obj.mvr_intf_immed_leave = "by-group";
						}

						function parseMvrIntfAssocDomain(location, value, errors) {
							if (type(value) in [ "int", "double" ]) {
								if (value > 10)
									push(errors, [ location, "must be lower than or equal to 10" ]);

								if (value < 1)
									push(errors, [ location, "must be bigger than or equal to 1" ]);

							}

							if (type(value) != "int")
								push(errors, [ location, "must be of type integer" ]);

							return value;
						}

						if (exists(value, "mvr-intf-assoc-domain")) {
							obj.mvr_intf_assoc_domain = parseMvrIntfAssocDomain(location + "/mvr-intf-assoc-domain", value["mvr-intf-assoc-domain"], errors);
						}
						else {
							push(errors, [ location, "is required" ]);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				if (exists(value, "mvr")) {
					obj.mvr = parseMvr(location + "/mvr", value["mvr"], errors);
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "multicast")) {
			obj.multicast = parseMulticast(location + "/multicast", value["multicast"], errors);
		}

		function parseSendHostname(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "send-hostname")) {
			obj.send_hostname = parseSendHostname(location + "/send-hostname", value["send-hostname"], errors);
		}
		else {
			obj.send_hostname = true;
		}

		function parseUseDns(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "string") {
						if (!matchIpv4(value))
							push(errors, [ location, "must be a valid IPv4 address" ]);

					}

					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "use-dns")) {
			obj.use_dns = parseUseDns(location + "/use-dns", value["use-dns"], errors);
		}

		function parseDhcpSnoopVlanEnable(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "dhcp-snoop-vlan-enable")) {
			obj.dhcp_snoop_vlan_enable = parseDhcpSnoopVlanEnable(location + "/dhcp-snoop-vlan-enable", value["dhcp-snoop-vlan-enable"], errors);
		}
		else {
			obj.dhcp_snoop_vlan_enable = false;
		}

		function parseVoiceVlanIntfConfig(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseVoiceVlanIntfMode(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "none", "manual", "auto" ]))
						push(errors, [ location, "must be one of \"none\", \"manual\" or \"auto\"" ]);

					return value;
				}

				if (exists(value, "voice-vlan-intf-mode")) {
					obj.voice_vlan_intf_mode = parseVoiceVlanIntfMode(location + "/voice-vlan-intf-mode", value["voice-vlan-intf-mode"], errors);
				}
				else {
					obj.voice_vlan_intf_mode = "auto";
				}

				function parseVoiceVlanIntfPriority(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 6)
							push(errors, [ location, "must be lower than or equal to 6" ]);

						if (value < 0)
							push(errors, [ location, "must be bigger than or equal to 0" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "voice-vlan-intf-priority")) {
					obj.voice_vlan_intf_priority = parseVoiceVlanIntfPriority(location + "/voice-vlan-intf-priority", value["voice-vlan-intf-priority"], errors);
				}
				else {
					obj.voice_vlan_intf_priority = 6;
				}

				function parseVoiceVlanIntfDetectVoice(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "oui", "lldp" ]))
						push(errors, [ location, "must be one of \"oui\" or \"lldp\"" ]);

					return value;
				}

				if (exists(value, "voice-vlan-intf-detect-voice")) {
					obj.voice_vlan_intf_detect_voice = parseVoiceVlanIntfDetectVoice(location + "/voice-vlan-intf-detect-voice", value["voice-vlan-intf-detect-voice"], errors);
				}
				else {
					obj.voice_vlan_intf_detect_voice = "oui";
				}

				function parseVoiceVlanIntfSecurity(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "voice-vlan-intf-security")) {
					obj.voice_vlan_intf_security = parseVoiceVlanIntfSecurity(location + "/voice-vlan-intf-security", value["voice-vlan-intf-security"], errors);
				}
				else {
					obj.voice_vlan_intf_security = false;
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "voice-vlan-intf-config")) {
			obj.voice_vlan_intf_config = parseVoiceVlanIntfConfig(location + "/voice-vlan-intf-config", value["voice-vlan-intf-config"], errors);
		}

		if (exists(value, "dhcp")) {
			obj.dhcp = instantiateInterfaceIpv4Dhcp(location + "/dhcp", value["dhcp"], errors);
		}

		function parseDhcpLeases(location, value, errors) {
			if (type(value) == "array") {
				return map(value, (item, i) => instantiateInterfaceIpv4DhcpLease(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "dhcp-leases")) {
			obj.dhcp_leases = parseDhcpLeases(location + "/dhcp-leases", value["dhcp-leases"], errors);
		}

		function parsePortForward(location, value, errors) {
			if (type(value) == "array") {
				return map(value, (item, i) => instantiateInterfaceIpv4PortForward(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "port-forward")) {
			obj.port_forward = parsePortForward(location + "/port-forward", value["port-forward"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceIpv6Dhcpv6(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseMode(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (!(value in [ "hybrid", "stateless", "stateful", "relay" ]))
				push(errors, [ location, "must be one of \"hybrid\", \"stateless\", \"stateful\" or \"relay\"" ]);

			return value;
		}

		if (exists(value, "mode")) {
			obj.mode = parseMode(location + "/mode", value["mode"], errors);
		}

		function parseAnnounceDns(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "string") {
						if (!matchIpv6(value))
							push(errors, [ location, "must be a valid IPv6 address" ]);

					}

					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "announce-dns")) {
			obj.announce_dns = parseAnnounceDns(location + "/announce-dns", value["announce-dns"], errors);
		}

		function parseFilterPrefix(location, value, errors) {
			if (type(value) == "string") {
				if (!matchUcCidr6(value))
					push(errors, [ location, "must be a valid IPv6 CIDR" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "filter-prefix")) {
			obj.filter_prefix = parseFilterPrefix(location + "/filter-prefix", value["filter-prefix"], errors);
		}
		else {
			obj.filter_prefix = "::/0";
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceIpv6PortForward(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseProtocol(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (!(value in [ "tcp", "udp", "any" ]))
				push(errors, [ location, "must be one of \"tcp\", \"udp\" or \"any\"" ]);

			return value;
		}

		if (exists(value, "protocol")) {
			obj.protocol = parseProtocol(location + "/protocol", value["protocol"], errors);
		}
		else {
			obj.protocol = "any";
		}

		function parseExternalPort(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 65535)
					push(errors, [ location, "must be lower than or equal to 65535" ]);

				if (value < 0)
					push(errors, [ location, "must be bigger than or equal to 0" ]);

			}

			if (type(value) == "string") {
				if (!matchUcPortrange(value))
					push(errors, [ location, "must be a valid network port range" ]);

			}

			if (type(value) != "int" && type(value) != "string")
				push(errors, [ location, "must be of type integer or string" ]);

			return value;
		}

		if (exists(value, "external-port")) {
			obj.external_port = parseExternalPort(location + "/external-port", value["external-port"], errors);
		}
		else {
			push(errors, [ location, "is required" ]);
		}

		function parseInternalAddress(location, value, errors) {
			if (type(value) == "string") {
				if (!matchIpv6(value))
					push(errors, [ location, "must be a valid IPv6 address" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "internal-address")) {
			obj.internal_address = parseInternalAddress(location + "/internal-address", value["internal-address"], errors);
		}
		else {
			push(errors, [ location, "is required" ]);
		}

		function parseInternalPort(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 65535)
					push(errors, [ location, "must be lower than or equal to 65535" ]);

				if (value < 0)
					push(errors, [ location, "must be bigger than or equal to 0" ]);

			}

			if (type(value) == "string") {
				if (!matchUcPortrange(value))
					push(errors, [ location, "must be a valid network port range" ]);

			}

			if (type(value) != "int" && type(value) != "string")
				push(errors, [ location, "must be of type integer or string" ]);

			return value;
		}

		if (exists(value, "internal-port")) {
			obj.internal_port = parseInternalPort(location + "/internal-port", value["internal-port"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceIpv6TrafficAllow(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseProtocol(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "protocol")) {
			obj.protocol = parseProtocol(location + "/protocol", value["protocol"], errors);
		}
		else {
			obj.protocol = "any";
		}

		function parseSourceAddress(location, value, errors) {
			if (type(value) == "string") {
				if (!matchUcCidr6(value))
					push(errors, [ location, "must be a valid IPv6 CIDR" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "source-address")) {
			obj.source_address = parseSourceAddress(location + "/source-address", value["source-address"], errors);
		}
		else {
			obj.source_address = "::/0";
		}

		function parseSourcePorts(location, value, errors) {
			if (type(value) == "array") {
				if (length(value) < 1)
					push(errors, [ location, "must have at least 1 items" ]);

				function parseItem(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 65535)
							push(errors, [ location, "must be lower than or equal to 65535" ]);

						if (value < 0)
							push(errors, [ location, "must be bigger than or equal to 0" ]);

					}

					if (type(value) == "string") {
						if (!matchUcPortrange(value))
							push(errors, [ location, "must be a valid network port range" ]);

					}

					if (type(value) != "int" && type(value) != "string")
						push(errors, [ location, "must be of type integer or string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "source-ports")) {
			obj.source_ports = parseSourcePorts(location + "/source-ports", value["source-ports"], errors);
		}

		function parseDestinationAddress(location, value, errors) {
			if (type(value) == "string") {
				if (!matchIpv6(value))
					push(errors, [ location, "must be a valid IPv6 address" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "destination-address")) {
			obj.destination_address = parseDestinationAddress(location + "/destination-address", value["destination-address"], errors);
		}
		else {
			push(errors, [ location, "is required" ]);
		}

		function parseDestinationPorts(location, value, errors) {
			if (type(value) == "array") {
				if (length(value) < 1)
					push(errors, [ location, "must have at least 1 items" ]);

				function parseItem(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 65535)
							push(errors, [ location, "must be lower than or equal to 65535" ]);

						if (value < 0)
							push(errors, [ location, "must be bigger than or equal to 0" ]);

					}

					if (type(value) == "string") {
						if (!matchUcPortrange(value))
							push(errors, [ location, "must be a valid network port range" ]);

					}

					if (type(value) != "int" && type(value) != "string")
						push(errors, [ location, "must be of type integer or string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "destination-ports")) {
			obj.destination_ports = parseDestinationPorts(location + "/destination-ports", value["destination-ports"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceIpv6(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseAddressing(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (!(value in [ "dynamic", "static" ]))
				push(errors, [ location, "must be one of \"dynamic\" or \"static\"" ]);

			return value;
		}

		if (exists(value, "addressing")) {
			obj.addressing = parseAddressing(location + "/addressing", value["addressing"], errors);
		}

		function parseSubnet(location, value, errors) {
			if (type(value) == "string") {
				if (!matchUcCidr6(value))
					push(errors, [ location, "must be a valid IPv6 CIDR" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "subnet")) {
			obj.subnet = parseSubnet(location + "/subnet", value["subnet"], errors);
		}

		function parseGateway(location, value, errors) {
			if (type(value) == "string") {
				if (!matchIpv6(value))
					push(errors, [ location, "must be a valid IPv6 address" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "gateway")) {
			obj.gateway = parseGateway(location + "/gateway", value["gateway"], errors);
		}

		function parsePrefixSize(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 64)
					push(errors, [ location, "must be lower than or equal to 64" ]);

				if (value < 0)
					push(errors, [ location, "must be bigger than or equal to 0" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "prefix-size")) {
			obj.prefix_size = parsePrefixSize(location + "/prefix-size", value["prefix-size"], errors);
		}

		if (exists(value, "dhcpv6")) {
			obj.dhcpv6 = instantiateInterfaceIpv6Dhcpv6(location + "/dhcpv6", value["dhcpv6"], errors);
		}

		function parsePortForward(location, value, errors) {
			if (type(value) == "array") {
				return map(value, (item, i) => instantiateInterfaceIpv6PortForward(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "port-forward")) {
			obj.port_forward = parsePortForward(location + "/port-forward", value["port-forward"], errors);
		}

		function parseTrafficAllow(location, value, errors) {
			if (type(value) == "array") {
				return map(value, (item, i) => instantiateInterfaceIpv6TrafficAllow(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "traffic-allow")) {
			obj.traffic_allow = parseTrafficAllow(location + "/traffic-allow", value["traffic-allow"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceAcl(location, value, errors) {
	if (type(value) == "array") {
		function parseItem(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseAclInfPolicyPreference(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 64)
							push(errors, [ location, "must be lower than or equal to 64" ]);

						if (value < 1)
							push(errors, [ location, "must be bigger than or equal to 1" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "acl-inf-policy-preference")) {
					obj.acl_inf_policy_preference = parseAclInfPolicyPreference(location + "/acl-inf-policy-preference", value["acl-inf-policy-preference"], errors);
				}
				else {
					obj.acl_inf_policy_preference = 1;
				}

				function parseAclInfPolicyIngress(location, value, errors) {
					if (type(value) == "string") {
						if (length(value) > 32)
							push(errors, [ location, "must be at most 32 characters long" ]);

						if (length(value) < 1)
							push(errors, [ location, "must be at least 1 characters long" ]);

					}

					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				if (exists(value, "acl-inf-policy-ingress")) {
					obj.acl_inf_policy_ingress = parseAclInfPolicyIngress(location + "/acl-inf-policy-ingress", value["acl-inf-policy-ingress"], errors);
				}

				function parseAclInfCountersIngress(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "acl-inf-counters-ingress")) {
					obj.acl_inf_counters_ingress = parseAclInfCountersIngress(location + "/acl-inf-counters-ingress", value["acl-inf-counters-ingress"], errors);
				}
				else {
					obj.acl_inf_counters_ingress = false;
				}

				function parseAclInfPolicyEgress(location, value, errors) {
					if (type(value) == "string") {
						if (length(value) > 32)
							push(errors, [ location, "must be at most 32 characters long" ]);

						if (length(value) < 1)
							push(errors, [ location, "must be at least 1 characters long" ]);

					}

					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				if (exists(value, "acl-inf-policy-egress")) {
					obj.acl_inf_policy_egress = parseAclInfPolicyEgress(location + "/acl-inf-policy-egress", value["acl-inf-policy-egress"], errors);
				}

				function parseAclInfCountersEgress(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "acl-inf-counters-egress")) {
					obj.acl_inf_counters_egress = parseAclInfCountersEgress(location + "/acl-inf-counters-egress", value["acl-inf-counters-egress"], errors);
				}
				else {
					obj.acl_inf_counters_egress = false;
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
	}

	if (type(value) != "array")
		push(errors, [ location, "must be of type array" ]);

	return value;
}

function instantiateInterfaceDhcpSnoopPort(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseDhcpSnoopPortTrust(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "dhcp-snoop-port-trust")) {
			obj.dhcp_snoop_port_trust = parseDhcpSnoopPortTrust(location + "/dhcp-snoop-port-trust", value["dhcp-snoop-port-trust"], errors);
		}
		else {
			obj.dhcp_snoop_port_trust = false;
		}

		function parseDhcpSnoopPortClientLimit(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value < 1)
					push(errors, [ location, "must be bigger than or equal to 1" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "dhcp-snoop-port-client-limit")) {
			obj.dhcp_snoop_port_client_limit = parseDhcpSnoopPortClientLimit(location + "/dhcp-snoop-port-client-limit", value["dhcp-snoop-port-client-limit"], errors);
		}

		function parseDhcpSnoopPortCircuitId(location, value, errors) {
			if (type(value) == "string") {
				if (length(value) > 32)
					push(errors, [ location, "must be at most 32 characters long" ]);

				if (length(value) < 1)
					push(errors, [ location, "must be at least 1 characters long" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "dhcp-snoop-port-circuit-id")) {
			obj.dhcp_snoop_port_circuit_id = parseDhcpSnoopPortCircuitId(location + "/dhcp-snoop-port-circuit-id", value["dhcp-snoop-port-circuit-id"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceBroadBandWwan(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseProtocol(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (value != "wwan")
				push(errors, [ location, "must have value \"wwan\"" ]);

			return value;
		}

		if (exists(value, "protocol")) {
			obj.protocol = parseProtocol(location + "/protocol", value["protocol"], errors);
		}

		function parseModemType(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (!(value in [ "qmi", "mbim", "wwan" ]))
				push(errors, [ location, "must be one of \"qmi\", \"mbim\" or \"wwan\"" ]);

			return value;
		}

		if (exists(value, "modem-type")) {
			obj.modem_type = parseModemType(location + "/modem-type", value["modem-type"], errors);
		}

		function parseAccessPointName(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "access-point-name")) {
			obj.access_point_name = parseAccessPointName(location + "/access-point-name", value["access-point-name"], errors);
		}

		function parseAuthenticationType(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (!(value in [ "none", "pap", "chap", "pap-chap" ]))
				push(errors, [ location, "must be one of \"none\", \"pap\", \"chap\" or \"pap-chap\"" ]);

			return value;
		}

		if (exists(value, "authentication-type")) {
			obj.authentication_type = parseAuthenticationType(location + "/authentication-type", value["authentication-type"], errors);
		}
		else {
			obj.authentication_type = "none";
		}

		function parsePinCode(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "pin-code")) {
			obj.pin_code = parsePinCode(location + "/pin-code", value["pin-code"], errors);
		}

		function parseUserName(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "user-name")) {
			obj.user_name = parseUserName(location + "/user-name", value["user-name"], errors);
		}

		function parsePassword(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "password")) {
			obj.password = parsePassword(location + "/password", value["password"], errors);
		}

		function parsePacketDataProtocol(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (!(value in [ "ipv4", "ipv6", "dual-stack" ]))
				push(errors, [ location, "must be one of \"ipv4\", \"ipv6\" or \"dual-stack\"" ]);

			return value;
		}

		if (exists(value, "packet-data-protocol")) {
			obj.packet_data_protocol = parsePacketDataProtocol(location + "/packet-data-protocol", value["packet-data-protocol"], errors);
		}
		else {
			obj.packet_data_protocol = "dual-stack";
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceBroadBandPppoe(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseProtocol(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (value != "pppoe")
				push(errors, [ location, "must have value \"pppoe\"" ]);

			return value;
		}

		if (exists(value, "protocol")) {
			obj.protocol = parseProtocol(location + "/protocol", value["protocol"], errors);
		}

		function parseUserName(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "user-name")) {
			obj.user_name = parseUserName(location + "/user-name", value["user-name"], errors);
		}

		function parsePassword(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "password")) {
			obj.password = parsePassword(location + "/password", value["password"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceBroadBand(location, value, errors) {
	function parseVariant0(location, value, errors) {
		value = instantiateInterfaceBroadBandWwan(location, value, errors);

		return value;
	}

	function parseVariant1(location, value, errors) {
		value = instantiateInterfaceBroadBandPppoe(location, value, errors);

		return value;
	}

	let success = 0, tryval, tryerr, vvalue = null, verrors = [];

	tryerr = [];
	tryval = parseVariant0(location, value, tryerr);
	if (!length(tryerr)) {
		if (type(vvalue) == "object" && type(tryval) == "object")
			vvalue = { ...vvalue, ...tryval };
		else
			vvalue = tryval;

		success++;
	}
	else {
		push(verrors, join(" and\n", map(tryerr, err => "\t - " + err[1])));
	}

	tryerr = [];
	tryval = parseVariant1(location, value, tryerr);
	if (!length(tryerr)) {
		if (type(vvalue) == "object" && type(tryval) == "object")
			vvalue = { ...vvalue, ...tryval };
		else
			vvalue = tryval;

		success++;
	}
	else {
		push(verrors, join(" and\n", map(tryerr, err => "\t - " + err[1])));
	}

	if (success != 1) {
		if (length(verrors))
			push(errors, [ location, "must match exactly one of the following constraints:\n" + join("\n- or -\n", verrors) ]);
		else
			push(errors, [ location, "must match only one variant" ]);
		return null;
	}

	value = vvalue;

	return value;
}

function instantiateInterfaceTunnelMesh(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseProto(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (value != "mesh")
				push(errors, [ location, "must have value \"mesh\"" ]);

			return value;
		}

		if (exists(value, "proto")) {
			obj.proto = parseProto(location + "/proto", value["proto"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceTunnelVxlan(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseProto(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (value != "vxlan")
				push(errors, [ location, "must have value \"vxlan\"" ]);

			return value;
		}

		if (exists(value, "proto")) {
			obj.proto = parseProto(location + "/proto", value["proto"], errors);
		}

		function parsePeerAddress(location, value, errors) {
			if (type(value) == "string") {
				if (!matchIpv4(value))
					push(errors, [ location, "must be a valid IPv4 address" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "peer-address")) {
			obj.peer_address = parsePeerAddress(location + "/peer-address", value["peer-address"], errors);
		}

		function parsePeerPort(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 65535)
					push(errors, [ location, "must be lower than or equal to 65535" ]);

				if (value < 1)
					push(errors, [ location, "must be bigger than or equal to 1" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "peer-port")) {
			obj.peer_port = parsePeerPort(location + "/peer-port", value["peer-port"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceTunnelL2tp(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseProto(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (value != "l2tp")
				push(errors, [ location, "must have value \"l2tp\"" ]);

			return value;
		}

		if (exists(value, "proto")) {
			obj.proto = parseProto(location + "/proto", value["proto"], errors);
		}

		function parseServer(location, value, errors) {
			if (type(value) == "string") {
				if (!matchIpv4(value))
					push(errors, [ location, "must be a valid IPv4 address" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "server")) {
			obj.server = parseServer(location + "/server", value["server"], errors);
		}

		function parseUserName(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "user-name")) {
			obj.user_name = parseUserName(location + "/user-name", value["user-name"], errors);
		}

		function parsePassword(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "password")) {
			obj.password = parsePassword(location + "/password", value["password"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceTunnelGre(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseProto(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (value != "gre")
				push(errors, [ location, "must have value \"gre\"" ]);

			return value;
		}

		if (exists(value, "proto")) {
			obj.proto = parseProto(location + "/proto", value["proto"], errors);
		}

		function parsePeerAddress(location, value, errors) {
			if (type(value) == "string") {
				if (!matchIpv4(value))
					push(errors, [ location, "must be a valid IPv4 address" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "peer-address")) {
			obj.peer_address = parsePeerAddress(location + "/peer-address", value["peer-address"], errors);
		}

		function parseDhcpHealthcheck(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "dhcp-healthcheck")) {
			obj.dhcp_healthcheck = parseDhcpHealthcheck(location + "/dhcp-healthcheck", value["dhcp-healthcheck"], errors);
		}
		else {
			obj.dhcp_healthcheck = false;
		}

		function parseDontFragment(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "dont-fragment")) {
			obj.dont_fragment = parseDontFragment(location + "/dont-fragment", value["dont-fragment"], errors);
		}
		else {
			obj.dont_fragment = false;
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceTunnelGre6(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseProto(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (value != "gre6")
				push(errors, [ location, "must have value \"gre6\"" ]);

			return value;
		}

		if (exists(value, "proto")) {
			obj.proto = parseProto(location + "/proto", value["proto"], errors);
		}

		function parsePeerAddress(location, value, errors) {
			if (type(value) == "string") {
				if (!matchIpv6(value))
					push(errors, [ location, "must be a valid IPv6 address" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "peer-address")) {
			obj.peer_address = parsePeerAddress(location + "/peer-address", value["peer-address"], errors);
		}

		function parseDhcpHealthcheck(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "dhcp-healthcheck")) {
			obj.dhcp_healthcheck = parseDhcpHealthcheck(location + "/dhcp-healthcheck", value["dhcp-healthcheck"], errors);
		}
		else {
			obj.dhcp_healthcheck = false;
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateInterfaceTunnel(location, value, errors) {
	function parseVariant0(location, value, errors) {
		value = instantiateInterfaceTunnelMesh(location, value, errors);

		return value;
	}

	function parseVariant1(location, value, errors) {
		value = instantiateInterfaceTunnelVxlan(location, value, errors);

		return value;
	}

	function parseVariant2(location, value, errors) {
		value = instantiateInterfaceTunnelL2tp(location, value, errors);

		return value;
	}

	function parseVariant3(location, value, errors) {
		value = instantiateInterfaceTunnelGre(location, value, errors);

		return value;
	}

	function parseVariant4(location, value, errors) {
		value = instantiateInterfaceTunnelGre6(location, value, errors);

		return value;
	}

	let success = 0, tryval, tryerr, vvalue = null, verrors = [];

	tryerr = [];
	tryval = parseVariant0(location, value, tryerr);
	if (!length(tryerr)) {
		if (type(vvalue) == "object" && type(tryval) == "object")
			vvalue = { ...vvalue, ...tryval };
		else
			vvalue = tryval;

		success++;
	}
	else {
		push(verrors, join(" and\n", map(tryerr, err => "\t - " + err[1])));
	}

	tryerr = [];
	tryval = parseVariant1(location, value, tryerr);
	if (!length(tryerr)) {
		if (type(vvalue) == "object" && type(tryval) == "object")
			vvalue = { ...vvalue, ...tryval };
		else
			vvalue = tryval;

		success++;
	}
	else {
		push(verrors, join(" and\n", map(tryerr, err => "\t - " + err[1])));
	}

	tryerr = [];
	tryval = parseVariant2(location, value, tryerr);
	if (!length(tryerr)) {
		if (type(vvalue) == "object" && type(tryval) == "object")
			vvalue = { ...vvalue, ...tryval };
		else
			vvalue = tryval;

		success++;
	}
	else {
		push(verrors, join(" and\n", map(tryerr, err => "\t - " + err[1])));
	}

	tryerr = [];
	tryval = parseVariant3(location, value, tryerr);
	if (!length(tryerr)) {
		if (type(vvalue) == "object" && type(tryval) == "object")
			vvalue = { ...vvalue, ...tryval };
		else
			vvalue = tryval;

		success++;
	}
	else {
		push(verrors, join(" and\n", map(tryerr, err => "\t - " + err[1])));
	}

	tryerr = [];
	tryval = parseVariant4(location, value, tryerr);
	if (!length(tryerr)) {
		if (type(vvalue) == "object" && type(tryval) == "object")
			vvalue = { ...vvalue, ...tryval };
		else
			vvalue = tryval;

		success++;
	}
	else {
		push(verrors, join(" and\n", map(tryerr, err => "\t - " + err[1])));
	}

	if (success != 1) {
		if (length(verrors))
			push(errors, [ location, "must match exactly one of the following constraints:\n" + join("\n- or -\n", verrors) ]);
		else
			push(errors, [ location, "must match only one variant" ]);
		return null;
	}

	value = vvalue;

	return value;
}

function instantiateInterface(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseName(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "name")) {
			obj.name = parseName(location + "/name", value["name"], errors);
		}

		function parseRole(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (!(value in [ "upstream", "downstream" ]))
				push(errors, [ location, "must be one of \"upstream\" or \"downstream\"" ]);

			return value;
		}

		if (exists(value, "role")) {
			obj.role = parseRole(location + "/role", value["role"], errors);
		}

		function parseIsolateHosts(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "isolate-hosts")) {
			obj.isolate_hosts = parseIsolateHosts(location + "/isolate-hosts", value["isolate-hosts"], errors);
		}

		function parseMetric(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 4294967295)
					push(errors, [ location, "must be lower than or equal to 4294967295" ]);

				if (value < 0)
					push(errors, [ location, "must be bigger than or equal to 0" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "metric")) {
			obj.metric = parseMetric(location + "/metric", value["metric"], errors);
		}

		function parseMtu(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 1500)
					push(errors, [ location, "must be lower than or equal to 1500" ]);

				if (value < 1280)
					push(errors, [ location, "must be bigger than or equal to 1280" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "mtu")) {
			obj.mtu = parseMtu(location + "/mtu", value["mtu"], errors);
		}

		function parseServices(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "services")) {
			obj.services = parseServices(location + "/services", value["services"], errors);
		}

		function parseVlanAwareness(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseFirst(location, value, errors) {
					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "first")) {
					obj.first = parseFirst(location + "/first", value["first"], errors);
				}

				function parseLast(location, value, errors) {
					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "last")) {
					obj.last = parseLast(location + "/last", value["last"], errors);
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "vlan-awareness")) {
			obj.vlan_awareness = parseVlanAwareness(location + "/vlan-awareness", value["vlan-awareness"], errors);
		}

		if (exists(value, "vlan")) {
			obj.vlan = instantiateInterfaceVlan(location + "/vlan", value["vlan"], errors);
		}

		if (exists(value, "bridge")) {
			obj.bridge = instantiateInterfaceBridge(location + "/bridge", value["bridge"], errors);
		}

		function parseEthernet(location, value, errors) {
			if (type(value) == "array") {
				return map(value, (item, i) => instantiateInterfaceEthernet(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "ethernet")) {
			obj.ethernet = parseEthernet(location + "/ethernet", value["ethernet"], errors);
		}

		if (exists(value, "ipv4")) {
			obj.ipv4 = instantiateInterfaceIpv4(location + "/ipv4", value["ipv4"], errors);
		}

		if (exists(value, "ipv6")) {
			obj.ipv6 = instantiateInterfaceIpv6(location + "/ipv6", value["ipv6"], errors);
		}

		if (exists(value, "acl")) {
			obj.acl = instantiateInterfaceAcl(location + "/acl", value["acl"], errors);
		}

		if (exists(value, "dhcp-snoop-port")) {
			obj.dhcp_snoop_port = instantiateInterfaceDhcpSnoopPort(location + "/dhcp-snoop-port", value["dhcp-snoop-port"], errors);
		}

		if (exists(value, "broad-band")) {
			obj.broad_band = instantiateInterfaceBroadBand(location + "/broad-band", value["broad-band"], errors);
		}

		if (exists(value, "tunnel")) {
			obj.tunnel = instantiateInterfaceTunnel(location + "/tunnel", value["tunnel"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceLldp(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseDescribe(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "describe")) {
			obj.describe = parseDescribe(location + "/describe", value["describe"], errors);
		}
		else {
			obj.describe = "uCentral Access Point";
		}

		function parseLocation(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "location")) {
			obj.location = parseLocation(location + "/location", value["location"], errors);
		}
		else {
			obj.location = "uCentral Network";
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceSsh(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parsePort(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 65535)
					push(errors, [ location, "must be lower than or equal to 65535" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "port")) {
			obj.port = parsePort(location + "/port", value["port"], errors);
		}
		else {
			obj.port = 22;
		}

		function parseAuthorizedKeys(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "authorized-keys")) {
			obj.authorized_keys = parseAuthorizedKeys(location + "/authorized-keys", value["authorized-keys"], errors);
		}

		function parsePasswordAuthentication(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "password-authentication")) {
			obj.password_authentication = parsePasswordAuthentication(location + "/password-authentication", value["password-authentication"], errors);
		}
		else {
			obj.password_authentication = true;
		}

		function parseEnable(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "enable")) {
			obj.enable = parseEnable(location + "/enable", value["enable"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceNtp(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseServers(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "string") {
						if (!matchUcHost(value))
							push(errors, [ location, "must be a valid hostname or IP address" ]);

					}

					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "servers")) {
			obj.servers = parseServers(location + "/servers", value["servers"], errors);
		}

		function parseLocalServer(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "local-server")) {
			obj.local_server = parseLocalServer(location + "/local-server", value["local-server"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceMdns(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseEnable(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "enable")) {
			obj.enable = parseEnable(location + "/enable", value["enable"], errors);
		}
		else {
			obj.enable = false;
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceRtty(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseHost(location, value, errors) {
			if (type(value) == "string") {
				if (!matchUcHost(value))
					push(errors, [ location, "must be a valid hostname or IP address" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "host")) {
			obj.host = parseHost(location + "/host", value["host"], errors);
		}

		function parsePort(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 65535)
					push(errors, [ location, "must be lower than or equal to 65535" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "port")) {
			obj.port = parsePort(location + "/port", value["port"], errors);
		}
		else {
			obj.port = 5912;
		}

		function parseToken(location, value, errors) {
			if (type(value) == "string") {
				if (length(value) > 32)
					push(errors, [ location, "must be at most 32 characters long" ]);

				if (length(value) < 32)
					push(errors, [ location, "must be at least 32 characters long" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "token")) {
			obj.token = parseToken(location + "/token", value["token"], errors);
		}

		function parseMutualTls(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "mutual-tls")) {
			obj.mutual_tls = parseMutualTls(location + "/mutual-tls", value["mutual-tls"], errors);
		}
		else {
			obj.mutual_tls = true;
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceLog(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseHost(location, value, errors) {
			if (type(value) == "string") {
				if (!matchUcHost(value))
					push(errors, [ location, "must be a valid hostname or IP address" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "host")) {
			obj.host = parseHost(location + "/host", value["host"], errors);
		}

		function parsePort(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 65535)
					push(errors, [ location, "must be lower than or equal to 65535" ]);

				if (value < 100)
					push(errors, [ location, "must be bigger than or equal to 100" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "port")) {
			obj.port = parsePort(location + "/port", value["port"], errors);
		}

		function parseProto(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (!(value in [ "tcp", "udp" ]))
				push(errors, [ location, "must be one of \"tcp\" or \"udp\"" ]);

			return value;
		}

		if (exists(value, "proto")) {
			obj.proto = parseProto(location + "/proto", value["proto"], errors);
		}
		else {
			obj.proto = "udp";
		}

		function parseSize(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value < 32)
					push(errors, [ location, "must be bigger than or equal to 32" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "size")) {
			obj.size = parseSize(location + "/size", value["size"], errors);
		}
		else {
			obj.size = 1000;
		}

		function parsePriority(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value < 0)
					push(errors, [ location, "must be bigger than or equal to 0" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "priority")) {
			obj.priority = parsePriority(location + "/priority", value["priority"], errors);
		}
		else {
			obj.priority = 7;
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceHttp(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseHttpPort(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 65535)
					push(errors, [ location, "must be lower than or equal to 65535" ]);

				if (value < 1)
					push(errors, [ location, "must be bigger than or equal to 1" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "http-port")) {
			obj.http_port = parseHttpPort(location + "/http-port", value["http-port"], errors);
		}
		else {
			obj.http_port = 80;
		}

		function parseEnable(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "enable")) {
			obj.enable = parseEnable(location + "/enable", value["enable"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceIgmp(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseEnable(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "enable")) {
			obj.enable = parseEnable(location + "/enable", value["enable"], errors);
		}
		else {
			obj.enable = false;
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceRadiusProxy(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseProxySecret(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "proxy-secret")) {
			obj.proxy_secret = parseProxySecret(location + "/proxy-secret", value["proxy-secret"], errors);
		}
		else {
			obj.proxy_secret = "secret";
		}

		function parseRealms(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					function parseVariant0(location, value, errors) {
						if (type(value) == "object") {
							let obj = {};

							function parseProtocol(location, value, errors) {
								if (type(value) != "string")
									push(errors, [ location, "must be of type string" ]);

								if (!(value in [ "radsec" ]))
									push(errors, [ location, "must be one of \"radsec\"" ]);

								return value;
							}

							if (exists(value, "protocol")) {
								obj.protocol = parseProtocol(location + "/protocol", value["protocol"], errors);
							}
							else {
								obj.protocol = "radsec";
							}

							function parseRealm(location, value, errors) {
								if (type(value) == "array") {
									function parseItem(location, value, errors) {
										if (type(value) != "string")
											push(errors, [ location, "must be of type string" ]);

										return value;
									}

									return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
								}

								if (type(value) != "array")
									push(errors, [ location, "must be of type array" ]);

								return value;
							}

							if (exists(value, "realm")) {
								obj.realm = parseRealm(location + "/realm", value["realm"], errors);
							}

							function parseAutoDiscover(location, value, errors) {
								if (type(value) != "bool")
									push(errors, [ location, "must be of type boolean" ]);

								return value;
							}

							if (exists(value, "auto-discover")) {
								obj.auto_discover = parseAutoDiscover(location + "/auto-discover", value["auto-discover"], errors);
							}
							else {
								obj.auto_discover = false;
							}

							function parseHost(location, value, errors) {
								if (type(value) == "string") {
									if (!matchUcHost(value))
										push(errors, [ location, "must be a valid hostname or IP address" ]);

								}

								if (type(value) != "string")
									push(errors, [ location, "must be of type string" ]);

								return value;
							}

							if (exists(value, "host")) {
								obj.host = parseHost(location + "/host", value["host"], errors);
							}

							function parsePort(location, value, errors) {
								if (type(value) in [ "int", "double" ]) {
									if (value > 65535)
										push(errors, [ location, "must be lower than or equal to 65535" ]);

								}

								if (type(value) != "int")
									push(errors, [ location, "must be of type integer" ]);

								return value;
							}

							if (exists(value, "port")) {
								obj.port = parsePort(location + "/port", value["port"], errors);
							}
							else {
								obj.port = 2083;
							}

							function parseSecret(location, value, errors) {
								if (type(value) != "string")
									push(errors, [ location, "must be of type string" ]);

								return value;
							}

							if (exists(value, "secret")) {
								obj.secret = parseSecret(location + "/secret", value["secret"], errors);
							}

							function parseUseLocalCertificates(location, value, errors) {
								if (type(value) != "bool")
									push(errors, [ location, "must be of type boolean" ]);

								return value;
							}

							if (exists(value, "use-local-certificates")) {
								obj.use_local_certificates = parseUseLocalCertificates(location + "/use-local-certificates", value["use-local-certificates"], errors);
							}
							else {
								obj.use_local_certificates = false;
							}

							function parseCaCertificate(location, value, errors) {
								if (type(value) != "string")
									push(errors, [ location, "must be of type string" ]);

								return value;
							}

							if (exists(value, "ca-certificate")) {
								obj.ca_certificate = parseCaCertificate(location + "/ca-certificate", value["ca-certificate"], errors);
							}

							function parseCertificate(location, value, errors) {
								if (type(value) != "string")
									push(errors, [ location, "must be of type string" ]);

								return value;
							}

							if (exists(value, "certificate")) {
								obj.certificate = parseCertificate(location + "/certificate", value["certificate"], errors);
							}

							function parsePrivateKey(location, value, errors) {
								if (type(value) != "string")
									push(errors, [ location, "must be of type string" ]);

								return value;
							}

							if (exists(value, "private-key")) {
								obj.private_key = parsePrivateKey(location + "/private-key", value["private-key"], errors);
							}

							function parsePrivateKeyPassword(location, value, errors) {
								if (type(value) != "string")
									push(errors, [ location, "must be of type string" ]);

								return value;
							}

							if (exists(value, "private-key-password")) {
								obj.private_key_password = parsePrivateKeyPassword(location + "/private-key-password", value["private-key-password"], errors);
							}

							return obj;
						}

						if (type(value) != "object")
							push(errors, [ location, "must be of type object" ]);

						return value;
					}

					function parseVariant1(location, value, errors) {
						if (type(value) == "object") {
							let obj = {};

							function parseProtocol(location, value, errors) {
								if (type(value) != "string")
									push(errors, [ location, "must be of type string" ]);

								if (!(value in [ "radius" ]))
									push(errors, [ location, "must be one of \"radius\"" ]);

								return value;
							}

							if (exists(value, "protocol")) {
								obj.protocol = parseProtocol(location + "/protocol", value["protocol"], errors);
							}

							function parseRealm(location, value, errors) {
								if (type(value) == "array") {
									function parseItem(location, value, errors) {
										if (type(value) != "string")
											push(errors, [ location, "must be of type string" ]);

										return value;
									}

									return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
								}

								if (type(value) != "array")
									push(errors, [ location, "must be of type array" ]);

								return value;
							}

							if (exists(value, "realm")) {
								obj.realm = parseRealm(location + "/realm", value["realm"], errors);
							}

							function parseAuthServer(location, value, errors) {
								if (type(value) == "string") {
									if (!matchUcHost(value))
										push(errors, [ location, "must be a valid hostname or IP address" ]);

								}

								if (type(value) != "string")
									push(errors, [ location, "must be of type string" ]);

								return value;
							}

							if (exists(value, "auth-server")) {
								obj.auth_server = parseAuthServer(location + "/auth-server", value["auth-server"], errors);
							}

							function parseAuthPort(location, value, errors) {
								if (type(value) in [ "int", "double" ]) {
									if (value > 65535)
										push(errors, [ location, "must be lower than or equal to 65535" ]);

									if (value < 1024)
										push(errors, [ location, "must be bigger than or equal to 1024" ]);

								}

								if (type(value) != "int")
									push(errors, [ location, "must be of type integer" ]);

								return value;
							}

							if (exists(value, "auth-port")) {
								obj.auth_port = parseAuthPort(location + "/auth-port", value["auth-port"], errors);
							}

							function parseAuthSecret(location, value, errors) {
								if (type(value) != "string")
									push(errors, [ location, "must be of type string" ]);

								return value;
							}

							if (exists(value, "auth-secret")) {
								obj.auth_secret = parseAuthSecret(location + "/auth-secret", value["auth-secret"], errors);
							}

							function parseAcctServer(location, value, errors) {
								if (type(value) == "string") {
									if (!matchUcHost(value))
										push(errors, [ location, "must be a valid hostname or IP address" ]);

								}

								if (type(value) != "string")
									push(errors, [ location, "must be of type string" ]);

								return value;
							}

							if (exists(value, "acct-server")) {
								obj.acct_server = parseAcctServer(location + "/acct-server", value["acct-server"], errors);
							}

							function parseAcctPort(location, value, errors) {
								if (type(value) in [ "int", "double" ]) {
									if (value > 65535)
										push(errors, [ location, "must be lower than or equal to 65535" ]);

									if (value < 1024)
										push(errors, [ location, "must be bigger than or equal to 1024" ]);

								}

								if (type(value) != "int")
									push(errors, [ location, "must be of type integer" ]);

								return value;
							}

							if (exists(value, "acct-port")) {
								obj.acct_port = parseAcctPort(location + "/acct-port", value["acct-port"], errors);
							}

							function parseAcctSecret(location, value, errors) {
								if (type(value) != "string")
									push(errors, [ location, "must be of type string" ]);

								return value;
							}

							if (exists(value, "acct-secret")) {
								obj.acct_secret = parseAcctSecret(location + "/acct-secret", value["acct-secret"], errors);
							}

							return obj;
						}

						if (type(value) != "object")
							push(errors, [ location, "must be of type object" ]);

						return value;
					}

					function parseVariant2(location, value, errors) {
						if (type(value) == "object") {
							let obj = {};

							function parseProtocol(location, value, errors) {
								if (type(value) != "string")
									push(errors, [ location, "must be of type string" ]);

								if (!(value in [ "block" ]))
									push(errors, [ location, "must be one of \"block\"" ]);

								return value;
							}

							if (exists(value, "protocol")) {
								obj.protocol = parseProtocol(location + "/protocol", value["protocol"], errors);
							}

							function parseRealm(location, value, errors) {
								if (type(value) == "array") {
									function parseItem(location, value, errors) {
										if (type(value) != "string")
											push(errors, [ location, "must be of type string" ]);

										return value;
									}

									return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
								}

								if (type(value) != "array")
									push(errors, [ location, "must be of type array" ]);

								return value;
							}

							if (exists(value, "realm")) {
								obj.realm = parseRealm(location + "/realm", value["realm"], errors);
							}

							function parseMessage(location, value, errors) {
								if (type(value) == "array") {
									function parseItem(location, value, errors) {
										if (type(value) != "string")
											push(errors, [ location, "must be of type string" ]);

										return value;
									}

									return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
								}

								if (type(value) != "string")
									push(errors, [ location, "must be of type string" ]);

								return value;
							}

							if (exists(value, "message")) {
								obj.message = parseMessage(location + "/message", value["message"], errors);
							}

							return obj;
						}

						if (type(value) != "object")
							push(errors, [ location, "must be of type object" ]);

						return value;
					}

					let success = 0, tryval, tryerr, vvalue = null, verrors = [];

					tryerr = [];
					tryval = parseVariant0(location, value, tryerr);
					if (!length(tryerr)) {
						if (type(vvalue) == "object" && type(tryval) == "object")
							vvalue = { ...vvalue, ...tryval };
						else
							vvalue = tryval;

						success++;
					}
					else {
						push(verrors, join(" and\n", map(tryerr, err => "\t - " + err[1])));
					}

					tryerr = [];
					tryval = parseVariant1(location, value, tryerr);
					if (!length(tryerr)) {
						if (type(vvalue) == "object" && type(tryval) == "object")
							vvalue = { ...vvalue, ...tryval };
						else
							vvalue = tryval;

						success++;
					}
					else {
						push(verrors, join(" and\n", map(tryerr, err => "\t - " + err[1])));
					}

					tryerr = [];
					tryval = parseVariant2(location, value, tryerr);
					if (!length(tryerr)) {
						if (type(vvalue) == "object" && type(tryval) == "object")
							vvalue = { ...vvalue, ...tryval };
						else
							vvalue = tryval;

						success++;
					}
					else {
						push(verrors, join(" and\n", map(tryerr, err => "\t - " + err[1])));
					}

					if (success == 0) {
						if (length(verrors))
							push(errors, [ location, "must match at least one of the following constraints:\n" + join("\n- or -\n", verrors) ]);
						else
							push(errors, [ location, "must match only one variant" ]);
						return null;
					}

					value = vvalue;

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "realms")) {
			obj.realms = parseRealms(location + "/realms", value["realms"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceOnlineCheck(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parsePingHosts(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "string") {
						if (!matchUcHost(value))
							push(errors, [ location, "must be a valid hostname or IP address" ]);

					}

					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "ping-hosts")) {
			obj.ping_hosts = parsePingHosts(location + "/ping-hosts", value["ping-hosts"], errors);
		}

		function parseDownloadHosts(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "download-hosts")) {
			obj.download_hosts = parseDownloadHosts(location + "/download-hosts", value["download-hosts"], errors);
		}

		function parseCheckInterval(location, value, errors) {
			if (!(type(value) in [ "int", "double" ]))
				push(errors, [ location, "must be of type number" ]);

			return value;
		}

		if (exists(value, "check-interval")) {
			obj.check_interval = parseCheckInterval(location + "/check-interval", value["check-interval"], errors);
		}
		else {
			obj.check_interval = 60;
		}

		function parseCheckThreshold(location, value, errors) {
			if (!(type(value) in [ "int", "double" ]))
				push(errors, [ location, "must be of type number" ]);

			return value;
		}

		if (exists(value, "check-threshold")) {
			obj.check_threshold = parseCheckThreshold(location + "/check-threshold", value["check-threshold"], errors);
		}
		else {
			obj.check_threshold = 1;
		}

		function parseAction(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "leds" ]))
						push(errors, [ location, "must be one of \"leds\"" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "action")) {
			obj.action = parseAction(location + "/action", value["action"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceDataPlane(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseIngressFilters(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parseName(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "name")) {
							obj.name = parseName(location + "/name", value["name"], errors);
						}

						function parseProgram(location, value, errors) {
							if (type(value) == "string") {
								if (!matchUcBase64(value))
									push(errors, [ location, "must be a valid base64 encoded data" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "program")) {
							obj.program = parseProgram(location + "/program", value["program"], errors);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "ingress-filters")) {
			obj.ingress_filters = parseIngressFilters(location + "/ingress-filters", value["ingress-filters"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceQualityOfServiceClassSelector(location, value, errors) {
	if (type(value) != "string")
		push(errors, [ location, "must be of type string" ]);

	if (!(value in [ "CS0", "CS1", "CS2", "CS3", "CS4", "CS5", "CS6", "CS7", "AF11", "AF12", "AF13", "AF21", "AF22", "AF23", "AF31", "AF32", "AF33", "AF41", "AF42", "AF43", "DF", "EF", "VA", "LE" ]))
		push(errors, [ location, "must be one of \"CS0\", \"CS1\", \"CS2\", \"CS3\", \"CS4\", \"CS5\", \"CS6\", \"CS7\", \"AF11\", \"AF12\", \"AF13\", \"AF21\", \"AF22\", \"AF23\", \"AF31\", \"AF32\", \"AF33\", \"AF41\", \"AF42\", \"AF43\", \"DF\", \"EF\", \"VA\" or \"LE\"" ]);

	return value;
}

function instantiateServiceQualityOfService(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseSelectPorts(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "select-ports")) {
			obj.select_ports = parseSelectPorts(location + "/select-ports", value["select-ports"], errors);
		}

		function parseBandwidthUp(location, value, errors) {
			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "bandwidth-up")) {
			obj.bandwidth_up = parseBandwidthUp(location + "/bandwidth-up", value["bandwidth-up"], errors);
		}
		else {
			obj.bandwidth_up = 0;
		}

		function parseBandwidthDown(location, value, errors) {
			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "bandwidth-down")) {
			obj.bandwidth_down = parseBandwidthDown(location + "/bandwidth-down", value["bandwidth-down"], errors);
		}
		else {
			obj.bandwidth_down = 0;
		}

		function parseBulkDetection(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				if (exists(value, "dscp")) {
					obj.dscp = instantiateServiceQualityOfServiceClassSelector(location + "/dscp", value["dscp"], errors);
				}
				else {
					obj.dscp = "CS0";
				}

				function parsePacketsPerSecond(location, value, errors) {
					if (!(type(value) in [ "int", "double" ]))
						push(errors, [ location, "must be of type number" ]);

					return value;
				}

				if (exists(value, "packets-per-second")) {
					obj.packets_per_second = parsePacketsPerSecond(location + "/packets-per-second", value["packets-per-second"], errors);
				}
				else {
					obj.packets_per_second = 0;
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "bulk-detection")) {
			obj.bulk_detection = parseBulkDetection(location + "/bulk-detection", value["bulk-detection"], errors);
		}

		function parseServices(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "services")) {
			obj.services = parseServices(location + "/services", value["services"], errors);
		}

		function parseClassifier(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						if (exists(value, "dscp")) {
							obj.dscp = instantiateServiceQualityOfServiceClassSelector(location + "/dscp", value["dscp"], errors);
						}
						else {
							obj.dscp = "CS1";
						}

						function parsePorts(location, value, errors) {
							if (type(value) == "array") {
								function parseItem(location, value, errors) {
									if (type(value) == "object") {
										let obj = {};

										function parseProtocol(location, value, errors) {
											if (type(value) != "string")
												push(errors, [ location, "must be of type string" ]);

											if (!(value in [ "any", "tcp", "udp" ]))
												push(errors, [ location, "must be one of \"any\", \"tcp\" or \"udp\"" ]);

											return value;
										}

										if (exists(value, "protocol")) {
											obj.protocol = parseProtocol(location + "/protocol", value["protocol"], errors);
										}
										else {
											obj.protocol = "any";
										}

										function parsePort(location, value, errors) {
											if (type(value) != "int")
												push(errors, [ location, "must be of type integer" ]);

											return value;
										}

										if (exists(value, "port")) {
											obj.port = parsePort(location + "/port", value["port"], errors);
										}

										function parseRangeEnd(location, value, errors) {
											if (type(value) != "int")
												push(errors, [ location, "must be of type integer" ]);

											return value;
										}

										if (exists(value, "range-end")) {
											obj.range_end = parseRangeEnd(location + "/range-end", value["range-end"], errors);
										}

										function parseReclassify(location, value, errors) {
											if (type(value) != "bool")
												push(errors, [ location, "must be of type boolean" ]);

											return value;
										}

										if (exists(value, "reclassify")) {
											obj.reclassify = parseReclassify(location + "/reclassify", value["reclassify"], errors);
										}
										else {
											obj.reclassify = true;
										}

										return obj;
									}

									if (type(value) != "object")
										push(errors, [ location, "must be of type object" ]);

									return value;
								}

								return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
							}

							if (type(value) != "array")
								push(errors, [ location, "must be of type array" ]);

							return value;
						}

						if (exists(value, "ports")) {
							obj.ports = parsePorts(location + "/ports", value["ports"], errors);
						}

						function parseDns(location, value, errors) {
							if (type(value) == "array") {
								function parseItem(location, value, errors) {
									if (type(value) == "object") {
										let obj = {};

										function parseFqdn(location, value, errors) {
											if (type(value) == "string") {
												if (!matchUcFqdn(value))
													push(errors, [ location, "must be a valid fully qualified domain name" ]);

											}

											if (type(value) != "string")
												push(errors, [ location, "must be of type string" ]);

											return value;
										}

										if (exists(value, "fqdn")) {
											obj.fqdn = parseFqdn(location + "/fqdn", value["fqdn"], errors);
										}

										function parseSuffixMatching(location, value, errors) {
											if (type(value) != "bool")
												push(errors, [ location, "must be of type boolean" ]);

											return value;
										}

										if (exists(value, "suffix-matching")) {
											obj.suffix_matching = parseSuffixMatching(location + "/suffix-matching", value["suffix-matching"], errors);
										}
										else {
											obj.suffix_matching = true;
										}

										function parseReclassify(location, value, errors) {
											if (type(value) != "bool")
												push(errors, [ location, "must be of type boolean" ]);

											return value;
										}

										if (exists(value, "reclassify")) {
											obj.reclassify = parseReclassify(location + "/reclassify", value["reclassify"], errors);
										}
										else {
											obj.reclassify = true;
										}

										return obj;
									}

									if (type(value) != "object")
										push(errors, [ location, "must be of type object" ]);

									return value;
								}

								return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
							}

							if (type(value) != "array")
								push(errors, [ location, "must be of type array" ]);

							return value;
						}

						if (exists(value, "dns")) {
							obj.dns = parseDns(location + "/dns", value["dns"], errors);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "classifier")) {
			obj.classifier = parseClassifier(location + "/classifier", value["classifier"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceWireguardOverlay(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseProto(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			if (value != "wireguard-overlay")
				push(errors, [ location, "must have value \"wireguard-overlay\"" ]);

			return value;
		}

		if (exists(value, "proto")) {
			obj.proto = parseProto(location + "/proto", value["proto"], errors);
		}

		function parsePrivateKey(location, value, errors) {
			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "private-key")) {
			obj.private_key = parsePrivateKey(location + "/private-key", value["private-key"], errors);
		}

		function parsePeerPort(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 65535)
					push(errors, [ location, "must be lower than or equal to 65535" ]);

				if (value < 1)
					push(errors, [ location, "must be bigger than or equal to 1" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "peer-port")) {
			obj.peer_port = parsePeerPort(location + "/peer-port", value["peer-port"], errors);
		}
		else {
			obj.peer_port = 3456;
		}

		function parsePeerExchangePort(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 65535)
					push(errors, [ location, "must be lower than or equal to 65535" ]);

				if (value < 1)
					push(errors, [ location, "must be bigger than or equal to 1" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "peer-exchange-port")) {
			obj.peer_exchange_port = parsePeerExchangePort(location + "/peer-exchange-port", value["peer-exchange-port"], errors);
		}
		else {
			obj.peer_exchange_port = 3458;
		}

		function parseRootNode(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parseKey(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				if (exists(value, "key")) {
					obj.key = parseKey(location + "/key", value["key"], errors);
				}

				function parseEndpoint(location, value, errors) {
					if (type(value) == "string") {
						if (!matchUcIp(value))
							push(errors, [ location, "must be a valid IPv4 or IPv6 address" ]);

					}

					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				if (exists(value, "endpoint")) {
					obj.endpoint = parseEndpoint(location + "/endpoint", value["endpoint"], errors);
				}

				function parseIpaddr(location, value, errors) {
					if (type(value) == "array") {
						function parseItem(location, value, errors) {
							if (type(value) == "string") {
								if (!matchUcIp(value))
									push(errors, [ location, "must be a valid IPv4 or IPv6 address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
					}

					if (type(value) != "array")
						push(errors, [ location, "must be of type array" ]);

					return value;
				}

				if (exists(value, "ipaddr")) {
					obj.ipaddr = parseIpaddr(location + "/ipaddr", value["ipaddr"], errors);
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "root-node")) {
			obj.root_node = parseRootNode(location + "/root-node", value["root-node"], errors);
		}

		function parseHosts(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) == "object") {
						let obj = {};

						function parseName(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "name")) {
							obj.name = parseName(location + "/name", value["name"], errors);
						}

						function parseKey(location, value, errors) {
							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "key")) {
							obj.key = parseKey(location + "/key", value["key"], errors);
						}

						function parseEndpoint(location, value, errors) {
							if (type(value) == "string") {
								if (!matchUcIp(value))
									push(errors, [ location, "must be a valid IPv4 or IPv6 address" ]);

							}

							if (type(value) != "string")
								push(errors, [ location, "must be of type string" ]);

							return value;
						}

						if (exists(value, "endpoint")) {
							obj.endpoint = parseEndpoint(location + "/endpoint", value["endpoint"], errors);
						}

						function parseSubnet(location, value, errors) {
							if (type(value) == "array") {
								function parseItem(location, value, errors) {
									if (type(value) == "string") {
										if (!matchUcCidr(value))
											push(errors, [ location, "must be a valid IPv4 or IPv6 CIDR" ]);

									}

									if (type(value) != "string")
										push(errors, [ location, "must be of type string" ]);

									return value;
								}

								return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
							}

							if (type(value) != "array")
								push(errors, [ location, "must be of type array" ]);

							return value;
						}

						if (exists(value, "subnet")) {
							obj.subnet = parseSubnet(location + "/subnet", value["subnet"], errors);
						}

						function parseIpaddr(location, value, errors) {
							if (type(value) == "array") {
								function parseItem(location, value, errors) {
									if (type(value) == "string") {
										if (!matchUcIp(value))
											push(errors, [ location, "must be a valid IPv4 or IPv6 address" ]);

									}

									if (type(value) != "string")
										push(errors, [ location, "must be of type string" ]);

									return value;
								}

								return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
							}

							if (type(value) != "array")
								push(errors, [ location, "must be of type array" ]);

							return value;
						}

						if (exists(value, "ipaddr")) {
							obj.ipaddr = parseIpaddr(location + "/ipaddr", value["ipaddr"], errors);
						}

						return obj;
					}

					if (type(value) != "object")
						push(errors, [ location, "must be of type object" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "hosts")) {
			obj.hosts = parseHosts(location + "/hosts", value["hosts"], errors);
		}

		function parseVxlan(location, value, errors) {
			if (type(value) == "object") {
				let obj = {};

				function parsePort(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 65535)
							push(errors, [ location, "must be lower than or equal to 65535" ]);

						if (value < 1)
							push(errors, [ location, "must be bigger than or equal to 1" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "port")) {
					obj.port = parsePort(location + "/port", value["port"], errors);
				}
				else {
					obj.port = 4789;
				}

				function parseMtu(location, value, errors) {
					if (type(value) in [ "int", "double" ]) {
						if (value > 65535)
							push(errors, [ location, "must be lower than or equal to 65535" ]);

						if (value < 256)
							push(errors, [ location, "must be bigger than or equal to 256" ]);

					}

					if (type(value) != "int")
						push(errors, [ location, "must be of type integer" ]);

					return value;
				}

				if (exists(value, "mtu")) {
					obj.mtu = parseMtu(location + "/mtu", value["mtu"], errors);
				}
				else {
					obj.mtu = 1420;
				}

				function parseIsolate(location, value, errors) {
					if (type(value) != "bool")
						push(errors, [ location, "must be of type boolean" ]);

					return value;
				}

				if (exists(value, "isolate")) {
					obj.isolate = parseIsolate(location + "/isolate", value["isolate"], errors);
				}
				else {
					obj.isolate = true;
				}

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "vxlan")) {
			obj.vxlan = parseVxlan(location + "/vxlan", value["vxlan"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceGps(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseAdjustTime(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "adjust-time")) {
			obj.adjust_time = parseAdjustTime(location + "/adjust-time", value["adjust-time"], errors);
		}
		else {
			obj.adjust_time = false;
		}

		function parseBaudRate(location, value, errors) {
			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			if (!(value in [ 2400, 4800, 9600, 19200 ]))
				push(errors, [ location, "must be one of 2400, 4800, 9600 or 19200" ]);

			return value;
		}

		if (exists(value, "baud-rate")) {
			obj.baud_rate = parseBaudRate(location + "/baud-rate", value["baud-rate"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceTelnet(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseEnable(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "enable")) {
			obj.enable = parseEnable(location + "/enable", value["enable"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateServiceHttps(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseHttpsPort(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value > 65535)
					push(errors, [ location, "must be lower than or equal to 65535" ]);

				if (value < 1)
					push(errors, [ location, "must be bigger than or equal to 1" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "https-port")) {
			obj.https_port = parseHttpsPort(location + "/https-port", value["https-port"], errors);
		}
		else {
			obj.https_port = 443;
		}

		function parseEnable(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "enable")) {
			obj.enable = parseEnable(location + "/enable", value["enable"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateService(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		if (exists(value, "lldp")) {
			obj.lldp = instantiateServiceLldp(location + "/lldp", value["lldp"], errors);
		}

		if (exists(value, "ssh")) {
			obj.ssh = instantiateServiceSsh(location + "/ssh", value["ssh"], errors);
		}

		if (exists(value, "ntp")) {
			obj.ntp = instantiateServiceNtp(location + "/ntp", value["ntp"], errors);
		}

		if (exists(value, "mdns")) {
			obj.mdns = instantiateServiceMdns(location + "/mdns", value["mdns"], errors);
		}

		if (exists(value, "rtty")) {
			obj.rtty = instantiateServiceRtty(location + "/rtty", value["rtty"], errors);
		}

		if (exists(value, "log")) {
			obj.log = instantiateServiceLog(location + "/log", value["log"], errors);
		}

		if (exists(value, "http")) {
			obj.http = instantiateServiceHttp(location + "/http", value["http"], errors);
		}

		if (exists(value, "igmp")) {
			obj.igmp = instantiateServiceIgmp(location + "/igmp", value["igmp"], errors);
		}

		if (exists(value, "radius-proxy")) {
			obj.radius_proxy = instantiateServiceRadiusProxy(location + "/radius-proxy", value["radius-proxy"], errors);
		}

		if (exists(value, "online-check")) {
			obj.online_check = instantiateServiceOnlineCheck(location + "/online-check", value["online-check"], errors);
		}

		if (exists(value, "data-plane")) {
			obj.data_plane = instantiateServiceDataPlane(location + "/data-plane", value["data-plane"], errors);
		}

		if (exists(value, "quality-of-service")) {
			obj.quality_of_service = instantiateServiceQualityOfService(location + "/quality-of-service", value["quality-of-service"], errors);
		}

		if (exists(value, "wireguard-overlay")) {
			obj.wireguard_overlay = instantiateServiceWireguardOverlay(location + "/wireguard-overlay", value["wireguard-overlay"], errors);
		}

		if (exists(value, "gps")) {
			obj.gps = instantiateServiceGps(location + "/gps", value["gps"], errors);
		}

		if (exists(value, "telnet")) {
			obj.telnet = instantiateServiceTelnet(location + "/telnet", value["telnet"], errors);
		}

		if (exists(value, "https")) {
			obj.https = instantiateServiceHttps(location + "/https", value["https"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateMetricsStatistics(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseInterval(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value < 60)
					push(errors, [ location, "must be bigger than or equal to 60" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "interval")) {
			obj.interval = parseInterval(location + "/interval", value["interval"], errors);
		}

		function parseTypes(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "lldp", "clients" ]))
						push(errors, [ location, "must be one of \"lldp\" or \"clients\"" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "types")) {
			obj.types = parseTypes(location + "/types", value["types"], errors);
		}

		function parseWiredClientsMaxNum(location, value, errors) {
			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "wired-clients-max-num")) {
			obj.wired_clients_max_num = parseWiredClientsMaxNum(location + "/wired-clients-max-num", value["wired-clients-max-num"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateMetricsHealth(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseInterval(location, value, errors) {
			if (type(value) in [ "int", "double" ]) {
				if (value < 60)
					push(errors, [ location, "must be bigger than or equal to 60" ]);

			}

			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "interval")) {
			obj.interval = parseInterval(location + "/interval", value["interval"], errors);
		}

		function parseDhcpLocal(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "dhcp-local")) {
			obj.dhcp_local = parseDhcpLocal(location + "/dhcp-local", value["dhcp-local"], errors);
		}
		else {
			obj.dhcp_local = true;
		}

		function parseDhcpRemote(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "dhcp-remote")) {
			obj.dhcp_remote = parseDhcpRemote(location + "/dhcp-remote", value["dhcp-remote"], errors);
		}
		else {
			obj.dhcp_remote = false;
		}

		function parseDnsLocal(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "dns-local")) {
			obj.dns_local = parseDnsLocal(location + "/dns-local", value["dns-local"], errors);
		}
		else {
			obj.dns_local = true;
		}

		function parseDnsRemote(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "dns-remote")) {
			obj.dns_remote = parseDnsRemote(location + "/dns-remote", value["dns-remote"], errors);
		}
		else {
			obj.dns_remote = true;
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateMetricsDhcpSnooping(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseFilters(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "ack", "discover", "offer", "request", "solicit", "reply", "renew" ]))
						push(errors, [ location, "must be one of \"ack\", \"discover\", \"offer\", \"request\", \"solicit\", \"reply\" or \"renew\"" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "filters")) {
			obj.filters = parseFilters(location + "/filters", value["filters"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateMetricsTelemetry(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseInterval(location, value, errors) {
			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "interval")) {
			obj.interval = parseInterval(location + "/interval", value["interval"], errors);
		}

		function parseTypes(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "ssh", "health", "health.dns", "health.dhcp", "health.radius", "health.memory", "client", "client.join", "client.leave", "client.key-mismatch", "wired", "wired.carrier-up", "wired.carrier-down", "unit", "unit.boot-up" ]))
						push(errors, [ location, "must be one of \"ssh\", \"health\", \"health.dns\", \"health.dhcp\", \"health.radius\", \"health.memory\", \"client\", \"client.join\", \"client.leave\", \"client.key-mismatch\", \"wired\", \"wired.carrier-up\", \"wired.carrier-down\", \"unit\" or \"unit.boot-up\"" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "types")) {
			obj.types = parseTypes(location + "/types", value["types"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateMetricsRealtime(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseTypes(location, value, errors) {
			if (type(value) == "array") {
				function parseItem(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					if (!(value in [ "ssh", "health", "health.dns", "health.dhcp", "health.radius", "health.memory", "client", "client.join", "client.leave", "client.key-mismatch", "wired", "wired.carrier-up", "wired.carrier-down", "unit", "unit.boot-up" ]))
						push(errors, [ location, "must be one of \"ssh\", \"health\", \"health.dns\", \"health.dhcp\", \"health.radius\", \"health.memory\", \"client\", \"client.join\", \"client.leave\", \"client.key-mismatch\", \"wired\", \"wired.carrier-up\", \"wired.carrier-down\", \"unit\" or \"unit.boot-up\"" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "types")) {
			obj.types = parseTypes(location + "/types", value["types"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateMetrics(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		if (exists(value, "statistics")) {
			obj.statistics = instantiateMetricsStatistics(location + "/statistics", value["statistics"], errors);
		}

		if (exists(value, "health")) {
			obj.health = instantiateMetricsHealth(location + "/health", value["health"], errors);
		}

		if (exists(value, "dhcp-snooping")) {
			obj.dhcp_snooping = instantiateMetricsDhcpSnooping(location + "/dhcp-snooping", value["dhcp-snooping"], errors);
		}

		if (exists(value, "telemetry")) {
			obj.telemetry = instantiateMetricsTelemetry(location + "/telemetry", value["telemetry"], errors);
		}

		if (exists(value, "realtime")) {
			obj.realtime = instantiateMetricsRealtime(location + "/realtime", value["realtime"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

function instantiateConfigRaw(location, value, errors) {
	if (type(value) == "array") {
		function parseItem(location, value, errors) {
			if (type(value) == "array") {
				if (length(value) < 2)
					push(errors, [ location, "must have at least 2 items" ]);

				function parseItem(location, value, errors) {
					if (type(value) != "string")
						push(errors, [ location, "must be of type string" ]);

					return value;
				}

				return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		return map(value, (item, i) => parseItem(location + "/" + i, item, errors));
	}

	if (type(value) != "array")
		push(errors, [ location, "must be of type array" ]);

	return value;
}

function newUCentralState(location, value, errors) {
	if (type(value) == "object") {
		let obj = {};

		function parseStrict(location, value, errors) {
			if (type(value) != "bool")
				push(errors, [ location, "must be of type boolean" ]);

			return value;
		}

		if (exists(value, "strict")) {
			obj.strict = parseStrict(location + "/strict", value["strict"], errors);
		}
		else {
			obj.strict = false;
		}

		function parseUuid(location, value, errors) {
			if (type(value) != "int")
				push(errors, [ location, "must be of type integer" ]);

			return value;
		}

		if (exists(value, "uuid")) {
			obj.uuid = parseUuid(location + "/uuid", value["uuid"], errors);
		}

		function parsePublic_ip_lookup(location, value, errors) {
			if (type(value) == "string") {
				if (!matchUcFqdn(value))
					push(errors, [ location, "must be a valid fully qualified domain name" ]);

			}

			if (type(value) != "string")
				push(errors, [ location, "must be of type string" ]);

			return value;
		}

		if (exists(value, "public_ip_lookup")) {
			obj.public_ip_lookup = parsePublic_ip_lookup(location + "/public_ip_lookup", value["public_ip_lookup"], errors);
		}

		if (exists(value, "unit")) {
			obj.unit = instantiateUnit(location + "/unit", value["unit"], errors);
		}

		if (exists(value, "globals")) {
			obj.globals = instantiateGlobals(location + "/globals", value["globals"], errors);
		}

		function parseEthernet(location, value, errors) {
			if (type(value) == "array") {
				return map(value, (item, i) => instantiateEthernet(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "ethernet")) {
			obj.ethernet = parseEthernet(location + "/ethernet", value["ethernet"], errors);
		}

		if (exists(value, "switch")) {
			obj.switch = instantiateSwitch(location + "/switch", value["switch"], errors);
		}

		function parseInterfaces(location, value, errors) {
			if (type(value) == "array") {
				return map(value, (item, i) => instantiateInterface(location + "/" + i, item, errors));
			}

			if (type(value) != "array")
				push(errors, [ location, "must be of type array" ]);

			return value;
		}

		if (exists(value, "interfaces")) {
			obj.interfaces = parseInterfaces(location + "/interfaces", value["interfaces"], errors);
		}

		if (exists(value, "services")) {
			obj.services = instantiateService(location + "/services", value["services"], errors);
		}

		if (exists(value, "metrics")) {
			obj.metrics = instantiateMetrics(location + "/metrics", value["metrics"], errors);
		}

		if (exists(value, "config-raw")) {
			obj.config_raw = instantiateConfigRaw(location + "/config-raw", value["config-raw"], errors);
		}

		function parseThirdParty(location, value, errors) {
			if (type(value) == "object") {
				let obj = { ...value };

				return obj;
			}

			if (type(value) != "object")
				push(errors, [ location, "must be of type object" ]);

			return value;
		}

		if (exists(value, "third-party")) {
			obj.third_party = parseThirdParty(location + "/third-party", value["third-party"], errors);
		}

		return obj;
	}

	if (type(value) != "object")
		push(errors, [ location, "must be of type object" ]);

	return value;
}

return {
	validate: (value, errors) => {
		let err = [];
		let res = newUCentralState("", value, err);
		if (errors) push(errors, ...map(err, e => "[E] (In " + e[0] + ") Value " + e[1]));
		return length(err) ? null : res;
	}
};
