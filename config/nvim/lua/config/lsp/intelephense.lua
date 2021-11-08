local intelephense = {}

intelephense.settings = {
    languages = { php = {} },
    rootMarkers = { "composer.json" },
    telemetry = { enabled = false },
    format = { enabled = false },
    completion = { fullyQualifyGlobalConstantsAndFunctions = true },
    phpdoc = { returnVoid = true },
}
intelephense.filetypes = { "php" }

return intelephense
