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
}

// ArticleMetadata 是文章元数据的实体类
type ArticleMetadata struct {
	UpdatedAt   time.Time `json:"updatedAt"`
	Title       string    `json:"title"`
	Slug        string    `json:"slug"`
	Description string    `json:"description"`
}
