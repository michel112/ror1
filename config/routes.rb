Rails.application.routes.draw do
	root 'parallel#parallelrate'
	#root 'application#scrape_reddit'
  get '/bdcrate' => 'bdc#bdcrate'
end