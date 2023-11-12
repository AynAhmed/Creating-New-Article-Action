# lib/tasks/add_random_articles.rake
namespace :db do
    desc 'Add ten random articles'
    task add_articles: :environment do
    category_ids = Category.all.pluck(:id)
    
    10.times do
    title ="article title #{rand(1000)}"
    body ="article content #{rand(1000)}"

    random_category_id = category_ids.sample

    article = Article.create(title: title , body: body , category_id: random_category_id)
    puts "Created article: #{title} in category: #{article.category.name}"

    end
        puts "randome article successfully"
    end

  end







#gets all the category ids 


    #   article_titles = [
    #     "The Science Behind Healthy Eating",
    #     "Exploring the Wonders of Nature",
    #     "Tech Trends in the Modern World",
    #     "The Art of Culinary Excellence",
    #     "Mastering the World of Finance",
    #     "Unlocking Creativity in Writing",
    #     "Fitness and Wellness for All",
    #     "Travel Adventures of a Lifetime",
    #     "Business Strategies for Success",
    #     "Innovations in Sustainable Living"
    #   ]
  
    #   categories = ["Science", "Nature", "Technology", "Food", "Finance", "Writing", "Health", "Travel", "Business", "Sustainability"]
  
    #   puts "Adding random articles..."
  
    #   10.times do
    #     title = "Title: #{article_titles.sample} and something random here"
    #     body = "This is the body of the article with some random content: #{Faker::Lorem.paragraphs.join(' ')}"
    #     category = @Category.sample
    #     Article.create(title: title, body: body, category: category)
    #     puts "Created article: #{title} in category: #{category}"
    #   end
  
    #   puts "Random articles have been added."
    # endvccvcc