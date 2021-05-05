{% macro color() -%}
     \override NoteHead.color = #(rgb-color%{ next_color() %})
{%- endmacro %}
{% macro size() -%}
     \override NoteHead.font-size = #%{next_size() %}
{%- endmacro %}
{% macro eps(scale, first_bar, last_bar, w) -%}
_\markup {
  \general-align #Y #DOWN {
    \epsfile #X #%{scale%} #"%{ eps_waveform(first_bar, last_bar, w=w*5, h=0.5, right_border_shift=0) %}"
  }
}
{%- endmacro %}

\pointAndClickOff
\header {
    tagline =  ""
    }

#(set-global-staff-size 18.581589107904897)
\paper {
    
    paper-width = 50\cm
    paper-height = 60\cm
    top-margin = 1.5\cm
    bottom-margin = 1.5\cm
    left-margin = 1.5\cm
    right-margin = 1.5\cm
    between-system-space = 1.5\cm
    ragged-right = ##t }
\layout {
    indent=#0
    short-indent = #0
    \context { \Score
        proportionalNotationDuration = #(ly:make-moment 1/10)
        \override SpacingSpanner.strict-note-spacing = ##t
        \override SpacingSpanner.uniform-stretching = ##t
        \override NonMusicalPaperColumn.page-break-permission = ##f
        \override NonMusicalPaperColumn.line-break-permission = ##f
        skipBars = ##t
        autoBeaming = ##f
        }
    }
PartPOneVoiceOne =  \relative e {
    \clef "treble" \numericTimeSignature\time 4/4 \key  \major
    \transposition c \tempo 4=108
    | % 1  %{eps(10,0, 4, 1)%}
      %{color()%} %{size()%} f' 4 
      \stemUp %{color()%} %{size()%} < f c' >4 
      \stemUp %{color()%} %{size()%} f4 
      \stemUp %{color()%} %{size()%} < f c' >4 
    | % 2 
      %{color()%} %{size()%} f4 
      \stemUp %{color()%} %{size()%} < f c' >4 
      \stemUp %{color()%} %{size()%} f4 
      \stemUp %{color()%} %{size()%} < f c' >4 
    | % 3 
      %{color()%} %{size()%} f4 
      \stemUp %{color()%} %{size()%} < f c' >4 
      \stemUp %{color()%} %{size()%} f4 
      \stemUp %{color()%} %{size()%} < f c' >4 
    |\barNumberCheck #4
      f4 
      \stemUp %{color()%} %{size()%} < f c' >4 
      \stemUp %{color()%} %{size()%} f4 
      \stemUp %{color()%} %{size()%} < f c' >8 \stemUp %{color()%} %{size()%} c'8  
      \bar "|."
      
    }


% The score definition
\score {
    <<
        
        \new StaffGroup
        <<
            \new Staff
            <<
                
                \context Staff << 
                    \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                    \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
                    >>
            	
                >>
            
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 100 }
    }
