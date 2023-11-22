# lib/tasks/backfill_categories_description.rake
namespace :db do
    desc "Backfill categories description"
    task backfill_categories_description: :environment do


      Category.all.each do |category|
        category.update(description: "Default Description") if category.description.blank?
      end
    end
  end

