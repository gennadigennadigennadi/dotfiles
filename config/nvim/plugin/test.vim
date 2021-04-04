let test#php#phpunit#executable = 'docker-compose run --rm php bin/phpunit'
let test#strategy = "neovim"
let test#enabled_runners = ["php#phpunit"]
