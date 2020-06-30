package rgblog

import (
	"log"
	"sort"
	"strconv"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jinzhu/gorm"
)

// DBClient 是数据库操作类
type DBClient struct {
	db *gorm.DB
}

var client DBClient

// GetDBClient 提供获取数据库操作类的客户端
func GetDBClient() *DBClient {
	return &client
}

func init() {
	db, err := gorm.Open("mysql", "stormlin:1234567890@/blog?charset=utf8mb4&parseTime=True&loc=Local")
	if err != nil {
		log.Fatalf("error: %s\n", err.Error())
	}
	client.db = db
}

// GetArticleMetadataByPage 按页获取文章元信息
func (client *DBClient) GetArticleMetadataByPage(offset, limit int) *[]Article {
	articleList := make([]Article, 0)
	client.db.Table(TableNameArticle).Select(ArticleMetadataColumns).
		Where("is_hidden = ? AND is_deleted = ?", 0, 0).
		Offset(offset).Limit(limit).Find(&articleList)
	return &articleList
}

func (client *DBClient) GetPublicArticleCount() int {
	var count int
	client.db.Table(TableNameArticle).
		Where("is_hidden = ? AND is_deleted = ?", 0, 0).Count(&count)
	return count
}

// GetAllPublicArticleSimpleTitle 获取所有公开文章的简略标题信息
func (client *DBClient) GetAllPublicArticleSimpleTitle() *[]ArticleSimpleTitle {
	simpleTitleList := make([]ArticleSimpleTitle, 0)
	client.db.Table(TableNameArticle).Select(ArticleSimpleTitleColumns).
		Where("is_hidden = ? AND is_deleted = ?", 0, 0).Find(&simpleTitleList)
	return &simpleTitleList
}

func (client *DBClient) GetArticlePageDetailBySlug(slug string) *ArticlePageDetail {
	// 存放对应文章的 title 和 updatedAt 两个字段
	article := Article{}
	// 取对应文章的 title 和 updatedAt 两个字段
	client.db.Table(TableNameArticle).Select(ArticleMetadataMinColumns).
		Where("slug = ? AND is_hidden = ? AND is_deleted = ?", slug, 0, 0).Find(&article)
	// todo: 确定找不到指定文章时的判断条件
	if article.Slug == "" {
		return nil
	}

	// 按照指定的 slug 找对应的文章内容
	var content ArticleContent
	client.db.Table(TableNameArticleContent).Select(ArticleContentHtmlColumns).
		Where("article_slug = ?", slug).Find(&content)
	if content.ArticleSlug == "" {
		return nil
	}
	return &ArticlePageDetail{
		UpdatedAt: article.UpdatedAt,
		Title:     article.Title,
		Html:      content.ArticleHtml,
	}
}

func (client *DBClient) GetSeriesSlugByArticleSlug(articleSlug string) string {
	result := SeriesArticle{}
	client.db.Table(TableNameSeriesArticle).Select(SeriesArticleSeriesSlugColumn).
		Where("article_slug = ?", articleSlug).Find(&result)
	return result.SeriesSlug
}

func (client *DBClient) GetAllSeriesArticle() *[]SeriesArticleListItem {
	// 接口查询结果
	result := make([]SeriesArticleListItem, 0)

	// 获取全部专栏名字
	seriesList := make([]Series, 0)
	client.db.Table(TableNameSeries).Select(SeriesMinColumns).Find(&seriesList)
	// 用来根据 slug 将对应专栏中的文章快速插入对应的结果列表中
	seriesSlugItemMap := make(map[string]*SeriesArticleListItem)
	// 构造结果列表中的专栏列表项
	for _, series := range seriesList {
		newListItem := SeriesArticleListItem{
			SeriesName:        series.Name,
			SeriesSlug:        series.Slug,
			SeriesDescription: series.Description,
			SimpleTitleList:   make([]ArticleSimpleTitle, 0),
		}
		seriesSlugItemMap[series.Slug] = &newListItem
	}

	// 获取全部公开的文章
	articleList := make([]Article, 0)
	client.db.Table(TableNameArticle).Select(ArticleSimpleTitleColumns).
		Where("is_hidden = ? AND is_deleted = ?", 0, 0).Find(&articleList)
	// 将查出的所有文章归入对应的专栏中
	for _, article := range articleList {
		seriesItem := seriesSlugItemMap[article.SeriesSlug]
		seriesItem.SimpleTitleList = append(seriesItem.SimpleTitleList, ArticleSimpleTitle{
			UpdatedAt:  article.UpdatedAt,
			Title:      article.Title,
			Slug:       article.Slug,
			SeriesName: seriesItem.SeriesName,
		})
	}

	// 构造结果列表中的专栏列表项
	for _, series := range seriesSlugItemMap {
		result = append(result, *series)
	}

	return &result
}

func (client *DBClient) GetArchivedArticle() *[]ArchivedArticleList {
	result := make([]ArchivedArticleList, 0)

	// 选取全部公开文章，然后按照更新年份从新到旧排序
	allPublicArticles := client.GetAllPublicArticleSimpleTitle()
	// 保存公开文章的发表年份
	yearArticleMap := make(map[string]*ArchivedArticleList)
	// 将文章年份归档，顺便构造返回结构体
	for _, article := range *allPublicArticles {
		updatedYear := strconv.Itoa(article.UpdatedAt.Year())
		if yearArticle, ok := yearArticleMap[updatedYear]; ok {
			// 追加到后面
			yearArticle.ArticleList = append(yearArticle.ArticleList, article)
		} else {
			newArchivedArticleList := ArchivedArticleList{
				Year:        updatedYear,
				ArticleList: []ArticleSimpleTitle{article},
			}
			yearArticleMap[updatedYear] = &newArchivedArticleList
		}
	}

	// 按照年份排序
	var keys []string
	for k := range yearArticleMap {
		keys = append(keys, k)
	}
	sort.Strings(keys)
	keysNum := len(keys)
	// 按照排序后的次序组装响应体
	for i := keysNum - 1; i >= 0; i-- {
		result = append(result, *yearArticleMap[keys[i]])
	}

	return &result
}

func (client *DBClient) GetAboutHtml() *About {
	about := About{}
	// 只取首条记录
	client.db.Table(TableNameAbout).Select(AboutHtml).Offset(0).Limit(1).Find(&about)
	return &about
}

func (client *DBClient) GetAboutMarkdown() *About {
	about := About{}
	client.db.Table(TableNameAbout).Select(AboutMarkdown).Offset(0).Limit(1).Find(&about)
	return &about
}

// GetUserByUsername 根据给定的用户名查询用户信息
func (client *DBClient) GetUserByUsername(username string) *User {
	user := User{}
	client.db.Table(TableNameUser).Select(UserInfoColumns).Offset(0).Limit(1).
		Where("username = ?", username).Find(&user)
	return &user
}

// AddNewUser 向数据库添加新的用户信息
func (client *DBClient) AddNewUser(user *User) {
	client.db.Table(TableNameUser).Create(user)
}
