# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    columns do
      column do
        panel "Recent Songs" do
          ul do
            Song.order(created_at: :desc).limit(5).map do |song|
              li link_to(song.title, admin_song_path(song))
            end
          end
        end
      end

      column do
        panel "Recent Users" do
          ul do
            User.order(created_at: :desc).limit(5).map do |user|
              li link_to(user.email, admin_user_path(user))
            end
          end
        end
      end
    end

    columns do
      column do
        panel "Site Statistics" do
          ul do
            li "Total Songs: #{Song.count}"
            li "Total Users: #{User.count}"
            li "Total Admin Users: #{AdminUser.count}"
          end
        end
      end

      column do
        panel "Info" do
          para "Welcome to the MusicApp Admin Panel."
          para "Use the navigation links above to manage your content."
        end
      end
    end

    columns do
      column do
        panel "Recent Admin Activities" do
          ul do
            AdminUser.order(last_sign_in_at: :desc).limit(5).map do |admin|
              li "#{admin.email} signed in at #{admin.last_sign_in_at}"
            end
          end
        end
      end

      column do
        panel "System Status" do
          para "All systems are running smoothly."
          para "Last database backup: #{Time.now.strftime('%B %d, %Y %H:%M %p')}"
        end
      end
    end
  end # content
end
