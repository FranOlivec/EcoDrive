class CommentsController < ApplicationController
    def create
        @car = Car.find(params[:car_id])
        @comment = @car.comments.new(comment_params)
        @comment.user = current_user
        if @comment.save
          redirect_to @car, notice: 'Comentario añadido con éxito.'
        else
          render 'cars/show'
        end
      end
    
      private
    
      def comment_params
        params.require(:comment).permit(:content)  # Asegúrate de que el atributo coincida con el nombre del modelo
      end

end
