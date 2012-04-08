# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'nerd_quiz/version'

Gem::Specification.new do |s|
  s.name        = 'nerd_quiz'
  s.version     = NerdQuiz::VERSION
  s.authors     = ['Simeon F. Willbanks']
  s.email       = ['sfw@simeonfosterwillbanks.com']
  s.homepage    = 'https://github.com/simeonwillbanks/nerd_quiz'
  s.summary     = %q{A ruby gem which implements a command line interface to NerdPursuit questions}
  s.description = %q{Test your nerd skills by answering NerdPursuit questions!}

  s.rubyforge_project = 'nerd_quiz'

  s.files         = [".rspec",
                      ".gitignore",
                      ".gitmodules",
                      "Gemfile",
                      "LICENSE",
                      "README.md",
                      "Rakefile",
                      "STORIES.md",
                      "bin/nquiz",
                      "lib/nerd_quiz.rb",
                      "lib/nerd_quiz/color.rb",
                      "lib/nerd_quiz/question.rb",
                      "lib/nerd_quiz/questions.rb",
                      "lib/nerd_quiz/quiz.rb",
                      "lib/nerd_quiz/scorecard.rb",
                      "lib/nerd_quiz/version.rb",
                      "nerd_quiz.gemspec",
                      "spec/nerd_quiz/question_spec.rb",
                      "spec/nerd_quiz/questions_spec.rb",
                      "spec/nerd_quiz/quiz_spec.rb",
                      "spec/nerd_quiz/scorecard_spec.rb",
                      "spec/spec_helper.rb",
                      #  `ls NerdPursuit/questions/*.json`.split("\n")
                      "NerdPursuit/questions/2_seconds.json", "NerdPursuit/questions/HTCPCP.json", "NerdPursuit/questions/about_ruby.json", "NerdPursuit/questions/absolute_superclass_1.8.json", "NerdPursuit/questions/absolute_superclass_1.9.json", "NerdPursuit/questions/active_record_base.json", "NerdPursuit/questions/all_ur_base.json", "NerdPursuit/questions/answer_to_everything.json", "NerdPursuit/questions/array_all_but_the_first.json", "NerdPursuit/questions/array_all_but_the_first_and_last .json", "NerdPursuit/questions/array_all_but_the_last.json", "NerdPursuit/questions/array_ampersand.json", "NerdPursuit/questions/array_get_and remove_first_element.json", "NerdPursuit/questions/array_get_and remove_last_element.json", "NerdPursuit/questions/array_pipe.json", "NerdPursuit/questions/array_splat.json", "NerdPursuit/questions/array_to_csv_string.json", "NerdPursuit/questions/attribute_selectors.json", "NerdPursuit/questions/background_image.json", "NerdPursuit/questions/backticks_in_ruby.json", "NerdPursuit/questions/base_object.json", "NerdPursuit/questions/best_language.json", "NerdPursuit/questions/bind.json", "NerdPursuit/questions/bindtypesignature.json", "NerdPursuit/questions/bitwise_and.json", "NerdPursuit/questions/bitwise_or.json", "NerdPursuit/questions/chrome_v8.json", "NerdPursuit/questions/class_inheritance.json", "NerdPursuit/questions/club_mate_caffeine.json", "NerdPursuit/questions/collect_alternative.json", "NerdPursuit/questions/comparsion.json", "NerdPursuit/questions/constants.json", "NerdPursuit/questions/controller_action.json", "NerdPursuit/questions/date_format_month.json", "NerdPursuit/questions/divmod.json", "NerdPursuit/questions/emails.json", "NerdPursuit/questions/encoding.json", "NerdPursuit/questions/enumerable.json", "NerdPursuit/questions/equality.json", "NerdPursuit/questions/falsy.json", "NerdPursuit/questions/fastes_sorting_algorithm.json", "NerdPursuit/questions/fizzbuzz.json", "NerdPursuit/questions/float_left.json", "NerdPursuit/questions/folders.json", "NerdPursuit/questions/fps.json", "NerdPursuit/questions/fptr.json", "NerdPursuit/questions/fun_with_brackets.json", "NerdPursuit/questions/garbarge_collector_in_19.json", "NerdPursuit/questions/global_variable_character.json", "NerdPursuit/questions/half_a_byte.json", "NerdPursuit/questions/hash_with_indifferent_access.json", "NerdPursuit/questions/hexadecimal_code.json", "NerdPursuit/questions/how_can_you_access_the_data_pas.json", "NerdPursuit/questions/how_do_you_specify_html5_doctyp.json", "NerdPursuit/questions/how_do_you_use_multiple_box_sha.json", "NerdPursuit/questions/how_is_ruby_licensed.json", "NerdPursuit/questions/how_many_gems.json", "NerdPursuit/questions/how_many_pypi_packages.json", "NerdPursuit/questions/how_to_concatenate_list_python.json", "NerdPursuit/questions/how_to_delete_variable_python.json", "NerdPursuit/questions/how_to_indent_python.json", "NerdPursuit/questions/how_to_open_python_main.json", "NerdPursuit/questions/img_tag.json", "NerdPursuit/questions/instance_exec.json", "NerdPursuit/questions/invited-php.json", "NerdPursuit/questions/jquery_sizzle.json", "NerdPursuit/questions/json.json", "NerdPursuit/questions/jsonp.json", "NerdPursuit/questions/kanji_converter.json", "NerdPursuit/questions/kernel-sprintf-2.json", "NerdPursuit/questions/kernel-sprintf.json", "NerdPursuit/questions/kernel.json", "NerdPursuit/questions/last_cmd_sub.json", "NerdPursuit/questions/last_directory.json", "NerdPursuit/questions/laziness.json", "NerdPursuit/questions/lazy.json", "NerdPursuit/questions/list_comprehension_python.json", "NerdPursuit/questions/map_parseInt.json", "NerdPursuit/questions/matz.json", "NerdPursuit/questions/media.json", "NerdPursuit/questions/method_used_for_comparisions.json", "NerdPursuit/questions/min_max_quantifier.json", "NerdPursuit/questions/mixins_are_what.json", "NerdPursuit/questions/monads.json", "NerdPursuit/questions/monadsvsmonoids.json", "NerdPursuit/questions/monoids.json", "NerdPursuit/questions/mutable_data_type.json", "NerdPursuit/questions/name_of_python_module_rep.json", "NerdPursuit/questions/negative_look_ahead.json", "NerdPursuit/questions/new_database.json", "NerdPursuit/questions/new_lambda_calling_syntax.json", "NerdPursuit/questions/new_lambda_constructing_syntax.json", "NerdPursuit/questions/nil.json", "NerdPursuit/questions/nil_id.json", "NerdPursuit/questions/nilclass.json", "NerdPursuit/questions/nodetype_of_text_node.json", "NerdPursuit/questions/numeric_types.json", "NerdPursuit/questions/ook_ook.json", "NerdPursuit/questions/optional_html_tags.json", "NerdPursuit/questions/oreilly_Antelope.json", "NerdPursuit/questions/oreilly_Camel.json", "NerdPursuit/questions/oreilly_Cow.json", "NerdPursuit/questions/oreilly_Insects.json", "NerdPursuit/questions/oreilly_Octopus.json", "NerdPursuit/questions/oreilly_Pidgeon.json", "NerdPursuit/questions/oreilly_Rat.json", "NerdPursuit/questions/oreilly_Rhinocerous.json", "NerdPursuit/questions/oreilly_Salmon.json", "NerdPursuit/questions/pluralize_person.json", "NerdPursuit/questions/png.json", "NerdPursuit/questions/position_fixed_support.json", "NerdPursuit/questions/position_property.json", "NerdPursuit/questions/prediction_gates.json", "NerdPursuit/questions/prefix_last_command.json", "NerdPursuit/questions/prime.json", "NerdPursuit/questions/private_method_in_ruby.json", "NerdPursuit/questions/protected_method_in_ruby.json", "NerdPursuit/questions/ps_save_for_web.json", "NerdPursuit/questions/quo.json", "NerdPursuit/questions/rails_first_shown.json", "NerdPursuit/questions/rails_inventor.json", "NerdPursuit/questions/rake_about.json", "NerdPursuit/questions/ranges_three_dots.json", "NerdPursuit/questions/release_date.json", "NerdPursuit/questions/rest.json", "NerdPursuit/questions/rest_about.json", "NerdPursuit/questions/return_value_or.json", "NerdPursuit/questions/roses.json", "NerdPursuit/questions/rspec_controller_render_views.json", "NerdPursuit/questions/run_time_of_bst.json", "NerdPursuit/questions/same_origin_policy.json", "NerdPursuit/questions/screen_image_resolution.json", "NerdPursuit/questions/simple_format.json", "NerdPursuit/questions/size_t_header.json", "NerdPursuit/questions/spaceship_operator.json", "NerdPursuit/questions/square_numbers_in_list.json", "NerdPursuit/questions/strict_doctype.json", "NerdPursuit/questions/string_clean_whitespace.json", "NerdPursuit/questions/string_object_coercion_internals.json", "NerdPursuit/questions/sum_things_up.json", "NerdPursuit/questions/symbol_identity_01.json", "NerdPursuit/questions/symbol_identity_02.json", "NerdPursuit/questions/symbol_identity_03.json", "NerdPursuit/questions/symbol_string_ids.json", "NerdPursuit/questions/symbols.json", "NerdPursuit/questions/the_cake.json", "NerdPursuit/questions/the_difference_between_and_operators.json", "NerdPursuit/questions/to_which_year_marty_mcfly_wants.json", "NerdPursuit/questions/trace_something_in_as3.json", "NerdPursuit/questions/typeof_arguments.json", "NerdPursuit/questions/unless_wtf.json", "NerdPursuit/questions/valid_function_expression.json", "NerdPursuit/questions/weakref.json", "NerdPursuit/questions/what_did_matz_say_about_ruby.json", "NerdPursuit/questions/what_do_array.json", "NerdPursuit/questions/what_do_string.json", "NerdPursuit/questions/what_does_gil_stands_for.json", "NerdPursuit/questions/what_does_negate_regexp_operator_do.json", "NerdPursuit/questions/what_is_a_mixin.json", "NerdPursuit/questions/what_is_a_traditional_vulcan_sa.json", "NerdPursuit/questions/what_is_node_js.json", "NerdPursuit/questions/what_s_4_2.json", "NerdPursuit/questions/what_s_typeof_null.json", "NerdPursuit/questions/when_life_gives_you_lemons.json", "NerdPursuit/questions/where_are_the_characters_of_daw.json", "NerdPursuit/questions/which_character_in_star_trek_se.json", "NerdPursuit/questions/which_is_not_a_python_framework.json", "NerdPursuit/questions/which_version_of_ecmascript_doe.json", "NerdPursuit/questions/who_created_jquery.json", "NerdPursuit/questions/who_created_python.json", "NerdPursuit/questions/who_invented_node_js.json", "NerdPursuit/questions/who_is_the_first_character_to_b.json", "NerdPursuit/questions/yo_dawg.json", "NerdPursuit/questions/z-index_property.json"
                     ]
  s.test_files    = [".rspec",
                     "spec/nerd_quiz/question_spec.rb",
                     "spec/nerd_quiz/questions_spec.rb",
                     "spec/nerd_quiz/quiz_spec.rb",
                     "spec/nerd_quiz/scorecard_spec.rb",
                     "spec/spec_helper.rb"]
  s.executables   = %w(nquiz)
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.2'
  s.license = 'MIT'

  # specify any dependencies here; for example:
  s.add_dependency 'yajl-ruby'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
