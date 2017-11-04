task default: %w[test]

task :test do
	ruby "spec/db_manager_spec.rb"
	ruby "spec/cve_search_spec.rb"
end

task :clean do 
	rm_rf "output"
end
