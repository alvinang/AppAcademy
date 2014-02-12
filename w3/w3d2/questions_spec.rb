require './questions_database'

p user_object = User.find_by_name('Chrissie', 'Deist')
p user1 = User.find_by_id(2)

p "authored_questions: #{user1.authored_questions}"
p "authored_replies: #{user1.authored_replies}"

p question_object2 = Question.find_by_author_id(2)

p question_follower = QuestionFollower.followers_for_question_id(1)
p followed_questions = QuestionFollower.followed_questions_for_user_id(1)

p tag = Tag.find_by_tag_id(1)

p "Most followed Questions: #{QuestionFollower.most_followed_questions(2)}"
p "Likers for Questions: #{QuestionLike.likers_for_question_id(1)}"
p "Number of Likes: #{QuestionLike.num_likes_for_question_id(1)}"
p "Liked question for User id: #{QuestionLike.liked_questions_for_user_id(1)}"
p "2 most liked questions: #{QuestionLike.most_liked_questions(1)}"
p "Chrissie's average karma: #{user1.average_karma}"
p "Most Popular Question: #{tag.most_popular_question(1)}"
p "Most Popular Tag: #{Tag.most_popular(1)}"