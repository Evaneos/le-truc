## Contributing

Nice to see people wanting to contribute their own **trucs**! 👌

### Write

Follow the examples in [the post section](/_posts), and create your own post. Donc forget to add tags and a nice summary.

### Cover

Writing your tips and tricks here might lead to share your **truc** to social media/slack. And adding a cover to give the potential reader some illustrated context would be a good practise.

To do so, add an `image` attribute, in your article, pointing to the cover asset:

```yaml
---
title: My super cool title
summary: "A summary that makes potential readers a sneek peak of the truc."
image: /assets/2018-01-01-your-slugified-super-cool-title.png/cover/a-descriptive-title.png
tags:
    - Nice tag 1
    - Nice tag 2
    - Not so nice tag 1
---
```

See the Illustrate section, you might want to use a nice code preview as a cover if you lack inspiration.

### Illustrate

You can use markdown code blocks to add some nice code, but you can also use [Carbon](https://carbon.now.sh/).

Generate your PNG code snippet, put it in the assets and add it to your post like so:

```markdown
{:.center} ![Inline]({{ "/assets/${YOUR_POST_BASE_NAME}/${YOUR_ASSET_FILENAME}" | absolute_url }})
```

#### ⚠️ Copy/paste

Before using Carbon to generate code snippet images, ask yourself this question:

> Will the user be tempted to copy/paste my code snippet?

If the answer is yes: do not use Carbon 😉

### Asset management

Create a folder dedicated to your post to keep things a bit structured.

For example:

The article in `_posts/2018-02-13-ouvrir-une-issue-github-depuis-le-code.md` will get this asset structure:

```
├── assets
│   ├── 2018-02-13-ouvrir-une-issue-github-depuis-le-code
│   │   ├── cover
│   │   │   └── a-nicely-names-cover.png
│   │   ├── some-asset-nicely-named.png
│   │   ├── and-another-one.png
│   │   └── contextual-menu.png
│   ├── ...
```