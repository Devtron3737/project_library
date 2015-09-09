require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  def initialize
    super('my_cool_db.db')
    self.results_as_hash = true
    self.type_translation = true
  end
end

class ModelBase
  def self.table_name
    self::TABLE_NAME
  end

  def self.find_by_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, target_id: id)

    SELECT
      *
    FROM
      #{self.table_name}
    WHERE
      id = :target_id
    SQL

    self.new(results.first)
  end
end

class Question < ModelBase
  TABLE_NAME = "questions"

  attr_accessor :id, :title, :body, :user_id

  # def self.find_by_id(id)
  #   super("questions", id)
  # end

  def self.find_by_author_id(author_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, author: author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = :author
    SQL

    results.map { |result| Question.new(result) }
  end

  # def self.find_by_id(id)
  #   results = QuestionsDatabase.instance.execute(<<-SQL, target_id: id)
  #   SELECT
  #     *
  #   FROM
  #     questions
  #   WHERE
  #     id = :target_id
  #   SQL
  #
  #   Question.new(results.first)
  # end

  def save
    if self.id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, title: self.title, body: self.body, user_id: self.user_id)
        INSERT INTO
          questions(title, body, user_id)
        VALUES
          (:title, :body, :user_id)
      SQL
      self.id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, title: self.title, body: self.body, user_id: self.user_id)
        UPDATE
          questions
        SET
          title = :title, body = :body, user_id = :user_id
        WHERE
          id = :id
      SQL
    end
  end

  def author
    User.find_by_id(self.user_id)
  end

  def self.most_followed(n)
    QuestionFollows.most_followed_questions(n)
  end

  def followers
    QuestionFollows.followers_for_question_id(self.id)
  end

  def most_liked(n)
    QuestionLikes.most_liked_questions(self.id)
  end

  def likers
    QuestionLikes.likers_for_question_id(self.id)
  end

  def num_likes
    QuestionLikes.num_likes_for_question_id(self.id)
  end

  def replies
    Reply.find_by_question_id(self.id)
  end

  def initialize(options = {})
    @id = options["id"]
    @title = options["title"]
    @body = options["body"]
    @user_id = options["user_id"]
  end
end

class User < ModelBase
  attr_accessor :id, :fname, :lname
  TABLE_NAME = "users"


  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(self.id)
  end
  #
  # def self.find_by_id(id)
  #   results = QuestionsDatabase.instance.execute(<<-SQL, target_id: id)
  #   SELECT
  #     *
  #   FROM
  #     users
  #   WHERE
  #     id = :target_id
  #   SQL
  #
  #   User.new(results.first)
  # end

  def self.find_by_name(fname, lname)
    results = QuestionsDatabase.instance.execute(<<-SQL, first_name: fname, last_name: lname)
    SELECT
      *
    FROM
      users
    WHERE
      fname = :first_name AND lname = :last_name
    SQL

    User.new(results.first)
  end

  def followed_questions
    QuestionFollows.followed_questions_for_user_id(self.id)
  end

  def liked_questions
    QuestionLikes.liked_questions_for_user_id(self.id)
  end

  def save
    if self.id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, fname: self.fname, lname: self.lname)
        INSERT INTO
          users(fname, lname)
        VALUES
          (:fname, :lname)
      SQL
      self.id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, fname: self.fname, lname: self.lname, id: self.id)
        UPDATE
          users
        SET
          fname = :fname, lname = :lname
        WHERE
          id = :id
      SQL
    end
  end

  def average_karma
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id: self.id).first
      SELECT
         (COUNT(question_likes.user_id)/CAST(COUNT(DISTINCT(users_questions.id)) AS FLOAT))  AS avg_karma
      FROM
        (SELECT
          id
        FROM
          questions
        WHERE
          user_id = :user_id
        ) AS users_questions
      LEFT OUTER JOIN
        question_likes ON question_likes.question_id = users_questions.id
    SQL
    results["avg_karma"]
  end

  # def average_karma
  #   results = QuestionsDatabase.instance.execute(<<-SQL, user_id: self.id).first
  #     SELECT
  #        (COUNT(question_likes.user_id)/CAST(COUNT(DISTINCT(users_questions.id)) AS FLOAT))  AS avg_karma
  #     FROM
  #       (SELECT
  #         question_id,
  #         COUNT(question_likes.user_id) count
  #       FROM
  #         questions
  #       LEFT OUTER JOIN
  #         question_likes ON question_likes.question_id = questions.id
  #       WHERE
  #         user_id = :user_id
  #       GROUP BY
  #         question_id)
  #   SQL
  #   results["avg_karma"]
  # end

  def initialize(options = {})
    @id = options["id"]
    @fname = options["fname"]
    @lname = options["lname"]
  end
end

