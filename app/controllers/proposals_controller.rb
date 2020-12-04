class ProposalsController < ApplicationController

  before_action :set_proposal, only: [ :edit, :update ]

  def edit
    @job = Job.find(params[:job_id])
    @date = "#{@proposal.deadline.strftime("%d.%m.%Y")} - (#{(Date.today - @proposal.deadline).ceil.abs} days)"
  end

  def update
    @proposal.update(proposal_status_params)

    @job = Job.find(params[:job_id])
    redirect_to @job
  end

  private

  def proposal_status_params
    params.require(:proposal).permit(:status)
  end

  def set_proposal
    @proposal = Proposal.find(params[:id])
    authorize @proposal
  end

end
