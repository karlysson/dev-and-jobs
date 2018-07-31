module RubyJobsBrazilScraper
    require 'nokogiri'
    require 'rest-client'
  
    def RubyJobsBrazilScraper.searchJobs
      url = 'http://rubyjobsbrazil.com.br/jobs'
      all_jobs = []
  
      loop do # caminha entre páginas
        jobs_page = getPage(url)
        jobs_element = jobs_page.css('div.job')
  
        getJob(jobs_element).each do |job|
          all_jobs.push(job)
        end
  
        if hasNextPage?(jobs_page)
          url = getNextPageUrl(jobs_page)
        else
          break
        end
  
        puts all_jobs
      end
    end
    
    private
  
    def RubyJobsBrazilScraper.getPage(url)
      resp = RestClient.get(url)
      page_html = Nokogiri::HTML(resp)
    end
  
  
    def RubyJobsBrazilScraper.getJob(elements)
      jobs = []
  
      elements.each do |element|
  
        job = {
          title: getTitle(element),
          description: getDescription(element),
          state: getState(element),
          city: getCity(element),
          url: getJobUrl(element)
        }
  
        jobs.push(job)
      end
  
      jobs
    end
  
  
    def RubyJobsBrazilScraper.getTitle(element)
      title = element.css('div.wrapper')[0].css('h2').text
      title
    end
  
  
    def RubyJobsBrazilScraper.getJobUrl(element)
      job_path = element.css('a')[0]['href']
      job_url = 'http://rubyjobsbrazil.com.br' << job_path
      job_url
    end
  
  
    def RubyJobsBrazilScraper.getDescription(element)
      description_url = getJobUrl(element)
      description_page = getPage(description_url)
      description = description_page.css('div.description').inner_html
      description
    end
  
  
    def RubyJobsBrazilScraper.getLocation(element)
      location = element.css('div.wrapper')[0].css('div')[2].text
    end
  
  
    def RubyJobsBrazilScraper.getState(element)
      location = getLocation(element)
      state = location.split('/')[1]
    end
  
  
    def RubyJobsBrazilScraper.getCity(element)
      location = getLocation(element)
      state = location.split('/')[0]
    end
  
  
    def RubyJobsBrazilScraper.getNextPageUrl(element)
      next_page_path = element.css("a[rel='next']")[0]['href']
      next_page_url = 'http://rubyjobsbrazil.com.br' << next_page_path
      next_page_url
    end
  
  
    def RubyJobsBrazilScraper.hasNextPage?(element)
      if element.css("a[rel='next']").empty?
        false
      else
        true
      end
    end
  end
  
  #RubyJobsBrazilScraper.searchJobs