# diagrams

## Prerequisites to create diagrams from code

It requires Python 3.6 or higher, check your Python version first

It uses [Graphviz](https://www.graphviz.org/) to render the diagram, so you need to [install Graphviz](https://graphviz.gitlab.io/download/) to use diagrams. After installing graphviz (or already have it), install the `diagrams`.

macOS users can download the Graphviz via `brew install graphviz` if you're using [Homebrew](https://brew.sh/). Similarly, Windows users with [Chocolatey](https://chocolatey.org/) installed can run `choco install graphviz`.

## How to use?

### AWS Infrastructure Diagram

Install `diagrams`

```bash
# using pip (pip3)
$ pip install diagrams
```

Run the diagram-as-code code

```bash
$ python3 github-actions-self-hosted-runner-aws-infra.py
```

Open the generated image

```bash
# on MacOS
$ open github_actions_self_hosted_runner_aws_infrastructure.png
```

### GitHub Actions Self Hosted Runner Working

Install Mermaid CLI

```bash
$ npm install -g @mermaid-js/mermaid-cli
```

Run Mermaid CLI tool with input as diagram-as-code code

```bash
$ mmdc --input github-actions-self-hosted-runner-working.mmd --output github-actions-self-hosted-runner-working.svg
```

Open the generated image

```bash
# on MacOS
$ open github-actions-self-hosted-runner-working.svg
```

## References to the softwares used

- https://github.com/mingrammer/diagrams
- https://mermaid.js.org/
