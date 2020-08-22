class InvitationMailer < ApplicationMailer
  def invite(invitation)
    mail(
      to: invitation.email,
      subject: "Invitation to join #{invitation.account.name} on Blink"
    )
  end
end
