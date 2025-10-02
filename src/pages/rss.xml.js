import rss, { pagesGlobToRssItems } from '@astrojs/rss';

export async function GET(context) {
  return rss({
    title: "Caden Parajuli's Blog",
    description: "In a world of artificial intelligence, I bring organic stupidity to your RSS feed",
    site: context.site,
    items: await pagesGlobToRssItems(import.meta.glob('./posts/*.md')),
    customData: `<language>en-us</language>`,
  });
}
