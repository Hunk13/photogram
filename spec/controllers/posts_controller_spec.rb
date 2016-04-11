require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  login_user

  describe "GET #index" do
    let(:posts) { create_list(:post, 2) }
    before do
      get :index
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, id: post }

    it 'assings the requested post to @post' do
      expect(assigns(:post)).to eq post
    end

    it 'tender show template' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new post to @post' do
      expect(assigns(:post)).to be_a_new(Post)
    end
    it 'render new template' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before { get :edit, id: post }
    it 'assings the requested post to @post' do
      expect(assigns(:post)).to eq post
    end
    it 'render new template' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      # it 'save the new post in database' do
      #   expect { post :create, post: attributes_for(:post) }.to change(Post, :count).by(1)
      # end

      # it 'redirect ti show view' do
      #   post :create, post: attributes_for(:post)
      #   expect(response).to redirect_to post_path(assigns(:post))
      # end
    end

    context 'with invalid attributes' do
      # it 'does not save the post' do
      #    expect { post :create, post: attributes_for(:invalid_post) }.to_not change(Post, :count)
      # end

      # it 're-render new view' do
      #   post :create, post: attributes_for(:invalid_post)
      #   expect(response).to render_template :new
      # end
    end
  end

  describe 'PATCH #update' do
    context 'valid attributes' do
      it 'assings the requested post to @post' do
        patch :update, id: post, post: attributes_for(:post)
        expect(assigns(:post)).to eq post
      end

      # it 'changes post attributes' do
      #   patch :update, id: post, post: { caption: 'new caption', image: 'new image' }
      #   post.reload
      #   expect(post.caption).to eq 'new caption'
      #   expect(post.image).to eq 'new image'
      # end

      # it 'redirect to updatet post' do
      #   patch :update, id: post, post: attributes_for(:post)
      #   expect(response).to redirect_to post
      # end
    end

    context 'invalid attributes' do
      before { patch :update, id: post, post: { caption: 'new caption', image: nil } }

      # it 'does not change attributes' do
      #   post.reload
      #   expect(post.caption).to eq 'nofilter'
      #   expect(post.image).to eq 'MyText'
      # end

      it 're-render edit template' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before { post }

    it 'delete post' do
      expect{ delete :destroy, id: post }.to change(Post, :count).by(-1)
    end

    it 'redirect to index view' do
      delete :destroy, id: post
      expect(response).to redirect_to posts_path
    end
  end
end
