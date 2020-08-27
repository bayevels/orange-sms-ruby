# frozen_string_literal: true

module TestRepoSmallBadge
  # rubocop:disable Metrics/MethodLength,Metrics/LineLength,Metrics/ParameterLists
  def rounded_svg_string(title_color: '#fff', title_font: 'Verdana,sans-serif', title_font_size: 11,
                         value_color: '#fff', value_font: 'Verdana,sans-serif', value_font_size: 11)
    %(<svg contentScriptType="text/ecmascript" contentStyleType="text/css" preserveAspectRatio="xMidYMid meet" version="1.0" height="20" width="120"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">


<linearGradient id="smooth" x2="0" y2="120">
<stop offset="0" stop-color="#bbb" stop-opacity=".1"/>
<stop offset="1" stop-opacity=".1"/>
</linearGradient>
<clipPath id="round">
<rect height="20" width="120" rx="3" fill="#fff"/>
</clipPath>
<g clip-path="url(#round)">
<rect height="20" width="60" fill="#555"/>
<rect x="60" height="20" width="60" fill="#4c1"/>
<rect height="20" width="120" fill="url(#smooth)"/>
</g>
<g fill="#{title_color}" text-anchor="middle" font-family="#{title_font}" font-size="#{title_font_size}">
<text x="30" y="15" fill="#010101" fill-opacity="0.3">
Total
</text>
<text x="30" y="14">
Total
</text>
</g>
<g fill="#{value_color}" text-anchor="middle" font-family="#{value_font}" font-size="#{value_font_size}">
<text x="90" y="15" fill="#010101" fill-opacity="0.3">
100%
</text>
<text x="90" y="14">
100%
</text>
</g>

</svg>)
  end

  def not_rounded_svg_string
    %(<svg contentScriptType="text/ecmascript" contentStyleType="text/css" preserveAspectRatio="xMidYMid meet" version="1.0" height="20" width="200"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">


<linearGradient id="smooth" x2="0" y2="200">
<stop offset="0" stop-color="#bbb" stop-opacity=".1"/>
<stop offset="1" stop-opacity=".1"/>
</linearGradient>
<clipPath id="round">
<rect height="20" width="200" rx="0" fill="#fff"/>
</clipPath>
<g clip-path="url(#round)">
<rect height="20" width="100" fill="#555"/>
<rect x="100" height="20" width="100" fill="#4c1"/>
<rect height="20" width="200" fill="url(#smooth)"/>
</g>
<g fill="#fff" text-anchor="middle" font-family="Verdana,sans-serif" font-size="11">
<text x="50" y="15" fill="#010101" fill-opacity="0.3">
badge Total
</text>
<text x="50" y="14">
badge Total
</text>
</g>
<g fill="#fff" text-anchor="middle" font-family="Verdana,sans-serif" font-size="11">
<text x="150" y="15" fill="#010101" fill-opacity="0.3">
100%
</text>
<text x="150" y="14">
100%
</text>
</g>

</svg>)
  end
  # rubocop:enable Metrics/MethodLength,Metrics/LineLength,Metrics/ParameterLists
end
