TimesMachine is a way for 3rd-party websites to sell topical NY Times articles to their visitors.

1. User does a google search for "dog haircuts 1983"
2. One result is for http://example.com/dog-haircuts-of-the-80s, which user visits
3. example.com is participating
   in the mythical TimesMachine Affiliate program, and has the TimesMachine
   javascript in their sidebar. The TimesMachine javascript queries the TimesMachine
   service for articles about dog haircuts which were published in or around 1983
   which are not free.
4. User can read the title and summary of these articles in the example.com sidebar and
   has the option to click over to purchase access to one.
 
When I made this project at the hackfest in 2011, articles in the NY Times archive from
before a certain date (I think 1986) were behind the "old" paywall and therefore never free,
so the premise of this project was to provide
a way for the NY Times to monetize their highly-relevant articles (when a user's Google search included
a specific year).

However, now it seems that the entire NY Times archive is freely available. None of the articles
returned by the V1 API with "fee" set to true are actually behind a paywall anymore, and
V2 of the api no longer has the "fee" boolean attribute.

![me!](http://f.cl.ly/items/2H1z1m3z2F0U0e082a18/Pasted_Image_7_10_13_2_27_AM.png)
