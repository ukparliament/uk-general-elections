Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  get '' => 'home#index', as: :root
  get 'uk-general-elections' => 'home#index', as: :home
  
  get 'uk-general-elections/years' => 'year#index', as: :year_list
  get 'uk-general-elections/years/:year' => 'year#show', as: :year_show
  
  get 'uk-general-elections/general-elections' => 'general_election#index', as: :general_election_list
  get 'uk-general-elections/general-elections/:general_election' => 'general_election#show', as: :general_election_show
  
  get 'uk-general-elections/general-elections/:general_election/elections' => 'general_election_election#index', as: :general_election_election_list
  
  get 'uk-general-elections/general-elections/:general_election/parties' => 'general_election_party#index', as: :general_election_party_list
  get 'uk-general-elections/general-elections/:general_election/parties/:party' => 'general_election_party#show', as: :general_election_party_show
  
  get 'uk-general-elections/elections' => 'election#index', as: :election_list
  get 'uk-general-elections/elections/:election' => 'election#show', as: :election_show
  
  get 'uk-general-elections/constituencies' => 'constituency#index', as: :constituency_list
  get 'uk-general-elections/constituencies/:constituency' => 'constituency#show', as: :constituency_show
  
  get 'uk-general-elections/parties' => 'party#index', as: :party_list
  get 'uk-general-elections/parties/:party' => 'party#show', as: :party_show
  
  get 'uk-general-elections/letters' => 'letter#index', as: :letter_list
  get 'uk-general-elections/letters/:letter' => 'letter#show', as: :letter_show
  
  get 'uk-general-elections/surnames' => 'surname#index', as: :surname_list
  get 'uk-general-elections/surnames/:surname' => 'surname#show', as: :surname_show
  
  get 'uk-general-elections/candidate-names' => 'candidate_name#index', as: :candidate_name_list
  get 'uk-general-elections/candidate-names/:candidate_name' => 'candidate_name#show', as: :candidate_name_show
  
  get 'uk-general-elections/meta' => 'meta#index', as: :meta_list
  get 'uk-general-elections/meta/schema' => 'meta#schema', as: :meta_schema
end
