module Org
  class SessionFeedsController < OrganizationController

    def index
      @session_feed = SessionFeed.new

      @existing_feeds = @current_organization.session_feeds.order(created_at: :desc)
    end

    def create
      @session_feed = SessionFeed.create!(session_feeds_params.merge(current_user: @current_user))
      redirect_to '/'
    end

    private

    def session_feeds_params
      params.require(:org_session_feed).permit(
          :body,
          :attachment
      )
    end
  end
end
