From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH RFC 3/3] leds: Add driver for the ISSI IS31FL32xx family
 of LED drivers
Date: Sat, 27 Feb 2016 11:48:45 +0100 (CET)
Message-ID: <2050552945.311154.eb44c2f6-8870-42b4-ada5-1ccea76f532b.open-xchange@email.1und1.de>
References: <1456251445-23970-1-git-send-email-drivshin.allworx@gmail.com>
 <1456251445-23970-4-git-send-email-drivshin.allworx@gmail.com>
 <56CDD4AA.5030801@samsung.com>
 <20160224212450.195330ed.drivshin.allworx@gmail.com>
 <56CEDDBE.2080601@samsung.com>
 <20160225141215.2ef2707e.drivshin.allworx@gmail.com>
 <56D01F42.70409@samsung.com>
 <20160226165823.2ff62b21.drivshin.allworx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.130]:53263 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756256AbcB0KtO (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Sat, 27 Feb 2016 05:49:14 -0500
In-Reply-To: <20160226165823.2ff62b21.drivshin.allworx@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, "David Rivshin (Allworx)" <drivshin.allworx@gmail.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org

Hi David,

> "David Rivshin (Allworx)" <drivshin.allworx@gmail.com> hat am 26. Februar 2016
> um 22:58 geschrieben:
>
>
> On Fri, 26 Feb 2016 10:47:46 +0100
> Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
>
> > On 02/25/2016 08:12 PM, David Rivshin (Allworx) wrote:
> > > On Thu, 25 Feb 2016 11:55:58 +0100
> > > Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
> > >
> > >> On 02/25/2016 03:24 AM, David Rivshin (Allworx) wrote:
> > >>> On Wed, 24 Feb 2016 17:04:58 +0100
> > >>> Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
> > >>>
> > >>>> Hi David,
> > >>>>
> > >>>> Thanks for the patch. Very nice driver. I have few comments
> > >>>> below.
> > >>>
> > >>> Thanks Jacek, I have responded the comments inline. I also wanted to
> > >>> double check whether you noticed some questions I had in the cover
> > >>> letter [1]. As I mentioned in another email to Rob, in hindsight I'm
> > >>> guessing I should have included them in the patch comments as well (or
> > >>> instead of).
> > >>
> > >> I saw them. I assumed that the review itself will address those
> > >> questions.
> > >
> > > Fair enough, thanks for the confirmation.
> > >
> > >>> Your review comments here effectively answered some of the questions,
> > >>> but
> > >>> the big one I'm still unsure of is whether it actually makes sense to
> > >>> have all 4 of these devices supported by a single driver.
> > >>
> > >> It's perfectly fine. Many drivers implement this pattern.
> > >
> > > OK, then I'll assume you think this driver is not yet too complicated
> > > for it's own good. Out of curiosity, might that view change if the
> > > 3216 specific features were ever implemented, especially GPIO and HW
> > > animation support? Gut feel is that would make 3216 specific code
> > > bigger than the rest of the code combined.
> >
> > I don't think so.
>
> Thanks, that helps calibrate my intuition for the future.
>
> > > Bigger question is what should be done in terms of the overlap in device
> > > support between this driver and leds-sn3218? If you think I should leave
> > > the *3218 support in this driver, then I would propose:
> > > - remove leds-sn3218 and its separate binding doc
> > > - add the "si-en,sn3218" compatible string to this driver and binding doc
> > > Note that while I expect this driver to work with the 3218 chips, I do
> > > not have one to test against. If we go down this route I would definitely
> > > want Stefan to test so that I don't accidentally break him.
> >
> > I'd prefer to have a single driver for the same hardware. Stefan, would
> > it be possible for you to test David's driver with the hardware you
> > have an access to?
>
> Stefan, one thing to note: the existing sn3218 driver/binding uses 0-based
> 'reg' values, and this driver/binding uses 1-based 'reg' values. So your
> devicetree(s) would need to be updated for that (as well as the compatible
> string).
>
> I didn't see a final answer from Rob as to which way is most appropriate
> for these devices yet, so I don't know which way this will end up in the
> final patch.

unfortunately i'm very busy. Yes, i will test it, but i can't promise when.

Should i apply this version or wait for the next?

Best regards
