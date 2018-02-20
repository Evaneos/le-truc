## Contributing

Nice to see people wanting to contribute to this **truc**! 👌

### Write

Follow the example in [the post section](/_posts), and create your own post. Donc forget to add tags and a nice summary.

### Illustrate

You can use markdown code blocks to add some nice code, but you can also use [Carbon](https://carbon.now.sh/).

Generate your PNG code snippet, put it in the assets and add it to your post like so:

```markdown
{:.center} ![Inline]({{ "/assets/${YOUR_POST_BASE_NAME}/${YOUR_ASSET_FILENAME}" | absolute_url }})
```

#### Assets

_A quick note on assets._

Create a folder dedicated to your post to keep things a bit structured.

For example:

The article in `_posts/2018-02-13-ouvrir-une-issue-github-depuis-le-code.md` will get this asset structure:

```
├── assets
│   ├── 2018-02-13-ouvrir-une-issue-github-depuis-le-code
│   │   ├── some-asset-nicely-named.png
│   │   ├── and-another-one.png
│   │   └── contextual-menu.png
│   ├── 2018-02-09-afficher-du-code-dans-les-textarea-github
│   │   └── ...
│   ├── 2018-02-20-git-diff-github-style
│   │   └── ...
```