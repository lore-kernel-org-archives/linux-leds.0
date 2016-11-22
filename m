From: Glenn Golden <gdg@zplane.com>
Subject: Re: [ibm-acpi-devel] [PATCH v5 2/6] leds: triggers: Add a keyboard
 backlight trigger
Date: Tue, 22 Nov 2016 08:20:01 -0700
Message-ID: <20161122152001.GE757@huh.zplane.com>
References: <7b8252c4-bb2a-01dd-2404-9b81c192fb6a@gmail.com>
 <201611201605.17631@pali>
 <CGME20161120162126epcas3p353e606ebc3d4f0868ff2937ec0e95c14@epcas3p3.samsung.com>
 <20161120162116.GA15737@amd>
 <0c4e7840-064c-5d8a-c5eb-8afe71727fcd@samsung.com>
 <3d623840-34c0-9d93-9eba-92e4198e4fff@redhat.com>
 <05766b18-026a-2af3-def8-9289ddb55234@samsung.com>
 <4fcc36c6-498b-0ce7-a7c8-28c214ccef88@redhat.com>
 <ff098b73-202a-200b-5c84-e96d33199d54@samsung.com>
 <20161122145825.GS13735@pali>
Reply-To: gdg@zplane.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:41792 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932417AbcKVPUF (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 22 Nov 2016 10:20:05 -0500
Content-Disposition: inline
In-Reply-To: <20161122145825.GS13735@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Matthew Garrett <mjg59@srcf.ucam.org>, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Darren Hart <dvhart@infradead.org>, linux-leds@vger.kernel.org

Pali Roh=E1r <pali.rohar@gmail.com> [2016-11-22 15:58:25 +0100]:
> On Monday 21 November 2016 14:29:00 Jacek Anaszewski wrote:
> > Let's wait until every involved part agrees (Pavel, Pali).
>=20
> Ok, I read that discussion on linux-leds ML and finally understand
> motivation and results.
>=20
> Personally I still do not like current approach and big problem what I
> see is that I was not able to understand *why* introduction of
> current_brightness is needed and how userspace application should use
> it, before I read whole that linux-leds discussion.
>=20
> For people who already understand situation it is probably OK, but when
> I first time saw this patch series I just said WTF and description in
> Documentation files nor in commit messages did not help me.
>=20
> I would suggest to properly document *current* behaviour of LED sysfs
> files in Documentation/ABI before doing any decision how to solve
> current problem.
>=20
> Without correct documentation how sysfs LED interface behave in
> different situations (trigger is active; zero is written to brightness;
> brightness is read when blinking is active; etc) it is really hard to
> discuss about those problems. As many people (me included) first looked
> at those documentation files and think that info written here is correct
> and handle everything...
>=20
=20
+1 on the above sentiment, sense of frustration well expressed.

I went thru the same sequence of wtf-ing as Pali describes before coming
away with any level of real understanding.  IMO, this is a great example
of an issue which is 90% doc vs. 10% technical.

Hearing statements made earlier such as "the variable name doesn't matter
much" (approximate paraphrase) makes me worry, and must respectfully
disagree.  I am not involved at all in development or patches on this,
just a lowly Joe User type, and as such, can tell you that out here in
the cheap seats, the naming really does matter.

Please respect views of Pali as stated above and concentrate on documentati=
on.

As an aside from complaining though: Major tip o' the hat to all the
motivated and devoted devs on this ACPI work throughout many years;
it's really very much appreciated, despite the occasional whining (as
mine above).
