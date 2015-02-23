#Determine where or not a given string / expression has matching braces.

RSpec.describe "has_valid_braces?" do
  it "will return true if the string has valid braces" do
    expect(Braces.new("()").has_valid_braces?).to be true
    expect(Braces.new("[{()}]").has_valid_braces?).to be true
    expect(Braces.new("(){}[]").has_valid_braces?).to be true
    expect(Braces.new("({}[])").has_valid_braces?).to be true
    expect(Braces.new("({vdvd}[a])").has_valid_braces?).to be true
    expect(Braces.new("({vdvd}[a])efeaff").has_valid_braces?).to be true
    expect(Braces.new("aef(!#@${vdvd}[a])efeaff").has_valid_braces?).to be true
  end

  it "will return false if the string does not have valid braces" do
    expect(Braces.new("({)").has_valid_braces?).to be false
    expect(Braces.new("[{aefaef()]}").has_valid_braces?).to be false
    expect(Braces.new("([){}[]").has_valid_braces?).to be false
    expect(Braces.new("({}[])))").has_valid_braces?).to be false
    expect(Braces.new("({]}[))").has_valid_braces?).to be false
    expect(Braces.new("894({aef]aefef}[))ef").has_valid_braces?).to be false
  end
end

class Braces
  BRACES = {
    ")" => "(",
    "]" => "[",
    "}" => "{"
  }

  attr_accessor :string, :hash
  def initialize(string)
    @string = string
    @hash = {}
  end

  def has_valid_braces?
    strip_valid_braces.compact.empty?
  end

  def strip_valid_braces
    arr = braces
    i = 0

    while arr.any?
      if back_braces.include?(arr[i])
        if BRACES[arr[i]] == arr[i - 1]
          arr.delete_at(i)
          arr.delete_at(i - 1)
          i -= 2
        else
          break
        end
      end

      i += 1
    end

    arr
  end

  def characters
    string.chars
  end

  def braces
    characters.select { |character| BRACES.keys.include?(character) || BRACES.values.include?(character) }
  end

  def back_braces
    BRACES.keys
  end
end
