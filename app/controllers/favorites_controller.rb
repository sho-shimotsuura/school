class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(school_id: params[:school_id])
    redirect_to schools_path, notice: "#{favorite.school.user.name}お気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to schools_path, notice: "#{favorite.school.user.name}お気に入り解除しました"
  end
end
