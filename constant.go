package main

// TableNameArticle 是 Article 表的名字
const TableNameArticle = "article"

// ArticleMetadataColumns 是获取文章元数据时后端提供的字段
const ArticleMetadataColumns = "updated_at, title, slug, description"

const TableNameArticleContent = "article_content"
const ArticleMetadataMinColumns = "updated_at, title, slug"
const ArticleContentHtmlColumns = "article_slug, article_html"
const ArticleSimpleTitleColumns = "updated_at, title, slug, series_slug"

const TableNameSeries = "series"
const SeriesAllColumns = "created_at, updated_at, name, slug, description"
const SeriesMinColumns = "name, slug, description"

const TableNameSeriesArticle = "series_article"
const SeriesArticleSeriesSlugColumn = "series_slug"
const SeriesArticleAllColumns = "created_at, updated_at, series_name, article_slug"

const TableNameAbout = "about"
const AboutMarkdown = "updated_at, markdown"
const AboutHtml = "updated_at, html"

const TableNameUser = "user"
const UserInfoColumns = "created_at, updated_at, username, password"

const DefaultOffset = "0"
const DefaultLimit = "3"
