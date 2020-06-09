function kdrain
	kubectl drain --ignore-daemonsets --delete-local-data $argv;
end
