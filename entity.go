package main

import "time"

// Article 是博客文章的实体类
type Article struct {
  ID        uint64
  CreatedAt time.Time `gorm:"column:created_at"`
  UpdatedAt time.Time `gorm:"column:updated_at"`

  Title       string `gorm:"column:title"`
  Slug        string `gorm:"column:slug"`
  IsHidden    bool   `gorm:"column:is_hidden"`
  IsDeleted   bool   `gorm:"column:is_deleted"`
  Description string `gorm:"column:description"`
  SeriesSlug  string `gorm:"column:series_slug"`
}

// ArticleFullTitle 是详细文章标题信息的实体类，提供文章的摘要信息
type ArticleFullTitle struct {
  UpdatedAt   time.Time `json:"updatedAt"`
  Title       string    `json:"title"`
  Slug        string    `json:"slug"`
  Description string    `json:"description"`
}

// ArticleSimpleTitle 是简略文章标题信息的实体类，不提供文章的摘要信息
type ArticleSimpleTitle struct {
  UpdatedAt  time.Time `json:"updatedAt"`
  Title      string    `json:"title"`
  Slug       string    `json:"slug"`
  SeriesName string    `json:""`
}

type ArticleContent struct {
  ID        uint64
  CreatedAt time.Time `gorm:"column:created_at"`
  UpdatedAt time.Time `gorm:"column:updated_at"`

  ArticleSlug     string `gorm:"column:article_slug"`
  ArticleMarkdown string `gorm:"column:article_markdown"`
  ArticleHtml     string `gorm:"column:article_html"`
}

// ArticlePageDetail 是文章页所需信息的实体类
type ArticlePageDetail struct {
  UpdatedAt time.Time `json:"updatedAt"`
  Title     string    `json:"title"`
  Html      string    `json:"html"`
}

// Series 是专栏的实体类
type Series struct {
  ID          uint64    `gorm:"column:id"`
  CreatedAt   time.Time `gorm:"column:created_at"`
  UpdatedAt   time.Time `gorm:"column:updated_at"`
  Name        string    `gorm:"column:name"`
  Slug        string    `gorm:"column:slug"`
  Description string    `gorm:"column:description"`
}

// SeriesArticle 是文章与对应专栏的映射关系的实体类
type SeriesArticle struct {
  ID          uint64    `gorm:"column:id"`
  CreatedAt   time.Time `gorm:"column:created_at"`
  UpdatedAt   time.Time `gorm:"column:updated_at"`
  SeriesSlug  string    `gorm:"column:series_slug"`
  ArticleSlug string    `gorm:"column:article_slug"`
}

// SeriesArticleListItem 是某个专栏与对应的全部文章
type SeriesArticleListItem struct {
  SeriesName        string
  SeriesSlug        string
  SeriesDescription string
  SimpleTitleList   []ArticleSimpleTitle
}

type ArchivedArticleList struct {
  Year        string
  ArticleList []ArticleSimpleTitle
}

// About 是关于页信息的实体类
type About struct {
  ID        uint64    `gorm:"column:id"`
  CreatedAt time.Time `gorm:"column:created_at"`
  UpdatedAt time.Time `gorm:"column:updated_at"`
  Markdown  string    `gorm:"column:markdown"`
  Html      string    `gorm:"column:html"`
}
