# frozen_string_literal: true

require 'spec_helper'

describe RepoSmallBadge::Image do
  include TestRepoSmallBadge

  context '#coverage_total' do
    describe '#coverage' do
      it do
        allow(File).to receive(:write)
          .with('./badge_total.svg', rounded_svg_string).and_return(true)
        expect(subject.badge('total', 'Total', '100%'))
          .to be_truthy
      end

      context 'without rounded and width 200 and title' do
        subject do
          described_class
            .new(badge_width: 200, rounded_border: false, title_prefix: 'badge')
        end

        it do
          allow(File).to receive(:write)
            .with('./badge_total.svg', not_rounded_svg_string).and_return(true)
          expect(subject.badge('total', 'Total', '100%')).to be_truthy
        end
      end

      context 'with different fonts colors size' do
        subject do
          described_class
            .new(badge_width: 200,
                 title_color: '#ffffff', title_font: 'Verdura', title_size: 12,
                 value_color: '#ffffcc', value_font: 'Berdura', value_size: 10)
        end
      end

      context '#config_merge' do
        it do
          expect(subject.config_merge(badge_height: 10)[:badge_height]).to eq 10
        end
      end
    end
  end
end
