Keep sync of literals in the codebase. Make sure to internationalize in all languages by following these steps:

<detailed_sequence_of_steps>

## Identify the literal string in the code that needs to be internationalized.
1. Find the file and line number where the literal is located.
2. Check if the literal is already in the i18n files. If it is, verify if it has translations in all languages.
3. If the literal exists in the i18n files but is missing translations, add the necessary translations.


## Understand the context of the literal.
1. Read surrounding code to understand how the literal is used.
2. Find component, feature & parent containing the literal to save it in the right place.

# 4. Ask for User Confirmation

1. Before making a decision, ask the user if you should proceed with the internationalization in the given new place or if they have a different preference.
Please review if text should be placed in the identified component, feature, or parent. Should I proceed with this placement?


# 5. Make the Changes
1. Move the literal to the appropriate i18n files. Don't forget to add it to all language files and with it  respective translations.
2. Replace the literal in the code with a reference to the i18n file.
