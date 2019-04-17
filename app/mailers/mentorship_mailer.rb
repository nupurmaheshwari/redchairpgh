class MentorshipMailer < ActionMailer::Base 
    def acceptance_email_to_mentee(mentor, mentee)
        @mentor = mentor
        @mentee = mentee
        mail(
          from: ENV['SES_EMAIL'],
          to: @mentee.email,
          subject: 'You have a new mentor!'
         )
    end

    def acceptance_email_to_mentor(mentor, mentee)
        @mentor = mentor
        @mentee = mentee
        mail(
          from: ENV['SES_EMAIL'],
          to: @mentor.email,
          subject: 'You have a new mentee!'
         )
    end
end
        