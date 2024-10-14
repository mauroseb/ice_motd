# Chef InSpec test for recipe ice_motd::default

describe file('/etc/motd') do
  it { should exist }
  its('mode') { should cmp '0644' }
  its('content') { should match 'PRODUCTION' }
  its('content') { should match 'Footer sample line' }
end
