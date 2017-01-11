From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH v2 4/5] firmware: add SmPL report for custom fallback mechanism
Date: Wed, 11 Jan 2017 11:25:15 -0600
Message-ID: <CAB=NE6U0qdithzESpWXcYv2JX0hfg_wieJBkt2LEiCAtBJQQgA@mail.gmail.com>
References: <20161216111038.22064-1-mcgrof@kernel.org> <20161216111038.22064-5-mcgrof@kernel.org>
 <20170111083226.GA26154@kroah.com> <20170111140222.GK13946@wotan.suse.de> <20170111154940.GA5460@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:42780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750760AbdAKRZn (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Jan 2017 12:25:43 -0500
In-Reply-To: <20170111154940.GA5460@kroah.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ming Lei <ming.lei@canonical.com>, Daniel Wagner <daniel.wagner@bmw-carit.de>, Tom Gundersen <teg@jklm.no>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vikram Mulukutla <markivx@codeaurora.org>, Stephen Boyd <stephen.boyd@linaro.org>, Mark Brown <broonie@kernel.org>, Mimi Zohar <zohar@linux.vnet.ibm.com>, Takashi Iwai <tiwai@suse.de>, Johannes Berg <johannes@sipsolutions.net>, Christian Lamparter <chunkeey@googlemail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Josh Boyer <jwboyer@fedoraproject.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Jiri Slaby <jslaby@suse.com>, Linus

On Wed, Jan 11, 2017 at 9:49 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Wed, Jan 11, 2017 at 03:02:22PM +0100, Luis R. Rodriguez wrote:
>> On Wed, Jan 11, 2017 at 09:32:26AM +0100, Greg KH wrote:
>> > On Fri, Dec 16, 2016 at 03:10:37AM -0800, Luis R. Rodriguez wrote:
>> > > Even though most distributions today disable the fallback mechanism
>> > > by default we've determined that we cannot remove them from the kernel.
>> > > This is not well understood so document the reason and logic behind that.
>> >
>> > Well, the biggest reason is that some distros still rely on this.  I've
>> > seen new products being made that rely on it,
>>
>> Let's be a bit more precise: upstream there are only two driver relying on this
>> and I've learned about the non-upstream uses which folks have been calling for
>> ensuring this functionality is kept for: a) non-upstream mobile 802.11 drivers or
>> upstream 802.11 drivers with slight out-of-tree customizations with a requirements to
>> get calibration data using custom mechanisms b) remote-proc users with huge firmware
>> requirements for which initramfs is not well suited for.
>
> That b) is a lot of devices, I know of a few million phones in the wild
> right now that rely on it.  And millions is a pretty big number :)
>
> Anyway, thanks for addressing my concerns, I'm guessing you will respin
> these remaining patches and resend them as I think there were still some
> comments on them?  I took the first 3 here.

Yeah sure, I will address these comments.

> Is the "drvdata" code ready in your opinion to be merged / reviewed yet?

drvdata stuff is ready as can be but after the sysdata/drvdata rename
change I failed to change one of the p54 files, I also forgot to Cc
Boris on the microcode conversion so I can just respin the drvdata
series again as a separate series right after I address the concerns
for this series.

 Luis
