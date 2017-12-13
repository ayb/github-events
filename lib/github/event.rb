# https://developer.github.com/v3/activity/events/types/
module Github
  module Event
    TYPES = %w(
      CommitCommentEvent CreateEvent DeleteEvent DeploymentEvent DeploymentStatusEvent
      DownloadEvent FollowEvent ForkEvent ForkApplyEvent GistEvent GollumEventInstallationEvent
      InstallationRepositoriesEvent IssueCommentEvent IssuesEvent LabelEvent MarketplacePurchaseEvent
      MemberEvent MembershipEvent MilestoneEvent OrganizationEvent OrgBlockEvent PageBuildEvent
      ProjectCardEvent ProjectColumnEvent ProjectEvent PublicEvent PullRequestEvent PullRequestReviewEvent
      PullRequestReviewCommentEvent PushEvent ReleaseEvent RepositoryEvent StatusEvent TeamEvent
      TeamAddEvent WatchEvent
    )

    def self.valid?(event)
      TYPES.include?(event)
    end

    def self.list
      TYPES.join(", ")
    end

  end
end
