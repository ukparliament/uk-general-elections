require 'csv'

task :setup => [
  :import ] do
end


task :import => :environment do
  puts "importing election data"
  CSV.foreach( 'db/data/download.tsv', :col_sep => "\t" ) do |row|
    general_election_name = row[0].strip
    election_year = row[1].strip
    voting_start_on = row[2].to_date
    voting_end_on = row[3].to_date
    constituency_name = row[4].strip
    party_name = row[5].strip
    candidate_name = row[6].strip
    is_uncontested = row[7]
    votes = row[8] if row[8]
    turnout = row[9] if row[9]
    
    year = Year.find_by_year( election_year )
    unless year
      year = Year.new
      year.year = election_year
      year.save
    end
    
    general_election = GeneralElection.find_by_name( general_election_name )
    unless general_election
      general_election = GeneralElection.new
      general_election.name = general_election_name
      general_election.voting_start_on = voting_start_on
      general_election.voting_end_on = voting_end_on
      general_election.year = year
      general_election.save
    end
    
    constituency = Constituency.find_by_name( constituency_name )
    unless constituency
      constituency = Constituency.new
      constituency.name = constituency_name
      constituency.save
    end
    
    party = Party.find_by_name( party_name )
    unless party
      party = Party.new
      party.name = party_name
      party.save
    end
    
    election = Election
      .where( "general_election_id = ?", general_election.id )
      .where( "constituency_id = ?", constituency.id )
      .first
    unless election
      election = Election.new
      election.turnout = turnout if turnout
      election.is_uncontested = is_uncontested
      election.general_election = general_election
      election.constituency = constituency
      election.save
    end
    
    candidacy = Candidacy
      .where( "election_id = ?", election.id )
      .where( "party_id = ?", party.id )
      .where( "candidate_name = ?", candidate_name )
      .where( "votes = ?", votes )
      .first
      
    unless candidacy
      candidacy = Candidacy.new
      candidacy.candidate_name = candidate_name
      candidacy.votes = votes if votes
      candidacy.election = election
      candidacy.party = party
      candidacy.save
    end
  end
end

task :check_uncontested => :environment do 
  elections = Election.all
  elections.each do |election|
    if election.candidacies.first.is_unopposed == false
      election.candidacies.each do |candidacy|
        puts "oooops" if candidacy.is_unopposed == true
        puts "whhhhops" if candidacy.votes.nil?
      end
    end
  end
end