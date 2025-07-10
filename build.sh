LINKS_HTML=""

for path in $(find src -maxdepth 1 -mindepth 1 -type d); do
  DIR_NAME=$(basename "$path")
  mkdir -p ./writeups/$DIR_NAME
  mdbook build ./$path -d ../../writeups/$DIR_NAME
  LINKS_HTML+=" <li><a href=\"https://citnap.github.io/saba-ctf-notes/$DIR_NAME\">$DIR_NAME</a></li>"
done

# Generate the final index.html
cat > ./writeups/index.html <<EOF
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Contents</title>
        <style>
            /* mdBook Dark Theme Inspired Palette */
            :root {
                --bg: #1e1e1e;
                --fg: #d4d4d4;
                --link: #4fc1ff;
                --subtle: #2d2d2d;
                --header: #ffffff;
            }

            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
                font-family:
                    system-ui,
                    -apple-system,
                    BlinkMacSystemFont,
                    "Segoe UI",
                    Roboto,
                    Oxygen,
                    Ubuntu,
                    Cantarell,
                    "Open Sans",
                    "Helvetica Neue",
                    sans-serif;
                background-color: var(--bg);
                color: var(--fg);
                line-height: 1.8;
                padding: 3rem 2rem;
                font-size: 1.25rem;
            }

            h1 {
                text-align: center;
                color: var(--header);
                font-size: 2.75rem;
                margin-bottom: 1rem;
            }

            .description {
                max-width: 700px;
                margin: 0 auto 3rem auto;
                text-align: justify;
                text-indent: 2em; /
                font-size: 1.1rem;
                color: var(--fg);
            }

            h2 {
                color: var(--header);
                font-size: 2rem;
                margin-top: 2rem;
                margin-bottom: 1.5rem;
            }

            ul {
                padding-left: 2rem;
                margin: 0;
            }

            li {
                margin-bottom: 1rem;
            }

            a {
                color: var(--link);
                text-decoration: none;
                font-weight: 500;
            }

            a:hover {
                text-decoration: underline;
            }

            .container {
                max-width: 900px;
                margin: auto;
                padding: 0 2rem;
            }

            @media (max-width: 600px) {
                body {
                    padding: 2rem 1rem;
                    font-size: 1.1rem;
                }

                h1 {
                    font-size: 2rem;
                }

                h2 {
                    font-size: 1.5rem;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Contents</h1>
            <p class="description">
                This is a site where I plan to collect my CTF writeups — even
                though there currently is only one 😅.
            </p>
            <hr class="divider" />
            <h2>Writeups</h2>
            <ul>
                $LINKS_HTML
            </ul>
        </div>
    </body>
</html>

EOF
