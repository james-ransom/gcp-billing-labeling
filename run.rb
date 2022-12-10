#!/usr/bin/ruby
require "rubygems"
require "json"
require "pp"
require 'open3'

require_relative 'config'
include Config 

class GCPLabel 

  @@threads = [] 

  def setup_labels(labels)
    str = '' 
    labels[0].each do |key,value|
        str = str + key + "=" + value + ","
    end
    return str.chop 
  end


  def label_resources(type)

    cmd = "bash -ci 'gcloud compute "+ type + " list --filter=-labels:rs-type '"
    stdout, stderr, status = Open3.capture3(cmd)
    items =  stdout.split("\n")
    thread_id = 1 
    items.each do |item|
      thread_id = thread_id + 1
      found = false
      Config::MAP.each do |item_pattern,labels|
        reg = Regexp.new( item_pattern.to_s); 
        if item.match(reg)
            zone=item.split(/(?:[[:space:]][[:space:]]+|\t)/)[1]
            name=item.split(/(?:[[:space:]][[:space:]]+|\t)/)[0]
            cmd_labels="gcloud compute "+ type + " add-labels " + name + " --format=none --no-user-output-enabled -q --zone=" + zone  + " --labels="  + setup_labels(labels)
            @@threads << Thread.new {
              `#{cmd_labels}`
      	    }
            found = true
        end 
      end
      if found == false
        print "Unable to label resource: " + item + "\n"
      end
    end
  end

  def run_threads
    @@threads.each_slice(50) do | batch |
      batch.each do |thread|
        thread.join
      end
    end
  end

end 

project_str = ARGV[0]
labeler = GCPLabel.new
labeler.label_resources("instances")
labeler.label_resources("disks")
labeler.run_threads