class QuestionFollows < ModelBase
  attr_accessor :id, :user_id, :question_id
  TABLE_NAME = "question_follows"

  # def self.find_by_id(id)
  #   table_name = questionfollows
  # #   results = QuestionsDatabase.instance.execute(<<-SQL, target_id: id)
  # #   SELECT
  # #     *
  # #   FROM
  # #     question_follows
  # #   WHERE
  # #     id = :target_id
  # #   SQL
  # #
  # #   QuestionFollows.new(results.first)
  # # end

  def initialize(options = {})
    @id = options["id"]
    @user_id = options["user_id"]
    @question_id = options["question_id"]
  end

  def self.followers_for_question_id(question_id)
    #return array of Users
    # join users and question follows
    results = QuestionsDatabase.instance.execute(<<-SQL, question_id: question_id)

    SELECT
      users.*
    FROM
      users
    JOIN
      question_follows ON question_follows.user_id = users.id
    WHERE
      question_follows.question_id = :question_id
    SQL

    results.map { |result| User.new(result)}
  end

  def self.followed_questions_for_user_id(user_id)

    results = QuestionsDatabase.instance.execute(<<-SQL, user_id: user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON question_follows.question_id = questions.id
      WHERE
        question_follows.user_id = :user_id
    SQL

    results.map { |result| Question.new(result)}

  end

  def self.most_followed_questions(n)
    results = QuestionsDatabase.instance.execute(<<-SQL, n: n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_follows ON question_follows.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC
      LIMIT :n
    SQL

    results.map {|result| Question.new(result)}
  end

end

class Reply < ModelBase
  attr_accessor :id, :question_id, :parent_id, :user_id, :body
  TABLE_NAME = "replies"

  def self.find_by_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user: user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = :user
    SQL

    results.map { |result| Reply.new(result) }
  end

  def self.find_by_question_id(question_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, question: question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = :question
    SQL

    return nil if results.empty?
    Reply.new(results.first)
  end

  #
  # def self.find_by_id(id)
  #   results = QuestionsDatabase.instance.execute(<<-SQL, target_id: id)
  #   SELECT
  #     *
  #   FROM
  #     replies
  #   WHERE
  #     id = :target_id
  #   SQL
  #
  #   Reply.new(results.first)
  # end

  def initialize(options = {})
    @id = options["id"]
    @question_id = options["question_id"]
    @parent_id = options["parent_id"]
    @user_id = options["user_id"]
    @body = options["body"]
  end

  def save
    if self.id.nil?
      QuestionsDatabase.instance.execute(<<-SQL, question_id: self.question_id, parent_id: self.parent_id, user_id: self.user_id, body: self.body)
        INSERT INTO
          replies(question_id, parent_id, user_id, body)
        VALUES
          (:question_id, :parent_id, :user_id, :body)
      SQL
      self.id = QuestionsDatabase.instance.last_insert_row_id
    else
      QuestionsDatabase.instance.execute(<<-SQL, question_id: self.question_id, parent_id: self.parent_id, user_id: self.user_id, body: self.body)
        UPDATE
          replies
        SET
          question_id = :question_id, parent_id = :parent_id, user_id = :user_id, body = :body
        WHERE
          id = :id
      SQL
    end
  end

  def author
    User.find_by_id(self.user_id)
  end

  def question
    Question.find_by_id(self.question_id)
  end

  def parent_reply
    return nil if self.parent_id.nil?
    Reply.find_by_id(self.parent_id)
  end

  def child_replies
    results = QuestionsDatabase.instance.execute(<<-SQL, id: self.id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = :id
    SQL

    results.map {|result| Reply.new(result)}
  end
end

class QuestionLikes < ModelBase
  attr_accessor :id, :question_id, :user_id
  TABLE_NAME = "question_likes"

  # def self.find_by_id(id)
  #   results = QuestionsDatabase.instance.execute(<<-SQL, target_id: id)
  #   SELECT
  #     *
  #   FROM
  #     question_likes
  #   WHERE
  #     id = :target_id
  #   SQL
  #
  #   QuestionLikes.new(results.first)
  # end

  def self.likers_for_question_id(id)
    results = QuestionsDatabase.instance.execute(<<-SQL, id: id)
      SELECT
        users.*
      FROM
        users
      JOIN
        question_likes ON question_likes.user_id = users.id
      WHERE
        question_likes.question_id = :id
    SQL

    results.map { |result| User.new(result) }
  end

  def self.most_liked_questions(n)
    results = QuestionsDatabase.instance.execute(<<-SQL, n: n)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON question_likes.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        COUNT(*) DESC
        LIMIT :n
    SQL

    results.map {|result| Question.new(result)}
  end


  def self.num_likes_for_question_id(question_id)
    result = QuestionsDatabase.instance.execute(<<-SQL, question_id: question_id).first
      SELECT
        COUNT(*)
      FROM
        question_likes
      JOIN
        questions ON questions.id = question_likes.question_id
      WHERE
        questions.id = :question_id
    SQL
    result['COUNT(*)']
  end

  def self.liked_questions_for_user_id(user_id)
    results = QuestionsDatabase.instance.execute(<<-SQL, user_id: user_id)
      SELECT
        questions.*
      FROM
        questions
      JOIN
        question_likes ON questions.id = question_likes.id
      WHERE
        question_likes.user_id = :user_id
    SQL

    results.map {|result| Question.new(result)}
  end

  def initialize(options = {})
    @id = options["id"]
    @question_id = options["question_id"]
    @user_id = options["user_id"]
  end
end
