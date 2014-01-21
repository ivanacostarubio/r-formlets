require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RFormlet" do

  class BoardForm
    include Formlets
    def action ; "/board" ; end
  end

  class OneAttributeForm
    include Formlets

    def action
      "/one_action"
    end

    def form_attributes
      {
        :name => :text
      }
    end
  end

  class FileForm
    include Formlets

    def action ; '/file' ; end

    def form_attributes
      {
        :logo => :file
      }
    end
  end

  class TextAreaForm

    include Formlets

    def action; '/file' ; end

    def form_attributes
      {
        :features => :textarea
      }
    end
  end

  it "points to a API endpoint" do
    class PersonForm
      include Formlets
      def action ; "/person" ; end
    end

    result = "<form method='post' action='/person'></form>"
    Formlets.render(PersonForm).should == result
  end

  it "renders another basic form" do
    result = "<form method='post' action='/board'></form>"
    Formlets.render(BoardForm).should == result
  end

  it "renders with one attribute text" do
    result = "<form method='post' action='/one_action'><div class='form-name'><label>Name:</label><br/><input type='text' id='name'></input></div></form>"
    Formlets.render(OneAttributeForm).should == result
  end

  it "supports file uploads" do
    result = "<form method='post' action='/file'><div class='form-logo'><label>Logo:</label><br/><input type='file' id='logo'></input></div></form>"
    Formlets.render(FileForm).should == result
  end

  it "supports large text AKA text areas" do
    result = "<form method='post' action='/file'><div class='form-features'><label>Features:</label><br/><textarea rows='10' cols='20' id='features'></textarea></div></form>"
    Formlets.render(TextAreaForm).should == result
  end

  it "supports submit" do
    class SubmitForm
      include Formlets
      def action ; "/person" ; end
      def form_attributes
        {
          :create => :submit
        }
      end
    end

    result = "<form method='post' action='/person'><div class='form-create'><input type='submit' value='create'/></div></form>"
    Formlets.render(SubmitForm).should == result
  end



  describe "Later" do
    it "supports PUT"
    it "supports other HTTP verbs?"
    it "creates the backend endpoint to create a record with this"
    it "supports validates?"

    describe "input type support" do
      it "crashes gratefully if trying to render a type of tag that is not supported"
      it "supports button"
      it "supports checkbox"
      it "supports color"
      it "supports date "
      it "supports datetime "
      it "supports datetime-local "
      it "supports email "
      it "supports file"
      it "supports hidden"
      it "supports image"
      it "supports month "
      it "supports number "
      it "supports password"
      it "supports radio"
      it "supports range "
      it "supports reset"
      it "supports search"
      it "supports tel"
      it "supports text"
      it "supports time "
      it "supports url"
      it "supports week"
    end
  end
end
