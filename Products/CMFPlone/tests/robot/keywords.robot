*** Keywords *****************************************************************

# --- SETUP ------------------------------------------------------------------

Refresh JS/CSS resources
  # Not needed anymore, and it is breaking the Plone Zope 4 tests.
  # Keep the keyword for backwards compatibility purposes.
  Sleep  0.0000001

# --- GIVEN ------------------------------------------------------------------

a logged-in site administrator
  Enable autologin as  Site Administrator  Contributor  Reviewer

a document '${title}'
  Create content  type=Document  id=doc  title=${title}

a file '${title}'
  Create content  type=File  id=file  title=${title}

a news item '${title}'
  Create content  type=News Item  id=doc  title=${title}

an image '${title}'
  Create content  type=Image  id=doc  title=${title}

a folder '${title}'
  Create content  type=Folder  title=${title}

patterns are loaded
  Wait For Condition  return !!document.querySelector('body.patterns-loaded')

a folder with a document '${title}'
  ${folder_uid}=  Create content  type=Folder  title=folder
  Create content  type=Document  container=${folder_uid}  title=${title}

Wait For Element
  [Arguments]  ${element}
  [Documentation]  Can contain css=, jquery=, or any other element selector.
  Wait Until Page Contains Element  ${element}
  Set Focus To Element  ${element}
  Wait Until Element Is Visible  ${element}

Wait For Then Click Element
  [Arguments]  ${element}
  [Documentation]  Can contain css=, jquery=, or any other element selector.
  Wait For Element  ${element}
  Click Element  ${element}

Wait For Then Click Hidden Element
  [Arguments]  ${element}
  [Documentation]  Meant for invisible elements.  Can contain css=, jquery=, or any other element selector.
  Wait Until Page Contains Element  ${element}
  Set Focus To Element  ${element}
  Click Element  ${element}
