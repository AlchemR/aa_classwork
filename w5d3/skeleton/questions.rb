require 'sqlite3'
require 'singleton'

class QuestionsDB < SQLite3::Database
  include Singleton
  
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end


class Users
  attr_accessor :id, :fname, :lname

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def self.all
        data = QuestionsDB.instance.execute("SELECT * FROM users")
        data.map { |row| Users.new(row) }
    end

    def self.find_by_id(user_id)
        search = QuestionsDB.instance.execute(<<-SQL, user_id)
         SELECT *
         FROM users
         WHERE
            id = ?
       SQL
         #search.map {|user| Users.new(user)}
         return Users.new(search[0])
    end
   
    def self.find_by_name(fname,lname)
        search = QuestionsDB.instance.execute(<<-SQL, fname, lname)
        SELECT *
        FROM users
        WHERE
            fname = ?
            AND
            lname = ?
        SQL
        if search.length > 1
            return search.map {|user| Users.new(user)}
        else
            return Users.new(search[0])
        end
    end
    
    def authored_questions
        Question.find_by_author_id(@id)
    end

    def authored_replies
        Replies.find_by_user_id(@id)
    end

    def followed_questions
        QuestionFollows.followed_questions_for_user_id(@id)
    end

    def liked_questions
        QuestionLikes.liked_questions_for_user_id(id)
    end

    def average_karma
        n=@id
        search = QuestionsDB.instance.execute(<<-SQL, n)
        SELECT (CAST(count(questions_likes.id) AS FLOAT) / count(DISTINCT questions.id)) as average
        FROM questions
        LEFT OUTER JOIN questions_likes ON questions_likes.question_id=questions.id
        WHERE questions.question_author_id = ?
        SQL
      search[0]['average']
    end

    def save
        if self.id == nil
            QuestionsDB.instance.execute(<<-SQL, fname, lname)
                INSERT INTO
                users (fname, lname)
                VALUES
                (?, ?)
            SQL
            self.id = QuestionsDB.instance.last_insert_row_id
        else
            QuestionsDB.instance.execute(<<-SQL, self.fname, self.lname, self.id)
            UPDATE
            users
            SET
                fname = ?, lname = ?
            WHERE
                id = ?
            SQL
        end
    end

end

class Question
    attr_accessor :id, :title, :body, :question_author_id

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @question_author_id = options['question_author_id']
      end

    def self.all
        data = QuestionsDB.instance.execute("SELECT * FROM questions")
        data.map { |row| Question.new(row) }
    end

    def self.find_by_author_id(question_author_id)
     search = QuestionsDB.instance.execute(<<-SQL, question_author_id)
      SELECT *
      FROM questions
      WHERE
        question_author_id = ?
    SQL
      search.map {|author| Question.new(author)}
    end

    def self.find_by_id(q_id)
     search = QuestionsDB.instance.execute(<<-SQL, q_id)
      SELECT *
      FROM questions
      WHERE
         id = ?
    SQL
      # search.map {|question| Question.new(question)}
      return Question.new(search[0])
    end
 
    
    def author #??
        u = Users.find_by_id(@question_author_id)
        # return u.fname + ' ' + u.lname
    end

    def replies
      Replies.find_by_question_id(@id)
    end

    def followers
        QuestionFollows.followers_for_question_id(@id)
    end

    def self.most_followed(n)
        QuestionFollows.most_followed_questions(n)
    end

    def likers
        QuestionLikes(@id)
    end

    def num_likes
    Questionlikes.num_likes_for_question_id(@id)
    end

    #   def self.most_liked(n)
    #     search = QuestionsDB.instance.execute(<<-SQL, n)
    #     SELECT question_id, COUNT(*) as liked_qty
    #     FROM questions_likes
    #     GROUP BY question_id
    #     ORDER BY COUNT(*) DESC
    #     LIMIT ?
    #     SQL
    #     search[0]["num_likes"]
    # end

    def self.most_liked(n)
        search = QuestionsDB.instance.execute(<<-SQL, n)
        SELECT questions.*
        FROM questions_likes
        JOIN questions on questions.id=questions_likes.question_id
        GROUP BY question_id        
        ORDER BY COUNT(user_id) DESC
        LIMIT ?
        SQL
        search.map {|row| Question.new(row)}
    end

    def save
        if self.id == nil
            QuestionsDB.instance.execute(<<-SQL, self.title, self.body, self.question_author_id)
                INSERT INTO
                questions (title, body, question_author_id)
                VALUES
                (?, ?, ?)
            SQL
            self.id = QuestionsDB.instance.last_insert_row_id
        else
            QuestionsDB.instance.execute(<<-SQL, self.title, self.body, self.question_author_id, self.id)
            UPDATE
                questions
            SET
                title = ?, body = ?, question_author_id = ?
            WHERE
                id = ?
            SQL
        end
    end

end

