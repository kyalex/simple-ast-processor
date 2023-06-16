# frozen_string_literal: true

require './specs/spec_helper'
require './processor'

# rubocop:disable Style/WordArray
RSpec.describe Processor do
  subject { described_class.new }

  it 'prints B' do
    expect(
      subject.visit(
        [
          'if',
          [
            'eq',
            ['get', 'month'],
            ['return', 6]
          ],
          ['return', 'B']
        ]
      )
    ).to eq('B')
  end

  it 'prints R' do # rubocop:disable RSpec/ExampleLength
    expect(
      subject.visit(
        [
          'if',
          [
            'and',
            [
              'eq',
              ['get', 'month'],
              ['return', 6]
            ],
            [
              'eq',
              ['get', 'year'],
              ['return', 2023]
            ]
          ],
          ['return', 'R']
        ]
      )
    ).to eq('R')
  end

  it 'prints U' do
    expect(
      subject.visit(
        [
          'int_to_char',
          [
            'plus',
            ['return', 81],
            ['return', 4]
          ]
        ]
      )
    ).to eq('U')
  end

  it 'prints G' do
    expect(
      subject.visit(
        [
          'unless',
          [
            'eq',
            ['get', 'month'],
            ['return', 4]
          ],
          ['return', 'G']
        ]
      )
    ).to eq('G')
  end
end
# rubocop:enable Style/WordArray
