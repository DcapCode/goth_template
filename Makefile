run:
	@echo "Starting the app.."
	@templ generate
	@go run cmd/main.go
install:
	@go install github.com/a-h/templ/cmd/templ@latest
	@go get github.com/joho/godotenv
	@go get github.com/labstack/echo/v4
	@go mod vendor
	@go mod tidy
	@go mod download
	@bun install tailwindcss
	@bun install daisyui@latest
build:
	@tailwindcss -i web/assets/input.css -o public/styles.css
	@templ generate
	@go build -o bin/blog_dcapedcode cmd/main.go
	
tailwindcss:
	@bun run tailwindcss --config tailwind.config.js -i input.css -o ./public/static/css/styles.css
templ:
	@templ generate