class QuestionFollows
    attr_accessor :id, :user_id, :question_id
  
    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

    def self.all
        data = QuestionsDB.instance.execute("SELECT * FROM questions_follows")
        data.map { |row| QuestionFollows.new(row) }
    end

    def self.find_by_id(qf_id)
        search = QuestionsDB.instance.execute(<<-SQL, qf_id)
        SELECT *
        FROM questions_follows
        WHERE
            id = ?
        SQL
        #search.map {|question_follow| QuestionFollows.new(question_follow)}
        return QuestionFollows(search[0])
    end

    def self.followers_for_question_id(qid)
        search = QuestionsDB.instance.execute(<<-SQL, qid)
        SELECT users.*
        FROM questions_follows
        JOIN users ON questions_follows.user_id = users.id
        WHERE questions_follows.question_id = ?
        SQL
        search.map {|row| Users.new(row)}
    end 


    def self.followed_questions_for_user_id(uid)
        search = QuestionsDB.instance.execute(<<-SQL, uid)
        SELECT questions.*
        FROM questions_follows
        JOIN questions ON questions.id=questions_follows.question_id
        WHERE user_id = ?
        SQL
        search.map {|row| Question.new(row)}
    end

    def self.most_followed_questions(n)
        search = QuestionsDB.instance.execute(<<-SQL, n)
        SELECT *
        FROM questions_follows
        JOIN questions on questions.id=questions_follows.question_id
        GROUP BY question_id        
        ORDER BY COUNT(user_id) DESC
        LIMIT ?
        SQL
        search.map {|row| Question.new(row)}
    end
  end
  

class Replies
    attr_accessor :id, :question_id, :parent_reply_id, :reply_author_id, :body

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
        @reply_author_id = options['reply_author_id']
        @body = options['body']
    end

    def self.all
        data = QuestionsDB.instance.execute("SELECT * FROM replies")
        data.map { |row| Replies.new(row) }
    end

    def self.find_by_id(reply_id)
        search = QuestionsDB.instance.execute(<<-SQL, reply_id)
        SELECT *
        FROM replies
        WHERE
            id = ?            
        SQL
        #search.map {|row| Replies.new(row)}
        return Replies.new(search[0])
    end

    def self.find_by_user_id(reply_author_id)
        search = QuestionsDB.instance.execute(<<-SQL, reply_author_id)
        SELECT *
        FROM replies
        WHERE
            reply_author_id = ?            
        SQL
        search.map {|row| Replies.new(row)}
    end

    def self.find_by_question_id(question_id)
        search = QuestionsDB.instance.execute(<<-SQL, question_id)
        SELECT *
        FROM replies
        WHERE
            question_id = ?            
        SQL
        search.map {|row| Replies.new(row)}
    end

    def author #??
        a = Users.find_by_id(@reply_author_id)
        # return a.fname + " " + a.lname
    end

    def question
        Question.find_by_id(@question_id)
    end

    def parent_reply
        return nil if @parent_reply_id == nil
        Replies.find_by_id(@parent_reply_id)
    end

    def child_replies
        search = QuestionsDB.instance.execute(<<-SQL, id)
        SELECT *
        FROM replies
        WHERE
            parent_reply_id = ?   
        SQL
        search.map {|row| Replies.new(row)}
    end
    #:id, :question_id, :parent_reply_id, :reply_author_id, :body
    def save
        if self.id == nil
            QuestionsDB.instance.execute(<<-SQL, self.question_id, self.parent_reply_id, self.reply_author_id, self.body)
                INSERT INTO
                replies (question_id, parent_reply_id, reply_author_id, body)
                VALUES
                (?, ?, ?, ?)
            SQL
            self.id = QuestionsDB.instance.last_insert_row_id
        else
            QuestionsDB.instance.execute(<<-SQL, self.question_id, self.parent_reply_id, self.reply_author_id, self.body, self.id)
            UPDATE
                replies
            SET
                question_id = ?, parent_reply_id = ?, reply_author_id = ?, body = ?
            WHERE
                id = ?
            SQL
        end
    end
end


class QuestionLikes
    attr_accessor :id, :question_id, :user_id
  
    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
    end

    def self.all
        data = QuestionsDB.instance.execute("SELECT * FROM questions_likes")
        data.map { |row| QuestionLikes.new(row) }
    end

    def self.find_by_id(ql_id)
        search = QuestionsDB.instance.execute(<<-SQL, ql_id)
        SELECT *
        FROM questions_likes
        WHERE
            id = ?
        SQL
        #search.map {|question_like| QuestionLikes.new(question_like)}
        QuestionLikes.new(search[0])
    end

    def self.likers_for_question_id(qid)
        search = QuestionsDB.instance.execute(<<-SQL, qid)
        SELECT users.*
        FROM questions_likes
        JOIN users ON questions_likes.user_id = users.id
        WHERE questions_likes.question_id = ?
        SQL
        search.map {|row| Users.new(row)}
    end 


     def self.num_likes_for_question_id(n)
        search = QuestionsDB.instance.execute(<<-SQL, n)
        SELECT COUNT(*) AS num_likes
        FROM questions_likes
        WHERE question_id = ?
        GROUP BY question_id 
        SQL
        search[0]["num_likes"]
    end

    def self.liked_questions_for_user_id(uid)
        search = QuestionsDB.instance.execute(<<-SQL, uid)
        SELECT questions.*
        FROM questions_likes
        JOIN questions ON questions.id=questions_likes.question_id
        WHERE user_id = ?
        SQL
        search.map {|row| Question.new(row)}
    end

    def self.most_liked_questions(n)
        search = QuestionsDB.instance.execute(<<-SQL, n)
        SELECT *
        FROM questions_likes
        JOIN questions on questions.id=questions_likes.question_id
        GROUP BY question_id        
        ORDER BY COUNT(user_id) DESC
        LIMIT ?
        SQL
        search.map {|row| Question.new(row)}
    end
end