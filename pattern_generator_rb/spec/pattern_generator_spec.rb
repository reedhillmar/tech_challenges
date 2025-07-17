require "./lib/pattern_generator"

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe PatternGenerator do
  let(:pg) { PatternGenerator.new }

  context "Part 1: Verify Pattern Compliance" do
    describe "#verify" do
      it "Given a generated serial number, return true or false based on whether or not the input matches the pattern" do
        pattern = ".#.@"

        expect(pg.verify("A3B1", pattern)).to be true
        expect(pg.verify("AABA", pattern)).to be false
      end
    end
  end

  context "Part 2: Generate The Nth Value In the Pattern" do
    describe "#generate" do
      it "Given a specific pattern, assuming that incrementing happens from right to left (like normal numbers), generate the Nth value in the sequence" do
        pattern = "@.#."

        expect(pg.generate(0, pattern)).to eq("0A0A")
        expect(pg.generate(27, pattern)).to eq("0A1B")
        expect(pg.generate(60, pattern)).to eq("0A2I")
        expect(pg.generate(999, pattern)).to eq("0D8L")
      end
    end
  end

  context "Part 3: Possibilities" do
    describe "#total_available" do
      it "Given a specific pattern, determine how many total numbers are in the set" do
        pattern = ".#."
        expect(pg.total_available(pattern)).to be 6760

        pattern = "@.#."
        expect(pg.total_available(pattern)).to be 243360

        pattern = ""
        expect(pg.total_available(pattern)).to be 0
      end
    end
  end

  xcontext "Part 4: Deduction" do
    describe "#find_pattern_for" do
      it "Given a sample of three serial numbers, output a pattern that could generate them. Prefer . and # over @ if they fit the sample serial numbers" do
        inputs = ["0A1B", "5C2Z", "9R9B"]
        expect(pg.find_pattern_for(inputs)).to eq("#.#.")

        inputs_2 = ["0A1B", "5C2Z", "AR9B"]
        expect(pg.find_pattern_for(inputs_2)).to eq("@.#.")
      end
    end
  end
end
