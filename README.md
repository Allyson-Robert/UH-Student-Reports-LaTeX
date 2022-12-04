# UHasselt-Reports-LaTeX-Templates
LaTeX Template for Hasselt University student reports (*uhreport*).
The proper faculty/school can be selected as an option [^1].
Note that Physics students should go to the appropriate [paper](https://github.com/Allyson-Robert/UHasselt_Physics_Paper_Template) or [report](https://github.com/Allyson-Robert/UHasselt_Physics_Report_Template) templates

Provides a LaTeX documentclass defining page layout, environments and several useful commands.
The document currently assumes dutch as the used language.

## Details
This class implements a few conveniences and automates the layout to fit (some of) the UHasselt housetyle such as proper official faculty/school colours and logos.
 
# Options
* faculty (sets colour and logo): wet, glw, reval, bew, rec, iiw, ark, ses, mob, sw
* language (passes language on to babel and selects logo): nl, en

# Commands
Additional commands are provides:

* \npar: Starts a new paragraph, is shorthand for \par\medskip
* \course: Needed to display the course on the title page
* \degree: Needed to show which to which degree the course belong


[^1]: Currently only the colour changes. Automatic choice of the title page logo will be added later
