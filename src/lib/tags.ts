export const allPosts = Object.values(
    import.meta.glob("../pages/posts/*.md", { eager: true }),
);

export const uniqueTags = [ ...new Set(allPosts.map((post: any) => post.frontmatter.tags).flat()), ];
