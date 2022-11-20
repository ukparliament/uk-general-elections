Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index', as: :home
  
  get 'years' => 'year#index', as: :year_list
  get 'years/:year' => 'year#show', as: :year_show
  
  get 'general-elections' => 'general_election#index', as: :general_election_list
  get 'general-elections/:general_election' => 'general_election#show', as: :general_election_show
  
  get 'general-elections/:general_election/elections' => 'general_election_election#index', as: :general_election_election_list
  
  get 'general-elections/:general_election/parties' => 'general_election_party#index', as: :general_election_party_list
  get 'general-elections/:general_election/parties/:party' => 'general_election_party#show', as: :general_election_party_show
  
  get 'elections' => 'election#index', as: :election_list
  get 'elections/:election' => 'election#show', as: :election_show
  
  get 'constituencies' => 'constituency#index', as: :constituency_list
  get 'constituencies/:constituency' => 'constituency#show', as: :constituency_show
  
  get 'parties' => 'party#index', as: :party_list
  get 'parties/:party' => 'party#show', as: :party_show
  
  get 'letters' => 'letter#index', as: :letter_list
  get 'letters/:letter' => 'letter#show', as: :letter_show
  
  get 'surnames' => 'surname#index', as: :surname_list
  get 'surnames/:surname' => 'surname#show', as: :surname_show
  
  get 'candidate-names' => 'candidate_name#index', as: :candidate_name_list
  get 'candidate-names/:candidate_name' => 'candidate_name#show', as: :candidate_name_show
  
  get 'meta' => 'meta#index', as: :meta_list
  get 'meta/schema' => 'meta#schema', as: :meta_schema
end
