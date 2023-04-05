function dockerips
	docker ps -q | xargs docker inspect --format '{{ .Id }} - {{ .Name }} - {{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}'
end
