# Deep Insertion of Data

**This example demonstrates deep insertion of data for nested entities using a single POST request.**

Deep insertion of data may be performed where entities are interrelated by composition. Default values are respected for the contained entity.

Deep insertion works exclusively for composition, not association. Rationale for this is suggested by the following quote from the CAP reference:

> Essentially, Compositions are the same as associations, just with the additional information that this association represents a contained-in relationship so the same syntax and rules apply in their base form.