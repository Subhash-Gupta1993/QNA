class QuestionAndAnswerController < ApplicationController
	before_action :authenticate_user!, except: [:new_like]

	def new_question
		@question = current_user.questions.new
	end

	def create_question
		question = current_user.questions.new(question_params)
		if question.save
			notice = "Successfully added."
		else
			notice = "Something went wrong."
		end
		return redirect_to root_path, notice: notice 
	end

	def new_answer
		@question = Question.find_by_id(params[:id])
		@answer = @question.answers.new
	end

	def create_answer
		question = Question.find_by_id(params[:answer][:id])
		answer = question.answers.new(answer_params)
		answer.user_id = current_user.id
		if answer.save
			notice = "Successfully added."
		else
			notice = "Something went wrong."
		end
		return redirect_to root_path, notice: notice
	end

	def new_like
		@questions = Question.all.recent
		question = Question.find_by_id(params[:id])
		like = question.likes.find_or_create_by(user_id: current_user.id) if current_user.present?
		unless like.present?
			@message = "Error"
		end
		respond_to do |format| 
	      format.js
	    end
	end
    protected
	def question_params
  		params.require(:question).permit(:question)
  	end

  	def answer_params
  		params.require(:answer).permit(:answer)
  	end
end
