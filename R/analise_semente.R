# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'
analise_semente <- function(path, ...) {
    # ensure path exists
    dir.create(path, recursive = TRUE, showWarnings = FALSE)

    # our structure
    dir.create(paste0(path, "/code"))
    dir.create(paste0(path, "/data"))
    dir.create(paste0(path, "/reports"))

    # README
    leiame = c(
        "# Leia-me mucho",
        "",
        "Nossos planos são muito bons",
        ""
    )
    leiame = paste(leiame, collapse = "\n")
    writeLines(leiame, con = file.path(path, "README.md"))

    # report1
    report = c(
        "---",
        "title: \"REPLACE ME\"",
        "output:",
        "    html_document:",
        "    df_print: paged",
        "theme: sandstone",
        "---",
        "",
        "```{r echo=FALSE, message=FALSE, warning=FALSE}",
        "library(tidyverse)",
        "library(here)",
        "library(viridis)",
        "source(here::here(\"code/lib.R\"))",
        "theme_set(theme_report())",
        "",
        "knitr::opts_chunk$set(tidy = FALSE,",
        "                      fig.width = 6,",
        "                      fig.height = 5,",
        "                      echo = FALSE)",
        "",
        "paleta = c(\"#404E4D\",",
        "           \"#92DCE5\",",
        "           \"#938BA1\",",
        "           \"#2D3142\",",
        "           \"#F4743B\")",
        "```",
        "",
        "```{r read}",
        "dados = read_projectdata()",
        "```"
    )
    report = paste(report, collapse = "\n")
    writeLines(report, con = file.path(path, "reports/a-report.Rmd"))

    lib = c(
        "theme_report <- function(base_size = 11,",
        "                         strip_text_size = 12,",
        "                         strip_text_margin = 5,",
        "                         subtitle_size = 13,",
        "                         subtitle_margin = 10,",
        "                         plot_title_size = 16,",
        "                         plot_title_margin = 10,",
        "                         ...) {",
        "    ret <- ggplot2::theme_minimal(base_family = \"Roboto-Regular\",",
        "                                  base_size = base_size, ...)",
        "    ret$strip.text <- ggplot2::element_text(hjust = 0, size=strip_text_size,",
        "                                            margin=margin(b=strip_text_margin),",
        "                                            family=\"Roboto-Bold\")",
        "    ret$plot.subtitle <- ggplot2::element_text(hjust = 0, size=subtitle_size,",
        "                                               margin=margin(b=subtitle_margin),",
        "                                               family=\"PT Sans\")",
        "    ret$plot.title <- ggplot2::element_text(hjust = 0, size = plot_title_size,",
        "                                             margin=margin(b=plot_title_margin),",
        "                                            family=\"Oswald\")",
        "    ret",
        "}",
        "",
        "import_data <- function(){",
        "",
        "}",
        "",
        "read_projectdata <- function(){",
        "",
        "}"
    )

    lib = paste(lib, collapse = "\n")
    writeLines(lib, con = file.path(path, "code/lib.R"))

}
