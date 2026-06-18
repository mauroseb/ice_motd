# Chef InSpec test for recipe ice_motd::default

describe file('/etc/motd') do
  it { should exist }
  its('mode') { should cmp '0644' }
  its('content') { should match(/THIS NODE IS MANAGED BY CHEF/) }
  its('content') { should match(/infra-testkitchen-01.a2-01.local/) }
  its('content') { should match(/PROD/) }
  its('content') { should match(/Footer sample line/) }
end
