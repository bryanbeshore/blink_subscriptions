# json.id all_accounts.collect(&:id)
json.subdomain all_accounts.collect(&:subdomain)
json.subscription all_accounts.collect(&:subscription)
# json.name all_users.collect(&:name)
# json.admin all_users.collect(&:admin)
# json.accounts all_users.collect(&:accounts)
# json.avatar_url gravatar_image_url(current_resource_owner.email, size: 40)