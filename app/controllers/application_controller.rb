class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex]) # 新規登録時(sign_up時)にnameとsexというキーのパラメーターを追加で許可する
  end

  # 新規登録後のリダイレクト先を投稿一覧ページへ
  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインに成功しました"

    posts_path  #　ログイン後の遷移先のパス
  end

end
